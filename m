Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DB1F883F
	for <oe-kbuild@lists.linux.dev>; Thu, 11 Dec 2025 23:55:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765497358; cv=none; b=f+FSjyKU/Z5UcCN0DqeQqqIOMXpUV0IzG/U0ZGd4OoCU7K22bgRzIfPmeKRTnqCvTevYdnc9FEhvJAAA5RT+oICAErnZHRK/sleuFXfrBMcjwta0hSvQugEosxRALxPGH2wVk3IS6j2v3L15lzjWA1EHUU7oVMqSF1gDOkrGKCs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765497358; c=relaxed/simple;
	bh=BtrZgqSEozyobpR9suc4dj+V83dRg8utUCbxi9jmStA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Niooo7gC0j8KcnBk64LRlA+Q7olMmSPSkRMrEjZMKXVcglQEhpZxQtl9gxzZ6VTKcNBW11hh4lz26Z3fkdk/e4Ze73qWNC0ynwSMWXWPg5dTlPo7FbfNKZ/0d+oYiwJnQqRjyrGn0ZJ7gVlsGmFxEYmvL4VY1N9+fzRjh6oHL4U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bUgivwcS; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bUgivwcS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765497356; x=1797033356;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=BtrZgqSEozyobpR9suc4dj+V83dRg8utUCbxi9jmStA=;
  b=bUgivwcSOebV4vUPI+rM+S4hTN82bwXJNmoDt0j6GXeJ7utyScqCpIfC
   /FdvojRZj/3Ai7mlyvYjwr8EaJj7O9EK7ommN0TDmz1lRSZ5n3xJHA5md
   Kn7L/U28zRzAEjD4yOdVlVhVcTPdQQov/uOPBYs32zknh4/LqTU01eR27
   TlbpCZ07oDxbOeGI7XV61Xs9XdhB6ixw8JCuYPxebKR36YrLiVo2S88Fe
   zXow89SYsPehjNUELSsc3VSiC5iUJvQAI5dy7okUl2RFibiHOGRaSGFa2
   4uOWyQuzVCPfG1zAqyjiMtlHOfTHt0qySwykSJCatD7K1Hcn37R+/raCF
   Q==;
X-CSE-ConnectionGUID: +p7ogpcvT0Gr5lNGz3osPA==
X-CSE-MsgGUID: GkPmv8apQSi7Nxh8zoNzkg==
X-IronPort-AV: E=McAfee;i="6800,10657,11639"; a="71113533"
X-IronPort-AV: E=Sophos;i="6.21,141,1763452800"; 
   d="scan'208";a="71113533"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Dec 2025 15:55:56 -0800
X-CSE-ConnectionGUID: 0KcABcVzSBOa6Kw6mgUiOA==
X-CSE-MsgGUID: 1356maddSVymPCunwZ4e0g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,141,1763452800"; 
   d="scan'208";a="197204098"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by fmviesa008.fm.intel.com with ESMTP; 11 Dec 2025 15:55:55 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vTqVk-000000001FA-1cOT;
	Thu, 11 Dec 2025 23:55:52 +0000
Date: Fri, 12 Dec 2025 00:55:38 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: arch/arm/boot/dts/nvidia/tegra114-roth.dtb: dma@6000a000
 (nvidia,tegra114-apbdma): $nodename:0: 'dma@6000a000' does not match
 '^dma-controller(@.*)?$'
Message-ID: <202512120057.sgbNJtPK-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "dtcheck: too old problem, older than 3 months"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: "Rob Herring (Arm)" <robh@kernel.org>
CC: Vinod Koul <vkoul@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   d358e5254674b70f34c847715ca509e46eb81e6f
commit: 7a430af7d135be5042f14987bce16f6b40a3f694 dt-bindings: dma: nvidia,tegra20-apbdma: Add undocumented compatibles and "clock-names"
date:   4 months ago
:::::: branch date: 21 hours ago
:::::: commit date: 4 months ago
config: arm-randconfig-2052-20251209 (https://download.01.org/0day-ci/archive/20251212/202512120057.sgbNJtPK-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 8.5.0
dtschema version: 2025.9.dev21+gaa859412c
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251212/202512120057.sgbNJtPK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202512120057.sgbNJtPK-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm/boot/dts/nvidia/tegra114.dtsi:740.15-750.4: Warning (unique_unit_address_if_enabled): /usb@7d000000: duplicate unit-address (also used in node /usb-phy@7d000000)
   arch/arm/boot/dts/nvidia/tegra114.dtsi:780.15-790.4: Warning (unique_unit_address_if_enabled): /usb@7d008000: duplicate unit-address (also used in node /usb-phy@7d008000)
>> arch/arm/boot/dts/nvidia/tegra114-roth.dtb: dma@6000a000 (nvidia,tegra114-apbdma): $nodename:0: 'dma@6000a000' does not match '^dma-controller(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/dma/nvidia,tegra20-apbdma.yaml
   arch/arm/boot/dts/nvidia/tegra114-roth.dtb: /i2c@7000d000/regulator@43: failed to match any schema with compatible: ['ti,tps51632']
   arch/arm/boot/dts/nvidia/tegra114-roth.dtb: /i2c@7000d000/pmic@58: failed to match any schema with compatible: ['ti,tps65913', 'ti,palmas']
   arch/arm/boot/dts/nvidia/tegra114-roth.dtb: /i2c@7000d000/pmic@58: failed to match any schema with compatible: ['ti,tps65913', 'ti,palmas']
   arch/arm/boot/dts/nvidia/tegra114-roth.dtb: /i2c@7000d000/pmic@58/pmic: failed to match any schema with compatible: ['ti,tps65913-pmic', 'ti,palmas-pmic']
   arch/arm/boot/dts/nvidia/tegra114-roth.dtb: /i2c@7000d000/pmic@58/pmic: failed to match any schema with compatible: ['ti,tps65913-pmic', 'ti,palmas-pmic']
   arch/arm/boot/dts/nvidia/tegra114-roth.dtb: /i2c@7000d000/pmic@58/rtc: failed to match any schema with compatible: ['ti,palmas-rtc']
   arch/arm/boot/dts/nvidia/tegra114-roth.dtb: /kbc@7000e200: failed to match any schema with compatible: ['nvidia,tegra114-kbc']
   arch/arm/boot/dts/nvidia/tegra114-roth.dtb: /memory-controller@70019000: failed to match any schema with compatible: ['nvidia,tegra114-mc']
   arch/arm/boot/dts/nvidia/tegra114-roth.dtb: /ahub@70080000: failed to match any schema with compatible: ['nvidia,tegra114-ahub']
--
   arch/arm/boot/dts/nvidia/tegra114.dtsi:740.15-750.4: Warning (unique_unit_address_if_enabled): /usb@7d000000: duplicate unit-address (also used in node /usb-phy@7d000000)
>> arch/arm/boot/dts/nvidia/tegra114-tn7.dtb: dma@6000a000 (nvidia,tegra114-apbdma): $nodename:0: 'dma@6000a000' does not match '^dma-controller(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/dma/nvidia,tegra20-apbdma.yaml
   arch/arm/boot/dts/nvidia/tegra114-tn7.dtb: /i2c@7000d000/pmic@58: failed to match any schema with compatible: ['ti,tps65913', 'ti,palmas']
   arch/arm/boot/dts/nvidia/tegra114-tn7.dtb: /i2c@7000d000/pmic@58: failed to match any schema with compatible: ['ti,tps65913', 'ti,palmas']
   arch/arm/boot/dts/nvidia/tegra114-tn7.dtb: /i2c@7000d000/pmic@58/pmic: failed to match any schema with compatible: ['ti,tps65913-pmic', 'ti,palmas-pmic']
   arch/arm/boot/dts/nvidia/tegra114-tn7.dtb: /i2c@7000d000/pmic@58/pmic: failed to match any schema with compatible: ['ti,tps65913-pmic', 'ti,palmas-pmic']
   arch/arm/boot/dts/nvidia/tegra114-tn7.dtb: /i2c@7000d000/pmic@58/rtc: failed to match any schema with compatible: ['ti,palmas-rtc']
   arch/arm/boot/dts/nvidia/tegra114-tn7.dtb: /kbc@7000e200: failed to match any schema with compatible: ['nvidia,tegra114-kbc']
   arch/arm/boot/dts/nvidia/tegra114-tn7.dtb: /memory-controller@70019000: failed to match any schema with compatible: ['nvidia,tegra114-mc']
   arch/arm/boot/dts/nvidia/tegra114-tn7.dtb: /ahub@70080000: failed to match any schema with compatible: ['nvidia,tegra114-ahub']
--
   arch/arm/boot/dts/nvidia/tegra124.dtsi:1108.15-1118.4: Warning (unique_unit_address_if_enabled): /usb@7d000000: duplicate unit-address (also used in node /usb-phy@7d000000)
   arch/arm/boot/dts/nvidia/tegra124.dtsi:1148.15-1158.4: Warning (unique_unit_address_if_enabled): /usb@7d004000: duplicate unit-address (also used in node /usb-phy@7d004000)
   arch/arm/boot/dts/nvidia/tegra124.dtsi:1187.15-1197.4: Warning (unique_unit_address_if_enabled): /usb@7d008000: duplicate unit-address (also used in node /usb-phy@7d008000)
   arch/arm/boot/dts/nvidia/tegra124-apalis-eval.dtb: /pcie@1003000: failed to match any schema with compatible: ['nvidia,tegra124-pcie']
   arch/arm/boot/dts/nvidia/tegra124-apalis-eval.dtb: /gpu@57000000: failed to match any schema with compatible: ['nvidia,gk20a']
>> arch/arm/boot/dts/nvidia/tegra124-apalis-eval.dtb: dma@60020000 (nvidia,tegra124-apbdma): $nodename:0: 'dma@60020000' does not match '^dma-controller(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/dma/nvidia,tegra20-apbdma.yaml
   arch/arm/boot/dts/nvidia/tegra124-apalis-eval.dtb: /i2c@7000d000/pmic@40: failed to match any schema with compatible: ['ams,as3722']
   arch/arm/boot/dts/nvidia/tegra124-apalis-eval.dtb: /clock@70110000: failed to match any schema with compatible: ['nvidia,tegra124-dfll']
   arch/arm/boot/dts/nvidia/tegra124-apalis-eval.dtb: /ahub@70300000: failed to match any schema with compatible: ['nvidia,tegra124-ahub']
   arch/arm/boot/dts/nvidia/tegra124-apalis-eval.dtb: cpu@0 (arm,cortex-a15): 'operating-points' is a dependency of 'clock-latency'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml
   arch/arm/boot/dts/nvidia/tegra124-apalis-eval.dtb: cpu@0 (arm,cortex-a15): Unevaluated properties are not allowed ('clock-latency', 'vdd-cpu-supply' were unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml
--
   arch/arm/boot/dts/nvidia/tegra124-nyan.dtsi:29.9-32.4: Warning (unit_address_vs_reg): /memory: node has a reg or ranges property, but no unit name
   arch/arm/boot/dts/nvidia/tegra124-nyan-blaze.dtb: / (google,nyan-blaze-rev10): False schema does not allow {'device_type': ['memory'], 'reg': [[0, 2147483648, 0, 2147483648]]}
   	from schema $id: http://devicetree.org/schemas/root-node.yaml
   arch/arm/boot/dts/nvidia/tegra124-nyan-blaze.dtb: /pcie@1003000: failed to match any schema with compatible: ['nvidia,tegra124-pcie']
   arch/arm/boot/dts/nvidia/tegra124-nyan-blaze.dtb: /gpu@57000000: failed to match any schema with compatible: ['nvidia,gk20a']
>> arch/arm/boot/dts/nvidia/tegra124-nyan-blaze.dtb: dma@60020000 (nvidia,tegra124-apbdma): $nodename:0: 'dma@60020000' does not match '^dma-controller(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/dma/nvidia,tegra20-apbdma.yaml
   arch/arm/boot/dts/nvidia/tegra124-nyan-blaze.dtb: /i2c@7000d000/pmic@40: failed to match any schema with compatible: ['ams,as3722']
   arch/arm/boot/dts/nvidia/tegra124-nyan-blaze.dtb: /clock@70110000: failed to match any schema with compatible: ['nvidia,tegra124-dfll']
   arch/arm/boot/dts/nvidia/tegra124-nyan-blaze.dtb: /ahub@70300000: failed to match any schema with compatible: ['nvidia,tegra124-ahub']
   arch/arm/boot/dts/nvidia/tegra124-nyan-blaze.dtb: cpu@0 (arm,cortex-a15): 'operating-points' is a dependency of 'clock-latency'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml
   arch/arm/boot/dts/nvidia/tegra124-nyan-blaze.dtb: cpu@0 (arm,cortex-a15): Unevaluated properties are not allowed ('clock-latency', 'vdd-cpu-supply' were unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
