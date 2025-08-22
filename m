Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 798622EBDF6
	for <oe-kbuild@lists.linux.dev>; Fri, 22 Aug 2025 08:16:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755850593; cv=none; b=NeKFuqcdNOa4cpGmaEGCOhMtUc0vDkeNBMq3beOrzDISK8NkOohvPJwZVuo/MvPboDpfpc6a9Ud6XFuDfprFjuxhQVDgIl4Rm6Ijcy34JJleTTaB9pp2JVgzv0g77fnOdVJcZCdkOOXehh9HzxK3+fqoNQqgov7cTIIzealYERg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755850593; c=relaxed/simple;
	bh=r/urV4nwxtacKLeAC/JVLs3+kQbhnOeKV+gaCD+JTgk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=KIGE6M/gOR35aDIl313p9Yp3pTqHTmQpiWxh6xcVv1xxMl8PNafPGGxel4ajopHl7NgTCOUV8O38+1L0NbiFEzVOQBRSVtGeKmFjhngACsMF7SgsmNeSwyoIJsRWxaGf3yfWvi1dTe+fxC9jGpmpu4PxOam67lZ7G+TCEKSKr1U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KxoxCtfR; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KxoxCtfR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755850592; x=1787386592;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=r/urV4nwxtacKLeAC/JVLs3+kQbhnOeKV+gaCD+JTgk=;
  b=KxoxCtfR6+4jfFnGEct6XLxqo97AB3/vbXS9EepwBk2N8B1tJLe80aTD
   hLT76pODVWZXIwnoaaMz6xEGTKnCS6aaG9E0VP8+vDHQKH6YJTcyBj9v3
   3IiBT7Cq6QagHykMZsk9gLWI+SjzWYuauKt0b1tIVVL+rpXm8WOaIbaun
   nFpFjC9nUqyerNN3q0qg7I0n7hZtcW6jFv5SbFMRvwecNPXf0TpazrTWE
   qOhmMyUZr16i2UeSz+kPtoibXl35/dyP7RRNwuJo9fkNTUVStsHi6ZtmR
   zAqv2JrM5V4b17e+lWnAyYTCV+92pfDR3jd8KKMLYH9wnQQui83DAxs9f
   Q==;
X-CSE-ConnectionGUID: NRt8S7TbROymyN3nZfymtw==
X-CSE-MsgGUID: D5Q5bsVoTb6A8qkQKGacxA==
X-IronPort-AV: E=McAfee;i="6800,10657,11529"; a="58221057"
X-IronPort-AV: E=Sophos;i="6.17,309,1747724400"; 
   d="scan'208";a="58221057"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Aug 2025 01:16:31 -0700
X-CSE-ConnectionGUID: 0NxcZr/pTd6yQNs6SJf84w==
X-CSE-MsgGUID: D+yc4MpSS36JyUvJF2lzXg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,309,1747724400"; 
   d="scan'208";a="168855089"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 22 Aug 2025 01:16:30 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1upMwl-000L3P-2s;
	Fri, 22 Aug 2025 08:16:27 +0000
Date: Fri, 22 Aug 2025 16:16:26 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [krzk-github:sm8750/visense-cps-testing-on-top-of-sm8750-audio-lpass
 21/76] arch/arm64/boot/dts/qcom/sm8750-mtp.dtb: usb@a6f8800
 (qcom,sm8750-dwc3): clock-names: ['cfg_noc', 'core', 'iface', 'sleep',
 'mock_utmi'] is too short
Message-ID: <202508221627.hokFhf3b-lkp@intel.com>
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
TO: Wesley Cheng <quic_wcheng@quicinc.com>
CC: Krzysztof Kozlowski <krzk@kernel.org>
CC: Melody Olvera <quic_molvera@quicinc.com>

tree:   https://github.com/krzk/linux sm8750/visense-cps-testing-on-top-of-sm8750-audio-lpass
head:   ffb2a13619fdca58779259a6a7f8eb5f710fdaa4
commit: 83abfce538041d2a7f66f69ae18340f27fab0430 [21/76] dt-bindings: usb: qcom,dwc3: Add SM8750 compatible
:::::: branch date: 18 hours ago
:::::: commit date: 2 days ago
config: arm64-randconfig-053-20250822 (https://download.01.org/0day-ci/archive/20250822/202508221627.hokFhf3b-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 93d24b6b7b148c47a2fa228a4ef31524fa1d9f3f)
dtschema version: 2025.6.2.dev4+g8f79ddd
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250822/202508221627.hokFhf3b-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202508221627.hokFhf3b-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/qcom/sm8750.dtsi:3115.27-3178.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sm8750-mtp.dtb: /soc@0/phy@1c06000: failed to match any schema with compatible: ['qcom,sm8750-qmp-gen3x2-pcie-phy']
>> arch/arm64/boot/dts/qcom/sm8750-mtp.dtb: usb@a6f8800 (qcom,sm8750-dwc3): clock-names: ['cfg_noc', 'core', 'iface', 'sleep', 'mock_utmi'] is too short
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
   arch/arm64/boot/dts/qcom/sm8750-mtp.dtb: usb@a6f8800 (qcom,sm8750-dwc3): clocks: [[36, 11], [36, 156], [36, 3], [36, 161], [36, 158]] is too short
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
   arch/arm64/boot/dts/qcom/sm8750-mtp.dtb: clock-controller@aaf0000 (qcom,sm8750-videocc): 'required-opps' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8450-videocc.yaml#
--
   arch/arm64/boot/dts/qcom/sm8750.dtsi:3006.27-3093.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sm8750.dtsi:3115.27-3178.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sm8750.dtsi:2766.34-2767.8: Warning (graph_endpoint): /soc@0/phy@88e8000/ports/port@0/endpoint: graph connection to node '/pmic-glink/connector@0/ports/port@1/endpoint' is not bidirectional
   arch/arm64/boot/dts/qcom/sm8750.dtsi:2867.31-2868.9: Warning (graph_endpoint): /soc@0/usb@a6f8800/usb@a600000/ports/port@0/endpoint: graph connection to node '/pmic-glink/connector@0/ports/port@0/endpoint' is not bidirectional
   arch/arm64/boot/dts/qcom/sm8750-qrd.dtb: Warning (graph_child_address): Failed prerequisite 'graph_endpoint'
   arch/arm64/boot/dts/qcom/sm8750-qrd.dtb: /soc@0/phy@1c06000: failed to match any schema with compatible: ['qcom,sm8750-qmp-gen3x2-pcie-phy']
>> arch/arm64/boot/dts/qcom/sm8750-qrd.dtb: usb@a6f8800 (qcom,sm8750-dwc3): clock-names: ['cfg_noc', 'core', 'iface', 'sleep', 'mock_utmi'] is too short
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
   arch/arm64/boot/dts/qcom/sm8750-qrd.dtb: usb@a6f8800 (qcom,sm8750-dwc3): clocks: [[36, 11], [36, 156], [36, 3], [36, 161], [36, 158]] is too short
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
   arch/arm64/boot/dts/qcom/sm8750-qrd.dtb: clock-controller@aaf0000 (qcom,sm8750-videocc): 'required-opps' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8450-videocc.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
