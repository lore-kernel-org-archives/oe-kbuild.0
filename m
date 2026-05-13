Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66E3E13A258
	for <oe-kbuild@lists.linux.dev>; Wed, 13 May 2026 05:31:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778650301; cv=none; b=Ejl06i0qrG4+lv2ULDAvBwJ2Dz8+nn5HVKpzK2jmvMjR7U+m1lfY5fpxDCBiJI2rm9wK9o6tEn1vd7dN8PmScPsntMAG8/XjUiUZzD4FRB6OZkEGTk/qr9FSk1rZbPd4gWtG0kHmL4LlH0udr91A/CUuxH7aOrfdVuDKLHosBEs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778650301; c=relaxed/simple;
	bh=UDh55SV3AnJJ6vvkAILUQLPJKIU/5Lh0RLnkP1l7bhQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=YC6HWr08OHIDhue2Jick4SroRt1KCjyY4AaQpQnMehFSuF7IBwK4Txju9xbCkXYiHUdYNPyM+ku7qOjHMoyRD/ebvzmMY0ceB12RFvZS2mEjhMjdnV//2DeN/B4oeBb5ncGYFgbD8FhmiFE4Ls9RYCZH8kBDrrOt+DynHsQ6Foc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PMGSywox; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PMGSywox"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778650299; x=1810186299;
  h=date:from:to:cc:subject:message-id;
  bh=UDh55SV3AnJJ6vvkAILUQLPJKIU/5Lh0RLnkP1l7bhQ=;
  b=PMGSywoxwEXsRVmrRAiMXodmZT7kM59hlxPoRyfktj7xwCirJrpXukGC
   nlxW037y887wAeKpayotLOUiwXKd3GUbVZE3BgDQ2gpYdmzRV8CosFgkP
   WUv5P/CmdLgpvMT5R95FtG4bRjVoIrioCRd5915yFjMfpKaz4FpgogbQY
   FCH9EME1MSgxnv3ef4PML99yiqV81Fq4egi4zB2kcqH5bJ7isbLa37qA0
   YO/7AYFTnSrli7ARk8aLGdi6MnZY5LF8+59dNqtN7MM8vk51CvdtOYAhN
   z6lGimK33nxJkfAcuzsv+ePM1hYaJedjzPRasQwmTzd5NKWblEWbzxsHu
   Q==;
X-CSE-ConnectionGUID: wcM6unFURGCgPmYmjvTDtA==
X-CSE-MsgGUID: tJYqyDWLQGyZeBQnlRR/Gg==
X-IronPort-AV: E=McAfee;i="6800,10657,11784"; a="90669858"
X-IronPort-AV: E=Sophos;i="6.23,232,1770624000"; 
   d="scan'208";a="90669858"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2026 22:31:39 -0700
X-CSE-ConnectionGUID: HFW/b6B7QhWdT4012F79EA==
X-CSE-MsgGUID: mTeel68+TemuGKpWqrOMIw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,232,1770624000"; 
   d="scan'208";a="238224574"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by orviesa007.jf.intel.com with ESMTP; 12 May 2026 22:31:37 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wN2C0-000000008TZ-007P;
	Wed, 13 May 2026 05:31:36 +0000
Date: Wed, 13 May 2026 07:31:09 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: 
 [qcom:20260416-qcom_ice_power_and_clk_vote-v5-1-5ccf5d7e2846@oss.qualcomm.com
 1/1] arch/arm64/boot/dts/qcom/eliza-mtp.dtb: crypto@1d88000
 (qcom,eliza-inline-crypto-engine): clocks: [[42, 124]] is too short
Message-ID: <202605130731.Gi7H8zjD-lkp@intel.com>
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
TO: Harshal Dev <harshal.dev@oss.qualcomm.com>
CC: Bjorn Andersson <andersson@kernel.org>
CC: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
CC: Krzysztof Kozlowski <krzk@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux 20260416-qcom_ice_power_and_clk_vote-v5-1-5ccf5d7e2846@oss.qualcomm.com
head:   e27264daac7d9ce892a2a5b4a864d6d9a3c9276a
commit: e27264daac7d9ce892a2a5b4a864d6d9a3c9276a [1/1] dt-bindings: crypto: qcom,ice: Fix missing power-domain and iface clk
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: arm64-randconfig-2055-20260512 (https://download.01.org/0day-ci/archive/20260513/202605130731.Gi7H8zjD-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.3.0
dtschema: 2026.5.dev9+gdf9ad30c5
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260513/202605130731.Gi7H8zjD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202605130731.Gi7H8zjD-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/qcom/eliza-mtp.dtb: crypto@1d88000 (qcom,eliza-inline-crypto-engine): clocks: [[42, 124]] is too short
   	from schema $id: http://devicetree.org/schemas/crypto/qcom,inline-crypto-engine.yaml
>> arch/arm64/boot/dts/qcom/eliza-mtp.dtb: crypto@1d88000 (qcom,eliza-inline-crypto-engine): 'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/crypto/qcom,inline-crypto-engine.yaml
>> arch/arm64/boot/dts/qcom/eliza-mtp.dtb: crypto@1d88000 (qcom,eliza-inline-crypto-engine): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/crypto/qcom,inline-crypto-engine.yaml
--
   arch/arm64/boot/dts/qcom/milos.dtsi:391.11-395.4: Warning (unique_unit_address_if_enabled): /memory@0: duplicate unit-address (also used in node /soc@0)
>> arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dtb: crypto@1d88000 (qcom,milos-inline-crypto-engine): clocks: [[45, 128]] is too short
   	from schema $id: http://devicetree.org/schemas/crypto/qcom,inline-crypto-engine.yaml
>> arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dtb: crypto@1d88000 (qcom,milos-inline-crypto-engine): 'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/crypto/qcom,inline-crypto-engine.yaml
>> arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dtb: crypto@1d88000 (qcom,milos-inline-crypto-engine): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/crypto/qcom,inline-crypto-engine.yaml

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
