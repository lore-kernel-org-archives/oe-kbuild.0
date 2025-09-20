Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0675827CB02
	for <oe-kbuild@lists.linux.dev>; Sat, 20 Sep 2025 09:50:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758361847; cv=none; b=LdMWpC1RqYA1H+qddz5931BR4juefwnDSkb2W/wq6a6yyXmUQfJSrMNv0yGUPutPn8KOdXHWpdN6pLyVh2yGnbfbzpIwY76m+oTW357NsyGjLSbDsZqFgUFUtKpRTkO2w6rsS6MqEN24xbA7WiLpnmVMhN5wrpbP+UTT2nwSIgY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758361847; c=relaxed/simple;
	bh=i3Z+g2mUpidNHYDlfZnJ2oVRWEW1xn/14fskzLUZDts=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=QCO0CaBuXDsuIJVhgG+08jRfB/TAEIlXbeNjwcuJ/tJipX/eYZqNIg8/PPQAaYxZVsCOEk+rRPXn7CK7+kHkTGvzhhQh/0jA3SYoJQYqqdA+J596W7SdE9XiNF9f7ef/jcQgsZQgA5BA3HnypE5pRrtv2kjnIbfYsfbsfAuPk9Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SPe9nn0u; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SPe9nn0u"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758361845; x=1789897845;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=i3Z+g2mUpidNHYDlfZnJ2oVRWEW1xn/14fskzLUZDts=;
  b=SPe9nn0uPzbO7RBiayr4Y5qw+gPjYzGl6iUnD41aB+UDimxw1EecAtZk
   fHO+ug5Z1TTmaFf368DdCk8GH5ZnchtE1Gj3iugQ2pY4+FWyl5r0qAvuG
   fLbOC/jGEgcJb2u7iWNqT5NGN2Dc8s5j4rQJD1hqOsvvifx9eA1CL0X3c
   8+tP5o/o/rmUbENODAtGVTQ+WPI4C0H3/gkEnwg/Ipj3EwZN2EMOE1x8d
   4YCxabjOiGzFh7n+tQSRvg0DLvwM2dRBvKnWPsvfjmLMqlKuX14arzPWk
   BVcQtOm+tW6y8fxBhry57eL3fc+cqnN5+wvswyFUrlOgPvqoQzaOSPsAX
   Q==;
X-CSE-ConnectionGUID: nyRiCsxYRXipyMlYH5zJ/g==
X-CSE-MsgGUID: bT6h1cUjQMeHYFzU5pCDog==
X-IronPort-AV: E=McAfee;i="6800,10657,11558"; a="64332899"
X-IronPort-AV: E=Sophos;i="6.18,280,1751266800"; 
   d="scan'208";a="64332899"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Sep 2025 02:50:41 -0700
X-CSE-ConnectionGUID: mpDHnQrdS7iKxnsPvrxXFA==
X-CSE-MsgGUID: EkwQmSQQQKS/YlMCRI+QLA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,280,1751266800"; 
   d="scan'208";a="175593239"
Received: from lkp-server01.sh.intel.com (HELO 84a20bd60769) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 20 Sep 2025 02:50:40 -0700
Received: from kbuild by 84a20bd60769 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uzuEn-0005D5-26;
	Sat, 20 Sep 2025 09:50:37 +0000
Date: Sat, 20 Sep 2025 17:50:29 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [qcom:arm64-for-6.18 188/265]
 arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dtb: speaker@0,1 (sdw10217020200):
 'powerdown-gpios' is a required property
Message-ID: <202509201709.PBOyR0SX-lkp@intel.com>
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
TO: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
CC: Bjorn Andersson <andersson@kernel.org>
CC: Prasad Kumpatla <quic_pkumpatl@quicinc.com>
CC: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux arm64-for-6.18
head:   2f695d3eac36601d383155e3bba189f06a0f750c
commit: b6b4c9f76a8b173a1a1455d181d19b5ab8842a47 [188/265] arm64: dts: qcom: qcs6490-rb3gen2: Add WSA8830 speakers amplifier
:::::: branch date: 7 hours ago
:::::: commit date: 12 days ago
config: arm64-randconfig-054-20250912 (https://download.01.org/0day-ci/archive/20250920/202509201709.PBOyR0SX-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 21857ae337e0892a5522b6e7337899caa61de2a6)
dtschema version: 2025.9.dev1+g4b28bc79f
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250920/202509201709.PBOyR0SX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202509201709.PBOyR0SX-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/qcom/sc7280.dtsi:5033.26-5106.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sc7280.dtsi:4305.10-4315.6: Warning (graph_child_address): /soc@0/eud@88e0000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dtb: speaker@0,1 (sdw10217020200): 'powerdown-gpios' is a required property
   	from schema $id: http://devicetree.org/schemas/sound/qcom,wsa883x.yaml#
>> arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dtb: speaker@0,1 (sdw10217020200): Unevaluated properties are not allowed ('reset-gpios' was unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/qcom,wsa883x.yaml#
   arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dtb: speaker@0,2 (sdw10217020200): 'powerdown-gpios' is a required property
   	from schema $id: http://devicetree.org/schemas/sound/qcom,wsa883x.yaml#
   arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dtb: speaker@0,2 (sdw10217020200): Unevaluated properties are not allowed ('reset-gpios' was unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/qcom,wsa883x.yaml#
   arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dtb: codec@3370000 (qcom,sc7280-lpass-va-macro): clock-names: ['mclk', 'macro', 'dcodec'] is too long
   	from schema $id: http://devicetree.org/schemas/sound/qcom,lpass-va-macro.yaml#
   arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dtb: codec@3370000 (qcom,sc7280-lpass-va-macro): clocks: [[228, 56, 1], [228, 102, 1], [228, 103, 1]] is too long
   	from schema $id: http://devicetree.org/schemas/sound/qcom,lpass-va-macro.yaml#
   arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dtb: pinctrl@33c0000 (qcom,sc7280-lpass-lpi-pinctrl): Unevaluated properties are not allowed ('clock-names', 'clocks' were unexpected)
--
>> arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-industrial-mezzanine.dtb: speaker@0,1 (sdw10217020200): 'powerdown-gpios' is a required property
   	from schema $id: http://devicetree.org/schemas/sound/qcom,wsa883x.yaml#
>> arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-industrial-mezzanine.dtb: speaker@0,1 (sdw10217020200): Unevaluated properties are not allowed ('reset-gpios' was unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/qcom,wsa883x.yaml#
   arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-industrial-mezzanine.dtb: speaker@0,2 (sdw10217020200): 'powerdown-gpios' is a required property
   	from schema $id: http://devicetree.org/schemas/sound/qcom,wsa883x.yaml#
   arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-industrial-mezzanine.dtb: speaker@0,2 (sdw10217020200): Unevaluated properties are not allowed ('reset-gpios' was unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/qcom,wsa883x.yaml#
>> arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-industrial-mezzanine.dtb: codec@3370000 (qcom,sc7280-lpass-va-macro): clock-names: ['mclk', 'macro', 'dcodec'] is too long
   	from schema $id: http://devicetree.org/schemas/sound/qcom,lpass-va-macro.yaml#
>> arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-industrial-mezzanine.dtb: codec@3370000 (qcom,sc7280-lpass-va-macro): clocks: [[228, 56, 1], [228, 102, 1], [228, 103, 1]] is too long
   	from schema $id: http://devicetree.org/schemas/sound/qcom,lpass-va-macro.yaml#
>> arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-industrial-mezzanine.dtb: pinctrl@33c0000 (qcom,sc7280-lpass-lpi-pinctrl): Unevaluated properties are not allowed ('clock-names', 'clocks' were unexpected)
   	from schema $id: http://devicetree.org/schemas/pinctrl/qcom,sc7280-lpass-lpi-pinctrl.yaml#
   arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-industrial-mezzanine.dtb: pmic@2 (qcom,pm8350c): pwm:nvmem: [[366, 367]] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/qcom,spmi-pmic.yaml#
   arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-industrial-mezzanine.dtb: pwm (qcom,pm8350c-pwm): nvmem: [[366, 367]] is too short
   	from schema $id: http://devicetree.org/schemas/leds/leds-qcom-lpg.yaml#
--
>> arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-vision-mezzanine.dtb: speaker@0,1 (sdw10217020200): 'powerdown-gpios' is a required property
   	from schema $id: http://devicetree.org/schemas/sound/qcom,wsa883x.yaml#
>> arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-vision-mezzanine.dtb: speaker@0,1 (sdw10217020200): Unevaluated properties are not allowed ('reset-gpios' was unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/qcom,wsa883x.yaml#
   arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-vision-mezzanine.dtb: speaker@0,2 (sdw10217020200): 'powerdown-gpios' is a required property
   	from schema $id: http://devicetree.org/schemas/sound/qcom,wsa883x.yaml#
   arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-vision-mezzanine.dtb: speaker@0,2 (sdw10217020200): Unevaluated properties are not allowed ('reset-gpios' was unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/qcom,wsa883x.yaml#
   arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-vision-mezzanine.dtb: codec@3370000 (qcom,sc7280-lpass-va-macro): clock-names: ['mclk', 'macro', 'dcodec'] is too long
   	from schema $id: http://devicetree.org/schemas/sound/qcom,lpass-va-macro.yaml#
   arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-vision-mezzanine.dtb: codec@3370000 (qcom,sc7280-lpass-va-macro): clocks: [[228, 56, 1], [228, 102, 1], [228, 103, 1]] is too long
   	from schema $id: http://devicetree.org/schemas/sound/qcom,lpass-va-macro.yaml#
   arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-vision-mezzanine.dtb: pinctrl@33c0000 (qcom,sc7280-lpass-lpi-pinctrl): Unevaluated properties are not allowed ('clock-names', 'clocks' were unexpected)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
