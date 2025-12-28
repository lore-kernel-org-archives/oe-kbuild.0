Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C86D115E97
	for <oe-kbuild@lists.linux.dev>; Sun, 28 Dec 2025 17:52:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766944379; cv=none; b=gilo/LE/JeANE9Elg39/f9VdEgVuUZlbHIci5ZgFsYN4mgeMOtnriEcPZ0USVa723XMV2h+c3yNlyXfOfgnDOCZfcLgeX18pTbbvcn2/+Bwu6wwMSP5iEUkEU9YDyHJC+EchT3t1I/+LL2XGlaN/DdtfZnIfHuHPApxI8hBbALE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766944379; c=relaxed/simple;
	bh=ft3wgAsKo2r8gQZ+5QnD8zp7QQNLNTnJa0gtAPfMCNU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=QPZbZjAuv0H2RrHOoaZb8m4W2m8b+Zf7g6Pa3ZwMfXEn4Jt4xMhb1wFapg21U+PGLH+Uxm5fFDodzldh5Ve3EUytRfyqsSNAIW8cvUtyPe8/g+SPLwdHFqadyXZ2aK3Cg7P9TjPw+ixD2eauQdfnEXpoeawdYdvWNw/cQeHTg5o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=g9KBEr2+; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="g9KBEr2+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766944378; x=1798480378;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ft3wgAsKo2r8gQZ+5QnD8zp7QQNLNTnJa0gtAPfMCNU=;
  b=g9KBEr2+atYJaiCfYmIkKZj7ZP/YRPeS+1qjeCtS1BPoY0RVAqvWh8Pj
   I2rVdgyBFqnMdPvbnhAlUu3xkRKD82ebCgJ73gzohDmOeApEkXbX51fLC
   YvAjiLCljFPNEE51Cjaf6v6yDaLm/Dl68l9Cwux2NJYJsA+JLr0ieHdRJ
   aSmPKf/9pp6/EUQeylm4xq+GAJ+tVOz0LP+Tz+BIFNtTnRLT9OsaNv+Jz
   Tx0oLOYVfZ3WxQ0tDmzw4CkzL8vhDQoTvjMktaNWu9bshx4LqjGLLPScw
   tFWPpTaGnulUya7QJ3ZD7WOqtk1g2apWPwJvUKeaJJQgZY1KGKSZYB0Dh
   A==;
X-CSE-ConnectionGUID: SwsdstXeTmuQHL7Sq7LlMQ==
X-CSE-MsgGUID: QQk/GNrwQR6Bmwymj2QbXg==
X-IronPort-AV: E=McAfee;i="6800,10657,11655"; a="91236876"
X-IronPort-AV: E=Sophos;i="6.21,184,1763452800"; 
   d="scan'208";a="91236876"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Dec 2025 09:52:58 -0800
X-CSE-ConnectionGUID: Xt2iL5w4SriRsRUJNIbh/Q==
X-CSE-MsgGUID: wi2SBaTpSVqkxJ87p2PmeA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,184,1763452800"; 
   d="scan'208";a="205282133"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by orviesa004.jf.intel.com with ESMTP; 28 Dec 2025 09:52:57 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vZuwo-000000007Zc-0Lbh;
	Sun, 28 Dec 2025 17:52:54 +0000
Date: Sun, 28 Dec 2025 18:52:34 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [krzk-dt:next/dt64 11/12] arch/arm64/boot/dts/apm/apm-mustang.dtb:
 poweroff@10548010 (syscon-poweroff): 'reg' does not match any of the
 regexes: '^pinctrl-[0-9]+$'
Message-ID: <202512281808.RTUHahkI-lkp@intel.com>
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
TO: "Rob Herring (Arm)" <robh@kernel.org>
CC: Krzysztof Kozlowski <krzk@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux-dt.git next/dt64
head:   5cd532f7f017460395836d8f129ad3ee5ae63110
commit: a1176f7c5b990244e9a0ee2bdd93c9a36e5fe666 [11/12] arm64: dts: apm: Add "reg" to "syscon-reboot" and "syscon-poweroff"
:::::: branch date: 6 days ago
:::::: commit date: 6 days ago
config: arm64-randconfig-2052-20251224 (https://download.01.org/0day-ci/archive/20251228/202512281808.RTUHahkI-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.4.0
dtschema version: 2025.12
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251228/202512281808.RTUHahkI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202512281808.RTUHahkI-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/apm/apm-mustang.dtb: mmc@1c000000 (arasan,sdhci-4.9a): Unevaluated properties are not allowed ('dma-coherent' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mmc/arasan,sdhci.yaml
   arch/arm64/boot/dts/apm/apm-mustang.dtb: ethernet@17020000 (apm,xgene-enet): phy-handle:0: [36, 37] is too long
   	from schema $id: http://devicetree.org/schemas/net/apm,xgene-enet.yaml
   arch/arm64/boot/dts/apm/apm-mustang.dtb: ethernet@17020000 (apm,xgene-enet): Unevaluated properties are not allowed ('local-mac-address', 'phy-connection-type', 'phy-handle' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/apm,xgene-enet.yaml
   arch/arm64/boot/dts/apm/apm-mustang.dtb: ethernet@17020000 (apm,xgene-enet): phy-handle:0: [36, 37] is too long
   	from schema $id: http://devicetree.org/schemas/net/ethernet-controller.yaml
   arch/arm64/boot/dts/apm/apm-mustang.dtb: dma@1f270000 (apm,xgene-storm-dma): 'device_type' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/dma/apm,xgene-storm-dma.yaml
>> arch/arm64/boot/dts/apm/apm-mustang.dtb: poweroff@10548010 (syscon-poweroff): 'reg' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/power/reset/syscon-poweroff.yaml
--
   arch/arm64/boot/dts/apm/apm-shadowcat.dtsi:243.10-411.5: Warning (simple_bus_reg): /soc/clocks: missing or empty reg/ranges property
   arch/arm64/boot/dts/apm/apm-shadowcat.dtsi:745.23-751.5: Warning (unique_unit_address_if_enabled): /soc/mdio@1f610000: duplicate unit-address (also used in node /soc/ethernet@1f610000)
   arch/arm64/boot/dts/apm/apm-shadowcat.dtsi:305.28-315.6: Warning (unique_unit_address_if_enabled): /soc/clocks/ahbclk@17000000: duplicate unit-address (also used in node /soc/clocks/rngpkaclk@17000000)
   arch/arm64/boot/dts/apm/apm-shadowcat.dtsi:317.32-327.6: Warning (unique_unit_address_if_enabled): /soc/clocks/sbapbclk@1704c000: duplicate unit-address (also used in node /soc/clocks/i2c4clk@1704c000)
   	from schema $id: http://devicetree.org/schemas/power/reset/syscon-reboot.yaml
   arch/arm64/boot/dts/apm/apm-merlin.dtb: mmc@1c000000 (arasan,sdhci-4.9a): Unevaluated properties are not allowed ('dma-coherent' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mmc/arasan,sdhci.yaml
>> arch/arm64/boot/dts/apm/apm-merlin.dtb: poweroff@10548010 (syscon-poweroff): 'reg' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/power/reset/syscon-poweroff.yaml

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
