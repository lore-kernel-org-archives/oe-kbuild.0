Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1B1044D685
	for <oe-kbuild@lists.linux.dev>; Fri, 21 Aug 2026 09:41:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787305313; cv=none; b=KyRmCtuRnYJMDIZRRopxHkQsRIUHM5EQAb7W3vYm/6SK5NsOwXkJIpvDrOYgekA34kTljgXSWaSmkkMgd9iL+9+DA52rC2UWUIkbkMhVpP9sMwNoCCbSkHDE62BvKE5urnWYWAjNMca4vlObwWCTlaxXytTS/78padSZ7dIBn78=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787305313; c=relaxed/simple;
	bh=pK4aGnWnwnK7BNyUbRFL9rDkvpcmOiotsGaT/qBDnko=;
	h=Date:From:To:Cc:Subject:Message-ID; b=X/mZixhqy74HIJ/X8vV4/oB+ppSzsUUmpOhhXiLeGSVKin0PZ4Hjn6DzoPyQUZo96kfu+6PLDIw2Yd+lhFAiu43Un4DuwhLZsrbLk59r8BcUTE0krw0nf3UpF20MUlB8MG0Yl7qLu9QQ8jdKjaDfgvlom7Pfil2Oww+uwEtwbkM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gYbCjPGT; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gYbCjPGT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787305307; x=1818841307;
  h=date:from:to:cc:subject:message-id;
  bh=pK4aGnWnwnK7BNyUbRFL9rDkvpcmOiotsGaT/qBDnko=;
  b=gYbCjPGT+oaYNSpqWKf2Y8qF0KWg+NMMqqHupBvLezoIwDfhN0uGp6kd
   lktfZaFadT39WTlMnKE2PKDn5USS+ts/u52J3NgtyRme6NARgiLxiFuZk
   HoKF1gnT7nkhOFPJexHcvJw3L0AxwveGzIUN4IpjtQhp3/xm2jgloeDy6
   1+RrfiZzdr2cw5G9Zt9huOdIP44ijxhrWRlNqVId2dgroHHsCyIwbrhQc
   xle2O1PXqkJvXOz60v68QKypd7c+hkUwrrY2KaHGHHTYB31ixiIUZ8hyp
   SGn1+3q6hSugtw2jlJy6m94ophYlpRHJvAXS5V/7nynRqLjSvVrEjQDO4
   w==;
X-CSE-ConnectionGUID: XyPOThNJQYeKoxLJLx8Ahg==
X-CSE-MsgGUID: 11q5vy38RMey6qvowK6Jbw==
X-IronPort-AV: E=McAfee;i="6800,10657,11881"; a="88055147"
X-IronPort-AV: E=Sophos;i="6.25,234,1779174000"; 
   d="scan'208";a="88055147"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Aug 2026 02:41:41 -0700
X-CSE-ConnectionGUID: ugjMq0DmTK+Yl1qaHUUG5w==
X-CSE-MsgGUID: iyGBzXtQSxWcBhnbVudWSw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,234,1779174000"; 
   d="scan'208";a="296197821"
Received: from igk-lkp-server01.igk.intel.com (HELO 3cba2a188a06) ([10.211.93.152])
  by orviesa002.jf.intel.com with ESMTP; 21 Aug 2026 02:41:39 -0700
Received: from kbuild by 3cba2a188a06 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wxLkn-000000007gH-2FNC;
	Fri, 21 Aug 2026 09:41:37 +0000
Date: Fri, 21 Aug 2026 11:40:58 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [asahilinux:tbt-reset-wip 15/19]
 arch/arm64/boot/dts/apple/t8103-j274.dtb: aliases: 'usb4_0_nhi', 'usb4_0_rc',
 'usb4_1_nhi', 'usb4_1_rc' do not match any of the regexes:
 '^[a-z][a-z0-9\\-]*$', '^pinctrl-[0-9]+$'
Message-ID: <202608211112.2MHyTIa0-lkp@intel.com>
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
TO: Sven Peter <sven@kernel.org>

tree:   https://github.com/AsahiLinux/linux tbt-reset-wip
head:   0d96b818b83e32982ee56f48c5092f99332af551
commit: 4ad60ec4291be4d8b8bb6e7bde55e6fc37e1225e [15/19] arm64: dts: apple: t8103: Add USB4 ACIO and NHI
:::::: branch date: 2 days ago
:::::: commit date: 12 days ago
config: arm64-randconfig-2052-20260820 (https://download.01.org/0day-ci/archive/20260821/202608211112.2MHyTIa0-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
dtschema: 2026.7.dev15+g01b5073ab
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260821/202608211112.2MHyTIa0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202608211112.2MHyTIa0-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/apple/t8103.dtsi:23.10-25.4: Warning (alias_paths): /aliases: aliases property name must include only lowercase and '-'
   arch/arm64/boot/dts/apple/t8103.dtsi:23.10-25.4: Warning (alias_paths): /aliases: aliases property name must include only lowercase and '-'
>> arch/arm64/boot/dts/apple/t8103-j274.dtb: aliases: 'usb4_0_nhi', 'usb4_0_rc', 'usb4_1_nhi', 'usb4_1_rc' do not match any of the regexes: '^[a-z][a-z0-9\\-]*$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/aliases.yaml
>> arch/arm64/boot/dts/apple/t8103-j274.dtb: /soc/nhi@381ac0000: failed to match any schema with compatible: ['apple,t8103-usb4-acio']
>> arch/arm64/boot/dts/apple/t8103-j274.dtb: /soc/nhi@381ac0000/nhi@381f00000: failed to match any schema with compatible: ['apple,t8103-usb4-nhi']
>> arch/arm64/boot/dts/apple/t8103-j274.dtb: /soc/nhi@501ac0000: failed to match any schema with compatible: ['apple,t8103-usb4-acio']
>> arch/arm64/boot/dts/apple/t8103-j274.dtb: /soc/nhi@501ac0000/nhi@501f00000: failed to match any schema with compatible: ['apple,t8103-usb4-nhi']
--
   arch/arm64/boot/dts/apple/t8103.dtsi:23.10-25.4: Warning (alias_paths): /aliases: aliases property name must include only lowercase and '-'
   arch/arm64/boot/dts/apple/t8103.dtsi:23.10-25.4: Warning (alias_paths): /aliases: aliases property name must include only lowercase and '-'
>> arch/arm64/boot/dts/apple/t8103-j293.dtb: aliases: 'usb4_0_nhi', 'usb4_0_rc', 'usb4_1_nhi', 'usb4_1_rc' do not match any of the regexes: '^[a-z][a-z0-9\\-]*$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/aliases.yaml
>> arch/arm64/boot/dts/apple/t8103-j293.dtb: /soc/nhi@381ac0000: failed to match any schema with compatible: ['apple,t8103-usb4-acio']
>> arch/arm64/boot/dts/apple/t8103-j293.dtb: /soc/nhi@381ac0000/nhi@381f00000: failed to match any schema with compatible: ['apple,t8103-usb4-nhi']
>> arch/arm64/boot/dts/apple/t8103-j293.dtb: /soc/nhi@501ac0000: failed to match any schema with compatible: ['apple,t8103-usb4-acio']
>> arch/arm64/boot/dts/apple/t8103-j293.dtb: /soc/nhi@501ac0000/nhi@501f00000: failed to match any schema with compatible: ['apple,t8103-usb4-nhi']
--
   arch/arm64/boot/dts/apple/t8103.dtsi:23.10-25.4: Warning (alias_paths): /aliases: aliases property name must include only lowercase and '-'
   arch/arm64/boot/dts/apple/t8103.dtsi:23.10-25.4: Warning (alias_paths): /aliases: aliases property name must include only lowercase and '-'
   arch/arm64/boot/dts/apple/t8103.dtsi:23.10-25.4: Warning (alias_paths): /aliases: aliases property name must include only lowercase and '-'
>> arch/arm64/boot/dts/apple/t8103-j313.dtb: aliases: 'usb4_0_nhi', 'usb4_0_rc', 'usb4_1_nhi', 'usb4_1_rc' do not match any of the regexes: '^[a-z][a-z0-9\\-]*$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/aliases.yaml
>> arch/arm64/boot/dts/apple/t8103-j313.dtb: /soc/nhi@381ac0000: failed to match any schema with compatible: ['apple,t8103-usb4-acio']
>> arch/arm64/boot/dts/apple/t8103-j313.dtb: /soc/nhi@381ac0000/nhi@381f00000: failed to match any schema with compatible: ['apple,t8103-usb4-nhi']
>> arch/arm64/boot/dts/apple/t8103-j313.dtb: /soc/nhi@501ac0000: failed to match any schema with compatible: ['apple,t8103-usb4-acio']
>> arch/arm64/boot/dts/apple/t8103-j313.dtb: /soc/nhi@501ac0000/nhi@501f00000: failed to match any schema with compatible: ['apple,t8103-usb4-nhi']
--
   arch/arm64/boot/dts/apple/t8103.dtsi:23.10-25.4: Warning (alias_paths): /aliases: aliases property name must include only lowercase and '-'
   arch/arm64/boot/dts/apple/t8103.dtsi:23.10-25.4: Warning (alias_paths): /aliases: aliases property name must include only lowercase and '-'
>> arch/arm64/boot/dts/apple/t8103-j456.dtb: aliases: 'usb4_0_nhi', 'usb4_0_rc', 'usb4_1_nhi', 'usb4_1_rc' do not match any of the regexes: '^[a-z][a-z0-9\\-]*$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/aliases.yaml
>> arch/arm64/boot/dts/apple/t8103-j456.dtb: /soc/nhi@381ac0000: failed to match any schema with compatible: ['apple,t8103-usb4-acio']
>> arch/arm64/boot/dts/apple/t8103-j456.dtb: /soc/nhi@381ac0000/nhi@381f00000: failed to match any schema with compatible: ['apple,t8103-usb4-nhi']
>> arch/arm64/boot/dts/apple/t8103-j456.dtb: /soc/nhi@501ac0000: failed to match any schema with compatible: ['apple,t8103-usb4-acio']
>> arch/arm64/boot/dts/apple/t8103-j456.dtb: /soc/nhi@501ac0000/nhi@501f00000: failed to match any schema with compatible: ['apple,t8103-usb4-nhi']
--
   arch/arm64/boot/dts/apple/t8103.dtsi:23.10-25.4: Warning (alias_paths): /aliases: aliases property name must include only lowercase and '-'
   arch/arm64/boot/dts/apple/t8103.dtsi:23.10-25.4: Warning (alias_paths): /aliases: aliases property name must include only lowercase and '-'
>> arch/arm64/boot/dts/apple/t8103-j457.dtb: aliases: 'usb4_0_nhi', 'usb4_0_rc', 'usb4_1_nhi', 'usb4_1_rc' do not match any of the regexes: '^[a-z][a-z0-9\\-]*$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/aliases.yaml
>> arch/arm64/boot/dts/apple/t8103-j457.dtb: /soc/nhi@381ac0000: failed to match any schema with compatible: ['apple,t8103-usb4-acio']
>> arch/arm64/boot/dts/apple/t8103-j457.dtb: /soc/nhi@381ac0000/nhi@381f00000: failed to match any schema with compatible: ['apple,t8103-usb4-nhi']
>> arch/arm64/boot/dts/apple/t8103-j457.dtb: /soc/nhi@501ac0000: failed to match any schema with compatible: ['apple,t8103-usb4-acio']
>> arch/arm64/boot/dts/apple/t8103-j457.dtb: /soc/nhi@501ac0000/nhi@501f00000: failed to match any schema with compatible: ['apple,t8103-usb4-nhi']

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
