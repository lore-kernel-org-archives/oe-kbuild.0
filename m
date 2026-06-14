Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C19F21D590
	for <oe-kbuild@lists.linux.dev>; Sun, 14 Jun 2026 07:54:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781423673; cv=none; b=mp+l0Ys7sszeSHa0v0GAZ8o1hBiRIxp2oDZEWoLz6ZrkML9rD54EoSZa/DATk9pmfPRYj2qqwcfyJRaEX/ZjMgroFnFGf74La1Dwkpcm8Qcu7V4r06jpqAMQ10UgojaX4fvNGrMThN5kkKyvDEMlGc/EoFdqoLkl1Y2rVCLzdeM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781423673; c=relaxed/simple;
	bh=pQmjfQz1yrkeELXCbGx0uIFZtey1W/VuAV9rD+jTxDo=;
	h=Date:From:To:Cc:Subject:Message-ID; b=mugRBbVfRAdP4M2DlixuIkFUik4r+PdC+5XTWwYgCc1w/EqN1JVaJIMZh7XxGQzncG+c4vA5HkAPMtrqFnCHb2vWiC9sCZVIxNCmHbSPsPOcwmnMfom/TfSWkbnEJBbZQ1Jhd47Bv+Ym1954CKl8Phiaxlgo7aM6pEspllAbPzM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NDAiYX/D; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NDAiYX/D"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781423672; x=1812959672;
  h=date:from:to:cc:subject:message-id;
  bh=pQmjfQz1yrkeELXCbGx0uIFZtey1W/VuAV9rD+jTxDo=;
  b=NDAiYX/DqsklHRGYYW2NYbnMwJyNUNF8HMdpuCDx76iOaTlRQvZC6MDd
   CeewuHNFPaN5Fmq2lJM1z7yKwEjASqiZ2uZsvvEo8F1YPS77unhRMfuFW
   AD+sAV+ckOpwkgPY7pGRV24wFV8lrMq4XWU8l1muaZi9P9Evb8y2MRnAn
   L5XJqVtf6GaYvEjx+8rOalIEsV+HAbD6UaK5gqJCsUMYmvqQUf4ivS/xu
   PoySERvg7LupyS4u3EHUHpPdxzf/q1agy5epbUgIDhQfJauvoDg8rLUis
   ZXbpzCNliSwAvOuibTK66zALDUHpN6l6Smiv9rwjXJL+R8rhpSrcQ2Gbu
   Q==;
X-CSE-ConnectionGUID: 0wTIfBqrSpGtzcAKC16zCQ==
X-CSE-MsgGUID: 3MoUpw9YQ7aDJLPCG+klBQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11816"; a="82259549"
X-IronPort-AV: E=Sophos;i="6.24,204,1774335600"; 
   d="scan'208";a="82259549"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jun 2026 00:54:31 -0700
X-CSE-ConnectionGUID: MB9aU4JdQh+op87PviY0Hg==
X-CSE-MsgGUID: 0IZWfhMASf+WJS/H4AOuwQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,204,1774335600"; 
   d="scan'208";a="271260845"
Received: from igk-lkp-server01.igk.intel.com (HELO 892db79562d4) ([10.211.93.152])
  by fmviesa001.fm.intel.com with ESMTP; 14 Jun 2026 00:54:30 -0700
Received: from kbuild by 892db79562d4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wYffn-000000004eP-4322;
	Sun, 14 Jun 2026 07:54:27 +0000
Date: Sun, 14 Jun 2026 09:54:15 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [linusw-pinctrl:devel 107/129]
 arch/arm64/boot/dts/allwinner/sun55i-a527-cubie-a5e.dtb: pinctrl@2000000
 (allwinner,sun55i-a523-pinctrl): interrupts: [[0, 69, 4], [0, 71, 4], [0, 73,
 4], [0, 75, 4], [0, 77, 4], [0, 79, 4], [0, 81, 4], [0, 83, 4], [0, 85, 4],
 [0, 140, 4]] is too short
Message-ID: <202606140954.xgjtxdMr-lkp@intel.com>
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
CC: linux-gpio@vger.kernel.org
TO: Andre Przywara <andre.przywara@arm.com>
CC: Linus Walleij <linusw@kernel.org>
CC: Jernej Skrabec <jernej.skrabec@gmail.com>
CC: "Chen-Yu Tsai" <wens@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git devel
head:   e3d967e6ef2f9605b132eabac64e984d884c81cf
commit: 11f25ac56372560762ae1cd6f8880d903f6d5825 [107/129] dt-bindings: pinctrl: sun55i-a523: increase IRQ banks number
:::::: branch date: 34 hours ago
:::::: commit date: 3 days ago
config: arm64-randconfig-2055-20260613 (https://download.01.org/0day-ci/archive/20260614/202606140954.xgjtxdMr-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.4.0
dtschema: 2026.5.dev10+g5d839523d
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260614/202606140954.xgjtxdMr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202606140954.xgjtxdMr-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi:107.6-1089.4: Warning (unit_address_vs_reg): /soc: node has a reg or ranges property, but no unit name
>> arch/arm64/boot/dts/allwinner/sun55i-a527-cubie-a5e.dtb: pinctrl@2000000 (allwinner,sun55i-a523-pinctrl): interrupts: [[0, 69, 4], [0, 71, 4], [0, 73, 4], [0, 75, 4], [0, 77, 4], [0, 79, 4], [0, 81, 4], [0, 83, 4], [0, 85, 4], [0, 140, 4]] is too short
   	from schema $id: http://devicetree.org/schemas/pinctrl/allwinner,sun55i-a523-pinctrl.yaml
--
   arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi:107.6-1089.4: Warning (unit_address_vs_reg): /soc: node has a reg or ranges property, but no unit name
>> arch/arm64/boot/dts/allwinner/sun55i-h728-x96qpro+.dtb: pinctrl@2000000 (allwinner,sun55i-a523-pinctrl): interrupts: [[0, 69, 4], [0, 71, 4], [0, 73, 4], [0, 75, 4], [0, 77, 4], [0, 79, 4], [0, 81, 4], [0, 83, 4], [0, 85, 4], [0, 140, 4]] is too short
   	from schema $id: http://devicetree.org/schemas/pinctrl/allwinner,sun55i-a523-pinctrl.yaml
--
   arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi:107.6-1089.4: Warning (unit_address_vs_reg): /soc: node has a reg or ranges property, but no unit name
>> arch/arm64/boot/dts/allwinner/sun55i-t527-avaota-a1.dtb: pinctrl@2000000 (allwinner,sun55i-a523-pinctrl): interrupts: [[0, 69, 4], [0, 71, 4], [0, 73, 4], [0, 75, 4], [0, 77, 4], [0, 79, 4], [0, 81, 4], [0, 83, 4], [0, 85, 4], [0, 140, 4]] is too short
   	from schema $id: http://devicetree.org/schemas/pinctrl/allwinner,sun55i-a523-pinctrl.yaml
--
   arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi:107.6-1089.4: Warning (unit_address_vs_reg): /soc: node has a reg or ranges property, but no unit name
>> arch/arm64/boot/dts/allwinner/sun55i-t527-orangepi-4a.dtb: pinctrl@2000000 (allwinner,sun55i-a523-pinctrl): interrupts: [[0, 69, 4], [0, 71, 4], [0, 73, 4], [0, 75, 4], [0, 77, 4], [0, 79, 4], [0, 81, 4], [0, 83, 4], [0, 85, 4], [0, 140, 4]] is too short
   	from schema $id: http://devicetree.org/schemas/pinctrl/allwinner,sun55i-a523-pinctrl.yaml

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
