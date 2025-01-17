Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E3971F7577
	for <oe-kbuild@lists.linux.dev>; Fri, 17 Jan 2025 08:34:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737102854; cv=none; b=n/4qNVfxRkcqnYb/92X/BW08gHycHbG9XVUA1XDu9amYqpF99hqkdO1dTxqj+YuFTZvv7//bBXl46nCAoC+KhHf+i+HfS7cjslvZcot2e4crlpUScgxEH5mO6DW/WFJn3IGRz0Y2PxQ8aJnwSQEOLSjzYUQNbhv0XSnYDUvg+EA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737102854; c=relaxed/simple;
	bh=GFDmsMNmEZMRginQIzlWE4AQbGejlpZ+dsrsCMmaZSM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=QwUpdmD/SHeMQD46c3XVZhDRlPFM6ZXlkynGoNrGyWxL68w7lctBvdMhlTw6f0niB4jS83ud/rvo/dpOUc6sz/7etHPc7rmYVGuuR44AD/eQgeKbRK3PxyVxOm0sTTbk1Bf2+g43cTvGYE9RV5WU92ZsBN0SOt+VSMSsiiHb0bg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dHUkTodS; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dHUkTodS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737102852; x=1768638852;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=GFDmsMNmEZMRginQIzlWE4AQbGejlpZ+dsrsCMmaZSM=;
  b=dHUkTodSPVJMlMUOvBBeL/iv5p+NH6YS/Cy5wA8UaDQke23d+Qj9MHKn
   kB0pNXg59XSxDcGU2cAMFhKP4iBe2zwj16IBlZIsr5hcYAFskUsqUKyY9
   IqKuChqs+hWNe5/gCV5sJQ5Fqkf9ECFJhZ850MIyHTFBQF4HLjOoojVOK
   dcOajMqQrBcQ6pcH+ccWfNAEda/KNQ2NdW9aoZrESA8lN4fyF5mE06a/l
   GgCwh1U2jG+skDhD8vIdUXK2vVtwT7S91Zo6otu55EH01Kaj1EzufBvpa
   NdVQYlaRdoAhP3MMVKj8fQskHpSO3+tfPpxU1PJxozh6b/fdMjr3fTTXy
   g==;
X-CSE-ConnectionGUID: qp8gEF00S1OoDGoByAU+nw==
X-CSE-MsgGUID: nWj21tuIQ5CQqNvJO366vw==
X-IronPort-AV: E=McAfee;i="6700,10204,11317"; a="37553110"
X-IronPort-AV: E=Sophos;i="6.13,211,1732608000"; 
   d="scan'208";a="37553110"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jan 2025 00:34:12 -0800
X-CSE-ConnectionGUID: 2xt9HCf6T82qHkzg4nYUew==
X-CSE-MsgGUID: xPJEiv8bSDmZmDv2PU4e1w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="109812144"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 17 Jan 2025 00:34:11 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tYhnt-000Sxx-00;
	Fri, 17 Jan 2025 08:34:09 +0000
Date: Fri, 17 Jan 2025 16:33:22 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [krzk-github:n/str-enable-disable 48/59]
 arch/arm64/boot/dts/mediatek/mt7622-bananapi-bpi-r64.dtb: pinctrl@10211000:
 'asm-sel-hog' does not match any of the regexes: '-pins(-[a-z]+)?$',
 'pinctrl-[0-9]+'
Message-ID: <202501171621.Uc4WiY0K-lkp@intel.com>
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

tree:   https://github.com/krzk/linux n/str-enable-disable
head:   bd2e2630d542c17294dcf6b292cfaeb576adbbbc
commit: d4d9adeac6c6e57df4d88a6a919b4ee9e7f728eb [48/59] arm64: dts: mediatek: mt7622: Align GPIO hog name with bindings
:::::: branch date: 24 hours ago
:::::: commit date: 2 days ago
config: arm64-randconfig-051-20250117 (https://download.01.org/0day-ci/archive/20250117/202501171621.Uc4WiY0K-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
dtschema version: 2024.12.dev6+gc4da38d
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250117/202501171621.Uc4WiY0K-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202501171621.Uc4WiY0K-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/mediatek/mt7622-bananapi-bpi-r64.dtb: pwrap@10001000: 'regulators' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/soc/mediatek/mediatek,pwrap.yaml#
   arch/arm64/boot/dts/mediatek/mt7622-bananapi-bpi-r64.dtb: /pwrap@10001000/regulators: failed to match any schema with compatible: ['mediatek,mt6380-regulator']
   arch/arm64/boot/dts/mediatek/mt7622-bananapi-bpi-r64.dtb: /power-controller@10006000: failed to match any schema with compatible: ['mediatek,mt7622-scpsys', 'syscon']
   arch/arm64/boot/dts/mediatek/mt7622-bananapi-bpi-r64.dtb: pinctrl@10211000: reg: [[0, 270602240, 0, 4096], [0, 268455936, 0, 4096]] is too long
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt7622-pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt7622-bananapi-bpi-r64.dtb: pinctrl@10211000: reg-names:0: 'eint' was expected
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt7622-pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt7622-bananapi-bpi-r64.dtb: pinctrl@10211000: reg-names: ['base', 'eint'] is too long
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt7622-pinctrl.yaml#
>> arch/arm64/boot/dts/mediatek/mt7622-bananapi-bpi-r64.dtb: pinctrl@10211000: 'asm-sel-hog' does not match any of the regexes: '-pins(-[a-z]+)?$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt7622-pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt7622-bananapi-bpi-r64.dtb: cci@10390000: slave-if@5000:compatible: ['arm,cci-400-ctrl-if', 'syscon'] is too long
   	from schema $id: http://devicetree.org/schemas/arm/arm,cci-400.yaml#
   arch/arm64/boot/dts/mediatek/mt7622-bananapi-bpi-r64.dtb: clock-controller@11220000: audio-controller:clocks: [[2, 2], [18, 80], [18, 81], [18, 107], [18, 108], [18, 89], [18, 90], [18, 91], [18, 92], [18, 95], [18, 96], [18, 97], [18, 98], [18, 103], [18, 104], [18, 105], [18, 106], [38, 8], [38, 9], [38, 10], [38, 11], [38, 4], [38, 5], [38, 6], [38, 7], [38, 14], [38, 15], [38, 39], [38, 40], [38, 0], [38, 46], [38, 17], [38, 18]] is too short
   	from schema $id: http://devicetree.org/schemas/arm/mediatek/mediatek,audsys.yaml#
   arch/arm64/boot/dts/mediatek/mt7622-bananapi-bpi-r64.dtb: clock-controller@11220000: audio-controller:clock-names: ['infra_sys_audio_clk', 'top_audio_mux1_sel', 'top_audio_mux2_sel', 'top_audio_a1sys_hp', 'top_audio_a2sys_hp', 'i2s0_src_sel', 'i2s1_src_sel', 'i2s2_src_sel', 'i2s3_src_sel', 'i2s0_src_div', 'i2s1_src_div', 'i2s2_src_div', 'i2s3_src_div', 'i2s0_mclk_en', 'i2s1_mclk_en', 'i2s2_mclk_en', 'i2s3_mclk_en', 'i2so0_hop_ck', 'i2so1_hop_ck', 'i2so2_hop_ck', 'i2so3_hop_ck', 'i2si0_hop_ck', 'i2si1_hop_ck', 'i2si2_hop_ck', 'i2si3_hop_ck', 'asrc0_out_ck', 'asrc1_out_ck', 'asrc2_out_ck', 'asrc3_out_ck', 'audio_afe_pd', 'audio_afe_conn_pd', 'audio_a1sys_pd', 'audio_a2sys_pd'] is too short
   	from schema $id: http://devicetree.org/schemas/arm/mediatek/mediatek,audsys.yaml#
   arch/arm64/boot/dts/mediatek/mt7622-bananapi-bpi-r64.dtb: clock-controller@11220000: audio-controller: 'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/arm/mediatek/mediatek,audsys.yaml#
   arch/arm64/boot/dts/mediatek/mt7622-bananapi-bpi-r64.dtb: audio-controller: clocks: [[2, 2], [18, 80], [18, 81], [18, 107], [18, 108], [18, 89], [18, 90], [18, 91], [18, 92], [18, 95], [18, 96], [18, 97], [18, 98], [18, 103], [18, 104], [18, 105], [18, 106], [38, 8], [38, 9], [38, 10], [38, 11], [38, 4], [38, 5], [38, 6], [38, 7], [38, 14], [38, 15], [38, 39], [38, 40], [38, 0], [38, 46], [38, 17], [38, 18]] is too short

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
