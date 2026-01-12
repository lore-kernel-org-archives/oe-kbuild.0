Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 801ED28C866
	for <oe-kbuild@lists.linux.dev>; Mon, 12 Jan 2026 10:21:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768213298; cv=none; b=XeHPHu+fUd+nULfq7dPOrPkC1v0UcnrcI82QVrMzPdW1PvVXVRBmPBA39hVrGjYj8O28F+lyE5KqxMTH7pImssCz/6mrhZ51j59+tWaSXCqtIEpQ0S3AocQrIUBt969R48WgAEiAU19VgMlFyGWG5OIbjCuPgOb9Kuqo1Q4rERw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768213298; c=relaxed/simple;
	bh=N1G/wiq4Ux8W4HxW7MUWT5L6TWra4aQBTh6qE98euWI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=G2P1cGUNUssVlAs09orafgoVJ02AFfbe+quduF4vwwTbM7khAuLON7gXJeBONHtVRoMRCvvJCT48uotOHUKc5FUPUVkRh8AuANVRvhEdA0hwTEp8SA/A35u2nFEIOL+2wAOtjV1ZssdG0uf9cORyAT5Ac7x+Q+eLtF0ROzxkLM0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=L+7ifYmJ; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="L+7ifYmJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768213297; x=1799749297;
  h=date:from:to:cc:subject:message-id;
  bh=N1G/wiq4Ux8W4HxW7MUWT5L6TWra4aQBTh6qE98euWI=;
  b=L+7ifYmJWOq7SOY863Z+IqiRcB6QTQu39SCUSyiSN6/RxxlknG1yOg0s
   JS8q6ZGEuzTeJQbH2doJagiUoyTFbqpM8ZT/08EKPLsTHdjDUbTujUXl3
   ZM0Howar5l2NzOYgNxDwfXrd0tIVhhULG9rmtSA8VrHuQfZgeN72grJoc
   RqpFGHX5MzKBh81bTg1o1LLboT9OjIQgJd2oBWDnrxg/klXLvQhtOmxum
   tUuDXLWaAHNIamR8n0d5fm4Pg+5RIE4yQOB+BdASk6ZWJJGKbeL9l6Gf0
   hKY2FgdJq2DDKG2J/QLaGO1WAEbraSGkmK5RTFFcnusF8ebld6fmRFBBl
   Q==;
X-CSE-ConnectionGUID: Bet9NMywSLqCsptdaDE6nQ==
X-CSE-MsgGUID: 5tQQxQSpSUaST0Ow0a/DzQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11668"; a="68689540"
X-IronPort-AV: E=Sophos;i="6.21,219,1763452800"; 
   d="scan'208";a="68689540"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jan 2026 02:21:36 -0800
X-CSE-ConnectionGUID: JfqOJF7dRmmAESq8164nTg==
X-CSE-MsgGUID: u9ppdeg6SZGECY/1feM06Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,219,1763452800"; 
   d="scan'208";a="234748268"
Received: from igk-lkp-server01.igk.intel.com (HELO 8581b2e2a62c) ([10.211.93.152])
  by orviesa002.jf.intel.com with ESMTP; 12 Jan 2026 02:21:35 -0800
Received: from kbuild by 8581b2e2a62c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vfF3E-000000000sP-2dXm;
	Mon, 12 Jan 2026 10:21:32 +0000
Date: Mon, 12 Jan 2026 11:20:55 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [spacemit:k1/for-next 6/8]
 arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dtb: i2c@d4012000
 (spacemit,k1-i2c): Unevaluated properties are not allowed ('resets' was
 unexpected)
Message-ID: <202601121125.XWPErYfq-lkp@intel.com>
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
CC: Yixun Lan <dlan@gentoo.org>
TO: Encrow Thorne <jyc0019@gmail.com>
CC: Yixun Lan <dlan@gentoo.org>

tree:   https://github.com/spacemit-com/linux k1/for-next
head:   0552cbce4bce08087313cdb599acf6f9616de0d7
commit: 91c444d4285c07dbf2e6e4bf954d9a0282157f1f [6/8] riscv: dts: spacemit: add reset property
:::::: branch date: 3 days ago
:::::: commit date: 4 days ago
config: riscv-randconfig-2052-20260112 (https://download.01.org/0day-ci/archive/20260112/202601121125.XWPErYfq-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 8.5.0
dtschema version: 2025.12
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260112/202601121125.XWPErYfq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202601121125.XWPErYfq-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dtb: i2c@d4012000 (spacemit,k1-i2c): Unevaluated properties are not allowed ('resets' was unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/spacemit,k1-i2c.yaml
   arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dtb: /soc/phy@c0b10000: failed to match any schema with compatible: ['spacemit,k1-combo-phy']
   arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dtb: /soc/phy@c0c10000: failed to match any schema with compatible: ['spacemit,k1-pcie-phy']
   arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dtb: /soc/phy@c0d10000: failed to match any schema with compatible: ['spacemit,k1-pcie-phy']
>> arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dtb: i2c@d401d800 (spacemit,k1-i2c): Unevaluated properties are not allowed ('resets' was unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/spacemit,k1-i2c.yaml
   arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dtb: pcie@ca400000 (spacemit,k1-pcie): pcie@0: 'vpcie3v3-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/pci/spacemit,k1-pcie-host.yaml
   arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dtb: pcie@ca800000 (spacemit,k1-pcie): pcie@0: 'vpcie3v3-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/pci/spacemit,k1-pcie-host.yaml
--
   arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dtb: /soc/phy@c0b10000: failed to match any schema with compatible: ['spacemit,k1-combo-phy']
   arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dtb: /soc/phy@c0c10000: failed to match any schema with compatible: ['spacemit,k1-pcie-phy']
   arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dtb: /soc/phy@c0d10000: failed to match any schema with compatible: ['spacemit,k1-pcie-phy']
>> arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dtb: i2c@d401d800 (spacemit,k1-i2c): Unevaluated properties are not allowed ('resets' was unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/spacemit,k1-i2c.yaml

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
