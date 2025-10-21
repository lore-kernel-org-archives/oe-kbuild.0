Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F0682F3607
	for <oe-kbuild@lists.linux.dev>; Tue, 21 Oct 2025 11:41:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761046874; cv=none; b=usDwQZLS1tvd5dfvTJv7VT9lUlUNUUifJRu06L4gcuL2Dw0u+onNMCVwTZP7BMEgzOPAZEZFYM+8ANDfqmiwny7MWYbCTl3FOaCdYZoNVvJsH8lNmrKezHSLG+YRefnBbBY2+RfUrU8iGd6kpzEbe19isosZ7k2kmitkkOh+0X0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761046874; c=relaxed/simple;
	bh=kFkeFnwj03vVXTuHixz/pm1kG437EB8ZWtBnz5FWejI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=seKo8RXElzK+aZ+aB/CuEz7K7RZXDF98nduowDGHo+HIJ7/LBvcq4Ze0FutUDvKetWP49PPlWWsZW1CLsShlKe4dlVWJieb9bU02SQi2YFa4e8PF8KbMp2eCr3FM2j/VyvNYPYXW1LDv1dQTTYfeeYtw6UUxqShFB5BGVBph5rI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WAd2yEM9; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WAd2yEM9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761046873; x=1792582873;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=kFkeFnwj03vVXTuHixz/pm1kG437EB8ZWtBnz5FWejI=;
  b=WAd2yEM9Jmm8exi3JNiyntyukk42quG8urqnmm4VefvT3xADEG3z6qMj
   +xt+o8W66gckI4YNXkCX7inEOKccjpWf/cphaUyBNgZS4n1Urr6UEpk8i
   sre+yMVZgDqSQ1eSCwt//l4GZBVQ5aHD4m8RBdq9v16Kjg59f/ll7z5oF
   OkU0iQrpk4poPl/KeNN1ZXiMlRBOxTWikr2wDsLJ/g9nk2UIi6iVkDvCk
   aOmAdU6TacPEsOanQxkOCUw4nSXxMuFgTyV9GfP3BZQ6hnA4e1sHWPFc5
   zM/R+5Kq+stdZgx6EeLG6N6J2lBkOHVftoesSdmrL7hTvtUCkMPUn7aou
   A==;
X-CSE-ConnectionGUID: 444GhUq8QeC/pxL51VM0Nw==
X-CSE-MsgGUID: yxmnoZXNS4KpavMdsQFIgQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="67005559"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="67005559"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2025 04:41:12 -0700
X-CSE-ConnectionGUID: uYgS+deYRjWjXO5N5X1Uew==
X-CSE-MsgGUID: nkOX+m4zRti+qQZMYgTTJQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,244,1754982000"; 
   d="scan'208";a="220740632"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 21 Oct 2025 04:41:10 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vBAj4-000Amv-05;
	Tue, 21 Oct 2025 11:40:39 +0000
Date: Tue, 21 Oct 2025 19:39:13 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [krzk-github:b4/dt-bindings-watchdog-timeout 3/4]
 arch/arm64/boot/dts/toshiba/tmpv7708-rm-mbrc.dtb: wdt@28330000
 (toshiba,visconti-wdt): $nodename:0: 'wdt@28330000' does not match
 '^(pmic|timer|watchdog)(@.*|-([0-9]|[1-9][0-9]+))?$'
Message-ID: <202510211937.tVnbPOtc-lkp@intel.com>
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

tree:   https://github.com/krzk/linux b4/dt-bindings-watchdog-timeout
head:   4ebfce881188d1984eb58adcaaa30f96fd5d3e3a
commit: 50d0c16c4b24f7a7a93257981d8b547e5abe0376 [3/4] dt-bindings: watchdog: Allow node names named 'pmic'
:::::: branch date: 19 hours ago
:::::: commit date: 19 hours ago
config: arm64-randconfig-051-20251021 (https://download.01.org/0day-ci/archive/20251021/202510211937.tVnbPOtc-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 754ebc6ebb9fb9fbee7aef33478c74ea74949853)
dtschema version: 2025.9.dev7+g3b6fdac89
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251021/202510211937.tVnbPOtc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202510211937.tVnbPOtc-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/toshiba/tmpv7708-rm-mbrc.dtb: pmux@24190000 (toshiba,tmpv7708-pinctrl): 'pwm_mux' does not match any of the regexes: '-pins$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/pinctrl/toshiba,visconti-pinctrl.yaml#
   arch/arm64/boot/dts/toshiba/tmpv7708-rm-mbrc.dtb: pmux@24190000 (toshiba,tmpv7708-pinctrl): $nodename:0: 'pmux@24190000' does not match '^(pinctrl|pinmux)(@[0-9a-f]+)?$'
   	from schema $id: http://devicetree.org/schemas/pinctrl/toshiba,visconti-pinctrl.yaml#
   arch/arm64/boot/dts/toshiba/tmpv7708-rm-mbrc.dtb: ethernet@28000000 (toshiba,visconti-dwmac): Unevaluated properties are not allowed ('mdio0' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/toshiba,visconti-dwmac.yaml#
>> arch/arm64/boot/dts/toshiba/tmpv7708-rm-mbrc.dtb: wdt@28330000 (toshiba,visconti-wdt): $nodename:0: 'wdt@28330000' does not match '^(pmic|timer|watchdog)(@.*|-([0-9]|[1-9][0-9]+))?$'
   	from schema $id: http://devicetree.org/schemas/watchdog/toshiba,visconti-wdt.yaml#
--
   arch/arm64/boot/dts/toshiba/tmpv7708-visrobo-vrb.dtb: pmux@24190000 (toshiba,tmpv7708-pinctrl): $nodename:0: 'pmux@24190000' does not match '^(pinctrl|pinmux)(@[0-9a-f]+)?$'
   	from schema $id: http://devicetree.org/schemas/pinctrl/toshiba,visconti-pinctrl.yaml#
   arch/arm64/boot/dts/toshiba/tmpv7708-visrobo-vrb.dtb: pmux@24190000 (toshiba,tmpv7708-pinctrl): spi0-pins:groups: ['spi0_grp', 'spi0_cs0_grp'] is too long
   	from schema $id: http://devicetree.org/schemas/pinctrl/toshiba,visconti-pinctrl.yaml#
   arch/arm64/boot/dts/toshiba/tmpv7708-visrobo-vrb.dtb: pmux@24190000 (toshiba,tmpv7708-pinctrl): spi0-pins:groups: ['spi0_grp', 'spi0_cs0_grp'] is too long
   	from schema $id: http://devicetree.org/schemas/pinctrl/toshiba,visconti-pinctrl.yaml#
   arch/arm64/boot/dts/toshiba/tmpv7708-visrobo-vrb.dtb: mmc-slot@0 (mmc-spi-slot): $nodename:0: 'mmc-slot@0' does not match '^mmc(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mmc/mmc-spi-slot.yaml#
   arch/arm64/boot/dts/toshiba/tmpv7708-visrobo-vrb.dtb: ethernet@28000000 (toshiba,visconti-dwmac): Unevaluated properties are not allowed ('mdio0' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/toshiba,visconti-dwmac.yaml#
>> arch/arm64/boot/dts/toshiba/tmpv7708-visrobo-vrb.dtb: wdt@28330000 (toshiba,visconti-wdt): $nodename:0: 'wdt@28330000' does not match '^(pmic|timer|watchdog)(@.*|-([0-9]|[1-9][0-9]+))?$'
   	from schema $id: http://devicetree.org/schemas/watchdog/toshiba,visconti-wdt.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
