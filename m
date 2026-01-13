Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F45F201278
	for <oe-kbuild@lists.linux.dev>; Tue, 13 Jan 2026 02:29:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768271387; cv=none; b=o4FZ8yI07nMcMmlPdm2i2rqUeCEy0XBVwsK/twIjBWNb2RNfCaR8lEQD8l2Xym6hVuVx/EMiifafE7JhSyUpNUW6GTg52WhN2P3uOXBXzb3pA6kH6SCqJNTROnBU12ajDz08cJiF/V2GzsFKbAwh3ZbMeiVK++jMxApa8SnC6mg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768271387; c=relaxed/simple;
	bh=puYwZe3n2NX3bonjbBhhM9+piNX1w2nfgN+3D6zrJR8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=YT0eGGIaNgJFvHg5X+YjNHt0TGOIBAm2dSQ/VMRrTElg2quEFzsCLRA9gxVkJdMXF+ZxXYb+qIFOjZZmsIRjRWbDBCx1PF4/LmrUk3EsA+03CUd3GfN4nslQCKpRTA1WKm9Qt+/M3MAxMe/fREk+7r0RRtNp20NTCvHrkMnm2y8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aFkSOpjs; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aFkSOpjs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768271386; x=1799807386;
  h=date:from:to:cc:subject:message-id;
  bh=puYwZe3n2NX3bonjbBhhM9+piNX1w2nfgN+3D6zrJR8=;
  b=aFkSOpjsb1ptWt3SvKeKmDqQ1CvGxqH+JjWO6RYfmEHgYb2UG3oI8eRa
   qob01PyXIdCHgA3N7rFngwjW/a/+dQYtoqIDlY76wTKfE1C7tvuLd7lkL
   ptbQGlBa5ODPHOqEx1HBS6PX9U/F5MYJrEd4L7xW4Jrumjlxh68qz5U2n
   REOogjZoKPSBEexPzmjOV7IUfoYj6DdmBuc0IQQ7c5oWUtj4AEDKi+jMN
   e6Wywq4c7RSUQL81+Vlbw/t7RCOZbeP/YF8+6Y2Vuxwkh2aerMAulbkzH
   2+syWY8hH4yoAUeV3xztPKITa2E3Aq5ImZ/k7IUqFAWOfMLghuVr3n38r
   Q==;
X-CSE-ConnectionGUID: jtP6WVLTQQOupf0pUOTr0Q==
X-CSE-MsgGUID: AF9B/RhtRcSPMJmv3O+XGQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11669"; a="73396854"
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; 
   d="scan'208";a="73396854"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jan 2026 18:29:45 -0800
X-CSE-ConnectionGUID: jUo06m30QjqW4O2Wpl8D8Q==
X-CSE-MsgGUID: Lu+oBHvJS/2hiyZQFVpgiA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; 
   d="scan'208";a="204897734"
Received: from igk-lkp-server01.igk.intel.com (HELO 8581b2e2a62c) ([10.211.93.152])
  by fmviesa010.fm.intel.com with ESMTP; 12 Jan 2026 18:29:41 -0800
Received: from kbuild by 8581b2e2a62c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vfUA7-0000000012H-2BjJ;
	Tue, 13 Jan 2026 02:29:39 +0000
Date: Tue, 13 Jan 2026 03:29:26 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [conor:pinctrl 6/14]
 arch/arm64/boot/dts/qcom/msm8976-longcheer-l9360.dtb: pinctrl@1000000
 (qcom,msm8976-pinctrl): ts-int-state: 'oneOf' conditional failed, one must be
 fixed:
Message-ID: <202601130343.lXDVYM5M-lkp@intel.com>
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
TO: Conor Dooley <conor+lkp@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git pinctrl
head:   a8805fb8a49841ef67f240537e28ed40ce539661
commit: 1ed6a1e08e61d88da8aaee79dae0f5fdb1963218 [6/14] dt-bindings: pinctrl: pincfg-node: add restrictions on conflicting properties
:::::: branch date: 3 weeks ago
:::::: commit date: 3 weeks ago
config: arm64-randconfig-2052-20260112 (https://download.01.org/0day-ci/archive/20260113/202601130343.lXDVYM5M-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project f43d6834093b19baf79beda8c0337ab020ac5f17)
dtschema version: 2025.12
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260113/202601130343.lXDVYM5M-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202601130343.lXDVYM5M-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/qcom/msm8976.dtsi:1063.27-1118.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@1a00000/dsi@1a96000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/pm8004.dtsi:14.23-23.4: Warning (avoid_unnecessary_addr_size): /soc@0/spmi@200f000/pmic@5: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/pm8950.dtsi:176.9-185.4: Warning (avoid_unnecessary_addr_size): /soc@0/spmi@200f000/pmic@1: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/msm8976-longcheer-l9360.dts:111.20-139.4: Warning (avoid_unnecessary_addr_size): /soc@0/i2c@78b6000/led-controller@30: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/msm8976.dtsi:510.27-513.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@a4000/s0-p1@219: duplicate unit-address (also used in node /soc@0/qfprom@a4000/s0-p2@219)
   arch/arm64/boot/dts/qcom/msm8976.dtsi:530.27-533.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@a4000/s2-p1@21c: duplicate unit-address (also used in node /soc@0/qfprom@a4000/s2-p2@21c)
   arch/arm64/boot/dts/qcom/msm8976.dtsi:555.27-558.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@a4000/s4-p1@221: duplicate unit-address (also used in node /soc@0/qfprom@a4000/s4-p2@221)
   arch/arm64/boot/dts/qcom/msm8976.dtsi:575.27-578.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@a4000/s6-p1@224: duplicate unit-address (also used in node /soc@0/qfprom@a4000/s6-p2@224)
   arch/arm64/boot/dts/qcom/msm8976.dtsi:595.25-598.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@a4000/mode@228: duplicate unit-address (also used in node /soc@0/qfprom@a4000/s8-p1@228)
   arch/arm64/boot/dts/qcom/msm8976.dtsi:605.27-608.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@a4000/s8-p2@229: duplicate unit-address (also used in node /soc@0/qfprom@a4000/s9-p1@229)
>> arch/arm64/boot/dts/qcom/msm8976-longcheer-l9360.dtb: pinctrl@1000000 (qcom,msm8976-pinctrl): ts-int-state: 'oneOf' conditional failed, one must be fixed:
   	'bias-pull-down', 'bias-pull-up', 'drive-strength', 'function', 'pins' do not match any of the regexes: '-pins$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/pinctrl/qcom,msm8976-pinctrl.yaml
--
   arch/arm64/boot/dts/qcom/pm8005.dtsi:26.23-35.4: Warning (avoid_unnecessary_addr_size): /soc@0/spmi@800f000/pmic@5: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/pmi8998.dtsi:71.20-79.5: Warning (avoid_unnecessary_addr_size): /soc@0/spmi@800f000/pmic@3/pwm: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/msm8998.dtsi:2930.27-2985.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@c900000/dsi@c994000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/msm8998.dtsi:3006.27-3061.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@c900000/dsi@c996000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/arm64/boot/dts/qcom/msm8998-sony-xperia-yoshino-lilac.dtb: pinctrl@3400000 (qcom,msm8998-pinctrl): blsp1-i2c5-sleep-state: 'oneOf' conditional failed, one must be fixed:
   	'bias-disable', 'bias-pull-up', 'drive-strength', 'function', 'pins' do not match any of the regexes: '-pins$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/pinctrl/qcom,msm8998-pinctrl.yaml
--
   arch/arm64/boot/dts/qcom/pm8005.dtsi:26.23-35.4: Warning (avoid_unnecessary_addr_size): /soc@0/spmi@800f000/pmic@5: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/pmi8998.dtsi:71.20-79.5: Warning (avoid_unnecessary_addr_size): /soc@0/spmi@800f000/pmic@3/pwm: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/msm8998.dtsi:2930.27-2985.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@c900000/dsi@c994000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/msm8998.dtsi:3006.27-3061.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@c900000/dsi@c996000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/arm64/boot/dts/qcom/msm8998-sony-xperia-yoshino-maple.dtb: pinctrl@3400000 (qcom,msm8998-pinctrl): blsp1-i2c5-sleep-state: 'oneOf' conditional failed, one must be fixed:
   	'bias-disable', 'bias-pull-up', 'drive-strength', 'function', 'pins' do not match any of the regexes: '-pins$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/pinctrl/qcom,msm8998-pinctrl.yaml
--
   arch/arm64/boot/dts/qcom/pm8005.dtsi:26.23-35.4: Warning (avoid_unnecessary_addr_size): /soc@0/spmi@800f000/pmic@5: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/pmi8998.dtsi:71.20-79.5: Warning (avoid_unnecessary_addr_size): /soc@0/spmi@800f000/pmic@3/pwm: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/msm8998.dtsi:2930.27-2985.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@c900000/dsi@c994000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/msm8998.dtsi:3006.27-3061.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@c900000/dsi@c996000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/arm64/boot/dts/qcom/msm8998-sony-xperia-yoshino-poplar.dtb: pinctrl@3400000 (qcom,msm8998-pinctrl): blsp1-i2c5-sleep-state: 'oneOf' conditional failed, one must be fixed:
   	'bias-disable', 'bias-pull-up', 'drive-strength', 'function', 'pins' do not match any of the regexes: '-pins$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/pinctrl/qcom,msm8998-pinctrl.yaml
--
   arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dtb: interconnect@16e0000 (qcom,sm6350-aggre1-noc): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/interconnect/qcom,sm6350-rpmh.yaml
   arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dtb: interconnect@1700000 (qcom,sm6350-aggre2-noc): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/interconnect/qcom,sm6350-rpmh.yaml
>> arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dtb: pinctrl@f100000 (qcom,sm6350-tlmm): qup-uart1-cts-default-state: 'oneOf' conditional failed, one must be fixed:
   	Unevaluated properties are not allowed ('bias-bus-hold' was unexpected)
   	'bias-bus-hold', 'bias-disable', 'drive-strength', 'function', 'pins' do not match any of the regexes: '-pins$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/pinctrl/qcom,sm6350-tlmm.yaml
>> arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dtb: pinctrl@f100000 (qcom,sm6350-tlmm): qup-uart1-rts-default-state: 'oneOf' conditional failed, one must be fixed:
   	'bias-disable', 'bias-pull-down', 'drive-strength', 'function', 'pins' do not match any of the regexes: '-pins$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/pinctrl/qcom,sm6350-tlmm.yaml
>> arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dtb: pinctrl@f100000 (qcom,sm6350-tlmm): qup-uart1-rx-default-state: 'oneOf' conditional failed, one must be fixed:
   	'bias-disable', 'bias-pull-up', 'drive-strength', 'function', 'pins' do not match any of the regexes: '-pins$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/pinctrl/qcom,sm6350-tlmm.yaml
>> arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dtb: pinctrl@f100000 (qcom,sm6350-tlmm): qup-uart1-tx-default-state: 'oneOf' conditional failed, one must be fixed:
   	'bias-disable', 'bias-pull-up', 'drive-strength', 'function', 'pins' do not match any of the regexes: '-pins$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/pinctrl/qcom,sm6350-tlmm.yaml

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
