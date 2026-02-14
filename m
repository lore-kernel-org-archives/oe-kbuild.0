Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CF72339A8
	for <oe-kbuild@lists.linux.dev>; Sat, 14 Feb 2026 11:06:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771067220; cv=none; b=RP88WfKmrVPpymTyt0T1ECeRryQjLG4sXHw3l7boKaM5qGzqWuzYwVuYE/BSEbD650zblYKVQxQMTcKhw83Hl4ge605MsE3Cl+zvlBsS/6Fbw3o6nTbX5oWvMG3Qw7MNYMRtP2asMRvI1mQUlbUQ2q4JsTIE99VaXwyiKmmw6tU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771067220; c=relaxed/simple;
	bh=D0nRzgoeUWe6e9FKbbf416szegrfueqoz8bcRBofdUA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=d7JlLCxJYoAT8p/3Xj2Iit1FnSny9bbeTt9gjBwOB7/WVrok+LWf06mw39Xp1sD6ajrNSMT60R7/YSJY3FYFGkvBNr2y0otSASroUrXYoZFWymSzC5a63xUI104yAxkDLSIP4yxJNkI7x6kE9asBk05lSaZQC3ZV3+RUXgTehvs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FyYzfRNu; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FyYzfRNu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771067219; x=1802603219;
  h=date:from:to:cc:subject:message-id;
  bh=D0nRzgoeUWe6e9FKbbf416szegrfueqoz8bcRBofdUA=;
  b=FyYzfRNur8uCpSD1gvGaRTF3B/iWEUoNfUySNJs8jxBOk3vuy96aQ8YJ
   ENxVAqhcNO1kk6WnkB2tNH5MxO3t/yS+fVoN+1r0xo0TUntTV1lM7HUCf
   Hfr5ATUQuqJS4HrdBarmKTHpELxXSiWUyv+8xQz2yUJxzRhISLEe9wga1
   JiFYQffIFlXCzNu/UempyKGG0iry1Oq2jWme54zmCGUump2YGle5ZOyau
   UWorZ96O3hvLZy2CTu9GUWDiBZug7M1/19mWMlvvA80RgTek5IPJtmqTz
   /dwYoo1VJUM467R6DBOli3+K4yCTHVhy6T9iTDL8b4sg3naXktd4dHWqg
   w==;
X-CSE-ConnectionGUID: MTEnJ1EeSUWkLSxAFp8WIg==
X-CSE-MsgGUID: Jfizvp0BQz6QYbj91Yz31g==
X-IronPort-AV: E=McAfee;i="6800,10657,11700"; a="83337221"
X-IronPort-AV: E=Sophos;i="6.21,290,1763452800"; 
   d="scan'208";a="83337221"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Feb 2026 03:06:59 -0800
X-CSE-ConnectionGUID: 3VKNcESzQ4CxyjAX8EPK2w==
X-CSE-MsgGUID: Rw4VP6AGS2qeejwqgIaJRg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,290,1763452800"; 
   d="scan'208";a="212253343"
Received: from igk-lkp-server01.igk.intel.com (HELO e5404a91d123) ([10.211.93.152])
  by orviesa006.jf.intel.com with ESMTP; 14 Feb 2026 03:06:57 -0800
Received: from kbuild by e5404a91d123 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vrDUF-000000001pB-0Tpc;
	Sat, 14 Feb 2026 11:06:55 +0000
Date: Sat, 14 Feb 2026 12:06:53 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [wsa:renesas/hwspinlock/refactor-alloc-buildtest 4/19]
 arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk.dtb: i2c@e6500000
 (renesas,i2c-r8a779g0): Unevaluated properties are not allowed ('hwlocks' was
 unexpected)
Message-ID: <202602141224.WkM68dsN-lkp@intel.com>
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
TO: Wolfram Sang <wsa-dev@sang-engineering.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git renesas/hwspinlock/refactor-alloc-buildtest
head:   661496e362d06c7579ec2f4001cebf7d520ef601
commit: ba752b18c89765642d2fb7facfac23b14d3e51a6 [4/19] various hacks for testing
:::::: branch date: 17 hours ago
:::::: commit date: 4 days ago
config: arm64-randconfig-2051-20260213 (https://download.01.org/0day-ci/archive/20260214/202602141224.WkM68dsN-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
dtschema: 2025.13.dev7+gd16dc68b0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260214/202602141224.WkM68dsN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202602141224.WkM68dsN-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk.dtb: i2c@e6500000 (renesas,i2c-r8a779g0): Unevaluated properties are not allowed ('hwlocks' was unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/renesas,rcar-i2c.yaml
--
>> arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk-camera-j1-imx219.dtb: i2c@e6500000 (renesas,i2c-r8a779g0): Unevaluated properties are not allowed ('hwlocks' was unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/renesas,rcar-i2c.yaml
--
>> arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk-camera-j1-imx462.dtb: i2c@e6500000 (renesas,i2c-r8a779g0): Unevaluated properties are not allowed ('hwlocks' was unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/renesas,rcar-i2c.yaml
--
>> arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk-camera-j2-imx219.dtb: i2c@e6500000 (renesas,i2c-r8a779g0): Unevaluated properties are not allowed ('hwlocks' was unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/renesas,rcar-i2c.yaml
--
>> arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk-camera-j2-imx462.dtb: i2c@e6500000 (renesas,i2c-r8a779g0): Unevaluated properties are not allowed ('hwlocks' was unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/renesas,rcar-i2c.yaml
--
>> arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk-fan-argon40.dtb: i2c@e6500000 (renesas,i2c-r8a779g0): Unevaluated properties are not allowed ('hwlocks' was unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/renesas,rcar-i2c.yaml
--
>> arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk-fan-pwm.dtb: i2c@e6500000 (renesas,i2c-r8a779g0): Unevaluated properties are not allowed ('hwlocks' was unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/renesas,rcar-i2c.yaml
--
>> arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk-rpi-display-2-5in.dtb: i2c@e6500000 (renesas,i2c-r8a779g0): Unevaluated properties are not allowed ('hwlocks' was unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/renesas,rcar-i2c.yaml
--
>> arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk-rpi-display-2-7in.dtb: i2c@e6500000 (renesas,i2c-r8a779g0): Unevaluated properties are not allowed ('hwlocks' was unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/renesas,rcar-i2c.yaml

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
