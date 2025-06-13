Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7779218A6AD
	for <oe-kbuild@lists.linux.dev>; Fri, 13 Jun 2025 02:55:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749783335; cv=none; b=GRAVaHs6lNf+4t+qSWcGL+3PQmGjbbErBSkZ/lr4BXaN03p/oapbjmeq/nL7nko8YN/Q4gKlMFgH8gonJQFFsBZ2Vl9WmmCzR6E+r5MCsFRd5o2ezfyBxo8X9bO6Hpu46Xy0JOHke8k/sceHeZzHfP2gDrr+uPRjSL3groSdlwM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749783335; c=relaxed/simple;
	bh=J8+vUWGhl9TShXjZP/l41me1dGQE89cUmUMwAS/RMq4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Gnz8syq3haZYOtTTkVeMXAMvR0LdzzgffLA2sNUeJJjbGS1O18OUkRMMA0JXY5D5zR82XtnZeOFy5kAgqOBty9iLTiPJGuQcv8o0nomvtT9kobOx1tgkBPn7I2aQZorqoAgTWl8m6WLpaupmGXB6ZWvMp/kswIgGZktSwIPNRPs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iBi4bpam; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iBi4bpam"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749783333; x=1781319333;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=J8+vUWGhl9TShXjZP/l41me1dGQE89cUmUMwAS/RMq4=;
  b=iBi4bpamoMizkDTRtk4H4IF2+X4t+3P+bto3Dl6/CDOJmQar68E3k2Jk
   74bseSZ9taV82GKdx8i0hICjj8AjfMJfF2OVCNzXb8sYl3zJ33+wTClLU
   X8RaDe/Z1i84bJlbMO0gy8rTwyeUlBQUqVsNiPZs7QJH5w0WP47aNQJjT
   E51JEv6m9hKiPSKYR0WNwNBSc3XT//9CzvTOyMNmw3uxjDfmlwWO2kTca
   g4T7DxSKKYgp+PU01KDEDmpUA3GmI5TpNiNSZoo4AHhilwfMnmskdmWPD
   bh2KbWzGPEZsNfCd1zHd7rJSWCk/TTyKV9ttkyQcjSHkhS6ncT5pp691I
   A==;
X-CSE-ConnectionGUID: 0U0K4tXyTKGcTGHP85w2cg==
X-CSE-MsgGUID: uHApJ8VkR7Ot4FuBixJQRg==
X-IronPort-AV: E=McAfee;i="6800,10657,11462"; a="51704904"
X-IronPort-AV: E=Sophos;i="6.16,232,1744095600"; 
   d="scan'208";a="51704904"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jun 2025 19:55:33 -0700
X-CSE-ConnectionGUID: 0lo2UgdPRn+TING96vgHHg==
X-CSE-MsgGUID: qGxaZEC/Tj2vx7jsmmODxg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,232,1744095600"; 
   d="scan'208";a="152468690"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 12 Jun 2025 19:55:29 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uPuZj-000CAc-1F;
	Fri, 13 Jun 2025 02:55:27 +0000
Date: Fri, 13 Jun 2025 10:55:23 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v2 2/2] arm64: tegra: Add NVIDIA Jetson Nano 2GB
 Developer Kit support
Message-ID: <202506131014.RHfnK5zN-lkp@intel.com>
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
In-Reply-To: <20250611-p3452-v2-2-fd2679706c63@gmail.com>
References: <20250611-p3452-v2-2-fd2679706c63@gmail.com>
TO: Aaron Kling via B4 Relay <devnull+webgeek1234.gmail.com@kernel.org>
TO: Rob Herring <robh@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
TO: Thierry Reding <thierry.reding@gmail.com>
TO: Jonathan Hunter <jonathanh@nvidia.com>
CC: devicetree@vger.kernel.org
CC: linux-tegra@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: Aaron Kling <webgeek1234@gmail.com>

Hi Aaron,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 19272b37aa4f83ca52bdf9c16d5d81bdd1354494]

url:    https://github.com/intel-lab-lkp/linux/commits/Aaron-Kling-via-B4-Relay/dt-bindings-arm-tegra-Document-Jetson-Nano-Devkits/20250612-025455
base:   19272b37aa4f83ca52bdf9c16d5d81bdd1354494
patch link:    https://lore.kernel.org/r/20250611-p3452-v2-2-fd2679706c63%40gmail.com
patch subject: [PATCH v2 2/2] arm64: tegra: Add NVIDIA Jetson Nano 2GB Developer Kit support
:::::: branch date: 32 hours ago
:::::: commit date: 32 hours ago
config: arm64-randconfig-053-20250612 (https://download.01.org/0day-ci/archive/20250613/202506131014.RHfnK5zN-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project f819f46284f2a79790038e1f6649172789734ae8)
dtschema version: 2025.3.dev28+g49451a5
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250613/202506131014.RHfnK5zN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202506131014.RHfnK5zN-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/nvidia/tegra210-p3541-0000.dtb: /pcie@1003000: failed to match any schema with compatible: ['nvidia,tegra210-pcie']
>> arch/arm64/boot/dts/nvidia/tegra210-p3541-0000.dtb: /host1x@50000000/tsec@54100000: failed to match any schema with compatible: ['nvidia,tegra210-tsec']
   arch/arm64/boot/dts/nvidia/tegra210-p3541-0000.dtb: /host1x@50000000/tsec@54500000: failed to match any schema with compatible: ['nvidia,tegra210-tsec']
>> arch/arm64/boot/dts/nvidia/tegra210-p3541-0000.dtb: /gpu@57000000: failed to match any schema with compatible: ['nvidia,gm20b']
>> arch/arm64/boot/dts/nvidia/tegra210-p3541-0000.dtb: /interrupt-controller@60004000: failed to match any schema with compatible: ['nvidia,tegra210-ictlr']
>> arch/arm64/boot/dts/nvidia/tegra210-p3541-0000.dtb: /dma@60020000: failed to match any schema with compatible: ['nvidia,tegra210-apbdma', 'nvidia,tegra148-apbdma']
>> arch/arm64/boot/dts/nvidia/tegra210-p3541-0000.dtb: /dma@60020000: failed to match any schema with compatible: ['nvidia,tegra210-apbdma', 'nvidia,tegra148-apbdma']
>> arch/arm64/boot/dts/nvidia/tegra210-p3541-0000.dtb: /i2c@7000d000/pmic@3c: failed to match any schema with compatible: ['maxim,max77620']
>> arch/arm64/boot/dts/nvidia/tegra210-p3541-0000.dtb: /memory-controller@70019000: failed to match any schema with compatible: ['nvidia,tegra210-mc']
>> arch/arm64/boot/dts/nvidia/tegra210-p3541-0000.dtb: external-memory-controller@7001b000 (nvidia,tegra210-emc): '#cooling-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/memory-controllers/nvidia,tegra210-emc.yaml#
>> arch/arm64/boot/dts/nvidia/tegra210-p3541-0000.dtb: /clock@70110000: failed to match any schema with compatible: ['nvidia,tegra210-dfll']
>> arch/arm64/boot/dts/nvidia/tegra210-p3541-0000.dtb: usb-phy@7d000000 (nvidia,tegra210-usb-phy): compatible: 'oneOf' conditional failed, one must be fixed:
   	['nvidia,tegra210-usb-phy', 'nvidia,tegra30-usb-phy'] is too long
   	'nvidia,tegra210-usb-phy' is not one of ['nvidia,tegra124-usb-phy', 'nvidia,tegra114-usb-phy']
   	'nvidia,tegra210-usb-phy' is not one of ['nvidia,tegra30-usb-phy', 'nvidia,tegra20-usb-phy']
   	from schema $id: http://devicetree.org/schemas/phy/nvidia,tegra20-usb-phy.yaml#
>> arch/arm64/boot/dts/nvidia/tegra210-p3541-0000.dtb: /usb-phy@7d000000: failed to match any schema with compatible: ['nvidia,tegra210-usb-phy', 'nvidia,tegra30-usb-phy']
>> arch/arm64/boot/dts/nvidia/tegra210-p3541-0000.dtb: usb-phy@7d004000 (nvidia,tegra210-usb-phy): compatible: 'oneOf' conditional failed, one must be fixed:
   	['nvidia,tegra210-usb-phy', 'nvidia,tegra30-usb-phy'] is too long
   	'nvidia,tegra210-usb-phy' is not one of ['nvidia,tegra124-usb-phy', 'nvidia,tegra114-usb-phy']
   	'nvidia,tegra210-usb-phy' is not one of ['nvidia,tegra30-usb-phy', 'nvidia,tegra20-usb-phy']
   	from schema $id: http://devicetree.org/schemas/phy/nvidia,tegra20-usb-phy.yaml#
>> arch/arm64/boot/dts/nvidia/tegra210-p3541-0000.dtb: /usb-phy@7d004000: failed to match any schema with compatible: ['nvidia,tegra210-usb-phy', 'nvidia,tegra30-usb-phy']
>> arch/arm64/boot/dts/nvidia/tegra210-p3541-0000.dtb: cpu@0 (arm,cortex-a57): 'operating-points' is a dependency of 'clock-latency'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
>> arch/arm64/boot/dts/nvidia/tegra210-p3541-0000.dtb: cpu@0 (arm,cortex-a57): Unevaluated properties are not allowed ('clock-latency' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
>> arch/arm64/boot/dts/nvidia/tegra210-p3541-0000.dtb: thermal-zones: cpu-thermal:cooling-maps: 'cpu-active', 'cpu-critical', 'cpu-hot', 'cpu-passive' do not match any of the regexes: '^map[-a-zA-Z0-9]*$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/nvidia/tegra210-p3541-0000.dtb: thermal-zones: mem-thermal:cooling-maps: 'dram-active', 'dram-passive' do not match any of the regexes: '^map[-a-zA-Z0-9]*$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
