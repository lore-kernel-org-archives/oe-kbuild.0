Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C41B918FDBE
	for <oe-kbuild@lists.linux.dev>; Sun,  3 May 2026 00:51:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777769473; cv=none; b=us8UIQ1IP5MW1Zg4OJak9lb3/kwEPuQcsfpAyihXwSHI8Yx8CSvD/vVYS71btfO/nwO7Z6Oa0zw2NLDoosKNEG7ZY7w8+jbs9k9iTNAuUehp7tSqllYCiDTM3d+bVwXH4LGrzX6cTvDo1FU6NHoTzxzmLo7Qi8tyyd2i/qWwK8Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777769473; c=relaxed/simple;
	bh=62m5p9qDXWLdUyc8B9AHZQdcvSwK84Vbtv5TWgWhoHo=;
	h=Date:From:To:Cc:Subject:Message-ID; b=VCBRWbcOinFY3/TgDw7FiOqUn3F2fR5EEEWKnl+RJu6nk/6OB9a4O9iE9EXjHUdt08q77VjTJzjPa/noj0VvFOrRl1bEekaZ94pM9ByBUGLVb5G+Yqk058oZDrvmpI6nkaS7PYslQyQigizkaK453F04cviVP1qTTOF4mO8EHHw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Sq3UbEtE; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Sq3UbEtE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777769472; x=1809305472;
  h=date:from:to:cc:subject:message-id;
  bh=62m5p9qDXWLdUyc8B9AHZQdcvSwK84Vbtv5TWgWhoHo=;
  b=Sq3UbEtEIfJU9bWZAulSXoErXG/xbynxUIN9IRCZtKKCe3vMu0EQj3jP
   Mp5QQU+aCgjT7s5YcqpGO/l6fSnAccUIZCAqi99FgzGujeu9ZbEls8Sse
   pTYqB4cKB2r5iYbZS54cEMVS4a0PG5TE+PX+vm7eFLVNJO9A4YOGCvxUV
   MFEuuyzAjPRYHtQqKqKQui12WQBIZUl/MM9jD0dCqH3BSOxYoDPFpdgNE
   eJk6FxrvKKt3rTGX4CbnruVTGbjQHdarfBZaAN3CYzJn5vFTUJQGKARfR
   z1SA0HTO5nKAQ1Qn5ehMuvCdvDwW3neunjrK42D2rSmF2cpFuvpUS1fkC
   w==;
X-CSE-ConnectionGUID: Xg2tw1jdTOO99XGuSFfYUw==
X-CSE-MsgGUID: U7ImZ79ZQa+j/ogW/UiDwg==
X-IronPort-AV: E=McAfee;i="6800,10657,11774"; a="90058049"
X-IronPort-AV: E=Sophos;i="6.23,213,1770624000"; 
   d="scan'208";a="90058049"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 May 2026 17:51:11 -0700
X-CSE-ConnectionGUID: FDdzH+WYTcSgG1nZfRuauw==
X-CSE-MsgGUID: rNx+0aPzSCCNHzHMyAO78g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,213,1770624000"; 
   d="scan'208";a="230822445"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by fmviesa010.fm.intel.com with ESMTP; 02 May 2026 17:51:10 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wJL36-000000005Pp-1IE9;
	Sun, 03 May 2026 00:51:08 +0000
Date: Sun, 03 May 2026 02:50:38 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: arch/arm64/boot/dts/mediatek/mt7622-bananapi-bpi-r64.dtb:
 pinctrl@10211000 (mediatek,mt7622-pinctrl): 'asm-sel-hog' does not match any
 of the regexes: '-pins(-[a-z]+)?$', '^pinctrl-[0-9]+$'
Message-ID: <202605030219.tXpHxzIe-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "dtcheck: too old problem, older than 3 months"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Krzysztof Kozlowski <krzk@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   66edb901bf874d9e0787326ba12d3548b2da8700
commit: 6e3b067d3c5e00dea2e38c609fcd247baa74dec4 arm64: dts: mediatek: mt7622: Align GPIO hog name with bindings
date:   1 year, 1 month ago
:::::: branch date: 5 hours ago
:::::: commit date: 1 year, 1 month ago
config: arm64-randconfig-2052-20260429 (https://download.01.org/0day-ci/archive/20260503/202605030219.tXpHxzIe-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
dtschema: 2026.5.dev4+g4ccc1997d
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260503/202605030219.tXpHxzIe-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 6e3b067d3c5e ("arm64: dts: mediatek: mt7622: Align GPIO hog name with bindings")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202605030219.tXpHxzIe-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/mediatek/mt7622-bananapi-bpi-r64.dtb: pwrap@10001000 (mediatek,mt7622-pwrap): 'regulators' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/soc/mediatek/mediatek,pwrap.yaml
   arch/arm64/boot/dts/mediatek/mt7622-bananapi-bpi-r64.dtb: /pwrap@10001000/regulators: failed to match any schema with compatible: ['mediatek,mt6380-regulator']
   arch/arm64/boot/dts/mediatek/mt7622-bananapi-bpi-r64.dtb: /power-controller@10006000: failed to match any schema with compatible: ['mediatek,mt7622-scpsys', 'syscon']
>> arch/arm64/boot/dts/mediatek/mt7622-bananapi-bpi-r64.dtb: pinctrl@10211000 (mediatek,mt7622-pinctrl): 'asm-sel-hog' does not match any of the regexes: '-pins(-[a-z]+)?$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt7622-pinctrl.yaml
   arch/arm64/boot/dts/mediatek/mt7622-bananapi-bpi-r64.dtb: pinctrl@10211000 (mediatek,mt7622-pinctrl): reg: [[0, 270602240, 0, 4096], [0, 268455936, 0, 4096]] is too long
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt7622-pinctrl.yaml
   arch/arm64/boot/dts/mediatek/mt7622-bananapi-bpi-r64.dtb: pinctrl@10211000 (mediatek,mt7622-pinctrl): reg-names:0: 'eint' was expected
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt7622-pinctrl.yaml
   arch/arm64/boot/dts/mediatek/mt7622-bananapi-bpi-r64.dtb: pinctrl@10211000 (mediatek,mt7622-pinctrl): reg-names: ['base', 'eint'] is too long
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt7622-pinctrl.yaml
   arch/arm64/boot/dts/mediatek/mt7622-bananapi-bpi-r64.dtb: cci@10390000 (arm,cci-400): slave-if@5000:compatible: ['arm,cci-400-ctrl-if', 'syscon'] is too long
   	from schema $id: http://devicetree.org/schemas/arm/arm,cci-400.yaml
   arch/arm64/boot/dts/mediatek/mt7622-bananapi-bpi-r64.dtb: clock-controller@11220000 (mediatek,mt7622-audsys): audio-controller:clock-names: ['infra_sys_audio_clk', 'top_audio_mux1_sel', 'top_audio_mux2_sel', 'top_audio_a1sys_hp', 'top_audio_a2sys_hp', 'i2s0_src_sel', 'i2s1_src_sel', 'i2s2_src_sel', 'i2s3_src_sel', 'i2s0_src_div', 'i2s1_src_div', 'i2s2_src_div', 'i2s3_src_div', 'i2s0_mclk_en', 'i2s1_mclk_en', 'i2s2_mclk_en', 'i2s3_mclk_en', 'i2so0_hop_ck', 'i2so1_hop_ck', 'i2so2_hop_ck', 'i2so3_hop_ck', 'i2si0_hop_ck', 'i2si1_hop_ck', 'i2si2_hop_ck', 'i2si3_hop_ck', 'asrc0_out_ck', 'asrc1_out_ck', 'asrc2_out_ck', 'asrc3_out_ck', 'audio_afe_pd', 'audio_afe_conn_pd', 'audio_a1sys_pd', 'audio_a2sys_pd'] is too short

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
