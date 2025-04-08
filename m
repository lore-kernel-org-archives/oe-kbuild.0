Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD12C1CAA67
	for <oe-kbuild@lists.linux.dev>; Tue,  8 Apr 2025 02:36:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744079773; cv=none; b=DoOVE+ind115/O0mJTdhipxuSaPiHJ0CLWd3G9bLL1CNRU3z6+IwqaNU01cGkKNeuIXNgl4EAtDLxpowIYWYN6F6yYp/29m0RBd4g2s6wxjlx8HsI6jMGAslgLCj6nyRcM3a4wTmaeSJk4nuHOhyLA18vCIoYsz+yaR0VqyQpK4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744079773; c=relaxed/simple;
	bh=V2Qfh3vsmWLOjDO2wd9+88/1rtenkm8WIMFLw0mGzbs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Ahn6JlX6aqmtuROEy2Vc+jn2Km6a1I1mNUkGEWwIb0eOJeP9zlnpeoQdeaPpH8ewN47Jv8h/Tlp6GCWftyQKH19SKuci7Q1fv20gGrqNekYEqjIbrReTSePXA6+7dBIEFltdNCA/RJIPEqwt7+RDF95ogD+4aggOetBROS/jEOU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=O7kJkP9y; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="O7kJkP9y"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744079772; x=1775615772;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=V2Qfh3vsmWLOjDO2wd9+88/1rtenkm8WIMFLw0mGzbs=;
  b=O7kJkP9yG7c8AjPIwYILV5NYTqVS6A0+ky1v443LdQpZSG+YnMK9r4wk
   Cuv60O+SM0oO5TRoxbWHt+kja4BrocAS+gopo0fTDhumdonDUr2bAT7ak
   cB3RndcMPCxGOF8XOoVf+JaM9D0pt3HHpRpKgT6dvDioz9Lv61z8+S3e3
   P4GGgi4qalkKNPbgsqXQLKBXvKXYv0Khuj0Q3iGAZw2OPG4gl66UrKG9Y
   rdPyoZqFigClG+5Vvcl4+irRogIth9E7Nefucd8AnFb+njHD0h276iuT0
   n90eC9Weej0CcTjdLuCxbrnJbzFsUy9/8dQojNz7FeuEb0cd2LiLv5W24
   g==;
X-CSE-ConnectionGUID: 1q1ZGAauSU6V03bAvSNjrA==
X-CSE-MsgGUID: oMSlZHM8QVCZPjYRfEXKSw==
X-IronPort-AV: E=McAfee;i="6700,10204,11397"; a="56860722"
X-IronPort-AV: E=Sophos;i="6.15,196,1739865600"; 
   d="scan'208";a="56860722"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2025 19:36:10 -0700
X-CSE-ConnectionGUID: mHhm2GxXS3Wm91mQwBfxhw==
X-CSE-MsgGUID: avfaNHZ4TA2vmllseUB6qQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,196,1739865600"; 
   d="scan'208";a="132262112"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 07 Apr 2025 19:36:09 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u1yoo-00041s-1X;
	Tue, 08 Apr 2025 02:36:06 +0000
Date: Tue, 8 Apr 2025 10:35:57 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [krzk-github:track/x1e-t14s 83/102]
 arch/arm64/boot/dts/qcom/sa8295p-adp.dtb: clock-controller@ad00000:
 Unevaluated properties are not allowed ('required-opps' was unexpected)
Message-ID: <202504081002.Z5Kbeglw-lkp@intel.com>
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
TO: Jagadeesh Kona <quic_jkona@quicinc.com>
CC: Krzysztof Kozlowski <krzk@kernel.org>

tree:   https://github.com/krzk/linux track/x1e-t14s
head:   239252d33658f16e30ebbe940292946ccc610d00
commit: c7f32d54eb631a7880c604c76129d46f4308a2bb [83/102] dt-bindings: clock: qcom: Update sc8280xp camcc bindings
:::::: branch date: 2 days ago
:::::: commit date: 3 days ago
config: arm64-randconfig-051-20250407 (https://download.01.org/0day-ci/archive/20250408/202504081002.Z5Kbeglw-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project 92c93f5286b9ff33f27ff694d2dc33da1c07afdd)
dtschema version: 2025.3.dev6+gb64c5c3
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250408/202504081002.Z5Kbeglw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202504081002.Z5Kbeglw-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/qcom/sa8295p-adp.dtb: clock-controller@ad00000: Unevaluated properties are not allowed ('required-opps' was unexpected)
   	from schema $id: http://devicetree.org/schemas/clock/qcom,sa8775p-camcc.yaml#
--
   arch/arm64/boot/dts/qcom/sa8540p-ride.dtb: ethernet@20000: tx-queues-config: 'snps,tx-sched-sp' does not match any of the regexes: '^queue[0-9]$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/net/qcom,ethqos.yaml#
   arch/arm64/boot/dts/qcom/sa8540p-ride.dtb: ethernet@20000: Unevaluated properties are not allowed ('max-speed', 'mdio', 'phy-handle', 'phy-mode', 'power-domains', 'rx-fifo-depth', 'rx-queues-config', 'snps,mtl-rx-config', 'snps,mtl-tx-config', 'snps,pbl', 'snps,tso', 'tx-fifo-depth', 'tx-queues-config' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/qcom,ethqos.yaml#
>> arch/arm64/boot/dts/qcom/sa8540p-ride.dtb: clock-controller@ad00000: Unevaluated properties are not allowed ('required-opps' was unexpected)
   	from schema $id: http://devicetree.org/schemas/clock/qcom,sa8775p-camcc.yaml#
   arch/arm64/boot/dts/qcom/sa8540p-ride.dtb: ethernet@23000000: tx-queues-config: 'snps,tx-sched-sp' does not match any of the regexes: '^queue[0-9]$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/net/qcom,ethqos.yaml#
   arch/arm64/boot/dts/qcom/sa8540p-ride.dtb: ethernet@23000000: Unevaluated properties are not allowed ('fixed-link', 'max-speed', 'phy-mode', 'power-domains', 'rx-fifo-depth', 'rx-queues-config', 'snps,mtl-rx-config', 'snps,mtl-tx-config', 'snps,pbl', 'snps,tso', 'tx-fifo-depth', 'tx-queues-config' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/qcom,ethqos.yaml#
--
>> arch/arm64/boot/dts/qcom/sc8280xp-crd.dtb: clock-controller@ad00000: Unevaluated properties are not allowed ('required-opps' was unexpected)
   	from schema $id: http://devicetree.org/schemas/clock/qcom,sa8775p-camcc.yaml#
--
>> arch/arm64/boot/dts/qcom/sc8280xp-huawei-gaokun3.dtb: clock-controller@ad00000: Unevaluated properties are not allowed ('required-opps' was unexpected)
   	from schema $id: http://devicetree.org/schemas/clock/qcom,sa8775p-camcc.yaml#
--
   arch/arm64/boot/dts/qcom/sc8280xp.dtsi:4160.12-4164.7: Warning (graph_child_address): /soc@0/camss@ac5a000/ports/port@0: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dtb: clock-controller@ad00000: Unevaluated properties are not allowed ('required-opps' was unexpected)
   	from schema $id: http://devicetree.org/schemas/clock/qcom,sa8775p-camcc.yaml#
--
   arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata.dtb: wifi@0: 'vddrfa0p8-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/net/wireless/qcom,ath11k-pci.yaml#
   arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata.dtb: wifi@0: 'vddrfa1p2-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/net/wireless/qcom,ath11k-pci.yaml#
   arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata.dtb: wifi@0: 'vddrfa1p8-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/net/wireless/qcom,ath11k-pci.yaml#
   arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata.dtb: wifi@0: 'vddpcie0p9-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/net/wireless/qcom,ath11k-pci.yaml#
   arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata.dtb: wifi@0: 'vddpcie1p8-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/net/wireless/qcom,ath11k-pci.yaml#
>> arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata.dtb: clock-controller@ad00000: Unevaluated properties are not allowed ('required-opps' was unexpected)
   	from schema $id: http://devicetree.org/schemas/clock/qcom,sa8775p-camcc.yaml#
--
>> arch/arm64/boot/dts/qcom/sc8280xp-microsoft-blackrock.dtb: clock-controller@ad00000: Unevaluated properties are not allowed ('required-opps' was unexpected)
   	from schema $id: http://devicetree.org/schemas/clock/qcom,sa8775p-camcc.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
