Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B03CF13B284
	for <oe-kbuild@lists.linux.dev>; Sat, 27 Sep 2025 01:12:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758935577; cv=none; b=C7wdFOYsaQxKXJC2fSrSriw6c3VaVWum97RrBZtVD5AiA+Qav28UHPfv4kXQDkhWUCjOS5JjCj2BRPtT+tICUqxEZpdjqBhmgd9UYZnG9opOF3XXook6AQ6nkfQ56JfuS0/EzwS93KOOTk7YLptMd8B/WLMCBlzgnshC+jTFgsQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758935577; c=relaxed/simple;
	bh=yDqbq129zOA4SUBwfebzWRwan0pLJ4ff5qazs8lv6+M=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HeeUWpsJZi3CX1xVt97i5Kd9/TOzUGppRYEaXQfs9Ex5lR8E2Lx8+qCv365PfUzWSQ6bIZ8+DOA3gt+V4cIX1cZB6ERYRMhgFJNSJuhR55DX6IUJukPY+cIDv0Pwv7bxQTg/nRp/5PUne7ml2vu0zQNFpfT2F1ro/GzWngbmIjE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NM2dcyN6; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NM2dcyN6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758935576; x=1790471576;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=yDqbq129zOA4SUBwfebzWRwan0pLJ4ff5qazs8lv6+M=;
  b=NM2dcyN6TVtA6CjrM3ssRae8TvdfFp7CN9Eot2fjYpD1fthEtEKWjCAM
   nNQAF3KBc1eqI3Ww0CO/CtbkNZj4iAqFtIm+vWTZ0G/8PAmbIDe5KA3mf
   ro/eDrsSdpOZWN+Zz4RqWxRP05BMW0TbM+HqexNimyWhtREqx/QetPslL
   XYoDaO1j3BiJKB2i3nc7qW4nCLym9Ki8dQlG+0jbftYOixDQz+BtkfZwU
   FM6YuBI8kRnmSaRFOJDtiCiDXpBIhy9vpHVESwO5PS7YwnrNbnQrrYNYt
   aRshxv4BdkgjMWUnj9YL3jShfOLy+9ziIjrJAdFJ6edjnEoQFf7goV37Y
   g==;
X-CSE-ConnectionGUID: 0JRBqIgYSVKxNG72D3od8A==
X-CSE-MsgGUID: 1B1XPFpETtyKy8of5r2Rvw==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="65083332"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="65083332"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Sep 2025 18:12:55 -0700
X-CSE-ConnectionGUID: sXg3o+7bTtujzpTytOLjVA==
X-CSE-MsgGUID: lkNk09+DQ7qK83mJY8zUxw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,296,1751266800"; 
   d="scan'208";a="201429477"
Received: from igk-lkp-server01.igk.intel.com (HELO 0e586ad5e7f7) ([10.91.175.65])
  by fmviesa002.fm.intel.com with ESMTP; 26 Sep 2025 18:12:54 -0700
Received: from kbuild by 0e586ad5e7f7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1v2JUa-000000005Oz-06WV;
	Sat, 27 Sep 2025 01:12:52 +0000
Date: Sat, 27 Sep 2025 03:11:55 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [asahilinux:bits/000-devicetree 23/140]
 arch/arm64/boot/dts/apple/t6000-j316s.dtb: /soc/smc@290400000/rtc: failed to
 match any schema with compatible: ['apple,smc-rtc']
Message-ID: <202509270334.oBIoFbyV-lkp@intel.com>
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
commit: 94a27052ade10376b9e6992882c3685605450a56 [23/140] arm64: dts: apple: t600x: Add smc_rtc node
:::::: branch date: 6 days ago
:::::: commit date: 3 weeks ago
config: arm64-randconfig-2051-20250919 (https://download.01.org/0day-ci/archive/20250927/202509270334.oBIoFbyV-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project ce5124856e019792783de9630d0c5a1f0aaf2d9d)
dtschema version: 2025.8
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250927/202509270334.oBIoFbyV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202509270334.oBIoFbyV-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/apple/t6000-j316s.dtb: /soc/smc@290400000: failed to match any schema with compatible: ['apple,t6000-smc', 'apple,smc']
   arch/arm64/boot/dts/apple/t6000-j316s.dtb: /soc/smc@290400000: failed to match any schema with compatible: ['apple,t6000-smc', 'apple,smc']
   arch/arm64/boot/dts/apple/t6000-j316s.dtb: /soc/smc@290400000/gpio: failed to match any schema with compatible: ['apple,smc-gpio']
>> arch/arm64/boot/dts/apple/t6000-j316s.dtb: /soc/smc@290400000/rtc: failed to match any schema with compatible: ['apple,smc-rtc']
   arch/arm64/boot/dts/apple/t6000-j316s.dtb: /soc/smc@290400000/reboot: failed to match any schema with compatible: ['apple,smc-reboot']
   arch/arm64/boot/dts/apple/t6000-j316s.dtb: pmic@f (apple,maverick-pmic): nvmem-layout: 'oneOf' conditional failed, one must be fixed:
   	'boot-error-count@6002,0', 'panic-count@6002,4', 'shutdown-flag@600f,3' do not match any of the regexes: '@[a-f0-9]+$', '^pinctrl-[0-9]+$'
   	'#address-cells', '#size-cells', 'boot-error-count@6002,0', 'boot-error-stage@6003', 'boot-stage@6001', 'fault-shadow@867b', 'panic-count@6002,4', 'pm-setting@1405', 'rtc-offset@1411', 'shutdown-flag@600f,3', 'socd@8b00' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	'kontron,sl28-vpd' was expected
   	'onie,tlv-layout' was expected
   	'fixed-layout' is not one of ['u-boot,env', 'u-boot,env-redundant-bool', 'u-boot,env-redundant-count', 'brcm,env']
   	from schema $id: http://devicetree.org/schemas/nvmem/apple,spmi-nvmem.yaml#
   arch/arm64/boot/dts/apple/t6000-j316s.dtb: pmic@f (apple,maverick-pmic): nvmem-layout: Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'boot-error-count@6002,0', 'boot-error-stage@6003', 'boot-stage@6001', 'fault-shadow@867b', 'panic-count@6002,4', 'pm-setting@1405', 'rtc-offset@1411', 'shutdown-flag@600f,3', 'socd@8b00' were unexpected)
   	from schema $id: http://devicetree.org/schemas/nvmem/apple,spmi-nvmem.yaml#
--
   arch/arm64/boot/dts/apple/t6001-j316c.dtb: /soc/smc@290400000: failed to match any schema with compatible: ['apple,t6000-smc', 'apple,smc']
   arch/arm64/boot/dts/apple/t6001-j316c.dtb: /soc/smc@290400000: failed to match any schema with compatible: ['apple,t6000-smc', 'apple,smc']
   arch/arm64/boot/dts/apple/t6001-j316c.dtb: /soc/smc@290400000/gpio: failed to match any schema with compatible: ['apple,smc-gpio']
>> arch/arm64/boot/dts/apple/t6001-j316c.dtb: /soc/smc@290400000/rtc: failed to match any schema with compatible: ['apple,smc-rtc']
   arch/arm64/boot/dts/apple/t6001-j316c.dtb: /soc/smc@290400000/reboot: failed to match any schema with compatible: ['apple,smc-reboot']
   arch/arm64/boot/dts/apple/t6001-j316c.dtb: pmic@f (apple,maverick-pmic): nvmem-layout: 'oneOf' conditional failed, one must be fixed:
   	'boot-error-count@6002,0', 'panic-count@6002,4', 'shutdown-flag@600f,3' do not match any of the regexes: '@[a-f0-9]+$', '^pinctrl-[0-9]+$'
   	'#address-cells', '#size-cells', 'boot-error-count@6002,0', 'boot-error-stage@6003', 'boot-stage@6001', 'fault-shadow@867b', 'panic-count@6002,4', 'pm-setting@1405', 'rtc-offset@1411', 'shutdown-flag@600f,3', 'socd@8b00' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	'kontron,sl28-vpd' was expected
   	'onie,tlv-layout' was expected
   	'fixed-layout' is not one of ['u-boot,env', 'u-boot,env-redundant-bool', 'u-boot,env-redundant-count', 'brcm,env']
   	from schema $id: http://devicetree.org/schemas/nvmem/apple,spmi-nvmem.yaml#
   arch/arm64/boot/dts/apple/t6001-j316c.dtb: pmic@f (apple,maverick-pmic): nvmem-layout: Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'boot-error-count@6002,0', 'boot-error-stage@6003', 'boot-stage@6001', 'fault-shadow@867b', 'panic-count@6002,4', 'pm-setting@1405', 'rtc-offset@1411', 'shutdown-flag@600f,3', 'socd@8b00' were unexpected)
   	from schema $id: http://devicetree.org/schemas/nvmem/apple,spmi-nvmem.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
