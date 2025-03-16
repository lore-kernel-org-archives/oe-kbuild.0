Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE4A81922ED
	for <oe-kbuild@lists.linux.dev>; Sun, 16 Mar 2025 22:08:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742162907; cv=none; b=uC3KAEiC/SFWmn8nCyKdv6HCx1tjrW10gWLfmqyVwa7J/0j+KbZ8vDKYt76TIXcmNUIJ+q1AeUG0hs0HjcMdfDjzGyJaIvJdJLejTJxUDw2ZXVJXC2o09KuEDSI97MnmcFBLWQ4qwpIK+/Hdl86u0Ptu5t8vOMi594r67hhxiBA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742162907; c=relaxed/simple;
	bh=01UHRZc7KVQptrHaoXKS/ooeMgOMO/kkiPT3pAsHR0A=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=GMxX0WU/xC5LEBrRX9dNRVXIJ9imXgYQx0xaRhjXUZT93yx16KJrhJxMaT3kZL9SB0ine6XD4iM5/ZMMqQA7Ozethy7KF2/GhuB/viOnnVfkMTUXlUkOqWsr2SYc1hUZCxy84kKXh1EDzkZA+YF4MLtR8YMDWW8bTZLwX/gqg7c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lLVlYZrl; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lLVlYZrl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742162905; x=1773698905;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=01UHRZc7KVQptrHaoXKS/ooeMgOMO/kkiPT3pAsHR0A=;
  b=lLVlYZrlGI2VraLjWVmISI3aD8QM51XwuCFh1wsntYg9uTj9sd8Rus81
   u/08VkiSTPNNsnWJn05f5vwmixtCqx1OrE9Zb6ALqU7iVBHsrsrfb+HSs
   Wk/OPWbj+3Rs0iJ/3JuPWknVs5cYKyc7kGpi1lfiiqBAYcpM2N7ytlrzI
   3WebhB7r2hNL8hKaJO2Tk0crCb0vmNtTtg3HFkIaHLoBIpOgPb7OaSw40
   Kfylm9PpaEztdb4UhGAO/HhpQ1V7Hty3uCm7RwINn5oGM8JaES6YmbR5u
   Q+ZWgOnD34kqluT/+dmhTW720KVEOYyLmh3MwY/Lo/ylxZTgRtCYXwUDE
   Q==;
X-CSE-ConnectionGUID: t0uQT1GsQQ+KSITXgttfEQ==
X-CSE-MsgGUID: 1z0676TGTja8LV7mQNEzxw==
X-IronPort-AV: E=McAfee;i="6700,10204,11375"; a="43156777"
X-IronPort-AV: E=Sophos;i="6.14,252,1736841600"; 
   d="scan'208";a="43156777"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Mar 2025 15:08:24 -0700
X-CSE-ConnectionGUID: wnGFhokhRNGhDDimpBrXNw==
X-CSE-MsgGUID: J7Mk2VSqRq6XTVTiQb/gYw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,252,1736841600"; 
   d="scan'208";a="126961585"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by orviesa005.jf.intel.com with ESMTP; 16 Mar 2025 15:08:23 -0700
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ttw9c-000CGx-1o;
	Sun, 16 Mar 2025 22:08:20 +0000
Date: Mon, 17 Mar 2025 06:08:00 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [qcom:arm64-for-6.15 125/172]
 arch/arm64/boot/dts/qcom/sm8450-hdk.dtb: pcie-ep@1c08000: reg: [[0,
 29392896, 0, 12288], [0, 1073741824, 0, 3869], [0, 1073745696, 0, 168], [0,
 1073745920, 0, 4096], [0, 1075838976, 0, 16777216], [0, 29405184, 0, 4096],
 [0, 1073750016, 0, 4096]] is too lo...
Message-ID: <202503170609.TMMpnSXI-lkp@intel.com>
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
CC: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux arm64-for-6.15
head:   27b85be287f96180de2499b981eec83850df0da9
commit: bffe01a9b4bbccd07a1fe2bd78c3795004b56645 [125/172] arm64: dts: qcom: sm8450: add PCIe EP device nodes
:::::: branch date: 2 days ago
:::::: commit date: 3 days ago
config: arm64-randconfig-051-20250315 (https://download.01.org/0day-ci/archive/20250317/202503170609.TMMpnSXI-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project 87916f8c32ebd8e284091db9b70339df57fd1e90)
dtschema version: 2025.3.dev4+g7b57675
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250317/202503170609.TMMpnSXI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202503170609.TMMpnSXI-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/qcom/sm8450.dtsi:3500.27-3571.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sm8450.dtsi:3592.27-3644.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>> arch/arm64/boot/dts/qcom/sm8450-hdk.dtb: pcie-ep@1c08000: reg: [[0, 29392896, 0, 12288], [0, 1073741824, 0, 3869], [0, 1073745696, 0, 168], [0, 1073745920, 0, 4096], [0, 1075838976, 0, 16777216], [0, 29405184, 0, 4096], [0, 1073750016, 0, 4096]] is too long
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-ep.yaml#
>> arch/arm64/boot/dts/qcom/sm8450-hdk.dtb: pcie-ep@1c08000: reg-names: ['parf', 'dbi', 'elbi', 'atu', 'addr_space', 'mmio', 'dma'] is too long
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-ep.yaml#
>> arch/arm64/boot/dts/qcom/sm8450-hdk.dtb: pcie-ep@1c08000: interrupts: [[0, 306, 4], [0, 440, 4], [0, 86, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-ep.yaml#
>> arch/arm64/boot/dts/qcom/sm8450-hdk.dtb: pcie-ep@1c08000: interrupt-names: ['global', 'doorbell', 'dma'] is too long
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-ep.yaml#
--
   arch/arm64/boot/dts/qcom/sm8450.dtsi:3500.27-3571.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sm8450.dtsi:3592.27-3644.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>> arch/arm64/boot/dts/qcom/sm8450-qrd.dtb: pcie-ep@1c08000: reg: [[0, 29392896, 0, 12288], [0, 1073741824, 0, 3869], [0, 1073745696, 0, 168], [0, 1073745920, 0, 4096], [0, 1075838976, 0, 16777216], [0, 29405184, 0, 4096], [0, 1073750016, 0, 4096]] is too long
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-ep.yaml#
>> arch/arm64/boot/dts/qcom/sm8450-qrd.dtb: pcie-ep@1c08000: reg-names: ['parf', 'dbi', 'elbi', 'atu', 'addr_space', 'mmio', 'dma'] is too long
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-ep.yaml#
>> arch/arm64/boot/dts/qcom/sm8450-qrd.dtb: pcie-ep@1c08000: interrupts: [[0, 306, 4], [0, 440, 4], [0, 86, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-ep.yaml#
>> arch/arm64/boot/dts/qcom/sm8450-qrd.dtb: pcie-ep@1c08000: interrupt-names: ['global', 'doorbell', 'dma'] is too long
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-ep.yaml#
--
   arch/arm64/boot/dts/qcom/sm8450.dtsi:3500.27-3571.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sm8450.dtsi:3592.27-3644.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>> arch/arm64/boot/dts/qcom/sm8450-sony-xperia-nagara-pdx223.dtb: pcie-ep@1c08000: reg: [[0, 29392896, 0, 12288], [0, 1073741824, 0, 3869], [0, 1073745696, 0, 168], [0, 1073745920, 0, 4096], [0, 1075838976, 0, 16777216], [0, 29405184, 0, 4096], [0, 1073750016, 0, 4096]] is too long
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-ep.yaml#
>> arch/arm64/boot/dts/qcom/sm8450-sony-xperia-nagara-pdx223.dtb: pcie-ep@1c08000: reg-names: ['parf', 'dbi', 'elbi', 'atu', 'addr_space', 'mmio', 'dma'] is too long
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-ep.yaml#
>> arch/arm64/boot/dts/qcom/sm8450-sony-xperia-nagara-pdx223.dtb: pcie-ep@1c08000: interrupts: [[0, 306, 4], [0, 440, 4], [0, 86, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-ep.yaml#
>> arch/arm64/boot/dts/qcom/sm8450-sony-xperia-nagara-pdx223.dtb: pcie-ep@1c08000: interrupt-names: ['global', 'doorbell', 'dma'] is too long
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-ep.yaml#
--
   arch/arm64/boot/dts/qcom/sm8450.dtsi:3500.27-3571.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sm8450.dtsi:3592.27-3644.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>> arch/arm64/boot/dts/qcom/sm8450-sony-xperia-nagara-pdx224.dtb: pcie-ep@1c08000: reg: [[0, 29392896, 0, 12288], [0, 1073741824, 0, 3869], [0, 1073745696, 0, 168], [0, 1073745920, 0, 4096], [0, 1075838976, 0, 16777216], [0, 29405184, 0, 4096], [0, 1073750016, 0, 4096]] is too long
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-ep.yaml#
>> arch/arm64/boot/dts/qcom/sm8450-sony-xperia-nagara-pdx224.dtb: pcie-ep@1c08000: reg-names: ['parf', 'dbi', 'elbi', 'atu', 'addr_space', 'mmio', 'dma'] is too long
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-ep.yaml#
>> arch/arm64/boot/dts/qcom/sm8450-sony-xperia-nagara-pdx224.dtb: pcie-ep@1c08000: interrupts: [[0, 306, 4], [0, 440, 4], [0, 86, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-ep.yaml#
>> arch/arm64/boot/dts/qcom/sm8450-sony-xperia-nagara-pdx224.dtb: pcie-ep@1c08000: interrupt-names: ['global', 'doorbell', 'dma'] is too long
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-ep.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
