Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.19
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794031208;
	b=TKY57mlTcmqePiKOLN7WytHev8MY6T6IY/UEbpylV/fNDzt9WkdlA+bY+4I5GqLf8hW9
	 Wco14p7p4DyeaUeua0Pk7m0zM7eCHFDXUUWaDheU1Rmx8WCkTzUmgC4S47MxN4pGCZYWc
	 bmNJS3qjIbJb+/e6d4fVQE9haVkWoAcPaqqPpIq09hDu5upuO0INAaJtE9wKCkb6rottn
	 SCCC7PMoR9esgIwfb/jfO2+hTaOVKVDxRZYcFY4tpKMaq7Sf43asAaPycw/mVA/aLXQXS
	 WLgQAqZ9mBz9WRezXPCgeaYGna5wt/s5LD90rkOiqRR/tzkbb1NZH/a+TdXH8BJCiug==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794031208;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=PI67gjN4JUnnPIz8m1Kd5wBEed/5Z9ip6S4lsGsFuQo=;
	b=ytP4C2ORU1o1BpII4V6xio+/DGn9mdOEFXGKyERQRIUj7XL0T79N9J6kwM5289vOWkn5
	 V4CNggznRKl6zbXR1Tt6ayLl+5wD7CGjeh3xoAznXbMYvQ/WLhomFBaQsZuipcO5OuePo
	 ZP2C3TI3Fbj3P3bk2C/C9ZRS3TO1W43FFiDdBQ83QDsohM7o3sglAvQkc/yP40gmv9p5p
	 PuWFfF9IqBPZTxEblXuGGM80RVcaZzGM9tWT78/MR/CHI2e98DoRndEuom9LgF7SH0rdx
	 3h8bf5D5LHVD6eNFGMcrXIFraGWdAhPSoeXmwUr7I9Q7CIhQDAaSLNRZ7hZsMZD8S1Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ONzgcgzf;
	arc=none smtp.remote-ip=198.175.65.19
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86EDC606A326
	for <oe-kbuild@lists.linux.dev>; Sat,  7 Nov 2026 06:00:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 86EDC606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ONzgcgzf
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794031205; x=1825567205;
  h=date:from:to:cc:subject:message-id;
  bh=5JGLlBFBKZXeJr4w9nLdiiu6agjutmMtCgSan7qpT/8=;
  b=ONzgcgzf1X9n+9Eg4Rsz5PUqdleLfsq6MZXogWLUe3fMTTrFN5EXWLZc
   a3UTYScewy+8WBlsinU03OFQ46adPRAUm8ta41sql28LHGD77BqhX5lyN
   1q/+RV+xCr2gjzwTM9JCUVhDK4eb7vNcSoxtFoO8g9fNHz9J06hn5X7Io
   xa81eAsbe+wyvCFyUovr09Xfqf6DR9tQar3C/0zmGiej69PoED5m2Z8yk
   frbdp30g6pNOMTGbMsbT/fXjoKzLEZ/9JTdm3TPP5okT6ggLGv6kOMH2b
   d2Oteh7xq3o1+ifS3XjVAM3msp8dzhkJ9aJaWxV0kaa39+S124K1WRHm+
   w==;
X-CSE-ConnectionGUID: B/N+yX3kS2unGoHF2hMNUg==
X-CSE-MsgGUID: GBTKgVJDTOyuapjypPaYaA==
X-IronPort-AV: E=McAfee;i="6800,10657,11958"; a="2883887"
X-IronPort-AV: E=Sophos;i="6.27,199,1787036400"; 
   d="scan'208";a="2883887"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2026 22:00:05 -0800
X-CSE-ConnectionGUID: NnIlS+h0SQGW+KJGcD2KQg==
X-CSE-MsgGUID: ZAK4wlPQTvGR8/yE2r/uPg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,199,1787036400"; 
   d="scan'208";a="7573121"
Received: from igk-lkp-server01.igk.intel.com (HELO 58ca8a381a5c) ([10.211.93.152])
  by fmviesa005.fm.intel.com with ESMTP; 06 Nov 2026 22:00:03 -0800
Received: from kbuild by 58ca8a381a5c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xPZT7-00000000AaF-3KB6;
	Sat, 07 Nov 2026 06:00:01 +0000
Date: Sat, 07 Nov 2026 06:59:25 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [superna9999:topic/sm8650/deckard-el2 1/1]
 arch/arm64/boot/dts/qcom/sm8650-ayaneo-pocket-s2.dtb: pinctrl@6e80000
 (qcom,sm8650-lpass-lpi-pinctrl): Unevaluated properties are not allowed
 ('i2s2-active' was unexpected)
Message-ID: <202611070632.BGMKVhYR-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Post: <mailto:oe-kbuild@lists.linux.dev>
List-Help: <mailto:oe-kbuild+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild+owner@lists.linux.dev>
Precedence: list

:::::: 
:::::: Manual check reason: "dtcheck: binding changes may go via different trees"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Neil Armstrong <neil.armstrong@linaro.org>

tree:   https://github.com/superna9999/linux topic/sm8650/deckard-el2
head:   4eb3bf9a5093f47916b0d4fc5fd45c97dd0b2c65
commit: 4eb3bf9a5093f47916b0d4fc5fd45c97dd0b2c65 [1/1] WiP
:::::: branch date: 15 hours ago
:::::: commit date: 15 hours ago
config: arm64-allnoconfig (https://download.01.org/0day-ci/archive/20261107/202611070632.BGMKVhYR-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 16.2.0
dtschema: 2026.10.dev5+gd1fbcafd6
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261107/202611070632.BGMKVhYR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202611070632.BGMKVhYR-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/qcom/sm8650-ayaneo-pocket-s2.dts:1427.29-1430.4: Warning (unit_address_vs_reg): /reserved-memory/lost-reg-mem: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/qcom/sm8650-ayaneo-pocket-s2.dts:1437.31-1441.4: Warning (unit_address_vs_reg): /reserved-memory/splash-region: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/qcom/sm8650.dtsi:5330.27-5386.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/arm64/boot/dts/qcom/sm8650-ayaneo-pocket-s2.dtb: pinctrl@6e80000 (qcom,sm8650-lpass-lpi-pinctrl): Unevaluated properties are not allowed ('i2s2-active' was unexpected)
   	from schema $id: http://devicetree.org/schemas/pinctrl/qcom,sm8650-lpass-lpi-pinctrl.yaml
--
   arch/arm64/boot/dts/qcom/sm8650.dtsi:5233.27-5308.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/sm8650.dtsi:5330.27-5386.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/arm64/boot/dts/qcom/sm8650-hdk.dtb: pinctrl@6e80000 (qcom,sm8650-lpass-lpi-pinctrl): Unevaluated properties are not allowed ('i2s2-active' was unexpected)
   	from schema $id: http://devicetree.org/schemas/pinctrl/qcom,sm8650-lpass-lpi-pinctrl.yaml
--
   arch/arm64/boot/dts/qcom/sm8650.dtsi:5330.27-5386.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/arm64/boot/dts/qcom/sm8650-mtp.dtb: pinctrl@6e80000 (qcom,sm8650-lpass-lpi-pinctrl): Unevaluated properties are not allowed ('i2s2-active' was unexpected)
   	from schema $id: http://devicetree.org/schemas/pinctrl/qcom,sm8650-lpass-lpi-pinctrl.yaml
--
   arch/arm64/boot/dts/qcom/sm8650.dtsi:5330.27-5386.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/arm64/boot/dts/qcom/sm8650-qrd.dtb: pinctrl@6e80000 (qcom,sm8650-lpass-lpi-pinctrl): Unevaluated properties are not allowed ('i2s2-active' was unexpected)
   	from schema $id: http://devicetree.org/schemas/pinctrl/qcom,sm8650-lpass-lpi-pinctrl.yaml
--
>> arch/arm64/boot/dts/qcom/sm8650-hdk-display-card-rear-camera-card.dtb: pinctrl@6e80000 (qcom,sm8650-lpass-lpi-pinctrl): Unevaluated properties are not allowed ('i2s2-active' was unexpected)
   	from schema $id: http://devicetree.org/schemas/pinctrl/qcom,sm8650-lpass-lpi-pinctrl.yaml
--
>> arch/arm64/boot/dts/qcom/sm8650-hdk-display-card.dtb: pinctrl@6e80000 (qcom,sm8650-lpass-lpi-pinctrl): Unevaluated properties are not allowed ('i2s2-active' was unexpected)
   	from schema $id: http://devicetree.org/schemas/pinctrl/qcom,sm8650-lpass-lpi-pinctrl.yaml
--
>> arch/arm64/boot/dts/qcom/sm8650-hdk-rear-camera-card.dtb: pinctrl@6e80000 (qcom,sm8650-lpass-lpi-pinctrl): Unevaluated properties are not allowed ('i2s2-active' was unexpected)
   	from schema $id: http://devicetree.org/schemas/pinctrl/qcom,sm8650-lpass-lpi-pinctrl.yaml

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
