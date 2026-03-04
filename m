Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD9F537F74C
	for <oe-kbuild@lists.linux.dev>; Wed,  4 Mar 2026 04:58:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772600308; cv=none; b=VXqGYUHfXEB9l0cCvFwCiD8QigOFIZMAuerR2TgqYB96p4k+xDpJI+JFCwrLN6028iIoMF5BwanVoL9/8ek8BeK34E3kH5IHtcigjvzRp1cxTVCZOV+cJSo9JqolkTKyo/QOiH+wDdoR8IzhQsFng/K2VQsbthwhj9Q0iivwsuk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772600308; c=relaxed/simple;
	bh=N2l/Jyvzc3LzfJ095pWxwTolILmIj/+mktquFImbM9I=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ZW00n9lV9KG7PT1gEs85bdNB4qV6vJosbWzuiWEau99VMk9F/fGyZI7EEuIl99yjUwxYTQ2+KNU+aVVarqGQECa5zuWfdDJtWcJ0DZC4IKprLerDp/zq/HHOo35roAS5JTIUwsh8wLsLmBQ2sZr4pGB7gkuhRGrtkOxf0ahw9Eg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dq0xFK5b; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dq0xFK5b"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772600307; x=1804136307;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=N2l/Jyvzc3LzfJ095pWxwTolILmIj/+mktquFImbM9I=;
  b=dq0xFK5b3sR8MOAlY/+PCKxukUxu4b5vUT4x4S0ffobOXiNx6uJbKH6l
   naxrt4UAcyAT+QTx9XaKHqpVoy5/VrXVEV6ZFjb2LbE+xmaW6YoNFYnyl
   1RCk3JmECpCL4u/iQfqhT8DnfpSkBIbU+fpgUi0q6P7m9L1fv99WhbynR
   EqNdv5SzVaxmyFZB0Aoahmz7kBve9Wz2rpMxqem0J2Vol7IdHUHsj9Q03
   jS2CtDPjxl1jU2c6eSwFYV/y0j9mb2aZxDVkdsJ0uRPYK8y8thJ5Jh6pK
   HmP3Pf0xIWShmblmP0OvYw5epWy4IMK37z4/4aSeCvd8cC3KOw+5jBFwd
   Q==;
X-CSE-ConnectionGUID: MTS4iQymTjuCfV4ymWxqEg==
X-CSE-MsgGUID: rIM1KbNtR5qJjNFDMW52ww==
X-IronPort-AV: E=McAfee;i="6800,10657,11718"; a="73562614"
X-IronPort-AV: E=Sophos;i="6.21,323,1763452800"; 
   d="scan'208";a="73562614"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Mar 2026 20:58:26 -0800
X-CSE-ConnectionGUID: NBKECr+ASYWaLheQmucT1A==
X-CSE-MsgGUID: Wo9LcspnRpWW7nSWrCOMZg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,323,1763452800"; 
   d="scan'208";a="218339016"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by orviesa007.jf.intel.com with ESMTP; 03 Mar 2026 20:58:25 -0800
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vxeJT-000000001cj-1ARJ;
	Wed, 04 Mar 2026 04:58:23 +0000
Date: Wed, 4 Mar 2026 05:58:10 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v3 6/6] arm64: dts: qcom: sm6125: Add missing MDSS core
 reset
Message-ID: <202603040549.kh0nwCO8-lkp@intel.com>
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
In-Reply-To: <20260303034847.13870-7-val@packett.cool>
References: <20260303034847.13870-7-val@packett.cool>
TO: Val Packett <val@packett.cool>
TO: Bjorn Andersson <andersson@kernel.org>
TO: Konrad Dybcio <konradybcio@kernel.org>
TO: Rob Herring <robh@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
TO: Adam Skladowski <a39.skl@gmail.com>
TO: Marijn Suijten <marijn.suijten@somainline.org>
TO: Dmitry Baryshkov <lumag@kernel.org>
CC: Val Packett <val@packett.cool>
CC: linux-arm-msm@vger.kernel.org
CC: phone-devel@vger.kernel.org
CC: ~postmarketos/upstreaming@lists.sr.ht
CC: devicetree@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: Yedaya Katsman <yedaya.ka@gmail.com>

Hi Val,

kernel test robot noticed the following build warnings:

[auto build test WARNING on clk/clk-next]
[also build test WARNING on robh/for-next krzk/for-next krzk-dt/for-next linus/master v7.0-rc2 next-20260303]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Val-Packett/dt-bindings-clock-qcom-sm6115-dispcc-Define-MDSS-resets/20260303-115510
base:   https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git clk-next
patch link:    https://lore.kernel.org/r/20260303034847.13870-7-val%40packett.cool
patch subject: [PATCH v3 6/6] arm64: dts: qcom: sm6125: Add missing MDSS core reset
:::::: branch date: 25 hours ago
:::::: commit date: 25 hours ago
config: arm64-randconfig-2051-20260303 (https://download.01.org/0day-ci/archive/20260304/202603040549.kh0nwCO8-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project f43d6834093b19baf79beda8c0337ab020ac5f17)
dtschema: 2025.13.dev8+g0515abdd9
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260304/202603040549.kh0nwCO8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202603040549.kh0nwCO8-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/qcom/sm6125-sony-xperia-seine-pdx201.dtb: geniqup@4ac0000 (qcom,geni-se-qup): #address-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,geni-se.yaml
   arch/arm64/boot/dts/qcom/sm6125-sony-xperia-seine-pdx201.dtb: geniqup@4ac0000 (qcom,geni-se-qup): #size-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,geni-se.yaml
   arch/arm64/boot/dts/qcom/sm6125-sony-xperia-seine-pdx201.dtb: geniqup@4cc0000 (qcom,geni-se-qup): #address-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,geni-se.yaml
   arch/arm64/boot/dts/qcom/sm6125-sony-xperia-seine-pdx201.dtb: geniqup@4cc0000 (qcom,geni-se-qup): #size-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,geni-se.yaml
   arch/arm64/boot/dts/qcom/sm6125-sony-xperia-seine-pdx201.dtb: /soc@0/display-subsystem@5e00000/dsi@5e94000/panel@0: failed to match any schema with compatible: ['samsung,sofef01-m-ams597ut01']
>> arch/arm64/boot/dts/qcom/sm6125-sony-xperia-seine-pdx201.dtb: clock-controller@5f00000 (qcom,sm6125-dispcc): '#reset-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/clock/qcom,dispcc-sm6125.yaml
--
   arch/arm64/boot/dts/qcom/sm6125.dtsi:1324.27-1391.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@5e00000/dsi@5e94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/sm6125-xiaomi-ginkgo.dtb: geniqup@4ac0000 (qcom,geni-se-qup): #address-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,geni-se.yaml
   arch/arm64/boot/dts/qcom/sm6125-xiaomi-ginkgo.dtb: geniqup@4ac0000 (qcom,geni-se-qup): #size-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,geni-se.yaml
   arch/arm64/boot/dts/qcom/sm6125-xiaomi-ginkgo.dtb: geniqup@4cc0000 (qcom,geni-se-qup): #address-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,geni-se.yaml
   arch/arm64/boot/dts/qcom/sm6125-xiaomi-ginkgo.dtb: geniqup@4cc0000 (qcom,geni-se-qup): #size-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,geni-se.yaml
>> arch/arm64/boot/dts/qcom/sm6125-xiaomi-ginkgo.dtb: clock-controller@5f00000 (qcom,sm6125-dispcc): '#reset-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/clock/qcom,dispcc-sm6125.yaml
--
   arch/arm64/boot/dts/qcom/sm6125.dtsi:1324.27-1391.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@5e00000/dsi@5e94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/sm6125-xiaomi-laurel-sprout.dtb: geniqup@4ac0000 (qcom,geni-se-qup): #address-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,geni-se.yaml
   arch/arm64/boot/dts/qcom/sm6125-xiaomi-laurel-sprout.dtb: geniqup@4ac0000 (qcom,geni-se-qup): #size-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,geni-se.yaml
   arch/arm64/boot/dts/qcom/sm6125-xiaomi-laurel-sprout.dtb: geniqup@4cc0000 (qcom,geni-se-qup): #address-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,geni-se.yaml
   arch/arm64/boot/dts/qcom/sm6125-xiaomi-laurel-sprout.dtb: geniqup@4cc0000 (qcom,geni-se-qup): #size-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,geni-se.yaml
>> arch/arm64/boot/dts/qcom/sm6125-xiaomi-laurel-sprout.dtb: clock-controller@5f00000 (qcom,sm6125-dispcc): '#reset-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/clock/qcom,dispcc-sm6125.yaml

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
