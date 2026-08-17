Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7BD63B42E4
	for <oe-kbuild@lists.linux.dev>; Mon, 17 Aug 2026 06:53:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786949613; cv=none; b=RpUe5pie10DKlqHEnklJcVZUfPx1mMtx+gQbgQ5qV98vHMgyiYAWmTs9sxv7/tou/PdJUVjXpSJ+1ojyN0+9kmtJJ7axTuRVhhe2TAPImMcB6CYEqvVMveOVyjwYeqTSGzEhACtVfgDPmBX+tHq1dPlGfaGPukJeqau93KuRTfs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786949613; c=relaxed/simple;
	bh=db7vwGphB5ppo1Th+GBw78u5nHBwDsW2a0/4HZvLiT4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=U1RXr0jOlEYGw7Z7GMH8Nvg7K5l2a1GEUdr/3UdZvMWmPDTcZCzFvDs4QHrRspr3h3h/JWgjcol5Vh3tt0WXZtNRhpEgZouLGrlMAV8giXWzo9ZPpzk4stGza974EsoMOo5NvRj83+QsOWUGbyeLuYIIcEyz8is4j6QYFuBqGVs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kR+tjdcR; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kR+tjdcR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786949611; x=1818485611;
  h=date:from:to:cc:subject:message-id;
  bh=db7vwGphB5ppo1Th+GBw78u5nHBwDsW2a0/4HZvLiT4=;
  b=kR+tjdcR3TREeh+6hVBeT1x1tHwrXnK1UCpQ2rrhpLb/qdrBv/bfb79+
   BpAFKhHstCnueBsVuyNnTCgRWJE8FQJdvrS7MwXqj2r3jCXvBq7tjxEY3
   y2oK1Iif086r856qbs/bDyz+MNt6nI+K+ytGzbyr5rUmC+qGOdr1N9cq4
   yuxR2wVNiBgdTU5dDAbdgkXulrwcLxbhctGBLY6pgKcbD5HpEtvIyX8xx
   AlgMYmJa0I1uQs8DTjWnEpeV7YM8ldIdSxT8k6NMOibzzctH2QvbhMRsY
   rRWpYFCnsGjSIj9RAQ7XlGzJCe5tMfQLXoloPYSgG3Ht5zwC4UY56J/KN
   w==;
X-CSE-ConnectionGUID: tNB68hTFTaCxCmXoij5O9A==
X-CSE-MsgGUID: dgy+P84SRTygOzHzsz6fOQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11877"; a="98933177"
X-IronPort-AV: E=Sophos;i="6.25,228,1779174000"; 
   d="scan'208";a="98933177"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Aug 2026 23:53:30 -0700
X-CSE-ConnectionGUID: FVfqnIOuSMShSrSPCdFGRw==
X-CSE-MsgGUID: F2Wf4eeHSQ2nUGfpyq605g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,228,1779174000"; 
   d="scan'208";a="268318552"
Received: from igk-lkp-server01.igk.intel.com (HELO 3cba2a188a06) ([10.211.93.152])
  by orviesa003.jf.intel.com with ESMTP; 16 Aug 2026 23:53:29 -0700
Received: from kbuild by 3cba2a188a06 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wvrDr-000000006lN-24EV;
	Mon, 17 Aug 2026 06:53:27 +0000
Date: Mon, 17 Aug 2026 08:52:41 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: 
 arch/arm64/boot/dts/ti/k3-j784s4-evm-usxgmii-sgmii-exp1-exp2_board2.dtb:
 ethernet@c000000 (ti,j784s4-cpswxg-nuss): 'pinctrl-0' is a dependency of
 'pinctrl-names'
Message-ID: <202608170859.x96Zh7ay-lkp@intel.com>
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
TO: Gokul Praveen <g-praveen@ti.com>
CC: 0day robot <lkp@intel.com>

tree:   https://github.com/intel-lab-lkp/linux/commits/Gokul-Praveen/arm64-dts-ti-Add-PLL1-refclk-to-J784S4-SoC-SERDES-node/20260814-012617
head:   ca187dbfa5be4285eb94f2ab7c2179709bfdd754
commit: ca187dbfa5be4285eb94f2ab7c2179709bfdd754 arm64: dts: ti: k3-j784s4: Add overlay for dual port USXGMII+SGMII mode
date:   4 days ago
:::::: branch date: 4 days ago
:::::: commit date: 4 days ago
config: arm64-randconfig-2053-20260815 (https://download.01.org/0day-ci/archive/20260817/202608170859.x96Zh7ay-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project daa9d09970fed49996f42a8f7000b584f295991d)
dtschema: 2026.7.dev15+g01b5073ab
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260817/202608170859.x96Zh7ay-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202608170859.x96Zh7ay-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/ti/k3-j784s4-evm-usxgmii-sgmii-exp1-exp2_board2.dtb: ethernet@c000000 (ti,j784s4-cpswxg-nuss): 'pinctrl-0' is a dependency of 'pinctrl-names'
   	from schema $id: http://devicetree.org/schemas/pinctrl/pinctrl-consumer.yaml
>> arch/arm64/boot/dts/ti/k3-j784s4-evm-usxgmii-sgmii-exp1-exp2_board2.dtb: serdes@5020000 (ti,j721e-serdes-10g): clock-names: ['refclk', 'pll1_refclk', 'phy_en_refclk'] is too long
   	from schema $id: http://devicetree.org/schemas/phy/phy-cadence-torrent.yaml
--
>> arch/arm64/boot/dts/ti/k3-j784s4-evm-sgmii-usxgmii-exp1-exp2_board1.dtb: ethernet@c000000 (ti,j784s4-cpswxg-nuss): 'pinctrl-0' is a dependency of 'pinctrl-names'
   	from schema $id: http://devicetree.org/schemas/pinctrl/pinctrl-consumer.yaml
>> arch/arm64/boot/dts/ti/k3-j784s4-evm-sgmii-usxgmii-exp1-exp2_board1.dtb: serdes@5020000 (ti,j721e-serdes-10g): clock-names: ['refclk', 'pll1_refclk', 'phy_en_refclk'] is too long
   	from schema $id: http://devicetree.org/schemas/phy/phy-cadence-torrent.yaml

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
