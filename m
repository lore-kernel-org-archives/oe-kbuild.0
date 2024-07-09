Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66BF21527AF
	for <oe-kbuild@lists.linux.dev>; Tue,  9 Jul 2024 08:49:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720514963; cv=none; b=FVzZy29q2c20u/9zzm5yxH0ivTL63xKTuHz6yrcnxLBJL+evz/B1Atnqi7M1OOcJz1ifc/y5/PMyaMJTt10JxtvDuqNwuMR0pH0mqWSGsk40OpAY1P9NE+Uc7PJN3bW0H2wUPa5vETjwuQDSdV8n2hK46MVDyUq2qC+zBAvC3mY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720514963; c=relaxed/simple;
	bh=WU4uWSD0TLu4UqKuAp/SWEIR5Y6rYVTsmYwLe26sW6Q=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=J3k6zMUEOLUVy+ipYcmmyzuVs1UCml/bmFGqd5mFT34pTvF2l6SIA2pS+hon5jRnjO9l8O1Jnp/5xdPGolFZZowwTpBdNVI+HKji1ddHnLxdK0u0rXdH5jU4oiY9cin+VNmI1PavnCNCJRS2wyE4vN3UVfINk3ejklmC98WK8OE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fwBIbxdt; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fwBIbxdt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720514962; x=1752050962;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=WU4uWSD0TLu4UqKuAp/SWEIR5Y6rYVTsmYwLe26sW6Q=;
  b=fwBIbxdt/DN12/XXXO1+3k2FJ7VdPPjLrKnRIncoDIpuG8EaFbTTlXSG
   lR9PlgOiaYjf0jHm9SGlAHrlpoudNAVvHZz6P5ivDeQbfwxtTXP8nkgfF
   //PXwuzhxpWa8Bgc9LnDUWEgKtsFlqCtX3ajWuxW+p2G1YhhnZwUjBlFU
   WGYY5PpHrxGgCARowd980oHNQaHqI9jKDlVNzvCjduU/lzk5giYS4VuD3
   WDtw9ch08wMluU6B7V5ICTynoMAoeeU0XhKBT7e3FxZVdCOs0FbAoM6he
   CYCmzr0dE2fML2S2DQoJhrMNvhRUuG4+BZfoSm1p/ackGPeoGftIJ2sar
   g==;
X-CSE-ConnectionGUID: 7SsQUYERTeanycIZxV2MmQ==
X-CSE-MsgGUID: zYhHsO0dSoG7+aGGxncXbA==
X-IronPort-AV: E=McAfee;i="6700,10204,11127"; a="21519675"
X-IronPort-AV: E=Sophos;i="6.09,194,1716274800"; 
   d="scan'208";a="21519675"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jul 2024 01:49:21 -0700
X-CSE-ConnectionGUID: s3w94rUbR2uBRo0kNo/txA==
X-CSE-MsgGUID: qmQdB6UNRr+hSr3NR8sT7w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,194,1716274800"; 
   d="scan'208";a="47569387"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 09 Jul 2024 01:49:20 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sR6XF-000WUI-22;
	Tue, 09 Jul 2024 08:49:17 +0000
Date: Tue, 9 Jul 2024 16:48:18 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [clk:clk-mediatek 2/9] arch/arm64/boot/dts/mediatek/mt7622-rfb1.dtb:
 clock-controller@1a100800: compatible: 'oneOf' conditional failed, one must
 be fixed:
Message-ID: <202407091606.BCjtQxFr-lkp@intel.com>
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
CC: linux-clk@vger.kernel.org
CC: linux-arm-kernel@lists.infradead.org
TO: Christian Marangi <ansuelsmth@gmail.com>
CC: Stephen Boyd <sboyd@kernel.org>
CC: Krzysztof Kozlowski <krzk@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git clk-mediatek
head:   58c53d43142f222221e5a76a7016c4d8f3b84b97
commit: 9f7809c6a8824b7147595b3c36e633ffc81fe2ab [2/9] dt-bindings: clock: mediatek: add syscon compatible for mt7622 pciesys
:::::: branch date: 11 hours ago
:::::: commit date: 14 hours ago
config: arm64-randconfig-051-20240709 (https://download.01.org/0day-ci/archive/20240709/202407091606.BCjtQxFr-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
dtschema version: 2024.6.dev3+g650bf2d
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240709/202407091606.BCjtQxFr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202407091606.BCjtQxFr-lkp@intel.com/

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
>> arch/arm64/boot/dts/mediatek/mt7622-rfb1.dtb: clock-controller@1a100800: compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt7622-pciesys'] is too short
   	'mediatek,mt7629-pciesys' was expected
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
>> arch/arm64/boot/dts/mediatek/mt7622-bananapi-bpi-r64.dtb: clock-controller@1a100800: compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt7622-pciesys'] is too short
   	'mediatek,mt7629-pciesys' was expected
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,mt7622-pciesys.yaml#
   arch/arm64/boot/dts/mediatek/mt7622-bananapi-bpi-r64.dtb: /pcie@1a143000: failed to match any schema with compatible: ['mediatek,mt7622-pcie']
   arch/arm64/boot/dts/mediatek/mt7622-bananapi-bpi-r64.dtb: /pcie@1a145000: failed to match any schema with compatible: ['mediatek,mt7622-pcie']
   arch/arm64/boot/dts/mediatek/mt7622-bananapi-bpi-r64.dtb: switch@0: 'interrupts' is a dependency of 'interrupt-controller'
   	from schema $id: http://devicetree.org/schemas/net/dsa/mediatek,mt7530.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
