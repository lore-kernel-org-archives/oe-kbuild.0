Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 056151F7569
	for <oe-kbuild@lists.linux.dev>; Fri,  1 May 2026 04:35:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777610148; cv=none; b=AQ1hyA5DPCpmgpuabnnR97BBkjPnsehJQk/RC0NHGVQmR8jEO7HGCMQUgswyU2Ddr2NeWOdYGpcoQiL2OV3/XjHq6TZbhUI06mIBQCC8UbvCdx6ccJajIrMJxXknf6MAA08EgDzA/wt4naY7SlqOOr1+U4zUBTehCNUwLFRacyU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777610148; c=relaxed/simple;
	bh=lxIdhoXkoK0VDwKYm1SA0HAuGjIhTKOFrF9zueoHuFw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=hTdgRQ24ycQWLSIFKSffl3vP4ZnOciVqLS9sjgtaG7RVoc6q/82bFTfsGvLiklYRLO1TxqRVtfFMTTt2/EpD3mnqbi7lPFbl6x7aPKlwyZLdj2StsiwlHSCRmVXEgAXppSy0gTPNAOEtIXeZHrHSa6Msoh3yrfk4Fy1FYmXqLN8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nSB30svg; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nSB30svg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777610146; x=1809146146;
  h=date:from:to:cc:subject:message-id;
  bh=lxIdhoXkoK0VDwKYm1SA0HAuGjIhTKOFrF9zueoHuFw=;
  b=nSB30svgX+GGHGxp3QKdQk+OWlBh/KLkbYtVr7IDzgIvpDFY8Qug3suJ
   7lqXghnNDYfE7FfFxeuEr+8GUVl6CUI7vylcae3SsSZQYuyeg8eX+CNI2
   0JeVOW0ECezRZfCwpnNJeVGjAgVu759k3jNVvBaKEMeyX6qg9z20gkr6Y
   /99u+Kyzek1KhvE+3MWQs7xvFywrlVE7iw2RcTrbIJdYBPMuG82pu+Ppr
   /QnOY2/4XBXH4rFalJ03+JAiQLdgvDpXmylm5orhAqNEYtdfkKtJEtS8W
   PDX1glye/8E98sMQWdWvkUlMfnyYVL0KpfxjMrs4kU5hQd96KCvmOd7ox
   w==;
X-CSE-ConnectionGUID: XE32VU/ITOmSM8taZyxmTA==
X-CSE-MsgGUID: 1YLvdctDRTG744dXbOE3pQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11772"; a="82183169"
X-IronPort-AV: E=Sophos;i="6.23,209,1770624000"; 
   d="scan'208";a="82183169"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Apr 2026 21:35:46 -0700
X-CSE-ConnectionGUID: abKZtXQ1Rm6Faqbc6Ef5kA==
X-CSE-MsgGUID: V1CZNQovTa2hLY1L8Sh8fw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,209,1770624000"; 
   d="scan'208";a="239106695"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by orviesa004.jf.intel.com with ESMTP; 30 Apr 2026 21:35:45 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wIfbK-000000004yT-30Ju;
	Fri, 01 May 2026 04:35:42 +0000
Date: Fri, 01 May 2026 06:35:10 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: arch/arm64/boot/dts/mediatek/mt7622-bananapi-bpi-r64.dtb:
 pinctrl@10211000 (mediatek,mt7622-pinctrl): 'asm-sel-hog' does not match any
 of the regexes: '-pins(-[a-z]+)?$', '^pinctrl-[0-9]+$'
Message-ID: <202605010656.cBlTNuER-lkp@intel.com>
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
head:   26fd6bff2c050196005312d1d306889220952a99
commit: 6e3b067d3c5e00dea2e38c609fcd247baa74dec4 arm64: dts: mediatek: mt7622: Align GPIO hog name with bindings
date:   1 year ago
:::::: branch date: 4 hours ago
:::::: commit date: 1 year ago
config: arm64-randconfig-2052-20260429 (https://download.01.org/0day-ci/archive/20260501/202605010656.cBlTNuER-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
dtschema: 2026.5.dev4+g4ccc1997d
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260501/202605010656.cBlTNuER-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 6e3b067d3c5e ("arm64: dts: mediatek: mt7622: Align GPIO hog name with bindings")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202605010656.cBlTNuER-lkp@intel.com/

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
