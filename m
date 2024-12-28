Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE1EE101C8
	for <oe-kbuild@lists.linux.dev>; Sat, 28 Dec 2024 05:33:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735364017; cv=none; b=m8h6zSDzqwEt4V6sibfOJl+pW1tSWiuU4Af6S5e7VF8953foK2zoaPdBlI+IKI68vMUa21lh3RywSXQ/1l16V9DMIXtWtfgwQWRyT9zAtmeTdD02ZWkqtgc40nkYRbCxcCpdY6SdfB+mTSwUxQBxAw4QPitLcNQXiRTcz/xmZ5Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735364017; c=relaxed/simple;
	bh=+kxzZsPj5+lrqt7QTSG2LBp7b2UU4f+SBv8Rwh7zQsI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=S6/ZR1J0aOkmNAEWa0di+nG2yzSn7DfGxG0w+qUBJ+rKLeSwQ31Aq7YxDxN0+Jg28U3zBlfjbPAOJ82qRc9l7nPFjncdrl1m6U314kRoGNU19VVuPJ3VTmItbiBNUnUkmreg528+4v2nsxf2UJJwoJjcrcXf5AgRsra4s0doSGA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cTzjV3Hd; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cTzjV3Hd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735364016; x=1766900016;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+kxzZsPj5+lrqt7QTSG2LBp7b2UU4f+SBv8Rwh7zQsI=;
  b=cTzjV3HdIs/2kI9YCoY0XlnpfGl/m9LcxZsDW184/DWYpXIU1IXX8SF0
   +2ODKltFcu5UCjz01YT/ix4WXkW5wQpnln6mKs4O7CPVcsNZ1s1dXO7iX
   OnGAj2wefbhgtztdu7qEKrqNufPm1F5V7X6u3f3hKvAghvzkoaXBsNxhQ
   kLf9xb5WwajZAfuh/5RI4hOyqZEwg4B6EHCcL53KV4bUbWddHIN1tBnvD
   eEppWjN/mLjsR3FXbghLa5PsmLFxclwWQiDzegK3H8Cunys21Gd7wfWOh
   vRaN17K+6zuyc25wDEJC6yPYjTJLLIUfFHU5ge5LBNz3prrOqlYoUd+hs
   g==;
X-CSE-ConnectionGUID: oemGCX+YS0aBpPplrmalCQ==
X-CSE-MsgGUID: pY6oXYgJTRaGVjIqEs6WNQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11298"; a="35624384"
X-IronPort-AV: E=Sophos;i="6.12,271,1728975600"; 
   d="scan'208";a="35624384"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Dec 2024 21:33:35 -0800
X-CSE-ConnectionGUID: NVGkQe+BR2adUI6W2mdpxg==
X-CSE-MsgGUID: dmiaNw6sRS2NbGdJ2M9bYw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="104925711"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 27 Dec 2024 21:33:33 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tRPS7-0003sp-2e;
	Sat, 28 Dec 2024 05:33:31 +0000
Date: Sat, 28 Dec 2024 13:33:01 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [qcom:arm64-for-6.14 97/123]
 arch/arm64/boot/dts/qcom/sm8650-hdk.dtb: display-subsystem@ae00000:
 interconnects: [[199, 3, 7, 29, 1, 7]] is too short
Message-ID: <202412281329.7sqDN5NM-lkp@intel.com>
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
TO: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: Bjorn Andersson <andersson@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux arm64-for-6.14
head:   1caf6149c3bf41a2ee07869449c4ea1ec8bbc2f8
commit: 9fa33cbca3d2842f1f47ed4e5f6574e611dae32b [97/123] arm64: dts: qcom: sm8650: correct MDSS interconnects
:::::: branch date: 25 hours ago
:::::: commit date: 31 hours ago
config: arm64-randconfig-052-20241227 (https://download.01.org/0day-ci/archive/20241228/202412281329.7sqDN5NM-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
dtschema version: 2024.12.dev5+gea243eb
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241228/202412281329.7sqDN5NM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202412281329.7sqDN5NM-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/qcom/sm8650.dtsi:3570.27-3645.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sm8650.dtsi:3667.27-3723.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sm8650-hdk.dts:834.9-845.5: Warning (graph_child_address): /soc@0/geniqup@ac0000/i2c@a8c000/typec-mux@e/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/qcom/sm8650-hdk.dtb: display-subsystem@ae00000: interconnects: [[199, 3, 7, 29, 1, 7]] is too short
   	from schema $id: http://devicetree.org/schemas/display/msm/qcom,sm8650-mdss.yaml#
>> arch/arm64/boot/dts/qcom/sm8650-hdk.dtb: display-subsystem@ae00000: interconnect-names: ['mdp0-mem'] is too short
   	from schema $id: http://devicetree.org/schemas/display/msm/qcom,sm8650-mdss.yaml#
--
   arch/arm64/boot/dts/qcom/sm8650.dtsi:3667.27-3723.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>> arch/arm64/boot/dts/qcom/sm8650-mtp.dtb: display-subsystem@ae00000: interconnects: [[182, 3, 7, 29, 1, 7]] is too short
   	from schema $id: http://devicetree.org/schemas/display/msm/qcom,sm8650-mdss.yaml#
>> arch/arm64/boot/dts/qcom/sm8650-mtp.dtb: display-subsystem@ae00000: interconnect-names: ['mdp0-mem'] is too short
   	from schema $id: http://devicetree.org/schemas/display/msm/qcom,sm8650-mdss.yaml#
--
   arch/arm64/boot/dts/qcom/sm8650.dtsi:3667.27-3723.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>> arch/arm64/boot/dts/qcom/sm8650-qrd.dtb: display-subsystem@ae00000: interconnects: [[191, 3, 7, 29, 1, 7]] is too short
   	from schema $id: http://devicetree.org/schemas/display/msm/qcom,sm8650-mdss.yaml#
>> arch/arm64/boot/dts/qcom/sm8650-qrd.dtb: display-subsystem@ae00000: interconnect-names: ['mdp0-mem'] is too short
   	from schema $id: http://devicetree.org/schemas/display/msm/qcom,sm8650-mdss.yaml#
--
>> arch/arm64/boot/dts/qcom/sm8650-hdk-display-card.dtb: display-subsystem@ae00000: interconnects: [[199, 3, 7, 29, 1, 7]] is too short
   	from schema $id: http://devicetree.org/schemas/display/msm/qcom,sm8650-mdss.yaml#
>> arch/arm64/boot/dts/qcom/sm8650-hdk-display-card.dtb: display-subsystem@ae00000: interconnect-names: ['mdp0-mem'] is too short
   	from schema $id: http://devicetree.org/schemas/display/msm/qcom,sm8650-mdss.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
