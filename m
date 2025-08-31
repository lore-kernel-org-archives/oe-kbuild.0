Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67F231C27
	for <oe-kbuild@lists.linux.dev>; Sun, 31 Aug 2025 00:03:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756598600; cv=none; b=LAEu4pQTREdpsFB0mYW3/nGhP03luUWzLQ6aZF54ACg30rpB1XddHyg/K1gkN2/UX2MtTjLSqSii/4bfo90Pd91z70mVwvmTzObF/dNuPTZHjxApWSaBnVKlDe5ugwvE/CH8h/V7IPZ05DJB7Ytbot8GIR6+bTdMJ/4tZiM4LQM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756598600; c=relaxed/simple;
	bh=y1CfG3xmMXOCmOrQeRhYB4UBs7ODLSF76pZ7J4L8ZtI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=s9DGIJxCs6e1pLlrg4PzgAbCCaRy7NbAHSnpXsoPj/AIM3s9rPyudfojzaN70fbEHTZFl6d04XpYE6Els7y8kWSPG7dGcDoY9JpdWaJ+DB1xH6bRcyr6uSFMuwo0tKmPAGyOHdn2v2NW3uOdoVRbmUdcqtRPCVCXm8ejNseHZuA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=S18v0HqI; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="S18v0HqI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756598598; x=1788134598;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=y1CfG3xmMXOCmOrQeRhYB4UBs7ODLSF76pZ7J4L8ZtI=;
  b=S18v0HqIggPdryBAmtPRBS6CCaf0+Q0i7aZazoSna0/IbQRmiqn2m6s0
   Jk+ic8Isb3TCQOYoSZPdinLVXEn5Qk43wdqcKwRi4CED8UTSRjJu0UCCq
   OF4PC43tRyUtD/2f/uhuAXeQa7dG7OUsQ4f3wUb/PDqgP/UowT4mkVDeN
   CJ/NOprmfTmUPJaOgfcLlnf1dsdcZm4AYIkU8XzkL/oIhFQkNomuwpSg3
   tYd9XL1go0uU85m2hAZYkvT+SaPc4OhvU1qJvFBf5pQAPeNdhJSupI9U3
   N2iNN/+EOwMKM2bjgS3sVlCB1PtPwWC9Ny+sEL2VENXElshHiLFb9sX0Q
   Q==;
X-CSE-ConnectionGUID: xYqxyZ+PT7CZbt0z4a6DdA==
X-CSE-MsgGUID: PvLTlFVnQWKoxD8D1Ga+7A==
X-IronPort-AV: E=McAfee;i="6800,10657,11537"; a="62483078"
X-IronPort-AV: E=Sophos;i="6.18,225,1751266800"; 
   d="scan'208";a="62483078"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Aug 2025 17:03:18 -0700
X-CSE-ConnectionGUID: paJZmIF7S5uPl6HKl9Kdig==
X-CSE-MsgGUID: o7YQgCZqQkahD1+3dGK1hA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,225,1751266800"; 
   d="scan'208";a="170577589"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 30 Aug 2025 17:03:17 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1usVXP-000VmL-04;
	Sun, 31 Aug 2025 00:03:15 +0000
Date: Sun, 31 Aug 2025 08:02:27 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [krzk-github:track/x1e-t14s 56/77]
 arch/arm64/boot/dts/qcom/x1e80100-dell-xps13-9345.dtb: csiphy@acec000
 (qcom,x1e80100-mipi-csi2-combo-phy): 'phy-type' is a required property
Message-ID: <202508310715.q9OXvHhw-lkp@intel.com>
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
TO: "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>
CC: Abel Vesa <abel.vesa@linaro.org>
CC: Neil Armstrong <neil.armstrong@linaro.org>

tree:   https://github.com/krzk/linux track/x1e-t14s
head:   6d8b522e6fa2b4a3deabb01d6d38343d5816d6c0
commit: ebe5081bae4b5226ac1ad80e31f9033a1bb09bbe [56/77] dt-bindings: phy: qcom: Add MIPI CSI2 C-PHY/DPHY Combo schema
:::::: branch date: 11 hours ago
:::::: commit date: 5 days ago
config: arm64-randconfig-051-20250830 (https://download.01.org/0day-ci/archive/20250831/202508310715.q9OXvHhw-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
dtschema version: 2025.6.2.dev4+g8f79ddd
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250831/202508310715.q9OXvHhw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202508310715.q9OXvHhw-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/qcom/x1e80100.dtsi:4880.11-4890.7: Warning (graph_child_address): /soc@0/usb@a2f8800/usb@a200000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/qcom/x1e80100-dell-xps13-9345.dtb: csiphy@acec000 (qcom,x1e80100-mipi-csi2-combo-phy): 'phy-type' is a required property
   	from schema $id: http://devicetree.org/schemas/phy/qcom,x1e80100-mipi-csi2-combo-phy.yaml#
   arch/arm64/boot/dts/qcom/x1e80100-dell-xps13-9345.dtb: phy@aec2a00 (qcom,x1e80100-dp-phy): clock-names: ['aux', 'cfg_ahb'] is too short
   	from schema $id: http://devicetree.org/schemas/phy/qcom,edp-phy.yaml#
--
>> arch/arm64/boot/dts/qcom/x1e80100-dell-xps13-9345-el2.dtb: csiphy@acec000 (qcom,x1e80100-mipi-csi2-combo-phy): 'phy-type' is a required property
   	from schema $id: http://devicetree.org/schemas/phy/qcom,x1e80100-mipi-csi2-combo-phy.yaml#
   arch/arm64/boot/dts/qcom/x1e80100-dell-xps13-9345-el2.dtb: phy@aec2a00 (qcom,x1e80100-dp-phy): clock-names: ['aux', 'cfg_ahb'] is too short
   	from schema $id: http://devicetree.org/schemas/phy/qcom,edp-phy.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
