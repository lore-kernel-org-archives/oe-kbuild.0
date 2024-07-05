Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAF6C3A8CB
	for <oe-kbuild@lists.linux.dev>; Fri,  5 Jul 2024 05:13:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720156441; cv=none; b=JcPHIokpZ+f1nJoerruxMzxQeL6u9AWyE8LdcEWbinnTAoHLp390fK0DARtbFetbtWnfBlNxdc7GFA18cy503LXnD5Lnwf6r3gxIaG6U2TUTKGXOrWGreE7Cowya2ubp4s70sdbbeJDQyEZqSw6zok6xy/BP2z90TliHnt+v8GU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720156441; c=relaxed/simple;
	bh=40nr4WmmoDOOcGFXymJ12XnBKSY7yheQ34I3OG6/0q0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=vBv2diwC0Pzx2ZbXdFa4LJptyPeeipt/PnO3jjyK1n36hyNOlaM+qya3iVDD8/bA1M3C8NoxIoxNbKnudH0rS2hL7aqLh/bdFAX0Y5zRyaYZQ6x+HnKZ0xnVv7PkoAafwtndnpo/MNQNOvmejuabu6b3zMM755hnUeqSOLPDp14=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=m4jNSuJs; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="m4jNSuJs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720156440; x=1751692440;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=40nr4WmmoDOOcGFXymJ12XnBKSY7yheQ34I3OG6/0q0=;
  b=m4jNSuJs6IRPHI5UZ55JSG87w8BNm0+fIPcNp5LMyxn/9Zt2MsFdk/o9
   ebYMY4/CgSE7gySHzxwZpmRh9c75dAEVZ9BPI/jn98nI7IXAqYqdG7I3T
   4+Edzf77NBCOOqYXsVfLr1Az4Jy2CFDvRJrV0hi5o5drHvqhPrBcx8PXN
   Akz7Z7OK7lS5lfotu/ZtRYDDWBUMFNvq9INvlmr9c4bMPlJpHfh8m0nes
   D2N8UWcmcuNXssGuLFLljBTz38dgAkq8lunUM5fL914xOwQLgtY4X4p5Z
   Z1Ta3HXs/XJeBhPZjExXNDEuBWpGErYjnXOiJWizA1ZzFtyFRoi38ulNV
   w==;
X-CSE-ConnectionGUID: kwN5WPDKQBa2gV6OGjA4Kw==
X-CSE-MsgGUID: fCfmU4r6QjmusPWqClGPRQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11123"; a="42861788"
X-IronPort-AV: E=Sophos;i="6.09,184,1716274800"; 
   d="scan'208";a="42861788"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jul 2024 22:13:59 -0700
X-CSE-ConnectionGUID: WopfsDeORAuZNGALuWxu3Q==
X-CSE-MsgGUID: rTcNgHH/RmCt1kNJdJhDuA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,184,1716274800"; 
   d="scan'208";a="69976615"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 04 Jul 2024 22:13:58 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sPbGe-000RxC-0F;
	Fri, 05 Jul 2024 05:13:56 +0000
Date: Fri, 5 Jul 2024 13:12:46 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [frank-w-bpi-r2-4.14:6.10-rc 30/35]
 arch/arm64/boot/dts/mediatek/mt7622-rfb1.dtb: clock-controller@1a100800:
 compatible: ['mediatek,mt7622-pciesys', 'syscon'] is too long
Message-ID: <202407051340.InjHPlPp-lkp@intel.com>
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
TO: Frank Wunderlich <frank-w@public-files.de>

tree:   https://github.com/frank-w/BPI-R2-4.14 6.10-rc
head:   16e22ff9e6052ffcab043b33e1ed0de08cdd2c64
commit: ddb26b11d3984899b8b64b737154427c66a2a528 [30/35] arm64: dts: mt7622: fix sata
:::::: branch date: 13 hours ago
:::::: commit date: 7 days ago
config: arm64-randconfig-051-20240705 (https://download.01.org/0day-ci/archive/20240705/202407051340.InjHPlPp-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
dtschema version: 2024.6.dev3+g650bf2d
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240705/202407051340.InjHPlPp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202407051340.InjHPlPp-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/mediatek/mt7622-rfb1.dtb: clock-controller@11220000: audio-controller:clock-names: ['infra_sys_audio_clk', 'top_audio_mux1_sel', 'top_audio_mux2_sel', 'top_audio_a1sys_hp', 'top_audio_a2sys_hp', 'i2s0_src_sel', 'i2s1_src_sel', 'i2s2_src_sel', 'i2s3_src_sel', 'i2s0_src_div', 'i2s1_src_div', 'i2s2_src_div', 'i2s3_src_div', 'i2s0_mclk_en', 'i2s1_mclk_en', 'i2s2_mclk_en', 'i2s3_mclk_en', 'i2so0_hop_ck', 'i2so1_hop_ck', 'i2so2_hop_ck', 'i2so3_hop_ck', 'i2si0_hop_ck', 'i2si1_hop_ck', 'i2si2_hop_ck', 'i2si3_hop_ck', 'asrc0_out_ck', 'asrc1_out_ck', 'asrc2_out_ck', 'asrc3_out_ck', 'audio_afe_pd', 'audio_afe_conn_pd', 'audio_a1sys_pd', 'audio_a2sys_pd'] is too short
   	from schema $id: http://devicetree.org/schemas/arm/mediatek/mediatek,audsys.yaml#
   arch/arm64/boot/dts/mediatek/mt7622-rfb1.dtb: clock-controller@11220000: audio-controller: 'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/arm/mediatek/mediatek,audsys.yaml#
   arch/arm64/boot/dts/mediatek/mt7622-rfb1.dtb: audio-controller: clocks: [[2, 2], [18, 80], [18, 81], [18, 107], [18, 108], [18, 89], [18, 90], [18, 91], [18, 92], [18, 95], [18, 96], [18, 97], [18, 98], [18, 103], [18, 104], [18, 105], [18, 106], [37, 8], [37, 9], [37, 10], [37, 11], [37, 4], [37, 5], [37, 6], [37, 7], [37, 14], [37, 15], [37, 39], [37, 40], [37, 0], [37, 46], [37, 17], [37, 18]] is too short
   	from schema $id: http://devicetree.org/schemas/sound/mediatek,mt2701-audio.yaml#
   arch/arm64/boot/dts/mediatek/mt7622-rfb1.dtb: audio-controller: clock-names: ['infra_sys_audio_clk', 'top_audio_mux1_sel', 'top_audio_mux2_sel', 'top_audio_a1sys_hp', 'top_audio_a2sys_hp', 'i2s0_src_sel', 'i2s1_src_sel', 'i2s2_src_sel', 'i2s3_src_sel', 'i2s0_src_div', 'i2s1_src_div', 'i2s2_src_div', 'i2s3_src_div', 'i2s0_mclk_en', 'i2s1_mclk_en', 'i2s2_mclk_en', 'i2s3_mclk_en', 'i2so0_hop_ck', 'i2so1_hop_ck', 'i2so2_hop_ck', 'i2so3_hop_ck', 'i2si0_hop_ck', 'i2si1_hop_ck', 'i2si2_hop_ck', 'i2si3_hop_ck', 'asrc0_out_ck', 'asrc1_out_ck', 'asrc2_out_ck', 'asrc3_out_ck', 'audio_afe_pd', 'audio_afe_conn_pd', 'audio_a1sys_pd', 'audio_a2sys_pd'] is too short
   	from schema $id: http://devicetree.org/schemas/sound/mediatek,mt2701-audio.yaml#
   arch/arm64/boot/dts/mediatek/mt7622-rfb1.dtb: audio-controller: 'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/sound/mediatek,mt2701-audio.yaml#
>> arch/arm64/boot/dts/mediatek/mt7622-rfb1.dtb: clock-controller@1a100800: compatible: ['mediatek,mt7622-pciesys', 'syscon'] is too long
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,mt7622-pciesys.yaml#
   arch/arm64/boot/dts/mediatek/mt7622-rfb1.dtb: /pcie@1a143000: failed to match any schema with compatible: ['mediatek,mt7622-pcie']
   arch/arm64/boot/dts/mediatek/mt7622-rfb1.dtb: /pcie@1a145000: failed to match any schema with compatible: ['mediatek,mt7622-pcie']
--
   arch/arm64/boot/dts/mediatek/mt7622-bananapi-bpi-r64.dtb: clock-controller@11220000: audio-controller:clock-names: ['infra_sys_audio_clk', 'top_audio_mux1_sel', 'top_audio_mux2_sel', 'top_audio_a1sys_hp', 'top_audio_a2sys_hp', 'i2s0_src_sel', 'i2s1_src_sel', 'i2s2_src_sel', 'i2s3_src_sel', 'i2s0_src_div', 'i2s1_src_div', 'i2s2_src_div', 'i2s3_src_div', 'i2s0_mclk_en', 'i2s1_mclk_en', 'i2s2_mclk_en', 'i2s3_mclk_en', 'i2so0_hop_ck', 'i2so1_hop_ck', 'i2so2_hop_ck', 'i2so3_hop_ck', 'i2si0_hop_ck', 'i2si1_hop_ck', 'i2si2_hop_ck', 'i2si3_hop_ck', 'asrc0_out_ck', 'asrc1_out_ck', 'asrc2_out_ck', 'asrc3_out_ck', 'audio_afe_pd', 'audio_afe_conn_pd', 'audio_a1sys_pd', 'audio_a2sys_pd'] is too short
   	from schema $id: http://devicetree.org/schemas/arm/mediatek/mediatek,audsys.yaml#
   arch/arm64/boot/dts/mediatek/mt7622-bananapi-bpi-r64.dtb: clock-controller@11220000: audio-controller: 'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/arm/mediatek/mediatek,audsys.yaml#
   arch/arm64/boot/dts/mediatek/mt7622-bananapi-bpi-r64.dtb: audio-controller: clocks: [[2, 2], [18, 80], [18, 81], [18, 107], [18, 108], [18, 89], [18, 90], [18, 91], [18, 92], [18, 95], [18, 96], [18, 97], [18, 98], [18, 103], [18, 104], [18, 105], [18, 106], [38, 8], [38, 9], [38, 10], [38, 11], [38, 4], [38, 5], [38, 6], [38, 7], [38, 14], [38, 15], [38, 39], [38, 40], [38, 0], [38, 46], [38, 17], [38, 18]] is too short
   	from schema $id: http://devicetree.org/schemas/sound/mediatek,mt2701-audio.yaml#
   arch/arm64/boot/dts/mediatek/mt7622-bananapi-bpi-r64.dtb: audio-controller: clock-names: ['infra_sys_audio_clk', 'top_audio_mux1_sel', 'top_audio_mux2_sel', 'top_audio_a1sys_hp', 'top_audio_a2sys_hp', 'i2s0_src_sel', 'i2s1_src_sel', 'i2s2_src_sel', 'i2s3_src_sel', 'i2s0_src_div', 'i2s1_src_div', 'i2s2_src_div', 'i2s3_src_div', 'i2s0_mclk_en', 'i2s1_mclk_en', 'i2s2_mclk_en', 'i2s3_mclk_en', 'i2so0_hop_ck', 'i2so1_hop_ck', 'i2so2_hop_ck', 'i2so3_hop_ck', 'i2si0_hop_ck', 'i2si1_hop_ck', 'i2si2_hop_ck', 'i2si3_hop_ck', 'asrc0_out_ck', 'asrc1_out_ck', 'asrc2_out_ck', 'asrc3_out_ck', 'audio_afe_pd', 'audio_afe_conn_pd', 'audio_a1sys_pd', 'audio_a2sys_pd'] is too short
   	from schema $id: http://devicetree.org/schemas/sound/mediatek,mt2701-audio.yaml#
   arch/arm64/boot/dts/mediatek/mt7622-bananapi-bpi-r64.dtb: audio-controller: 'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/sound/mediatek,mt2701-audio.yaml#
>> arch/arm64/boot/dts/mediatek/mt7622-bananapi-bpi-r64.dtb: clock-controller@1a100800: compatible: ['mediatek,mt7622-pciesys', 'syscon'] is too long
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,mt7622-pciesys.yaml#
   arch/arm64/boot/dts/mediatek/mt7622-bananapi-bpi-r64.dtb: /pcie@1a143000: failed to match any schema with compatible: ['mediatek,mt7622-pcie']
   arch/arm64/boot/dts/mediatek/mt7622-bananapi-bpi-r64.dtb: /pcie@1a145000: failed to match any schema with compatible: ['mediatek,mt7622-pcie']
   arch/arm64/boot/dts/mediatek/mt7622-bananapi-bpi-r64.dtb: switch@1f: 'interrupts' is a dependency of 'interrupt-controller'
   	from schema $id: http://devicetree.org/schemas/net/dsa/mediatek,mt7530.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
