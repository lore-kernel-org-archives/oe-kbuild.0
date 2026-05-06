Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F342E1EA84
	for <oe-kbuild@lists.linux.dev>; Wed,  6 May 2026 19:06:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778094386; cv=none; b=GFIlgAYvDYMlQgZTJAt1qGFpwD/h5AR2tzeMgLOvJMv9Z8dmICbg+5UELLFxArXl9D9K1lWF9sjCIG3kN7BVgBvw2rjhtt1dR81gN2QsO99/7fRapJWZ5hsGkpnZ94E/p4T+Hb5dqNX4ddsNHv3OY+glCyGUewJSJo7zacbbOfw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778094386; c=relaxed/simple;
	bh=THSP315iGSHFiEwULxF9rDZV6voRz2hFVtBgjzUZ60E=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Iu6JnURpUvNSvbEzfI/8ZoYQh58IFCjwyxreDeXG+goHKBYvS2639NEPBRs/0R5rTMQcwVyEB8X8GsrHfVh5s/MCFrWuYXMLclvErDSJxZsS/HAn/kHY1ZZ2BMWxI+ENN1/iffinioevgq5Nt/SvteTgFXecXr3/Hw7jY2HnxnY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eTS3DRMp; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eTS3DRMp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778094384; x=1809630384;
  h=date:from:to:cc:subject:message-id;
  bh=THSP315iGSHFiEwULxF9rDZV6voRz2hFVtBgjzUZ60E=;
  b=eTS3DRMpU0PQTm5DdHpMgDMdkoqql66nNwYvKMJs1no1HGnc3+vI5lvG
   hc2AMeMOJEgt8zXLOx07cnF9hLfLPBIvQXqOrznIiBBiebvr/dFLRKVOF
   1oWqGxPJwdE/zXeoFzM9N+WywZwIDmbVKRzRIVWgRIphxqQw2woZu2VKh
   46rVOcmt5LEAmBiw5sPU79rqcoyPEsxBbrJaWEyRwWLL8W7QoA0JoXGgA
   2FZf0VrKAUCMgX3BX5z6WpXzFwBLlAfzyL9lOOXl5VXfSzAym2RTrbdA6
   Il3NIUgofnOkDu0im5+TQ7OyT+1uJvveFZb6m22vlHqFdPJrh7yJkmuBd
   g==;
X-CSE-ConnectionGUID: Ywl1RwYOSSCUBjUeFdp/mw==
X-CSE-MsgGUID: M3I2k4bQTbKs6yjHVrTnAg==
X-IronPort-AV: E=McAfee;i="6800,10657,11778"; a="78929360"
X-IronPort-AV: E=Sophos;i="6.23,220,1770624000"; 
   d="scan'208";a="78929360"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 May 2026 12:06:23 -0700
X-CSE-ConnectionGUID: At5irYi3Rki1Qx8R5Z3PHw==
X-CSE-MsgGUID: /HVaXH6bQ5ya9BNTRQteFw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,220,1770624000"; 
   d="scan'208";a="231854828"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by fmviesa010.fm.intel.com with ESMTP; 06 May 2026 12:06:21 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wKhZa-000000006bl-3ufv;
	Wed, 06 May 2026 19:06:18 +0000
Date: Wed, 06 May 2026 21:05:29 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: arch/arm64/boot/dts/mediatek/mt7622-bananapi-bpi-r64.dtb:
 pinctrl@10211000 (mediatek,mt7622-pinctrl): 'asm-sel-hog' does not match any
 of the regexes: '-pins(-[a-z]+)?$', '^pinctrl-[0-9]+$'
Message-ID: <202605062002.km6tMHLh-lkp@intel.com>
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
head:   adc1e5c6203cf13fe05a1ead08edcb3d3a3baae8
commit: 6e3b067d3c5e00dea2e38c609fcd247baa74dec4 arm64: dts: mediatek: mt7622: Align GPIO hog name with bindings
date:   1 year, 1 month ago
:::::: branch date: 5 hours ago
:::::: commit date: 1 year, 1 month ago
config: arm64-randconfig-2052-20260429 (https://download.01.org/0day-ci/archive/20260506/202605062002.km6tMHLh-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
dtschema: 2026.5.dev4+g4ccc1997d
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260506/202605062002.km6tMHLh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 6e3b067d3c5e ("arm64: dts: mediatek: mt7622: Align GPIO hog name with bindings")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202605062002.km6tMHLh-lkp@intel.com/

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
