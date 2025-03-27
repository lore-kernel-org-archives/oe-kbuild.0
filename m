Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09C5A21422C
	for <oe-kbuild@lists.linux.dev>; Thu, 27 Mar 2025 14:22:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743085371; cv=none; b=K4zQNdLSWwklVa3Y5AaCvnu59iDCWFWX84GPHGSv7bMhvxqS4vgkusdl1W5uEH8v3YWglSpAQr0cZ4RxcOhKBFbQb2cJCzBn6c4fkEnoTXqSaTB1GUcR0qpamA80vlAzrUHqHqxzQhFvkwA7+nIxgndxnEQ561UGyj6HlYcXlR8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743085371; c=relaxed/simple;
	bh=jqBThOSdFL4naz9zo/ZuZ1BZR29ZPH1vIdUTWXTcWxE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=m43Xc7TC/zEq3kpVgYC50uc4hajzNw1lWbJCAXi28KFwQdnfYvOBxXqZ5dgL9spRs39+WxDZHJ2bFpFyZHcoIW1R+XbzLggy4+GOA80hKzYIvHG7x09hjTe+SJLu7gTwIxu6hsr+77LzIVqEFgBaVjIh9+n1GZMunuPC1kmJPHo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=N8qVFJQg; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="N8qVFJQg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743085369; x=1774621369;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=jqBThOSdFL4naz9zo/ZuZ1BZR29ZPH1vIdUTWXTcWxE=;
  b=N8qVFJQgp5TO0bDJ9MCGNeCziYGjh3QCknVfoPwui4r4sKSgkYvmCJrQ
   Jkr0dzQOy5/pdgnAidBMhU9kED0qMHdE3ERvqEOxPSz9zzYdVjf+OTvWo
   ExId07cGMvDP56xxvyed5UC40pBOSyx/yUf8P0R0e+cMkj1sBAOr6dUb3
   gsxq22qKry4jDB8fIu3P5BaCN3sueom1WgOkOoMdFef7RlXq4nlvxYoN6
   MY9KfXYVMLUq94DGiX2Wp9CPY5jya2m+Bj2M7PDA/ZEPyU90Stb6g1nMi
   s3Fzv+o5DtFk8gr4HwgB9QRvFM/imWH5LPu94VhHHsjcHxAU4ZqBkY/uc
   g==;
X-CSE-ConnectionGUID: qUh5jr4zSyy7sUuoXMx5EQ==
X-CSE-MsgGUID: 4QwgWvuFSdG/tUeBKmisHg==
X-IronPort-AV: E=McAfee;i="6700,10204,11385"; a="61811812"
X-IronPort-AV: E=Sophos;i="6.14,280,1736841600"; 
   d="scan'208";a="61811812"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Mar 2025 07:22:48 -0700
X-CSE-ConnectionGUID: G1Gt2oiFR6CCw+qzVGUacg==
X-CSE-MsgGUID: msn6+RGhQB++6SaSoMmhSg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,280,1736841600"; 
   d="scan'208";a="125133637"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by fmviesa007.fm.intel.com with ESMTP; 27 Mar 2025 07:22:44 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1txo82-0006h9-0t;
	Thu, 27 Mar 2025 14:22:42 +0000
Date: Thu, 27 Mar 2025 22:21:45 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [wsa:renesas/n1d/enablement 9/9]
 arch/arm/boot/dts/renesas/r9a06g032-rzn1d400-db.dtb: keyboard: 'eight',
 'five', 'four', 'one', 'seven', 'six', 'three', 'two' do not match any of
 the regexes:
 '^(button|event|key|switch|(button|event|key|switch)-[a-z0-9-]+|[a-z0-9-]+-(button|event|key|swi...
Message-ID: <202503272228.G23ldajB-lkp@intel.com>
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
TO: Wolfram Sang <wsa-dev@sang-engineering.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git renesas/n1d/enablement
head:   8062afb33fe16880df4bfb6622c18e15c069c320
commit: 8062afb33fe16880df4bfb6622c18e15c069c320 [9/9] ARM: dts: renesas: r9a06g032-rzn1d400-db: describe keys
:::::: branch date: 28 hours ago
:::::: commit date: 28 hours ago
config: arm-randconfig-053-20250327 (https://download.01.org/0day-ci/archive/20250327/202503272228.G23ldajB-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
dtschema version: 2025.3.dev5+g0f9dc23
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250327/202503272228.G23ldajB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202503272228.G23ldajB-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm/boot/dts/renesas/r9a06g032.dtsi:415.27-464.5: Warning (avoid_unnecessary_addr_size): /soc/switch@44050000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm/boot/dts/renesas/r9a06g032-rzn1d400-db.dtb: cpus: cpu@1:enable-method:0: 'spin-table' was expected
   	from schema $id: http://devicetree.org/schemas/cpus.yaml#
   arch/arm/boot/dts/renesas/r9a06g032-rzn1d400-db.dtb: switch@44050000: Unevaluated properties are not allowed ('#address-cells', '#size-cells' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/dsa/renesas,rzn1-a5psw.yaml#
>> arch/arm/boot/dts/renesas/r9a06g032-rzn1d400-db.dtb: keyboard: 'eight', 'five', 'four', 'one', 'seven', 'six', 'three', 'two' do not match any of the regexes: '^(button|event|key|switch|(button|event|key|switch)-[a-z0-9-]+|[a-z0-9-]+-(button|event|key|switch))$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/input/gpio-keys.yaml#
--
   arch/arm/boot/dts/renesas/r9a06g032.dtsi:415.27-464.5: Warning (avoid_unnecessary_addr_size): /soc/switch@44050000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm/boot/dts/renesas/r9a06g032-rzn1d400-eb.dtb: cpus: cpu@1:enable-method:0: 'spin-table' was expected
   	from schema $id: http://devicetree.org/schemas/cpus.yaml#
   arch/arm/boot/dts/renesas/r9a06g032-rzn1d400-eb.dtb: switch@44050000: Unevaluated properties are not allowed ('#address-cells', '#size-cells' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/dsa/renesas,rzn1-a5psw.yaml#
>> arch/arm/boot/dts/renesas/r9a06g032-rzn1d400-eb.dtb: keyboard: 'eight', 'five', 'four', 'one', 'seven', 'six', 'three', 'two' do not match any of the regexes: '^(button|event|key|switch|(button|event|key|switch)-[a-z0-9-]+|[a-z0-9-]+-(button|event|key|switch))$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/input/gpio-keys.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
