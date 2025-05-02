Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4323021B9F4
	for <oe-kbuild@lists.linux.dev>; Fri,  2 May 2025 22:38:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746225519; cv=none; b=e2/rUuTFqSRt5Fragix0zjp1JcEiI1BwrXJQaJXs1ykt/F1PjwiRrIwo8EGM5TXp/9xNJxhEO/i5ISUNLoU2hwvm6dPTh4/KumcgrdPpRCH7v3rOkETcv6DOSqziYT6SN40FTpeFfaW1mP6cpBKEUSVL46lmofXfx7i9nmDDOo4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746225519; c=relaxed/simple;
	bh=qU13h89ox6VOxoSYYxLeYLpZe1+XITPSljdfDhDRsfA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=uqYaNQkUK0bB08dZsKjCCfRXT+exTF+kuhN80W5KEuxj5PUs9DJSBue/Zjie3TENCzdi6ou0/iDOIIwimq5hkKuBXgpvwtEbt9PbriHbtC7nFXBvHAjAoNTcXaMbIPKl0cGxMlh7U8lVkyL6k1tZqELGPw9ocBBIedDssNsr7Zw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=as4j5KuS; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="as4j5KuS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746225518; x=1777761518;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=qU13h89ox6VOxoSYYxLeYLpZe1+XITPSljdfDhDRsfA=;
  b=as4j5KuSelsArEjWdw50SCXXqt1PUZXYUNN/OToj7REd8IkXuAhQBh4C
   a+eWFzEpFeuI2dl64BbnLqexTn+mTMMZNEEuYxA5Pd2BBGvdZWSCPmHL9
   e+SNe7sn0R5RJAKOGegx2upYli9LRuO6vGDKBclTUlcU5raMKbUFzjCUv
   OMRjw4w2bV8YOORyVv//K1WVdjRAEWeOFgwHKf0qrb6USFxgyow7x24c6
   WkkDGhwYBkJwW7tEDFQfh/qb3EnTHafYbDJFknpAFhJ8ipJHxueAVbMEO
   +IZD8MjGUBAQRS+J7u/bjR9jaThK1jZvLeOdww1MDhDdveOHFjlWyKLMf
   w==;
X-CSE-ConnectionGUID: PVttJonqRBOSPG8D+ygbIQ==
X-CSE-MsgGUID: MSn7QpCyQ6O4QSK+C2QIUw==
X-IronPort-AV: E=McAfee;i="6700,10204,11421"; a="59303329"
X-IronPort-AV: E=Sophos;i="6.15,257,1739865600"; 
   d="scan'208";a="59303329"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 May 2025 15:38:33 -0700
X-CSE-ConnectionGUID: qBY8E89tQ0iaJoQZb9xIpg==
X-CSE-MsgGUID: rw7CSbhsRU27IPJKO8W0og==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,257,1739865600"; 
   d="scan'208";a="171999089"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 02 May 2025 15:38:32 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uAz1Z-00053L-13;
	Fri, 02 May 2025 22:38:29 +0000
Date: Sat, 3 May 2025 06:38:07 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v2 4/7] arm64: dts: qcom: qcs6490-rb3gen2: Add WSA8830
 speakers amplifier
Message-ID: <202505030526.blGwUmaV-lkp@intel.com>
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
In-Reply-To: <20250429092430.21477-5-quic_pkumpatl@quicinc.com>
References: <20250429092430.21477-5-quic_pkumpatl@quicinc.com>
TO: Prasad Kumpatla <quic_pkumpatl@quicinc.com>
TO: Bjorn Andersson <andersson@kernel.org>
TO: Konrad Dybcio <konradybcio@kernel.org>
TO: Rob Herring <robh@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
CC: cros-qcom-dts-watchers@chromium.org
CC: linux-arm-msm@vger.kernel.org
CC: devicetree@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: kernel@oss.qualcomm.com
CC: Mohammad Rafi Shaik <quic_mohs@quicinc.com>
CC: Prasad Kumpatla <quic_pkumpatl@quicinc.com>

Hi Prasad,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 33035b665157558254b3c21c3f049fd728e72368]

url:    https://github.com/intel-lab-lkp/linux/commits/Prasad-Kumpatla/arm64-dts-qcom-qcs6490-audioreach-Add-gpr-node/20250429-172836
base:   33035b665157558254b3c21c3f049fd728e72368
patch link:    https://lore.kernel.org/r/20250429092430.21477-5-quic_pkumpatl%40quicinc.com
patch subject: [PATCH v2 4/7] arm64: dts: qcom: qcs6490-rb3gen2: Add WSA8830 speakers amplifier
:::::: branch date: 4 days ago
:::::: commit date: 4 days ago
config: arm64-randconfig-053-20250502 (https://download.01.org/0day-ci/archive/20250503/202505030526.blGwUmaV-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
dtschema version: 2025.3.dev21+ge6ea659
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250503/202505030526.blGwUmaV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202505030526.blGwUmaV-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/qcom/sc7280.dtsi:4825.26-4898.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sc7280.dtsi:4106.10-4116.6: Warning (graph_child_address): /soc@0/eud@88e0000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dtb: codec@3370000 (qcom,sc7280-lpass-va-macro): clock-names: ['mclk', 'macro', 'dcodec'] is too long
   	from schema $id: http://devicetree.org/schemas/sound/qcom,lpass-va-macro.yaml#
>> arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dtb: codec@3370000 (qcom,sc7280-lpass-va-macro): clocks: [[224, 56, 1], [224, 102, 1], [224, 103, 1]] is too long
   	from schema $id: http://devicetree.org/schemas/sound/qcom,lpass-va-macro.yaml#
>> arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dtb: pinctrl@33c0000 (qcom,sc7280-lpass-lpi-pinctrl): Unevaluated properties are not allowed ('clock-names', 'clocks' were unexpected)
   	from schema $id: http://devicetree.org/schemas/pinctrl/qcom,sc7280-lpass-lpi-pinctrl.yaml#
   arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dtb: pmic@2 (qcom,pm8350c): pwm:nvmem: [[360, 361]] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/qcom,spmi-pmic.yaml#
   arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dtb: pwm (qcom,pm8350c-pwm): nvmem: [[360, 361]] is too short
   	from schema $id: http://devicetree.org/schemas/leds/leds-qcom-lpg.yaml#
--
>> arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-vision-mezzanine.dtb: codec@3370000 (qcom,sc7280-lpass-va-macro): clock-names: ['mclk', 'macro', 'dcodec'] is too long
   	from schema $id: http://devicetree.org/schemas/sound/qcom,lpass-va-macro.yaml#
>> arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-vision-mezzanine.dtb: codec@3370000 (qcom,sc7280-lpass-va-macro): clocks: [[224, 56, 1], [224, 102, 1], [224, 103, 1]] is too long
   	from schema $id: http://devicetree.org/schemas/sound/qcom,lpass-va-macro.yaml#
>> arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-vision-mezzanine.dtb: pinctrl@33c0000 (qcom,sc7280-lpass-lpi-pinctrl): Unevaluated properties are not allowed ('clock-names', 'clocks' were unexpected)
   	from schema $id: http://devicetree.org/schemas/pinctrl/qcom,sc7280-lpass-lpi-pinctrl.yaml#
   arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-vision-mezzanine.dtb: pmic@2 (qcom,pm8350c): pwm:nvmem: [[360, 361]] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/qcom,spmi-pmic.yaml#
   arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-vision-mezzanine.dtb: pwm (qcom,pm8350c-pwm): nvmem: [[360, 361]] is too short
   	from schema $id: http://devicetree.org/schemas/leds/leds-qcom-lpg.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
