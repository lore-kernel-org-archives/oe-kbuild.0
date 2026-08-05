Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 026D2381E84
	for <oe-kbuild@lists.linux.dev>; Wed,  5 Aug 2026 03:18:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785899933; cv=none; b=U2E1CZ4QBBg+UY5VOrx6een4FJ2EGdQiJDEhl5xhkXOBfKZe68CrcUbv1dq9dW1whMpik6UQNB6W8dwnylxPpuXWjUT0NYEQTRJtc7bKrGLyqUHWW59fc8BXqqTZM9TBerzJJSavz20fDp9gyAZml2sqeQSLqw6q5GXh0iPeVwE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785899933; c=relaxed/simple;
	bh=P5bvjEkCkSX1NDzJXqlEAOpvIroaD57gZRefaTvfDh4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=uUGcjpOA+HwC57uiGdsKn9ulkWh68niI9GseqOlGFtBPJusPcj9sTPJsMPTurUIk4MvXhXjpiG+5LnVQORpvmJ7RVCpOQMAeMoS+jcWuoi8yQW5rXAwAWuZ6OkpUpRtXV5OgJDBs6pEdgWNy8JQlCCQVpBcM9v+rA7uNMjC69LM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=R1GZMPe4; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="R1GZMPe4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785899930; x=1817435930;
  h=date:from:to:cc:subject:message-id;
  bh=P5bvjEkCkSX1NDzJXqlEAOpvIroaD57gZRefaTvfDh4=;
  b=R1GZMPe4Bz4wtLoHT8tSdIw9wkM4MQI0bkcW2o46kFRjDOQTIOOHj6pN
   r7/vChqkBOmeWMjew+FTms938Y/eLl4bR237cN4af9AVLSRLfWbaGbk56
   n4Qm+HLlLshyTxLKOQEJNjPnM7FRvOmKwtjxx6VfQ7c2yFAOIW+pWe/Z5
   pISjRlDKxGVU2BULfn6Ea/2gPkqhWf5gSiXME7tqLT3IsVsOYv7Vkpv81
   ff780pniXpwWbEncNonskxGk4DDBltN52lgTEaYS2ousgjbZnARN45rFP
   Sml1QiBlJaPfQEcvOpoi7s5vxjq1dPFV7H2OoyPPuTGJYllGecfaJGFLM
   A==;
X-CSE-ConnectionGUID: 3ddD6yPtQb+apZkLKq97Ow==
X-CSE-MsgGUID: Aq9ewAU7QVmG3JmW1ez/Zw==
X-IronPort-AV: E=McAfee;i="6800,10657,11865"; a="86494013"
X-IronPort-AV: E=Sophos;i="6.25,205,1779174000"; 
   d="scan'208";a="86494013"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Aug 2026 20:18:47 -0700
X-CSE-ConnectionGUID: jzIl1sZyRNyxkZi65sj1/w==
X-CSE-MsgGUID: jrUaj7AhTaGb+FRT01qgyw==
X-ExtLoop1: 1
Received: from igk-lkp-server01.igk.intel.com (HELO 3cba2a188a06) ([10.211.93.152])
  by fmviesa003.fm.intel.com with ESMTP; 04 Aug 2026 20:18:46 -0700
Received: from kbuild by 3cba2a188a06 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wrS9U-000000004K6-2qn8;
	Wed, 05 Aug 2026 03:18:44 +0000
Date: Wed, 05 Aug 2026 05:18:38 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [qcom:arm64-for-7.3 311/333]
 arch/arm64/boot/dts/qcom/sm8350-hdk.dtb: scm (qcom,scm-sm8350): 'sram' does
 not match any of the regexes: '^pinctrl-[0-9]+$'
Message-ID: <202608050542.9iXuXkY1-lkp@intel.com>
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
TO: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
CC: Bjorn Andersson <andersson@kernel.org>
CC: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux arm64-for-7.3
head:   58a273157af32b7d8e6fbd7930db3a5044c2ad10
commit: e030c56e38fcd5d30fb57f0db3388d13e29872b4 [311/333] arm64: dts: qcom: sm8350: Add minidump SRAM config to SCM node
:::::: branch date: 12 hours ago
:::::: commit date: 2 days ago
config: arm64-randconfig-2054-20260803 (https://download.01.org/0day-ci/archive/20260805/202608050542.9iXuXkY1-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project ade128740327db281859708ddcb3b072903b3414)
dtschema: 2026.7.dev1+g2203c1720
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260805/202608050542.9iXuXkY1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202608050542.9iXuXkY1-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/qcom/sm8350.dtsi:3037.27-3115.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/sm8350.dtsi:3136.27-3214.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/arm64/boot/dts/qcom/sm8350-hdk.dtb: scm (qcom,scm-sm8350): 'sram' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/firmware/qcom,scm.yaml
>> arch/arm64/boot/dts/qcom/sm8350-hdk.dtb: sram@14680000 (qcom,sm8350-imem): 'minidump-sram@1c' does not match any of the regexes: '^modem-tables@[0-9a-f]+$', '^pil-reloc@[0-9a-f]+$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/sram/qcom,imem.yaml
--
   arch/arm64/boot/dts/qcom/sm8350.dtsi:3037.27-3115.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/sm8350.dtsi:3136.27-3214.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/arm64/boot/dts/qcom/sm8350-microsoft-surface-duo2.dtb: scm (qcom,scm-sm8350): 'sram' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/firmware/qcom,scm.yaml
>> arch/arm64/boot/dts/qcom/sm8350-microsoft-surface-duo2.dtb: sram@14680000 (qcom,sm8350-imem): 'minidump-sram@1c' does not match any of the regexes: '^modem-tables@[0-9a-f]+$', '^pil-reloc@[0-9a-f]+$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/sram/qcom,imem.yaml
--
   arch/arm64/boot/dts/qcom/sm8350.dtsi:3037.27-3115.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/sm8350.dtsi:3136.27-3214.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/arm64/boot/dts/qcom/sm8350-mtp.dtb: scm (qcom,scm-sm8350): 'sram' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/firmware/qcom,scm.yaml
>> arch/arm64/boot/dts/qcom/sm8350-mtp.dtb: sram@14680000 (qcom,sm8350-imem): 'minidump-sram@1c' does not match any of the regexes: '^modem-tables@[0-9a-f]+$', '^pil-reloc@[0-9a-f]+$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/sram/qcom,imem.yaml
--
   arch/arm64/boot/dts/qcom/sm8350.dtsi:3037.27-3115.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/sm8350.dtsi:3136.27-3214.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/arm64/boot/dts/qcom/sm8350-sony-xperia-sagami-pdx214.dtb: scm (qcom,scm-sm8350): 'sram' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/firmware/qcom,scm.yaml
>> arch/arm64/boot/dts/qcom/sm8350-sony-xperia-sagami-pdx214.dtb: sram@14680000 (qcom,sm8350-imem): 'minidump-sram@1c' does not match any of the regexes: '^modem-tables@[0-9a-f]+$', '^pil-reloc@[0-9a-f]+$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/sram/qcom,imem.yaml
--
   arch/arm64/boot/dts/qcom/sm8350.dtsi:3037.27-3115.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/sm8350.dtsi:3136.27-3214.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/arm64/boot/dts/qcom/sm8350-sony-xperia-sagami-pdx215.dtb: scm (qcom,scm-sm8350): 'sram' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/firmware/qcom,scm.yaml
>> arch/arm64/boot/dts/qcom/sm8350-sony-xperia-sagami-pdx215.dtb: sram@14680000 (qcom,sm8350-imem): 'minidump-sram@1c' does not match any of the regexes: '^modem-tables@[0-9a-f]+$', '^pil-reloc@[0-9a-f]+$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/sram/qcom,imem.yaml

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
