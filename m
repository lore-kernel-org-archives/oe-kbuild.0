Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A17F3594B
	for <oe-kbuild@lists.linux.dev>; Sat, 14 Jun 2025 00:44:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749861882; cv=none; b=YurQpVwfzEKea2xl0oDNFjnXr583zd/XWWTUvV/tCfWn7LJo0FGfs8wQZcCaXPwdaRzVCZ9Pcod5d8nrN8RUnpao5EoGxBDqZ3T6Dg+hutWMMww5QWDf/sIyv2jaGVd4Os4kHEwZAy2Z2lwSeHLcPf2G8eO9n1aSzcMK1kvbdKw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749861882; c=relaxed/simple;
	bh=Gpbho9vgcnTMFzV6lW+Wyw9SjZbSUUHX5XT6wVuGKV4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jOhHDQzFPWLaeOrsS5CMgx9Rd6pePWbLMEi+EczR4PUH3C1400cgjx4Nlx8Ec1J9JnKBSLs6rEXFS+cdk/3XvVNYY9XJnsr3KvADEtUUG10NfGcnAsfFhXTPHynfATSoJqtpqS1DaDczy3hbSW62OEIsfvddiBk8bavVmny4nsM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aDWICppr; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aDWICppr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749861879; x=1781397879;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Gpbho9vgcnTMFzV6lW+Wyw9SjZbSUUHX5XT6wVuGKV4=;
  b=aDWICpprniERMrwarz+HoznODR0g/gZZHRjEPAqZkvTxNNSQvkqrnaef
   LfdT9ANv4gUkBsg4b2w3ZNaikFWiA0sjMl3yHgXVRIjbaxG1Xy5Lf9Oy8
   r5KhbFNzJGwwzJHqdPS68zbkRu3o5wOEiKjvL3DiiZkag3j1UospEBYeO
   6oMCMF7/voawjmkPA74lPD3GeP3y4gZ3u0gaTIAA4oO8goGK/iY7cpmzb
   2u40SVkPBkAMoFadBYHaO06O9B19HMvcBBtrDAFVJ1IOWWDYFFxEtN8Z5
   CxpsWRHXkrICMRAxBfhx59QoctkvWL7AtEG/44Wf7XsG9CEjyUki6TN33
   Q==;
X-CSE-ConnectionGUID: DhFJbbttRi+mQKIlEGaz9g==
X-CSE-MsgGUID: p9IEJ6nOQbKmwJDZvr1j7A==
X-IronPort-AV: E=McAfee;i="6800,10657,11463"; a="74617621"
X-IronPort-AV: E=Sophos;i="6.16,235,1744095600"; 
   d="scan'208";a="74617621"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jun 2025 17:44:38 -0700
X-CSE-ConnectionGUID: 6Dn0HOFKRDufyHEew2BXzw==
X-CSE-MsgGUID: 6LrtbC75TkK+6EIP1r/J1g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,235,1744095600"; 
   d="scan'208";a="147859558"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 13 Jun 2025 17:44:35 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uQF0b-000D7e-1K;
	Sat, 14 Jun 2025 00:44:33 +0000
Date: Sat, 14 Jun 2025 08:44:25 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH 2/2] arm64: dts: Add Apple SoC GPU
Message-ID: <202506140805.nRfgPcyk-lkp@intel.com>
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
CC: llvm@lists.linux.dev
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20250611-sgx-dt-v1-2-7a11f3885c60@gmail.com>
References: <20250611-sgx-dt-v1-2-7a11f3885c60@gmail.com>
TO: Sasha Finkelstein via B4 Relay <devnull+fnkl.kernel.gmail.com@kernel.org>
TO: Sven Peter <sven@kernel.org>
TO: Janne Grunau <j@jannau.net>
TO: Alyssa Rosenzweig <alyssa@rosenzweig.io>
TO: Neal Gompa <neal@gompa.dev>
TO: David Airlie <airlied@gmail.com>
TO: Simona Vetter <simona@ffwll.ch>
TO: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
TO: Maxime Ripard <mripard@kernel.org>
TO: Thomas Zimmermann <tzimmermann@suse.de>
TO: Rob Herring <robh@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
CC: asahi@lists.linux.dev
CC: linux-arm-kernel@lists.infradead.org
CC: dri-devel@lists.freedesktop.org
CC: devicetree@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: Sasha Finkelstein <fnkl.kernel@gmail.com>

Hi Sasha,

kernel test robot noticed the following build warnings:

[auto build test WARNING on aef17cb3d3c43854002956f24c24ec8e1a0e3546]

url:    https://github.com/intel-lab-lkp/linux/commits/Sasha-Finkelstein-via-B4-Relay/dt-bindings-Add-Apple-SoC-GPU/20250612-013338
base:   aef17cb3d3c43854002956f24c24ec8e1a0e3546
patch link:    https://lore.kernel.org/r/20250611-sgx-dt-v1-2-7a11f3885c60%40gmail.com
patch subject: [PATCH 2/2] arm64: dts: Add Apple SoC GPU
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: arm64-randconfig-002-20250613 (https://download.01.org/0day-ci/archive/20250614/202506140805.nRfgPcyk-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project f819f46284f2a79790038e1f6649172789734ae8)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250614/202506140805.nRfgPcyk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202506140805.nRfgPcyk-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/apple/t8112.dtsi:378.24-380.5: Warning (unit_address_vs_reg): /reserved-memory/globals: node has a reg or ranges property, but no unit name
>> arch/arm64/boot/dts/apple/t8112.dtsi:382.26-384.5: Warning (unit_address_vs_reg): /reserved-memory/hw-cal-a: node has a reg or ranges property, but no unit name
>> arch/arm64/boot/dts/apple/t8112.dtsi:386.26-388.5: Warning (unit_address_vs_reg): /reserved-memory/hw-cal-b: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/apple/t8112.dtsi:390.28-392.5: Warning (unit_address_vs_reg): /reserved-memory/uat-handoff: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/apple/t8112.dtsi:394.34-396.5: Warning (unit_address_vs_reg): /reserved-memory/uat-pagetables: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/apple/t8112.dtsi:398.22-400.5: Warning (unit_address_vs_reg): /reserved-memory/uat-ttbs: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/apple/t8112.dtsi:481.34-510.5: Warning (avoid_unnecessary_addr_size): /soc/dsi@228600000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/apple/spi1-nvram.dtsi:19.10-38.4: Warning (avoid_unnecessary_addr_size): /soc/spi@235104000/flash@0: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/apple/t8112.dtsi:874.46-877.8: Warning (unique_unit_address_if_enabled): /soc/spmi@23d714000/pmic@e/nvmem-layout/boot-error-count@f702: duplicate unit-address (also used in node /soc/spmi@23d714000/pmic@e/nvmem-layout/panic-count@f702)
   arch/arm64/boot/dts/apple/t8112.dtsi:493.25-502.7: Warning (graph_child_address): /soc/dsi@228600000/ports/port@0: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
--
>> arch/arm64/boot/dts/apple/t8103.dtsi:363.24-365.5: Warning (unit_address_vs_reg): /reserved-memory/globals: node has a reg or ranges property, but no unit name
>> arch/arm64/boot/dts/apple/t8103.dtsi:367.26-369.5: Warning (unit_address_vs_reg): /reserved-memory/hw-cal-a: node has a reg or ranges property, but no unit name
>> arch/arm64/boot/dts/apple/t8103.dtsi:371.26-373.5: Warning (unit_address_vs_reg): /reserved-memory/hw-cal-b: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/apple/t8103.dtsi:375.28-377.5: Warning (unit_address_vs_reg): /reserved-memory/uat-handoff: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/apple/t8103.dtsi:379.34-381.5: Warning (unit_address_vs_reg): /reserved-memory/uat-pagetables: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/apple/t8103.dtsi:383.22-385.5: Warning (unit_address_vs_reg): /reserved-memory/uat-ttbs: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/apple/t8103.dtsi:466.34-495.5: Warning (avoid_unnecessary_addr_size): /soc/dsi@228600000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/apple/spi1-nvram.dtsi:19.10-38.4: Warning (avoid_unnecessary_addr_size): /soc/spi@235104000/flash@0: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/apple/t8103.dtsi:826.46-829.8: Warning (unique_unit_address_if_enabled): /soc/spmi@23d0d9300/pmic@f/nvmem-layout/boot-error-count@9f02: duplicate unit-address (also used in node /soc/spmi@23d0d9300/pmic@f/nvmem-layout/panic-count@9f02)
   arch/arm64/boot/dts/apple/t8103.dtsi:478.25-487.7: Warning (graph_child_address): /soc/dsi@228600000/ports/port@0: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
--
>> arch/arm64/boot/dts/apple/t600x-common.dtsi:391.24-393.5: Warning (unit_address_vs_reg): /reserved-memory/globals: node has a reg or ranges property, but no unit name
>> arch/arm64/boot/dts/apple/t600x-common.dtsi:395.26-397.5: Warning (unit_address_vs_reg): /reserved-memory/hw-cal-a: node has a reg or ranges property, but no unit name
>> arch/arm64/boot/dts/apple/t600x-common.dtsi:399.26-401.5: Warning (unit_address_vs_reg): /reserved-memory/hw-cal-b: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/apple/t600x-common.dtsi:403.28-405.5: Warning (unit_address_vs_reg): /reserved-memory/uat-handoff: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/apple/t600x-common.dtsi:407.34-409.5: Warning (unit_address_vs_reg): /reserved-memory/uat-pagetables: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/apple/t600x-common.dtsi:411.22-413.5: Warning (unit_address_vs_reg): /reserved-memory/uat-ttbs: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/apple/spi1-nvram.dtsi:19.10-38.4: Warning (avoid_unnecessary_addr_size): /soc@200000000/spi@39b104000/flash@0: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/apple/t600x-die0.dtsi:75.45-78.7: Warning (unique_unit_address_if_enabled): /soc@200000000/spmi@2920a1300/pmic@f/nvmem-layout/boot-error-count@6002: duplicate unit-address (also used in node /soc@200000000/spmi@2920a1300/pmic@f/nvmem-layout/panic-count@6002)
--
>> arch/arm64/boot/dts/apple/t600x-common.dtsi:391.24-393.5: Warning (unit_address_vs_reg): /reserved-memory/globals: node has a reg or ranges property, but no unit name
>> arch/arm64/boot/dts/apple/t600x-common.dtsi:395.26-397.5: Warning (unit_address_vs_reg): /reserved-memory/hw-cal-a: node has a reg or ranges property, but no unit name
>> arch/arm64/boot/dts/apple/t600x-common.dtsi:399.26-401.5: Warning (unit_address_vs_reg): /reserved-memory/hw-cal-b: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/apple/t600x-common.dtsi:403.28-405.5: Warning (unit_address_vs_reg): /reserved-memory/uat-handoff: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/apple/t600x-common.dtsi:407.34-409.5: Warning (unit_address_vs_reg): /reserved-memory/uat-pagetables: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/apple/t600x-common.dtsi:411.22-413.5: Warning (unit_address_vs_reg): /reserved-memory/uat-ttbs: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/apple/spi1-nvram.dtsi:19.10-38.4: Warning (avoid_unnecessary_addr_size): /soc/spi@39b104000/flash@0: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/apple/t600x-die0.dtsi:75.45-78.7: Warning (unique_unit_address_if_enabled): /soc/spmi@2920a1300/pmic@f/nvmem-layout/boot-error-count@6002: duplicate unit-address (also used in node /soc/spmi@2920a1300/pmic@f/nvmem-layout/panic-count@6002)
--
>> arch/arm64/boot/dts/apple/t8112.dtsi:378.24-380.5: Warning (unit_address_vs_reg): /reserved-memory/globals: node has a reg or ranges property, but no unit name
>> arch/arm64/boot/dts/apple/t8112.dtsi:382.26-384.5: Warning (unit_address_vs_reg): /reserved-memory/hw-cal-a: node has a reg or ranges property, but no unit name
>> arch/arm64/boot/dts/apple/t8112.dtsi:386.26-388.5: Warning (unit_address_vs_reg): /reserved-memory/hw-cal-b: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/apple/t8112.dtsi:390.28-392.5: Warning (unit_address_vs_reg): /reserved-memory/uat-handoff: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/apple/t8112.dtsi:394.34-396.5: Warning (unit_address_vs_reg): /reserved-memory/uat-pagetables: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/apple/t8112.dtsi:398.22-400.5: Warning (unit_address_vs_reg): /reserved-memory/uat-ttbs: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/apple/spi1-nvram.dtsi:19.10-38.4: Warning (avoid_unnecessary_addr_size): /soc/spi@235104000/flash@0: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/apple/t8112.dtsi:874.46-877.8: Warning (unique_unit_address_if_enabled): /soc/spmi@23d714000/pmic@e/nvmem-layout/boot-error-count@f702: duplicate unit-address (also used in node /soc/spmi@23d714000/pmic@e/nvmem-layout/panic-count@f702)
   arch/arm64/boot/dts/apple/t8112.dtsi:493.25-502.7: Warning (graph_child_address): /soc/dsi@228600000/ports/port@0: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/apple/t8112.dtsi:504.26-508.7: Warning (graph_child_address): /soc/dsi@228600000/ports/port@1: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
--
>> arch/arm64/boot/dts/apple/t8103.dtsi:363.24-365.5: Warning (unit_address_vs_reg): /reserved-memory/globals: node has a reg or ranges property, but no unit name
>> arch/arm64/boot/dts/apple/t8103.dtsi:367.26-369.5: Warning (unit_address_vs_reg): /reserved-memory/hw-cal-a: node has a reg or ranges property, but no unit name
>> arch/arm64/boot/dts/apple/t8103.dtsi:371.26-373.5: Warning (unit_address_vs_reg): /reserved-memory/hw-cal-b: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/apple/t8103.dtsi:375.28-377.5: Warning (unit_address_vs_reg): /reserved-memory/uat-handoff: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/apple/t8103.dtsi:379.34-381.5: Warning (unit_address_vs_reg): /reserved-memory/uat-pagetables: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/apple/t8103.dtsi:383.22-385.5: Warning (unit_address_vs_reg): /reserved-memory/uat-ttbs: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/apple/spi1-nvram.dtsi:19.10-38.4: Warning (avoid_unnecessary_addr_size): /soc/spi@235104000/flash@0: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/apple/t8103.dtsi:826.46-829.8: Warning (unique_unit_address_if_enabled): /soc/spmi@23d0d9300/pmic@f/nvmem-layout/boot-error-count@9f02: duplicate unit-address (also used in node /soc/spmi@23d0d9300/pmic@f/nvmem-layout/panic-count@9f02)
   arch/arm64/boot/dts/apple/t8103.dtsi:478.25-487.7: Warning (graph_child_address): /soc/dsi@228600000/ports/port@0: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/apple/t8103.dtsi:489.26-493.7: Warning (graph_child_address): /soc/dsi@228600000/ports/port@1: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary

vim +378 arch/arm64/boot/dts/apple/t8112.dtsi

2d5ce3fbef3242 Hector Martin     2023-03-07    15  
2d5ce3fbef3242 Hector Martin     2023-03-07    16  / {
2d5ce3fbef3242 Hector Martin     2023-03-07    17  	compatible = "apple,t8112", "apple,arm-platform";
2d5ce3fbef3242 Hector Martin     2023-03-07    18  
2d5ce3fbef3242 Hector Martin     2023-03-07    19  	#address-cells = <2>;
2d5ce3fbef3242 Hector Martin     2023-03-07    20  	#size-cells = <2>;
2d5ce3fbef3242 Hector Martin     2023-03-07    21  
296496dda0fb06 Sasha Finkelstein 2025-06-11    22  	aliases {
296496dda0fb06 Sasha Finkelstein 2025-06-11    23  		gpu = &gpu;
296496dda0fb06 Sasha Finkelstein 2025-06-11    24  	};
296496dda0fb06 Sasha Finkelstein 2025-06-11    25  
2d5ce3fbef3242 Hector Martin     2023-03-07    26  	cpus {
2d5ce3fbef3242 Hector Martin     2023-03-07    27  		#address-cells = <2>;
2d5ce3fbef3242 Hector Martin     2023-03-07    28  		#size-cells = <0>;
2d5ce3fbef3242 Hector Martin     2023-03-07    29  
2d5ce3fbef3242 Hector Martin     2023-03-07    30  		cpu-map {
2d5ce3fbef3242 Hector Martin     2023-03-07    31  			cluster0 {
2d5ce3fbef3242 Hector Martin     2023-03-07    32  				core0 {
2d5ce3fbef3242 Hector Martin     2023-03-07    33  					cpu = <&cpu_e0>;
2d5ce3fbef3242 Hector Martin     2023-03-07    34  				};
2d5ce3fbef3242 Hector Martin     2023-03-07    35  				core1 {
2d5ce3fbef3242 Hector Martin     2023-03-07    36  					cpu = <&cpu_e1>;
2d5ce3fbef3242 Hector Martin     2023-03-07    37  				};
2d5ce3fbef3242 Hector Martin     2023-03-07    38  				core2 {
2d5ce3fbef3242 Hector Martin     2023-03-07    39  					cpu = <&cpu_e2>;
2d5ce3fbef3242 Hector Martin     2023-03-07    40  				};
2d5ce3fbef3242 Hector Martin     2023-03-07    41  				core3 {
2d5ce3fbef3242 Hector Martin     2023-03-07    42  					cpu = <&cpu_e3>;
2d5ce3fbef3242 Hector Martin     2023-03-07    43  				};
2d5ce3fbef3242 Hector Martin     2023-03-07    44  			};
2d5ce3fbef3242 Hector Martin     2023-03-07    45  
2d5ce3fbef3242 Hector Martin     2023-03-07    46  			cluster1 {
2d5ce3fbef3242 Hector Martin     2023-03-07    47  				core0 {
2d5ce3fbef3242 Hector Martin     2023-03-07    48  					cpu = <&cpu_p0>;
2d5ce3fbef3242 Hector Martin     2023-03-07    49  				};
2d5ce3fbef3242 Hector Martin     2023-03-07    50  				core1 {
2d5ce3fbef3242 Hector Martin     2023-03-07    51  					cpu = <&cpu_p1>;
2d5ce3fbef3242 Hector Martin     2023-03-07    52  				};
2d5ce3fbef3242 Hector Martin     2023-03-07    53  				core2 {
2d5ce3fbef3242 Hector Martin     2023-03-07    54  					cpu = <&cpu_p2>;
2d5ce3fbef3242 Hector Martin     2023-03-07    55  				};
2d5ce3fbef3242 Hector Martin     2023-03-07    56  				core3 {
2d5ce3fbef3242 Hector Martin     2023-03-07    57  					cpu = <&cpu_p3>;
2d5ce3fbef3242 Hector Martin     2023-03-07    58  				};
2d5ce3fbef3242 Hector Martin     2023-03-07    59  			};
2d5ce3fbef3242 Hector Martin     2023-03-07    60  		};
2d5ce3fbef3242 Hector Martin     2023-03-07    61  
2d5ce3fbef3242 Hector Martin     2023-03-07    62  		cpu_e0: cpu@0 {
2d5ce3fbef3242 Hector Martin     2023-03-07    63  			compatible = "apple,blizzard";
2d5ce3fbef3242 Hector Martin     2023-03-07    64  			device_type = "cpu";
2d5ce3fbef3242 Hector Martin     2023-03-07    65  			reg = <0x0 0x0>;
2d5ce3fbef3242 Hector Martin     2023-03-07    66  			enable-method = "spin-table";
2d5ce3fbef3242 Hector Martin     2023-03-07    67  			cpu-release-addr = <0 0>; /* To be filled by loader */
2d5ce3fbef3242 Hector Martin     2023-03-07    68  			operating-points-v2 = <&ecluster_opp>;
2d5ce3fbef3242 Hector Martin     2023-03-07    69  			capacity-dmips-mhz = <756>;
2d5ce3fbef3242 Hector Martin     2023-03-07    70  			performance-domains = <&cpufreq_e>;
2d5ce3fbef3242 Hector Martin     2023-03-07    71  			next-level-cache = <&l2_cache_0>;
2d5ce3fbef3242 Hector Martin     2023-03-07    72  			i-cache-size = <0x20000>;
2d5ce3fbef3242 Hector Martin     2023-03-07    73  			d-cache-size = <0x10000>;
2d5ce3fbef3242 Hector Martin     2023-03-07    74  		};
2d5ce3fbef3242 Hector Martin     2023-03-07    75  
2d5ce3fbef3242 Hector Martin     2023-03-07    76  		cpu_e1: cpu@1 {
2d5ce3fbef3242 Hector Martin     2023-03-07    77  			compatible = "apple,blizzard";
2d5ce3fbef3242 Hector Martin     2023-03-07    78  			device_type = "cpu";
2d5ce3fbef3242 Hector Martin     2023-03-07    79  			reg = <0x0 0x1>;
2d5ce3fbef3242 Hector Martin     2023-03-07    80  			enable-method = "spin-table";
2d5ce3fbef3242 Hector Martin     2023-03-07    81  			cpu-release-addr = <0 0>; /* To be filled by loader */
2d5ce3fbef3242 Hector Martin     2023-03-07    82  			operating-points-v2 = <&ecluster_opp>;
2d5ce3fbef3242 Hector Martin     2023-03-07    83  			capacity-dmips-mhz = <756>;
2d5ce3fbef3242 Hector Martin     2023-03-07    84  			performance-domains = <&cpufreq_e>;
2d5ce3fbef3242 Hector Martin     2023-03-07    85  			next-level-cache = <&l2_cache_0>;
2d5ce3fbef3242 Hector Martin     2023-03-07    86  			i-cache-size = <0x20000>;
2d5ce3fbef3242 Hector Martin     2023-03-07    87  			d-cache-size = <0x10000>;
2d5ce3fbef3242 Hector Martin     2023-03-07    88  		};
2d5ce3fbef3242 Hector Martin     2023-03-07    89  
2d5ce3fbef3242 Hector Martin     2023-03-07    90  		cpu_e2: cpu@2 {
2d5ce3fbef3242 Hector Martin     2023-03-07    91  			compatible = "apple,blizzard";
2d5ce3fbef3242 Hector Martin     2023-03-07    92  			device_type = "cpu";
2d5ce3fbef3242 Hector Martin     2023-03-07    93  			reg = <0x0 0x2>;
2d5ce3fbef3242 Hector Martin     2023-03-07    94  			enable-method = "spin-table";
2d5ce3fbef3242 Hector Martin     2023-03-07    95  			cpu-release-addr = <0 0>; /* To be filled by loader */
2d5ce3fbef3242 Hector Martin     2023-03-07    96  			operating-points-v2 = <&ecluster_opp>;
2d5ce3fbef3242 Hector Martin     2023-03-07    97  			capacity-dmips-mhz = <756>;
2d5ce3fbef3242 Hector Martin     2023-03-07    98  			performance-domains = <&cpufreq_e>;
2d5ce3fbef3242 Hector Martin     2023-03-07    99  			next-level-cache = <&l2_cache_0>;
2d5ce3fbef3242 Hector Martin     2023-03-07   100  			i-cache-size = <0x20000>;
2d5ce3fbef3242 Hector Martin     2023-03-07   101  			d-cache-size = <0x10000>;
2d5ce3fbef3242 Hector Martin     2023-03-07   102  		};
2d5ce3fbef3242 Hector Martin     2023-03-07   103  
2d5ce3fbef3242 Hector Martin     2023-03-07   104  		cpu_e3: cpu@3 {
2d5ce3fbef3242 Hector Martin     2023-03-07   105  			compatible = "apple,blizzard";
2d5ce3fbef3242 Hector Martin     2023-03-07   106  			device_type = "cpu";
2d5ce3fbef3242 Hector Martin     2023-03-07   107  			reg = <0x0 0x3>;
2d5ce3fbef3242 Hector Martin     2023-03-07   108  			enable-method = "spin-table";
2d5ce3fbef3242 Hector Martin     2023-03-07   109  			cpu-release-addr = <0 0>; /* To be filled by loader */
2d5ce3fbef3242 Hector Martin     2023-03-07   110  			operating-points-v2 = <&ecluster_opp>;
2d5ce3fbef3242 Hector Martin     2023-03-07   111  			capacity-dmips-mhz = <756>;
2d5ce3fbef3242 Hector Martin     2023-03-07   112  			performance-domains = <&cpufreq_e>;
2d5ce3fbef3242 Hector Martin     2023-03-07   113  			next-level-cache = <&l2_cache_0>;
2d5ce3fbef3242 Hector Martin     2023-03-07   114  			i-cache-size = <0x20000>;
2d5ce3fbef3242 Hector Martin     2023-03-07   115  			d-cache-size = <0x10000>;
2d5ce3fbef3242 Hector Martin     2023-03-07   116  		};
2d5ce3fbef3242 Hector Martin     2023-03-07   117  
2d5ce3fbef3242 Hector Martin     2023-03-07   118  		cpu_p0: cpu@10100 {
2d5ce3fbef3242 Hector Martin     2023-03-07   119  			compatible = "apple,avalanche";
2d5ce3fbef3242 Hector Martin     2023-03-07   120  			device_type = "cpu";
2d5ce3fbef3242 Hector Martin     2023-03-07   121  			reg = <0x0 0x10100>;
2d5ce3fbef3242 Hector Martin     2023-03-07   122  			enable-method = "spin-table";
2d5ce3fbef3242 Hector Martin     2023-03-07   123  			cpu-release-addr = <0 0>; /* To be filled by loader */
2d5ce3fbef3242 Hector Martin     2023-03-07   124  			operating-points-v2 = <&pcluster_opp>;
2d5ce3fbef3242 Hector Martin     2023-03-07   125  			capacity-dmips-mhz = <1024>;
2d5ce3fbef3242 Hector Martin     2023-03-07   126  			performance-domains = <&cpufreq_p>;
2d5ce3fbef3242 Hector Martin     2023-03-07   127  			next-level-cache = <&l2_cache_1>;
2d5ce3fbef3242 Hector Martin     2023-03-07   128  			i-cache-size = <0x30000>;
2d5ce3fbef3242 Hector Martin     2023-03-07   129  			d-cache-size = <0x20000>;
2d5ce3fbef3242 Hector Martin     2023-03-07   130  		};
2d5ce3fbef3242 Hector Martin     2023-03-07   131  
2d5ce3fbef3242 Hector Martin     2023-03-07   132  		cpu_p1: cpu@10101 {
2d5ce3fbef3242 Hector Martin     2023-03-07   133  			compatible = "apple,avalanche";
2d5ce3fbef3242 Hector Martin     2023-03-07   134  			device_type = "cpu";
2d5ce3fbef3242 Hector Martin     2023-03-07   135  			reg = <0x0 0x10101>;
2d5ce3fbef3242 Hector Martin     2023-03-07   136  			enable-method = "spin-table";
2d5ce3fbef3242 Hector Martin     2023-03-07   137  			cpu-release-addr = <0 0>; /* To be filled by loader */
2d5ce3fbef3242 Hector Martin     2023-03-07   138  			operating-points-v2 = <&pcluster_opp>;
2d5ce3fbef3242 Hector Martin     2023-03-07   139  			capacity-dmips-mhz = <1024>;
2d5ce3fbef3242 Hector Martin     2023-03-07   140  			performance-domains = <&cpufreq_p>;
2d5ce3fbef3242 Hector Martin     2023-03-07   141  			next-level-cache = <&l2_cache_1>;
2d5ce3fbef3242 Hector Martin     2023-03-07   142  			i-cache-size = <0x30000>;
2d5ce3fbef3242 Hector Martin     2023-03-07   143  			d-cache-size = <0x20000>;
2d5ce3fbef3242 Hector Martin     2023-03-07   144  		};
2d5ce3fbef3242 Hector Martin     2023-03-07   145  
2d5ce3fbef3242 Hector Martin     2023-03-07   146  		cpu_p2: cpu@10102 {
2d5ce3fbef3242 Hector Martin     2023-03-07   147  			compatible = "apple,avalanche";
2d5ce3fbef3242 Hector Martin     2023-03-07   148  			device_type = "cpu";
2d5ce3fbef3242 Hector Martin     2023-03-07   149  			reg = <0x0 0x10102>;
2d5ce3fbef3242 Hector Martin     2023-03-07   150  			enable-method = "spin-table";
2d5ce3fbef3242 Hector Martin     2023-03-07   151  			cpu-release-addr = <0 0>; /* To be filled by loader */
2d5ce3fbef3242 Hector Martin     2023-03-07   152  			operating-points-v2 = <&pcluster_opp>;
2d5ce3fbef3242 Hector Martin     2023-03-07   153  			capacity-dmips-mhz = <1024>;
2d5ce3fbef3242 Hector Martin     2023-03-07   154  			performance-domains = <&cpufreq_p>;
2d5ce3fbef3242 Hector Martin     2023-03-07   155  			next-level-cache = <&l2_cache_1>;
2d5ce3fbef3242 Hector Martin     2023-03-07   156  			i-cache-size = <0x30000>;
2d5ce3fbef3242 Hector Martin     2023-03-07   157  			d-cache-size = <0x20000>;
2d5ce3fbef3242 Hector Martin     2023-03-07   158  		};
2d5ce3fbef3242 Hector Martin     2023-03-07   159  
2d5ce3fbef3242 Hector Martin     2023-03-07   160  		cpu_p3: cpu@10103 {
2d5ce3fbef3242 Hector Martin     2023-03-07   161  			compatible = "apple,avalanche";
2d5ce3fbef3242 Hector Martin     2023-03-07   162  			device_type = "cpu";
2d5ce3fbef3242 Hector Martin     2023-03-07   163  			reg = <0x0 0x10103>;
2d5ce3fbef3242 Hector Martin     2023-03-07   164  			enable-method = "spin-table";
2d5ce3fbef3242 Hector Martin     2023-03-07   165  			cpu-release-addr = <0 0>; /* To be filled by loader */
2d5ce3fbef3242 Hector Martin     2023-03-07   166  			operating-points-v2 = <&pcluster_opp>;
2d5ce3fbef3242 Hector Martin     2023-03-07   167  			capacity-dmips-mhz = <1024>;
2d5ce3fbef3242 Hector Martin     2023-03-07   168  			performance-domains = <&cpufreq_p>;
2d5ce3fbef3242 Hector Martin     2023-03-07   169  			next-level-cache = <&l2_cache_1>;
2d5ce3fbef3242 Hector Martin     2023-03-07   170  			i-cache-size = <0x30000>;
2d5ce3fbef3242 Hector Martin     2023-03-07   171  			d-cache-size = <0x20000>;
2d5ce3fbef3242 Hector Martin     2023-03-07   172  		};
2d5ce3fbef3242 Hector Martin     2023-03-07   173  
2d5ce3fbef3242 Hector Martin     2023-03-07   174  		l2_cache_0: l2-cache-0 {
2d5ce3fbef3242 Hector Martin     2023-03-07   175  			compatible = "cache";
2d5ce3fbef3242 Hector Martin     2023-03-07   176  			cache-level = <2>;
2d5ce3fbef3242 Hector Martin     2023-03-07   177  			cache-unified;
2d5ce3fbef3242 Hector Martin     2023-03-07   178  			cache-size = <0x400000>;
2d5ce3fbef3242 Hector Martin     2023-03-07   179  		};
2d5ce3fbef3242 Hector Martin     2023-03-07   180  
2d5ce3fbef3242 Hector Martin     2023-03-07   181  		l2_cache_1: l2-cache-1 {
2d5ce3fbef3242 Hector Martin     2023-03-07   182  			compatible = "cache";
2d5ce3fbef3242 Hector Martin     2023-03-07   183  			cache-level = <2>;
2d5ce3fbef3242 Hector Martin     2023-03-07   184  			cache-unified;
2d5ce3fbef3242 Hector Martin     2023-03-07   185  			cache-size = <0x1000000>;
2d5ce3fbef3242 Hector Martin     2023-03-07   186  		};
2d5ce3fbef3242 Hector Martin     2023-03-07   187  	};
2d5ce3fbef3242 Hector Martin     2023-03-07   188  
2d5ce3fbef3242 Hector Martin     2023-03-07   189  	ecluster_opp: opp-table-0 {
2d5ce3fbef3242 Hector Martin     2023-03-07   190  		compatible = "operating-points-v2";
2d5ce3fbef3242 Hector Martin     2023-03-07   191  		opp-shared;
2d5ce3fbef3242 Hector Martin     2023-03-07   192  
2d5ce3fbef3242 Hector Martin     2023-03-07   193  		opp01 {
2d5ce3fbef3242 Hector Martin     2023-03-07   194  			opp-hz = /bits/ 64 <600000000>;
2d5ce3fbef3242 Hector Martin     2023-03-07   195  			opp-level = <1>;
2d5ce3fbef3242 Hector Martin     2023-03-07   196  			clock-latency-ns = <7500>;
2d5ce3fbef3242 Hector Martin     2023-03-07   197  		};
2d5ce3fbef3242 Hector Martin     2023-03-07   198  		opp02 {
2d5ce3fbef3242 Hector Martin     2023-03-07   199  			opp-hz = /bits/ 64 <912000000>;
2d5ce3fbef3242 Hector Martin     2023-03-07   200  			opp-level = <2>;
2d5ce3fbef3242 Hector Martin     2023-03-07   201  			clock-latency-ns = <20000>;
2d5ce3fbef3242 Hector Martin     2023-03-07   202  		};
2d5ce3fbef3242 Hector Martin     2023-03-07   203  		opp03 {
2d5ce3fbef3242 Hector Martin     2023-03-07   204  			opp-hz = /bits/ 64 <1284000000>;
2d5ce3fbef3242 Hector Martin     2023-03-07   205  			opp-level = <3>;
2d5ce3fbef3242 Hector Martin     2023-03-07   206  			clock-latency-ns = <22000>;
2d5ce3fbef3242 Hector Martin     2023-03-07   207  		};
2d5ce3fbef3242 Hector Martin     2023-03-07   208  		opp04 {
2d5ce3fbef3242 Hector Martin     2023-03-07   209  			opp-hz = /bits/ 64 <1752000000>;
2d5ce3fbef3242 Hector Martin     2023-03-07   210  			opp-level = <4>;
2d5ce3fbef3242 Hector Martin     2023-03-07   211  			clock-latency-ns = <30000>;
2d5ce3fbef3242 Hector Martin     2023-03-07   212  		};
2d5ce3fbef3242 Hector Martin     2023-03-07   213  		opp05 {
2d5ce3fbef3242 Hector Martin     2023-03-07   214  			opp-hz = /bits/ 64 <2004000000>;
2d5ce3fbef3242 Hector Martin     2023-03-07   215  			opp-level = <5>;
2d5ce3fbef3242 Hector Martin     2023-03-07   216  			clock-latency-ns = <35000>;
2d5ce3fbef3242 Hector Martin     2023-03-07   217  		};
2d5ce3fbef3242 Hector Martin     2023-03-07   218  		opp06 {
2d5ce3fbef3242 Hector Martin     2023-03-07   219  			opp-hz = /bits/ 64 <2256000000>;
2d5ce3fbef3242 Hector Martin     2023-03-07   220  			opp-level = <6>;
2d5ce3fbef3242 Hector Martin     2023-03-07   221  			clock-latency-ns = <39000>;
2d5ce3fbef3242 Hector Martin     2023-03-07   222  		};
2d5ce3fbef3242 Hector Martin     2023-03-07   223  		opp07 {
2d5ce3fbef3242 Hector Martin     2023-03-07   224  			opp-hz = /bits/ 64 <2424000000>;
2d5ce3fbef3242 Hector Martin     2023-03-07   225  			opp-level = <7>;
2d5ce3fbef3242 Hector Martin     2023-03-07   226  			clock-latency-ns = <53000>;
2d5ce3fbef3242 Hector Martin     2023-03-07   227  		};
2d5ce3fbef3242 Hector Martin     2023-03-07   228  	};
2d5ce3fbef3242 Hector Martin     2023-03-07   229  
2d5ce3fbef3242 Hector Martin     2023-03-07   230  	pcluster_opp: opp-table-1 {
2d5ce3fbef3242 Hector Martin     2023-03-07   231  		compatible = "operating-points-v2";
2d5ce3fbef3242 Hector Martin     2023-03-07   232  		opp-shared;
2d5ce3fbef3242 Hector Martin     2023-03-07   233  
2d5ce3fbef3242 Hector Martin     2023-03-07   234  		opp01 {
2d5ce3fbef3242 Hector Martin     2023-03-07   235  			opp-hz = /bits/ 64 <660000000>;
2d5ce3fbef3242 Hector Martin     2023-03-07   236  			opp-level = <1>;
2d5ce3fbef3242 Hector Martin     2023-03-07   237  			clock-latency-ns = <9000>;
2d5ce3fbef3242 Hector Martin     2023-03-07   238  		};
2d5ce3fbef3242 Hector Martin     2023-03-07   239  		opp02 {
2d5ce3fbef3242 Hector Martin     2023-03-07   240  			opp-hz = /bits/ 64 <924000000>;
2d5ce3fbef3242 Hector Martin     2023-03-07   241  			opp-level = <2>;
2d5ce3fbef3242 Hector Martin     2023-03-07   242  			clock-latency-ns = <19000>;
2d5ce3fbef3242 Hector Martin     2023-03-07   243  		};
2d5ce3fbef3242 Hector Martin     2023-03-07   244  		opp03 {
2d5ce3fbef3242 Hector Martin     2023-03-07   245  			opp-hz = /bits/ 64 <1188000000>;
2d5ce3fbef3242 Hector Martin     2023-03-07   246  			opp-level = <3>;
2d5ce3fbef3242 Hector Martin     2023-03-07   247  			clock-latency-ns = <22000>;
2d5ce3fbef3242 Hector Martin     2023-03-07   248  		};
2d5ce3fbef3242 Hector Martin     2023-03-07   249  		opp04 {
2d5ce3fbef3242 Hector Martin     2023-03-07   250  			opp-hz = /bits/ 64 <1452000000>;
2d5ce3fbef3242 Hector Martin     2023-03-07   251  			opp-level = <4>;
2d5ce3fbef3242 Hector Martin     2023-03-07   252  			clock-latency-ns = <24000>;
2d5ce3fbef3242 Hector Martin     2023-03-07   253  		};
2d5ce3fbef3242 Hector Martin     2023-03-07   254  		opp05 {
2d5ce3fbef3242 Hector Martin     2023-03-07   255  			opp-hz = /bits/ 64 <1704000000>;
2d5ce3fbef3242 Hector Martin     2023-03-07   256  			opp-level = <5>;
2d5ce3fbef3242 Hector Martin     2023-03-07   257  			clock-latency-ns = <26000>;
2d5ce3fbef3242 Hector Martin     2023-03-07   258  		};
2d5ce3fbef3242 Hector Martin     2023-03-07   259  		opp06 {
2d5ce3fbef3242 Hector Martin     2023-03-07   260  			opp-hz = /bits/ 64 <1968000000>;
2d5ce3fbef3242 Hector Martin     2023-03-07   261  			opp-level = <6>;
2d5ce3fbef3242 Hector Martin     2023-03-07   262  			clock-latency-ns = <28000>;
2d5ce3fbef3242 Hector Martin     2023-03-07   263  		};
2d5ce3fbef3242 Hector Martin     2023-03-07   264  		opp07 {
2d5ce3fbef3242 Hector Martin     2023-03-07   265  			opp-hz = /bits/ 64 <2208000000>;
2d5ce3fbef3242 Hector Martin     2023-03-07   266  			opp-level = <7>;
2d5ce3fbef3242 Hector Martin     2023-03-07   267  			clock-latency-ns = <30000>;
2d5ce3fbef3242 Hector Martin     2023-03-07   268  		};
2d5ce3fbef3242 Hector Martin     2023-03-07   269  		opp08 {
2d5ce3fbef3242 Hector Martin     2023-03-07   270  			opp-hz = /bits/ 64 <2400000000>;
2d5ce3fbef3242 Hector Martin     2023-03-07   271  			opp-level = <8>;
2d5ce3fbef3242 Hector Martin     2023-03-07   272  			clock-latency-ns = <33000>;
2d5ce3fbef3242 Hector Martin     2023-03-07   273  		};
2d5ce3fbef3242 Hector Martin     2023-03-07   274  		opp09 {
2d5ce3fbef3242 Hector Martin     2023-03-07   275  			opp-hz = /bits/ 64 <2568000000>;
2d5ce3fbef3242 Hector Martin     2023-03-07   276  			opp-level = <9>;
2d5ce3fbef3242 Hector Martin     2023-03-07   277  			clock-latency-ns = <34000>;
2d5ce3fbef3242 Hector Martin     2023-03-07   278  		};
2d5ce3fbef3242 Hector Martin     2023-03-07   279  		opp10 {
2d5ce3fbef3242 Hector Martin     2023-03-07   280  			opp-hz = /bits/ 64 <2724000000>;
2d5ce3fbef3242 Hector Martin     2023-03-07   281  			opp-level = <10>;
2d5ce3fbef3242 Hector Martin     2023-03-07   282  			clock-latency-ns = <36000>;
2d5ce3fbef3242 Hector Martin     2023-03-07   283  		};
2d5ce3fbef3242 Hector Martin     2023-03-07   284  		opp11 {
2d5ce3fbef3242 Hector Martin     2023-03-07   285  			opp-hz = /bits/ 64 <2868000000>;
2d5ce3fbef3242 Hector Martin     2023-03-07   286  			opp-level = <11>;
2d5ce3fbef3242 Hector Martin     2023-03-07   287  			clock-latency-ns = <41000>;
2d5ce3fbef3242 Hector Martin     2023-03-07   288  		};
2d5ce3fbef3242 Hector Martin     2023-03-07   289  		opp12 {
2d5ce3fbef3242 Hector Martin     2023-03-07   290  			opp-hz = /bits/ 64 <2988000000>;
2d5ce3fbef3242 Hector Martin     2023-03-07   291  			opp-level = <12>;
2d5ce3fbef3242 Hector Martin     2023-03-07   292  			clock-latency-ns = <42000>;
2d5ce3fbef3242 Hector Martin     2023-03-07   293  		};
2d5ce3fbef3242 Hector Martin     2023-03-07   294  		opp13 {
2d5ce3fbef3242 Hector Martin     2023-03-07   295  			opp-hz = /bits/ 64 <3096000000>;
2d5ce3fbef3242 Hector Martin     2023-03-07   296  			opp-level = <13>;
2d5ce3fbef3242 Hector Martin     2023-03-07   297  			clock-latency-ns = <44000>;
2d5ce3fbef3242 Hector Martin     2023-03-07   298  		};
2d5ce3fbef3242 Hector Martin     2023-03-07   299  		opp14 {
2d5ce3fbef3242 Hector Martin     2023-03-07   300  			opp-hz = /bits/ 64 <3204000000>;
2d5ce3fbef3242 Hector Martin     2023-03-07   301  			opp-level = <14>;
2d5ce3fbef3242 Hector Martin     2023-03-07   302  			clock-latency-ns = <46000>;
2d5ce3fbef3242 Hector Martin     2023-03-07   303  		};
2d5ce3fbef3242 Hector Martin     2023-03-07   304  		/* Not available until CPU deep sleep is implemented */
2d5ce3fbef3242 Hector Martin     2023-03-07   305  #if 0
2d5ce3fbef3242 Hector Martin     2023-03-07   306  		opp15 {
2d5ce3fbef3242 Hector Martin     2023-03-07   307  			opp-hz = /bits/ 64 <3324000000>;
2d5ce3fbef3242 Hector Martin     2023-03-07   308  			opp-level = <15>;
2d5ce3fbef3242 Hector Martin     2023-03-07   309  			clock-latency-ns = <62000>;
2d5ce3fbef3242 Hector Martin     2023-03-07   310  			turbo-mode;
2d5ce3fbef3242 Hector Martin     2023-03-07   311  		};
2d5ce3fbef3242 Hector Martin     2023-03-07   312  		opp16 {
2d5ce3fbef3242 Hector Martin     2023-03-07   313  			opp-hz = /bits/ 64 <3408000000>;
2d5ce3fbef3242 Hector Martin     2023-03-07   314  			opp-level = <16>;
2d5ce3fbef3242 Hector Martin     2023-03-07   315  			clock-latency-ns = <62000>;
2d5ce3fbef3242 Hector Martin     2023-03-07   316  			turbo-mode;
2d5ce3fbef3242 Hector Martin     2023-03-07   317  		};
2d5ce3fbef3242 Hector Martin     2023-03-07   318  		opp17 {
2d5ce3fbef3242 Hector Martin     2023-03-07   319  			opp-hz = /bits/ 64 <3504000000>;
2d5ce3fbef3242 Hector Martin     2023-03-07   320  			opp-level = <17>;
2d5ce3fbef3242 Hector Martin     2023-03-07   321  			clock-latency-ns = <62000>;
2d5ce3fbef3242 Hector Martin     2023-03-07   322  			turbo-mode;
2d5ce3fbef3242 Hector Martin     2023-03-07   323  		};
2d5ce3fbef3242 Hector Martin     2023-03-07   324  #endif
2d5ce3fbef3242 Hector Martin     2023-03-07   325  	};
2d5ce3fbef3242 Hector Martin     2023-03-07   326  
2d5ce3fbef3242 Hector Martin     2023-03-07   327  	timer {
2d5ce3fbef3242 Hector Martin     2023-03-07   328  		compatible = "arm,armv8-timer";
2d5ce3fbef3242 Hector Martin     2023-03-07   329  		interrupt-parent = <&aic>;
2d5ce3fbef3242 Hector Martin     2023-03-07   330  		interrupt-names = "phys", "virt", "hyp-phys", "hyp-virt";
2d5ce3fbef3242 Hector Martin     2023-03-07   331  		interrupts = <AIC_FIQ AIC_TMR_GUEST_PHYS IRQ_TYPE_LEVEL_HIGH>,
2d5ce3fbef3242 Hector Martin     2023-03-07   332  			     <AIC_FIQ AIC_TMR_GUEST_VIRT IRQ_TYPE_LEVEL_HIGH>,
2d5ce3fbef3242 Hector Martin     2023-03-07   333  			     <AIC_FIQ AIC_TMR_HV_PHYS IRQ_TYPE_LEVEL_HIGH>,
2d5ce3fbef3242 Hector Martin     2023-03-07   334  			     <AIC_FIQ AIC_TMR_HV_VIRT IRQ_TYPE_LEVEL_HIGH>;
2d5ce3fbef3242 Hector Martin     2023-03-07   335  	};
2d5ce3fbef3242 Hector Martin     2023-03-07   336  
2d5ce3fbef3242 Hector Martin     2023-03-07   337  	pmu-e {
2d5ce3fbef3242 Hector Martin     2023-03-07   338  		compatible = "apple,blizzard-pmu";
2d5ce3fbef3242 Hector Martin     2023-03-07   339  		interrupt-parent = <&aic>;
2d5ce3fbef3242 Hector Martin     2023-03-07   340  		interrupts = <AIC_FIQ AIC_CPU_PMU_E IRQ_TYPE_LEVEL_HIGH>;
2d5ce3fbef3242 Hector Martin     2023-03-07   341  	};
2d5ce3fbef3242 Hector Martin     2023-03-07   342  
2d5ce3fbef3242 Hector Martin     2023-03-07   343  	pmu-p {
2d5ce3fbef3242 Hector Martin     2023-03-07   344  		compatible = "apple,avalanche-pmu";
2d5ce3fbef3242 Hector Martin     2023-03-07   345  		interrupt-parent = <&aic>;
2d5ce3fbef3242 Hector Martin     2023-03-07   346  		interrupts = <AIC_FIQ AIC_CPU_PMU_P IRQ_TYPE_LEVEL_HIGH>;
2d5ce3fbef3242 Hector Martin     2023-03-07   347  	};
2d5ce3fbef3242 Hector Martin     2023-03-07   348  
2d5ce3fbef3242 Hector Martin     2023-03-07   349  	clkref: clock-ref {
2d5ce3fbef3242 Hector Martin     2023-03-07   350  		compatible = "fixed-clock";
2d5ce3fbef3242 Hector Martin     2023-03-07   351  		#clock-cells = <0>;
2d5ce3fbef3242 Hector Martin     2023-03-07   352  		clock-frequency = <24000000>;
2d5ce3fbef3242 Hector Martin     2023-03-07   353  		clock-output-names = "clkref";
2d5ce3fbef3242 Hector Martin     2023-03-07   354  	};
2d5ce3fbef3242 Hector Martin     2023-03-07   355  
0a6d561c7e46bf Janne Grunau      2024-12-03   356  	clk_200m: clock-200m {
0a6d561c7e46bf Janne Grunau      2024-12-03   357  		compatible = "fixed-clock";
0a6d561c7e46bf Janne Grunau      2024-12-03   358  		#clock-cells = <0>;
0a6d561c7e46bf Janne Grunau      2024-12-03   359  		clock-frequency = <200000000>;
0a6d561c7e46bf Janne Grunau      2024-12-03   360  		clock-output-names = "clk_200m";
0a6d561c7e46bf Janne Grunau      2024-12-03   361  	};
0a6d561c7e46bf Janne Grunau      2024-12-03   362  
2d5ce3fbef3242 Hector Martin     2023-03-07   363  	/*
2d5ce3fbef3242 Hector Martin     2023-03-07   364  	 * This is a fabulated representation of the input clock
2d5ce3fbef3242 Hector Martin     2023-03-07   365  	 * to NCO since we don't know the true clock tree.
2d5ce3fbef3242 Hector Martin     2023-03-07   366  	 */
2d5ce3fbef3242 Hector Martin     2023-03-07   367  	nco_clkref: clock-ref-nco {
2d5ce3fbef3242 Hector Martin     2023-03-07   368  		compatible = "fixed-clock";
2d5ce3fbef3242 Hector Martin     2023-03-07   369  		#clock-cells = <0>;
2d5ce3fbef3242 Hector Martin     2023-03-07   370  		clock-output-names = "nco_ref";
2d5ce3fbef3242 Hector Martin     2023-03-07   371  	};
2d5ce3fbef3242 Hector Martin     2023-03-07   372  
296496dda0fb06 Sasha Finkelstein 2025-06-11   373  	reserved-memory {
296496dda0fb06 Sasha Finkelstein 2025-06-11   374  		#address-cells = <2>;
296496dda0fb06 Sasha Finkelstein 2025-06-11   375  		#size-cells = <2>;
296496dda0fb06 Sasha Finkelstein 2025-06-11   376  		ranges;
296496dda0fb06 Sasha Finkelstein 2025-06-11   377  
296496dda0fb06 Sasha Finkelstein 2025-06-11  @378  		gpu_globals: globals {
296496dda0fb06 Sasha Finkelstein 2025-06-11   379  			reg = <0x0 0 0 0>;
296496dda0fb06 Sasha Finkelstein 2025-06-11   380  		};
296496dda0fb06 Sasha Finkelstein 2025-06-11   381  
296496dda0fb06 Sasha Finkelstein 2025-06-11  @382  		gpu_hw_cal_a: hw-cal-a {
296496dda0fb06 Sasha Finkelstein 2025-06-11   383  			reg = <0x0 0 0 0>;
296496dda0fb06 Sasha Finkelstein 2025-06-11   384  		};
296496dda0fb06 Sasha Finkelstein 2025-06-11   385  
296496dda0fb06 Sasha Finkelstein 2025-06-11  @386  		gpu_hw_cal_b: hw-cal-b {
296496dda0fb06 Sasha Finkelstein 2025-06-11   387  			reg = <0x0 0 0 0>;
296496dda0fb06 Sasha Finkelstein 2025-06-11   388  		};
296496dda0fb06 Sasha Finkelstein 2025-06-11   389  
296496dda0fb06 Sasha Finkelstein 2025-06-11   390  		uat_handoff: uat-handoff {
296496dda0fb06 Sasha Finkelstein 2025-06-11   391  			reg = <0x0 0 0 0>;
296496dda0fb06 Sasha Finkelstein 2025-06-11   392  		};
296496dda0fb06 Sasha Finkelstein 2025-06-11   393  
296496dda0fb06 Sasha Finkelstein 2025-06-11   394  		uat_pagetables: uat-pagetables {
296496dda0fb06 Sasha Finkelstein 2025-06-11   395  			reg = <0x0 0 0 0>;
296496dda0fb06 Sasha Finkelstein 2025-06-11   396  		};
296496dda0fb06 Sasha Finkelstein 2025-06-11   397  
296496dda0fb06 Sasha Finkelstein 2025-06-11   398  		uat_ttbs: uat-ttbs {
296496dda0fb06 Sasha Finkelstein 2025-06-11   399  			reg = <0x0 0 0 0>;
296496dda0fb06 Sasha Finkelstein 2025-06-11   400  		};
296496dda0fb06 Sasha Finkelstein 2025-06-11   401  	};
296496dda0fb06 Sasha Finkelstein 2025-06-11   402  
2d5ce3fbef3242 Hector Martin     2023-03-07   403  	soc {
2d5ce3fbef3242 Hector Martin     2023-03-07   404  		compatible = "simple-bus";
2d5ce3fbef3242 Hector Martin     2023-03-07   405  		#address-cells = <2>;
2d5ce3fbef3242 Hector Martin     2023-03-07   406  		#size-cells = <2>;
2d5ce3fbef3242 Hector Martin     2023-03-07   407  
2d5ce3fbef3242 Hector Martin     2023-03-07   408  		ranges;
2d5ce3fbef3242 Hector Martin     2023-03-07   409  		nonposted-mmio;
2d5ce3fbef3242 Hector Martin     2023-03-07   410  
296496dda0fb06 Sasha Finkelstein 2025-06-11   411  		gpu: gpu@206400000 {
296496dda0fb06 Sasha Finkelstein 2025-06-11   412  			compatible = "apple,agx-g14g";
296496dda0fb06 Sasha Finkelstein 2025-06-11   413  			reg = <0x2 0x6400000 0 0x40000>,
296496dda0fb06 Sasha Finkelstein 2025-06-11   414  				<0x2 0x4000000 0 0x1000000>;
296496dda0fb06 Sasha Finkelstein 2025-06-11   415  			reg-names = "asc", "sgx";
296496dda0fb06 Sasha Finkelstein 2025-06-11   416  			mboxes = <&agx_mbox>;
296496dda0fb06 Sasha Finkelstein 2025-06-11   417  			power-domains = <&ps_gfx>;
296496dda0fb06 Sasha Finkelstein 2025-06-11   418  			memory-region = <&uat_ttbs>, <&uat_pagetables>, <&uat_handoff>,
296496dda0fb06 Sasha Finkelstein 2025-06-11   419  					<&gpu_hw_cal_a>, <&gpu_hw_cal_b>, <&gpu_globals>;
296496dda0fb06 Sasha Finkelstein 2025-06-11   420  			memory-region-names = "ttbs", "pagetables", "handoff",
296496dda0fb06 Sasha Finkelstein 2025-06-11   421  					      "hw-cal-a", "hw-cal-b", "globals";
296496dda0fb06 Sasha Finkelstein 2025-06-11   422  
296496dda0fb06 Sasha Finkelstein 2025-06-11   423  			apple,firmware-compat = <0 0 0>;
296496dda0fb06 Sasha Finkelstein 2025-06-11   424  		};
296496dda0fb06 Sasha Finkelstein 2025-06-11   425  
296496dda0fb06 Sasha Finkelstein 2025-06-11   426  		agx_mbox: mbox@206408000 {
296496dda0fb06 Sasha Finkelstein 2025-06-11   427  			compatible = "apple,t8103-asc-mailbox", "apple,asc-mailbox-v4";
296496dda0fb06 Sasha Finkelstein 2025-06-11   428  			reg = <0x2 0x6408000 0x0 0x4000>;
296496dda0fb06 Sasha Finkelstein 2025-06-11   429  			interrupt-parent = <&aic>;
296496dda0fb06 Sasha Finkelstein 2025-06-11   430  			interrupts = <AIC_IRQ 709 IRQ_TYPE_LEVEL_HIGH>,
296496dda0fb06 Sasha Finkelstein 2025-06-11   431  				<AIC_IRQ 710 IRQ_TYPE_LEVEL_HIGH>,
296496dda0fb06 Sasha Finkelstein 2025-06-11   432  				<AIC_IRQ 711 IRQ_TYPE_LEVEL_HIGH>,
296496dda0fb06 Sasha Finkelstein 2025-06-11   433  				<AIC_IRQ 712 IRQ_TYPE_LEVEL_HIGH>;
296496dda0fb06 Sasha Finkelstein 2025-06-11   434  			interrupt-names = "send-empty", "send-not-empty",
296496dda0fb06 Sasha Finkelstein 2025-06-11   435  				"recv-empty", "recv-not-empty";
296496dda0fb06 Sasha Finkelstein 2025-06-11   436  			#mbox-cells = <0>;
296496dda0fb06 Sasha Finkelstein 2025-06-11   437  		};
296496dda0fb06 Sasha Finkelstein 2025-06-11   438  
2d5ce3fbef3242 Hector Martin     2023-03-07   439  		cpufreq_e: cpufreq@210e20000 {
2d5ce3fbef3242 Hector Martin     2023-03-07   440  			compatible = "apple,t8112-cluster-cpufreq", "apple,cluster-cpufreq";
2d5ce3fbef3242 Hector Martin     2023-03-07   441  			reg = <0x2 0x10e20000 0 0x1000>;
2d5ce3fbef3242 Hector Martin     2023-03-07   442  			#performance-domain-cells = <0>;
2d5ce3fbef3242 Hector Martin     2023-03-07   443  		};
2d5ce3fbef3242 Hector Martin     2023-03-07   444  
2d5ce3fbef3242 Hector Martin     2023-03-07   445  		cpufreq_p: cpufreq@211e20000 {
2d5ce3fbef3242 Hector Martin     2023-03-07   446  			compatible = "apple,t8112-cluster-cpufreq", "apple,cluster-cpufreq";
2d5ce3fbef3242 Hector Martin     2023-03-07   447  			reg = <0x2 0x11e20000 0 0x1000>;
2d5ce3fbef3242 Hector Martin     2023-03-07   448  			#performance-domain-cells = <0>;
2d5ce3fbef3242 Hector Martin     2023-03-07   449  		};
2d5ce3fbef3242 Hector Martin     2023-03-07   450  
7275e795e520c7 Sasha Finkelstein 2025-02-17   451  		display_dfr: display-pipe@228200000 {
7275e795e520c7 Sasha Finkelstein 2025-02-17   452  			compatible = "apple,t8112-display-pipe", "apple,h7-display-pipe";
7275e795e520c7 Sasha Finkelstein 2025-02-17   453  			reg = <0x2 0x28200000 0x0 0xc000>,
7275e795e520c7 Sasha Finkelstein 2025-02-17   454  			      <0x2 0x28400000 0x0 0x4000>;
7275e795e520c7 Sasha Finkelstein 2025-02-17   455  			reg-names = "be", "fe";
7275e795e520c7 Sasha Finkelstein 2025-02-17   456  			power-domains = <&ps_dispdfr_fe>, <&ps_dispdfr_be>;
7275e795e520c7 Sasha Finkelstein 2025-02-17   457  			interrupt-parent = <&aic>;
7275e795e520c7 Sasha Finkelstein 2025-02-17   458  			interrupts = <AIC_IRQ 614 IRQ_TYPE_LEVEL_HIGH>,
7275e795e520c7 Sasha Finkelstein 2025-02-17   459  				     <AIC_IRQ 618 IRQ_TYPE_LEVEL_HIGH>;
7275e795e520c7 Sasha Finkelstein 2025-02-17   460  			interrupt-names = "be", "fe";
7275e795e520c7 Sasha Finkelstein 2025-02-17   461  			iommus = <&displaydfr_dart 0>;
7275e795e520c7 Sasha Finkelstein 2025-02-17   462  			status = "disabled";
7275e795e520c7 Sasha Finkelstein 2025-02-17   463  
7275e795e520c7 Sasha Finkelstein 2025-02-17   464  			port {
7275e795e520c7 Sasha Finkelstein 2025-02-17   465  				dfr_adp_out_mipi: endpoint {
7275e795e520c7 Sasha Finkelstein 2025-02-17   466  					remote-endpoint = <&dfr_mipi_in_adp>;
7275e795e520c7 Sasha Finkelstein 2025-02-17   467  				};
7275e795e520c7 Sasha Finkelstein 2025-02-17   468  			};
7275e795e520c7 Sasha Finkelstein 2025-02-17   469  		};
7275e795e520c7 Sasha Finkelstein 2025-02-17   470  
7275e795e520c7 Sasha Finkelstein 2025-02-17   471  		displaydfr_dart: iommu@228304000 {
7275e795e520c7 Sasha Finkelstein 2025-02-17   472  			compatible = "apple,t8110-dart";
7275e795e520c7 Sasha Finkelstein 2025-02-17   473  			reg = <0x2 0x28304000 0x0 0x4000>;
7275e795e520c7 Sasha Finkelstein 2025-02-17   474  			interrupt-parent = <&aic>;
7275e795e520c7 Sasha Finkelstein 2025-02-17   475  			interrupts = <AIC_IRQ 616 IRQ_TYPE_LEVEL_HIGH>;
7275e795e520c7 Sasha Finkelstein 2025-02-17   476  			#iommu-cells = <1>;
7275e795e520c7 Sasha Finkelstein 2025-02-17   477  			power-domains = <&ps_dispdfr_fe>;
7275e795e520c7 Sasha Finkelstein 2025-02-17   478  			status = "disabled";
7275e795e520c7 Sasha Finkelstein 2025-02-17   479  		};
7275e795e520c7 Sasha Finkelstein 2025-02-17   480  
7275e795e520c7 Sasha Finkelstein 2025-02-17   481  		displaydfr_mipi: dsi@228600000 {
7275e795e520c7 Sasha Finkelstein 2025-02-17   482  			compatible = "apple,t8112-display-pipe-mipi", "apple,h7-display-pipe-mipi";
7275e795e520c7 Sasha Finkelstein 2025-02-17   483  			reg = <0x2 0x28600000 0x0 0x100000>;
7275e795e520c7 Sasha Finkelstein 2025-02-17   484  			power-domains = <&ps_mipi_dsi>;
7275e795e520c7 Sasha Finkelstein 2025-02-17   485  			#address-cells = <1>;
7275e795e520c7 Sasha Finkelstein 2025-02-17   486  			#size-cells = <0>;
7275e795e520c7 Sasha Finkelstein 2025-02-17   487  			status = "disabled";
7275e795e520c7 Sasha Finkelstein 2025-02-17   488  
7275e795e520c7 Sasha Finkelstein 2025-02-17   489  			ports {
7275e795e520c7 Sasha Finkelstein 2025-02-17   490  				#address-cells = <1>;
7275e795e520c7 Sasha Finkelstein 2025-02-17   491  				#size-cells = <0>;
7275e795e520c7 Sasha Finkelstein 2025-02-17   492  
7275e795e520c7 Sasha Finkelstein 2025-02-17   493  				dfr_mipi_in: port@0 {
7275e795e520c7 Sasha Finkelstein 2025-02-17   494  					reg = <0>;
7275e795e520c7 Sasha Finkelstein 2025-02-17   495  					#address-cells = <1>;
7275e795e520c7 Sasha Finkelstein 2025-02-17   496  					#size-cells = <0>;
7275e795e520c7 Sasha Finkelstein 2025-02-17   497  
7275e795e520c7 Sasha Finkelstein 2025-02-17   498  					dfr_mipi_in_adp: endpoint@0 {
7275e795e520c7 Sasha Finkelstein 2025-02-17   499  						reg = <0>;
7275e795e520c7 Sasha Finkelstein 2025-02-17   500  						remote-endpoint = <&dfr_adp_out_mipi>;
7275e795e520c7 Sasha Finkelstein 2025-02-17   501  					};
7275e795e520c7 Sasha Finkelstein 2025-02-17   502  				};
7275e795e520c7 Sasha Finkelstein 2025-02-17   503  
7275e795e520c7 Sasha Finkelstein 2025-02-17   504  				dfr_mipi_out: port@1 {
7275e795e520c7 Sasha Finkelstein 2025-02-17   505  					reg = <1>;
7275e795e520c7 Sasha Finkelstein 2025-02-17   506  					#address-cells = <1>;
7275e795e520c7 Sasha Finkelstein 2025-02-17   507  					#size-cells = <0>;
7275e795e520c7 Sasha Finkelstein 2025-02-17   508  				};
7275e795e520c7 Sasha Finkelstein 2025-02-17   509  			};
7275e795e520c7 Sasha Finkelstein 2025-02-17   510  		};
7275e795e520c7 Sasha Finkelstein 2025-02-17   511  
2d5ce3fbef3242 Hector Martin     2023-03-07   512  		sio_dart: iommu@235004000 {
2d5ce3fbef3242 Hector Martin     2023-03-07   513  			compatible = "apple,t8110-dart";
2d5ce3fbef3242 Hector Martin     2023-03-07   514  			reg = <0x2 0x35004000 0x0 0x4000>;
2d5ce3fbef3242 Hector Martin     2023-03-07   515  			interrupt-parent = <&aic>;
2d5ce3fbef3242 Hector Martin     2023-03-07   516  			interrupts = <AIC_IRQ 769 IRQ_TYPE_LEVEL_HIGH>;
2d5ce3fbef3242 Hector Martin     2023-03-07   517  			#iommu-cells = <1>;
2d5ce3fbef3242 Hector Martin     2023-03-07   518  			power-domains = <&ps_sio_cpu>;
2d5ce3fbef3242 Hector Martin     2023-03-07   519  		};
2d5ce3fbef3242 Hector Martin     2023-03-07   520  
2d5ce3fbef3242 Hector Martin     2023-03-07   521  		i2c0: i2c@235010000 {
2d5ce3fbef3242 Hector Martin     2023-03-07   522  			compatible = "apple,t8112-i2c", "apple,i2c";
2d5ce3fbef3242 Hector Martin     2023-03-07   523  			reg = <0x2 0x35010000 0x0 0x4000>;
2d5ce3fbef3242 Hector Martin     2023-03-07   524  			clocks = <&clkref>;
2d5ce3fbef3242 Hector Martin     2023-03-07   525  			interrupt-parent = <&aic>;
2d5ce3fbef3242 Hector Martin     2023-03-07   526  			interrupts = <AIC_IRQ 761 IRQ_TYPE_LEVEL_HIGH>;
2d5ce3fbef3242 Hector Martin     2023-03-07   527  			pinctrl-0 = <&i2c0_pins>;
2d5ce3fbef3242 Hector Martin     2023-03-07   528  			pinctrl-names = "default";
2d5ce3fbef3242 Hector Martin     2023-03-07   529  			#address-cells = <0x1>;
2d5ce3fbef3242 Hector Martin     2023-03-07   530  			#size-cells = <0x0>;
2d5ce3fbef3242 Hector Martin     2023-03-07   531  			power-domains = <&ps_i2c0>;
2d5ce3fbef3242 Hector Martin     2023-03-07   532  			status = "disabled";
2d5ce3fbef3242 Hector Martin     2023-03-07   533  		};
2d5ce3fbef3242 Hector Martin     2023-03-07   534  
2d5ce3fbef3242 Hector Martin     2023-03-07   535  		i2c1: i2c@235014000 {
2d5ce3fbef3242 Hector Martin     2023-03-07   536  			compatible = "apple,t8112-i2c", "apple,i2c";
2d5ce3fbef3242 Hector Martin     2023-03-07   537  			reg = <0x2 0x35014000 0x0 0x4000>;
2d5ce3fbef3242 Hector Martin     2023-03-07   538  			clocks = <&clkref>;
2d5ce3fbef3242 Hector Martin     2023-03-07   539  			interrupt-parent = <&aic>;
2d5ce3fbef3242 Hector Martin     2023-03-07   540  			interrupts = <AIC_IRQ 762 IRQ_TYPE_LEVEL_HIGH>;
2d5ce3fbef3242 Hector Martin     2023-03-07   541  			pinctrl-0 = <&i2c1_pins>;
2d5ce3fbef3242 Hector Martin     2023-03-07   542  			pinctrl-names = "default";
2d5ce3fbef3242 Hector Martin     2023-03-07   543  			#address-cells = <0x1>;
2d5ce3fbef3242 Hector Martin     2023-03-07   544  			#size-cells = <0x0>;
2d5ce3fbef3242 Hector Martin     2023-03-07   545  			power-domains = <&ps_i2c1>;
2d5ce3fbef3242 Hector Martin     2023-03-07   546  			status = "disabled";
2d5ce3fbef3242 Hector Martin     2023-03-07   547  		};
2d5ce3fbef3242 Hector Martin     2023-03-07   548  
2d5ce3fbef3242 Hector Martin     2023-03-07   549  		i2c2: i2c@235018000 {
2d5ce3fbef3242 Hector Martin     2023-03-07   550  			compatible = "apple,t8112-i2c", "apple,i2c";
2d5ce3fbef3242 Hector Martin     2023-03-07   551  			reg = <0x2 0x35018000 0x0 0x4000>;
2d5ce3fbef3242 Hector Martin     2023-03-07   552  			clocks = <&clkref>;
2d5ce3fbef3242 Hector Martin     2023-03-07   553  			interrupt-parent = <&aic>;
2d5ce3fbef3242 Hector Martin     2023-03-07   554  			interrupts = <AIC_IRQ 763 IRQ_TYPE_LEVEL_HIGH>;
2d5ce3fbef3242 Hector Martin     2023-03-07   555  			pinctrl-0 = <&i2c2_pins>;
2d5ce3fbef3242 Hector Martin     2023-03-07   556  			pinctrl-names = "default";
2d5ce3fbef3242 Hector Martin     2023-03-07   557  			#address-cells = <0x1>;
2d5ce3fbef3242 Hector Martin     2023-03-07   558  			#size-cells = <0x0>;
2d5ce3fbef3242 Hector Martin     2023-03-07   559  			power-domains = <&ps_i2c2>;
2d5ce3fbef3242 Hector Martin     2023-03-07   560  			status = "disabled";
2d5ce3fbef3242 Hector Martin     2023-03-07   561  		};
2d5ce3fbef3242 Hector Martin     2023-03-07   562  
2d5ce3fbef3242 Hector Martin     2023-03-07   563  		i2c3: i2c@23501c000 {
2d5ce3fbef3242 Hector Martin     2023-03-07   564  			compatible = "apple,t8112-i2c", "apple,i2c";
2d5ce3fbef3242 Hector Martin     2023-03-07   565  			reg = <0x2 0x3501c000 0x0 0x4000>;
2d5ce3fbef3242 Hector Martin     2023-03-07   566  			clocks = <&clkref>;
2d5ce3fbef3242 Hector Martin     2023-03-07   567  			interrupt-parent = <&aic>;
2d5ce3fbef3242 Hector Martin     2023-03-07   568  			interrupts = <AIC_IRQ 764 IRQ_TYPE_LEVEL_HIGH>;
2d5ce3fbef3242 Hector Martin     2023-03-07   569  			pinctrl-0 = <&i2c3_pins>;
2d5ce3fbef3242 Hector Martin     2023-03-07   570  			pinctrl-names = "default";
2d5ce3fbef3242 Hector Martin     2023-03-07   571  			#address-cells = <0x1>;
2d5ce3fbef3242 Hector Martin     2023-03-07   572  			#size-cells = <0x0>;
2d5ce3fbef3242 Hector Martin     2023-03-07   573  			power-domains = <&ps_i2c3>;
2d5ce3fbef3242 Hector Martin     2023-03-07   574  			status = "disabled";
2d5ce3fbef3242 Hector Martin     2023-03-07   575  		};
2d5ce3fbef3242 Hector Martin     2023-03-07   576  
2d5ce3fbef3242 Hector Martin     2023-03-07   577  		i2c4: i2c@235020000 {
2d5ce3fbef3242 Hector Martin     2023-03-07   578  			compatible = "apple,t8112-i2c", "apple,i2c";
2d5ce3fbef3242 Hector Martin     2023-03-07   579  			reg = <0x2 0x35020000 0x0 0x4000>;
2d5ce3fbef3242 Hector Martin     2023-03-07   580  			clocks = <&clkref>;
2d5ce3fbef3242 Hector Martin     2023-03-07   581  			interrupt-parent = <&aic>;
2d5ce3fbef3242 Hector Martin     2023-03-07   582  			interrupts = <AIC_IRQ 765 IRQ_TYPE_LEVEL_HIGH>;
2d5ce3fbef3242 Hector Martin     2023-03-07   583  			pinctrl-0 = <&i2c4_pins>;
2d5ce3fbef3242 Hector Martin     2023-03-07   584  			pinctrl-names = "default";
2d5ce3fbef3242 Hector Martin     2023-03-07   585  			#address-cells = <0x1>;
2d5ce3fbef3242 Hector Martin     2023-03-07   586  			#size-cells = <0x0>;
2d5ce3fbef3242 Hector Martin     2023-03-07   587  			power-domains = <&ps_i2c4>;
2d5ce3fbef3242 Hector Martin     2023-03-07   588  			status = "disabled";
2d5ce3fbef3242 Hector Martin     2023-03-07   589  		};
2d5ce3fbef3242 Hector Martin     2023-03-07   590  
50aa09ac18fac9 Sasha Finkelstein 2023-04-09   591  		fpwm1: pwm@235044000 {
50aa09ac18fac9 Sasha Finkelstein 2023-04-09   592  			compatible = "apple,t8112-fpwm", "apple,s5l-fpwm";
50aa09ac18fac9 Sasha Finkelstein 2023-04-09   593  			reg = <0x2 0x35044000 0x0 0x4000>;
50aa09ac18fac9 Sasha Finkelstein 2023-04-09   594  			power-domains = <&ps_fpwm1>;
50aa09ac18fac9 Sasha Finkelstein 2023-04-09   595  			clocks = <&clkref>;
50aa09ac18fac9 Sasha Finkelstein 2023-04-09   596  			#pwm-cells = <2>;
50aa09ac18fac9 Sasha Finkelstein 2023-04-09   597  			status = "disabled";
50aa09ac18fac9 Sasha Finkelstein 2023-04-09   598  		};
50aa09ac18fac9 Sasha Finkelstein 2023-04-09   599  
0a6d561c7e46bf Janne Grunau      2024-12-03   600  		spi1: spi@235104000 {
0a6d561c7e46bf Janne Grunau      2024-12-03   601  			compatible = "apple,t8112-spi", "apple,spi";
0a6d561c7e46bf Janne Grunau      2024-12-03   602  			reg = <0x2 0x35104000 0x0 0x4000>;
0a6d561c7e46bf Janne Grunau      2024-12-03   603  			interrupt-parent = <&aic>;
0a6d561c7e46bf Janne Grunau      2024-12-03   604  			interrupts = <AIC_IRQ 749 IRQ_TYPE_LEVEL_HIGH>;
0a6d561c7e46bf Janne Grunau      2024-12-03   605  			clocks = <&clk_200m>;
0a6d561c7e46bf Janne Grunau      2024-12-03   606  			pinctrl-0 = <&spi1_pins>;
0a6d561c7e46bf Janne Grunau      2024-12-03   607  			pinctrl-names = "default";
0a6d561c7e46bf Janne Grunau      2024-12-03   608  			power-domains = <&ps_spi1>;
0a6d561c7e46bf Janne Grunau      2024-12-03   609  			#address-cells = <1>;
0a6d561c7e46bf Janne Grunau      2024-12-03   610  			#size-cells = <0>;
0a6d561c7e46bf Janne Grunau      2024-12-03   611  			status = "disabled";
0a6d561c7e46bf Janne Grunau      2024-12-03   612  		};
0a6d561c7e46bf Janne Grunau      2024-12-03   613  
0a6d561c7e46bf Janne Grunau      2024-12-03   614  		spi3: spi@23510c000 {
0a6d561c7e46bf Janne Grunau      2024-12-03   615  			compatible = "apple,t8112-spi", "apple,spi";
0a6d561c7e46bf Janne Grunau      2024-12-03   616  			reg = <0x2 0x3510c000 0x0 0x4000>;
0a6d561c7e46bf Janne Grunau      2024-12-03   617  			interrupt-parent = <&aic>;
0a6d561c7e46bf Janne Grunau      2024-12-03   618  			interrupts = <AIC_IRQ 751 IRQ_TYPE_LEVEL_HIGH>;
0a6d561c7e46bf Janne Grunau      2024-12-03   619  			clocks = <&clkref>;
0a6d561c7e46bf Janne Grunau      2024-12-03   620  			pinctrl-0 = <&spi3_pins>;
0a6d561c7e46bf Janne Grunau      2024-12-03   621  			pinctrl-names = "default";
0a6d561c7e46bf Janne Grunau      2024-12-03   622  			power-domains = <&ps_spi3>;
0a6d561c7e46bf Janne Grunau      2024-12-03   623  			#address-cells = <1>;
0a6d561c7e46bf Janne Grunau      2024-12-03   624  			#size-cells = <0>;
44db68dee1f772 Sasha Finkelstein 2025-02-25   625  			status = "disabled"; /* only used in J493 */
0a6d561c7e46bf Janne Grunau      2024-12-03   626  		};
0a6d561c7e46bf Janne Grunau      2024-12-03   627  
2d5ce3fbef3242 Hector Martin     2023-03-07   628  		serial0: serial@235200000 {
2d5ce3fbef3242 Hector Martin     2023-03-07   629  			compatible = "apple,s5l-uart";
2d5ce3fbef3242 Hector Martin     2023-03-07   630  			reg = <0x2 0x35200000 0x0 0x1000>;
2d5ce3fbef3242 Hector Martin     2023-03-07   631  			reg-io-width = <4>;
2d5ce3fbef3242 Hector Martin     2023-03-07   632  			interrupt-parent = <&aic>;
2d5ce3fbef3242 Hector Martin     2023-03-07   633  			interrupts = <AIC_IRQ 739 IRQ_TYPE_LEVEL_HIGH>;
2d5ce3fbef3242 Hector Martin     2023-03-07   634  			/*
2d5ce3fbef3242 Hector Martin     2023-03-07   635  			 * TODO: figure out the clocking properly, there may
2d5ce3fbef3242 Hector Martin     2023-03-07   636  			 * be a third selectable clock.
2d5ce3fbef3242 Hector Martin     2023-03-07   637  			 */
2d5ce3fbef3242 Hector Martin     2023-03-07   638  			clocks = <&clkref>, <&clkref>;
2d5ce3fbef3242 Hector Martin     2023-03-07   639  			clock-names = "uart", "clk_uart_baud0";
2d5ce3fbef3242 Hector Martin     2023-03-07   640  			power-domains = <&ps_uart0>;
2d5ce3fbef3242 Hector Martin     2023-03-07   641  			status = "disabled";
2d5ce3fbef3242 Hector Martin     2023-03-07   642  		};
2d5ce3fbef3242 Hector Martin     2023-03-07   643  
2d5ce3fbef3242 Hector Martin     2023-03-07   644  		serial2: serial@235208000 {
2d5ce3fbef3242 Hector Martin     2023-03-07   645  			compatible = "apple,s5l-uart";
2d5ce3fbef3242 Hector Martin     2023-03-07   646  			reg = <0x2 0x35208000 0x0 0x1000>;
2d5ce3fbef3242 Hector Martin     2023-03-07   647  			reg-io-width = <4>;
2d5ce3fbef3242 Hector Martin     2023-03-07   648  			interrupt-parent = <&aic>;
2d5ce3fbef3242 Hector Martin     2023-03-07   649  			interrupts = <AIC_IRQ 741 IRQ_TYPE_LEVEL_HIGH>;
2d5ce3fbef3242 Hector Martin     2023-03-07   650  			clocks = <&clkref>, <&clkref>;
2d5ce3fbef3242 Hector Martin     2023-03-07   651  			clock-names = "uart", "clk_uart_baud0";
2d5ce3fbef3242 Hector Martin     2023-03-07   652  			power-domains = <&ps_uart2>;
2d5ce3fbef3242 Hector Martin     2023-03-07   653  			status = "disabled";
2d5ce3fbef3242 Hector Martin     2023-03-07   654  		};
2d5ce3fbef3242 Hector Martin     2023-03-07   655  
2d5ce3fbef3242 Hector Martin     2023-03-07   656  		admac: dma-controller@238200000 {
2d5ce3fbef3242 Hector Martin     2023-03-07   657  			compatible = "apple,t8112-admac", "apple,admac";
2d5ce3fbef3242 Hector Martin     2023-03-07   658  			reg = <0x2 0x38200000 0x0 0x34000>;
2d5ce3fbef3242 Hector Martin     2023-03-07   659  			dma-channels = <24>;
2d5ce3fbef3242 Hector Martin     2023-03-07   660  			interrupts-extended = <0>,
2d5ce3fbef3242 Hector Martin     2023-03-07   661  					      <&aic AIC_IRQ 760 IRQ_TYPE_LEVEL_HIGH>,
2d5ce3fbef3242 Hector Martin     2023-03-07   662  					      <0>,
2d5ce3fbef3242 Hector Martin     2023-03-07   663  					      <0>;
2d5ce3fbef3242 Hector Martin     2023-03-07   664  			#dma-cells = <1>;
2d5ce3fbef3242 Hector Martin     2023-03-07   665  			iommus = <&sio_dart 2>;
2d5ce3fbef3242 Hector Martin     2023-03-07   666  			power-domains = <&ps_sio_adma>;
2d5ce3fbef3242 Hector Martin     2023-03-07   667  			resets = <&ps_audio_p>;
2d5ce3fbef3242 Hector Martin     2023-03-07   668  		};
2d5ce3fbef3242 Hector Martin     2023-03-07   669  
2d5ce3fbef3242 Hector Martin     2023-03-07   670  		mca: i2s@238400000 {
2d5ce3fbef3242 Hector Martin     2023-03-07   671  			compatible = "apple,t8112-mca", "apple,mca";
2d5ce3fbef3242 Hector Martin     2023-03-07   672  			reg = <0x2 0x38400000 0x0 0x18000>,
2d5ce3fbef3242 Hector Martin     2023-03-07   673  			      <0x2 0x38300000 0x0 0x30000>;
2d5ce3fbef3242 Hector Martin     2023-03-07   674  
2d5ce3fbef3242 Hector Martin     2023-03-07   675  			interrupt-parent = <&aic>;
2d5ce3fbef3242 Hector Martin     2023-03-07   676  			interrupts = <AIC_IRQ 753 IRQ_TYPE_LEVEL_HIGH>,
2d5ce3fbef3242 Hector Martin     2023-03-07   677  				     <AIC_IRQ 754 IRQ_TYPE_LEVEL_HIGH>,
2d5ce3fbef3242 Hector Martin     2023-03-07   678  				     <AIC_IRQ 755 IRQ_TYPE_LEVEL_HIGH>,
2d5ce3fbef3242 Hector Martin     2023-03-07   679  				     <AIC_IRQ 756 IRQ_TYPE_LEVEL_HIGH>,
2d5ce3fbef3242 Hector Martin     2023-03-07   680  				     <AIC_IRQ 757 IRQ_TYPE_LEVEL_HIGH>,
2d5ce3fbef3242 Hector Martin     2023-03-07   681  				     <AIC_IRQ 758 IRQ_TYPE_LEVEL_HIGH>;
2d5ce3fbef3242 Hector Martin     2023-03-07   682  
2d5ce3fbef3242 Hector Martin     2023-03-07   683  			resets = <&ps_audio_p>;
2d5ce3fbef3242 Hector Martin     2023-03-07   684  			clocks = <&nco 0>, <&nco 1>, <&nco 2>,
2d5ce3fbef3242 Hector Martin     2023-03-07   685  				 <&nco 3>, <&nco 4>, <&nco 4>;
2d5ce3fbef3242 Hector Martin     2023-03-07   686  			power-domains = <&ps_audio_p>, <&ps_mca0>, <&ps_mca1>,
2d5ce3fbef3242 Hector Martin     2023-03-07   687  					<&ps_mca2>, <&ps_mca3>, <&ps_mca4>, <&ps_mca5>;
2d5ce3fbef3242 Hector Martin     2023-03-07   688  			dmas = <&admac 0>, <&admac 1>, <&admac 2>, <&admac 3>,
2d5ce3fbef3242 Hector Martin     2023-03-07   689  			       <&admac 4>, <&admac 5>, <&admac 6>, <&admac 7>,
2d5ce3fbef3242 Hector Martin     2023-03-07   690  			       <&admac 8>, <&admac 9>, <&admac 10>, <&admac 11>,
2d5ce3fbef3242 Hector Martin     2023-03-07   691  			       <&admac 12>, <&admac 13>, <&admac 14>, <&admac 15>,
2d5ce3fbef3242 Hector Martin     2023-03-07   692  			       <&admac 16>, <&admac 17>, <&admac 18>, <&admac 19>,
2d5ce3fbef3242 Hector Martin     2023-03-07   693  			       <&admac 20>, <&admac 21>, <&admac 22>, <&admac 23>;
2d5ce3fbef3242 Hector Martin     2023-03-07   694  			dma-names = "tx0a", "rx0a", "tx0b", "rx0b",
2d5ce3fbef3242 Hector Martin     2023-03-07   695  				    "tx1a", "rx1a", "tx1b", "rx1b",
2d5ce3fbef3242 Hector Martin     2023-03-07   696  				    "tx2a", "rx2a", "tx2b", "rx2b",
2d5ce3fbef3242 Hector Martin     2023-03-07   697  				    "tx3a", "rx3a", "tx3b", "rx3b",
2d5ce3fbef3242 Hector Martin     2023-03-07   698  				    "tx4a", "rx4a", "tx4b", "rx4b",
2d5ce3fbef3242 Hector Martin     2023-03-07   699  				    "tx5a", "rx5a", "tx5b", "rx5b";
2d5ce3fbef3242 Hector Martin     2023-03-07   700  
2d5ce3fbef3242 Hector Martin     2023-03-07   701  			#sound-dai-cells = <1>;
2d5ce3fbef3242 Hector Martin     2023-03-07   702  		};
2d5ce3fbef3242 Hector Martin     2023-03-07   703  
2d5ce3fbef3242 Hector Martin     2023-03-07   704  		nco: clock-controller@23b044000 {
2d5ce3fbef3242 Hector Martin     2023-03-07   705  			compatible = "apple,t8112-nco", "apple,nco";
2d5ce3fbef3242 Hector Martin     2023-03-07   706  			reg = <0x2 0x3b044000 0x0 0x14000>;
2d5ce3fbef3242 Hector Martin     2023-03-07   707  			clocks = <&nco_clkref>;
2d5ce3fbef3242 Hector Martin     2023-03-07   708  			#clock-cells = <1>;
2d5ce3fbef3242 Hector Martin     2023-03-07   709  		};
2d5ce3fbef3242 Hector Martin     2023-03-07   710  
2d5ce3fbef3242 Hector Martin     2023-03-07   711  		aic: interrupt-controller@23b0c0000 {
2d5ce3fbef3242 Hector Martin     2023-03-07   712  			compatible = "apple,t8112-aic", "apple,aic2";
2d5ce3fbef3242 Hector Martin     2023-03-07   713  			#interrupt-cells = <3>;
2d5ce3fbef3242 Hector Martin     2023-03-07   714  			interrupt-controller;
2d5ce3fbef3242 Hector Martin     2023-03-07   715  			reg = <0x2 0x3b0c0000 0x0 0x8000>,
2d5ce3fbef3242 Hector Martin     2023-03-07   716  				<0x2 0x3b0c8000 0x0 0x4>;
2d5ce3fbef3242 Hector Martin     2023-03-07   717  			reg-names = "core", "event";
2d5ce3fbef3242 Hector Martin     2023-03-07   718  			power-domains = <&ps_aic>;
2d5ce3fbef3242 Hector Martin     2023-03-07   719  
2d5ce3fbef3242 Hector Martin     2023-03-07   720  			affinities {
2d5ce3fbef3242 Hector Martin     2023-03-07   721  				e-core-pmu-affinity {
2d5ce3fbef3242 Hector Martin     2023-03-07   722  					apple,fiq-index = <AIC_CPU_PMU_E>;
2d5ce3fbef3242 Hector Martin     2023-03-07   723  					cpus = <&cpu_e0 &cpu_e1 &cpu_e2 &cpu_e3>;
2d5ce3fbef3242 Hector Martin     2023-03-07   724  				};
2d5ce3fbef3242 Hector Martin     2023-03-07   725  
2d5ce3fbef3242 Hector Martin     2023-03-07   726  				p-core-pmu-affinity {
2d5ce3fbef3242 Hector Martin     2023-03-07   727  					apple,fiq-index = <AIC_CPU_PMU_P>;
2d5ce3fbef3242 Hector Martin     2023-03-07   728  					cpus = <&cpu_p0 &cpu_p1 &cpu_p2 &cpu_p3>;
2d5ce3fbef3242 Hector Martin     2023-03-07   729  				};
2d5ce3fbef3242 Hector Martin     2023-03-07   730  			};
2d5ce3fbef3242 Hector Martin     2023-03-07   731  		};
2d5ce3fbef3242 Hector Martin     2023-03-07   732  
2d5ce3fbef3242 Hector Martin     2023-03-07   733  		pmgr: power-management@23b700000 {
2d5ce3fbef3242 Hector Martin     2023-03-07   734  			compatible = "apple,t8112-pmgr", "apple,pmgr", "syscon", "simple-mfd";
2d5ce3fbef3242 Hector Martin     2023-03-07   735  			#address-cells = <1>;
2d5ce3fbef3242 Hector Martin     2023-03-07   736  			#size-cells = <1>;
2d5ce3fbef3242 Hector Martin     2023-03-07   737  			reg = <0x2 0x3b700000 0 0x14000>;
2d5ce3fbef3242 Hector Martin     2023-03-07   738  			/* child nodes are added in t8103-pmgr.dtsi */
2d5ce3fbef3242 Hector Martin     2023-03-07   739  		};
2d5ce3fbef3242 Hector Martin     2023-03-07   740  
2d5ce3fbef3242 Hector Martin     2023-03-07   741  		pinctrl_ap: pinctrl@23c100000 {
2d5ce3fbef3242 Hector Martin     2023-03-07   742  			compatible = "apple,t8112-pinctrl", "apple,pinctrl";
2d5ce3fbef3242 Hector Martin     2023-03-07   743  			reg = <0x2 0x3c100000 0x0 0x100000>;
2d5ce3fbef3242 Hector Martin     2023-03-07   744  			power-domains = <&ps_gpio>;
2d5ce3fbef3242 Hector Martin     2023-03-07   745  
2d5ce3fbef3242 Hector Martin     2023-03-07   746  			gpio-controller;
2d5ce3fbef3242 Hector Martin     2023-03-07   747  			#gpio-cells = <2>;
2d5ce3fbef3242 Hector Martin     2023-03-07   748  			gpio-ranges = <&pinctrl_ap 0 0 213>;
2d5ce3fbef3242 Hector Martin     2023-03-07   749  			apple,npins = <213>;
2d5ce3fbef3242 Hector Martin     2023-03-07   750  
2d5ce3fbef3242 Hector Martin     2023-03-07   751  			interrupt-controller;
2d5ce3fbef3242 Hector Martin     2023-03-07   752  			#interrupt-cells = <2>;
2d5ce3fbef3242 Hector Martin     2023-03-07   753  			interrupt-parent = <&aic>;
2d5ce3fbef3242 Hector Martin     2023-03-07   754  			interrupts = <AIC_IRQ 199 IRQ_TYPE_LEVEL_HIGH>,
2d5ce3fbef3242 Hector Martin     2023-03-07   755  				     <AIC_IRQ 200 IRQ_TYPE_LEVEL_HIGH>,
2d5ce3fbef3242 Hector Martin     2023-03-07   756  				     <AIC_IRQ 201 IRQ_TYPE_LEVEL_HIGH>,
2d5ce3fbef3242 Hector Martin     2023-03-07   757  				     <AIC_IRQ 202 IRQ_TYPE_LEVEL_HIGH>,
2d5ce3fbef3242 Hector Martin     2023-03-07   758  				     <AIC_IRQ 203 IRQ_TYPE_LEVEL_HIGH>,
2d5ce3fbef3242 Hector Martin     2023-03-07   759  				     <AIC_IRQ 204 IRQ_TYPE_LEVEL_HIGH>,
2d5ce3fbef3242 Hector Martin     2023-03-07   760  				     <AIC_IRQ 205 IRQ_TYPE_LEVEL_HIGH>;
2d5ce3fbef3242 Hector Martin     2023-03-07   761  
2d5ce3fbef3242 Hector Martin     2023-03-07   762  			i2c0_pins: i2c0-pins {
2d5ce3fbef3242 Hector Martin     2023-03-07   763  				pinmux = <APPLE_PINMUX(111, 1)>,
2d5ce3fbef3242 Hector Martin     2023-03-07   764  					 <APPLE_PINMUX(110, 1)>;
2d5ce3fbef3242 Hector Martin     2023-03-07   765  			};
2d5ce3fbef3242 Hector Martin     2023-03-07   766  
2d5ce3fbef3242 Hector Martin     2023-03-07   767  			i2c1_pins: i2c1-pins {
2d5ce3fbef3242 Hector Martin     2023-03-07   768  				pinmux = <APPLE_PINMUX(113, 1)>,
2d5ce3fbef3242 Hector Martin     2023-03-07   769  					 <APPLE_PINMUX(112, 1)>;
2d5ce3fbef3242 Hector Martin     2023-03-07   770  			};
2d5ce3fbef3242 Hector Martin     2023-03-07   771  
2d5ce3fbef3242 Hector Martin     2023-03-07   772  			i2c2_pins: i2c2-pins {
2d5ce3fbef3242 Hector Martin     2023-03-07   773  				pinmux = <APPLE_PINMUX(87, 1)>,
2d5ce3fbef3242 Hector Martin     2023-03-07   774  					 <APPLE_PINMUX(86, 1)>;
2d5ce3fbef3242 Hector Martin     2023-03-07   775  			};
2d5ce3fbef3242 Hector Martin     2023-03-07   776  
2d5ce3fbef3242 Hector Martin     2023-03-07   777  			i2c3_pins: i2c3-pins {
2d5ce3fbef3242 Hector Martin     2023-03-07   778  				pinmux = <APPLE_PINMUX(54, 1)>,
2d5ce3fbef3242 Hector Martin     2023-03-07   779  					 <APPLE_PINMUX(53, 1)>;
2d5ce3fbef3242 Hector Martin     2023-03-07   780  			};
2d5ce3fbef3242 Hector Martin     2023-03-07   781  
2d5ce3fbef3242 Hector Martin     2023-03-07   782  			i2c4_pins: i2c4-pins {
2d5ce3fbef3242 Hector Martin     2023-03-07   783  				pinmux = <APPLE_PINMUX(131, 1)>,
2d5ce3fbef3242 Hector Martin     2023-03-07   784  					 <APPLE_PINMUX(130, 1)>;
2d5ce3fbef3242 Hector Martin     2023-03-07   785  			};
2d5ce3fbef3242 Hector Martin     2023-03-07   786  
0a6d561c7e46bf Janne Grunau      2024-12-03   787  			spi1_pins: spi1-pins {
2d5ce3fbef3242 Hector Martin     2023-03-07   788  				pinmux = <APPLE_PINMUX(46, 1)>,
2d5ce3fbef3242 Hector Martin     2023-03-07   789  					<APPLE_PINMUX(47, 1)>,
2d5ce3fbef3242 Hector Martin     2023-03-07   790  					<APPLE_PINMUX(48, 1)>,
2d5ce3fbef3242 Hector Martin     2023-03-07   791  					<APPLE_PINMUX(49, 1)>;
2d5ce3fbef3242 Hector Martin     2023-03-07   792  			};
2d5ce3fbef3242 Hector Martin     2023-03-07   793  
0a6d561c7e46bf Janne Grunau      2024-12-03   794  			spi3_pins: spi3-pins {
0a6d561c7e46bf Janne Grunau      2024-12-03   795  				pinmux = <APPLE_PINMUX(93, 1)>,
0a6d561c7e46bf Janne Grunau      2024-12-03   796  					<APPLE_PINMUX(94, 1)>,
0a6d561c7e46bf Janne Grunau      2024-12-03   797  					<APPLE_PINMUX(95, 1)>,
0a6d561c7e46bf Janne Grunau      2024-12-03   798  					<APPLE_PINMUX(96, 1)>;
0a6d561c7e46bf Janne Grunau      2024-12-03   799  			};
0a6d561c7e46bf Janne Grunau      2024-12-03   800  
2d5ce3fbef3242 Hector Martin     2023-03-07   801  			pcie_pins: pcie-pins {
2d5ce3fbef3242 Hector Martin     2023-03-07   802  				pinmux = <APPLE_PINMUX(162, 1)>,
2d5ce3fbef3242 Hector Martin     2023-03-07   803  					 <APPLE_PINMUX(163, 1)>,
2d5ce3fbef3242 Hector Martin     2023-03-07   804  					 <APPLE_PINMUX(164, 1)>;
2d5ce3fbef3242 Hector Martin     2023-03-07   805  				// TODO: 1 more CLKREQs
2d5ce3fbef3242 Hector Martin     2023-03-07   806  			};
2d5ce3fbef3242 Hector Martin     2023-03-07   807  		};
2d5ce3fbef3242 Hector Martin     2023-03-07   808  
2d5ce3fbef3242 Hector Martin     2023-03-07   809  		pinctrl_nub: pinctrl@23d1f0000 {
2d5ce3fbef3242 Hector Martin     2023-03-07   810  			compatible = "apple,t8112-pinctrl", "apple,pinctrl";
2d5ce3fbef3242 Hector Martin     2023-03-07   811  			reg = <0x2 0x3d1f0000 0x0 0x4000>;
2d5ce3fbef3242 Hector Martin     2023-03-07   812  			power-domains = <&ps_nub_gpio>;
2d5ce3fbef3242 Hector Martin     2023-03-07   813  
2d5ce3fbef3242 Hector Martin     2023-03-07   814  			gpio-controller;
2d5ce3fbef3242 Hector Martin     2023-03-07   815  			#gpio-cells = <2>;
2d5ce3fbef3242 Hector Martin     2023-03-07   816  			gpio-ranges = <&pinctrl_nub 0 0 24>;
2d5ce3fbef3242 Hector Martin     2023-03-07   817  			apple,npins = <24>;
2d5ce3fbef3242 Hector Martin     2023-03-07   818  
2d5ce3fbef3242 Hector Martin     2023-03-07   819  			interrupt-controller;
2d5ce3fbef3242 Hector Martin     2023-03-07   820  			#interrupt-cells = <2>;
2d5ce3fbef3242 Hector Martin     2023-03-07   821  			interrupt-parent = <&aic>;
2d5ce3fbef3242 Hector Martin     2023-03-07   822  			interrupts = <AIC_IRQ 371 IRQ_TYPE_LEVEL_HIGH>,
2d5ce3fbef3242 Hector Martin     2023-03-07   823  				     <AIC_IRQ 372 IRQ_TYPE_LEVEL_HIGH>,
2d5ce3fbef3242 Hector Martin     2023-03-07   824  				     <AIC_IRQ 373 IRQ_TYPE_LEVEL_HIGH>,
2d5ce3fbef3242 Hector Martin     2023-03-07   825  				     <AIC_IRQ 374 IRQ_TYPE_LEVEL_HIGH>,
2d5ce3fbef3242 Hector Martin     2023-03-07   826  				     <AIC_IRQ 375 IRQ_TYPE_LEVEL_HIGH>,
2d5ce3fbef3242 Hector Martin     2023-03-07   827  				     <AIC_IRQ 376 IRQ_TYPE_LEVEL_HIGH>,
2d5ce3fbef3242 Hector Martin     2023-03-07   828  				     <AIC_IRQ 377 IRQ_TYPE_LEVEL_HIGH>;
2d5ce3fbef3242 Hector Martin     2023-03-07   829  		};
2d5ce3fbef3242 Hector Martin     2023-03-07   830  
2d5ce3fbef3242 Hector Martin     2023-03-07   831  		pmgr_mini: power-management@23d280000 {
2d5ce3fbef3242 Hector Martin     2023-03-07   832  			compatible = "apple,t8112-pmgr", "apple,pmgr", "syscon", "simple-mfd";
2d5ce3fbef3242 Hector Martin     2023-03-07   833  			#address-cells = <1>;
2d5ce3fbef3242 Hector Martin     2023-03-07   834  			#size-cells = <1>;
2d5ce3fbef3242 Hector Martin     2023-03-07   835  			reg = <0x2 0x3d280000 0 0x4000>;
2d5ce3fbef3242 Hector Martin     2023-03-07   836  			/* child nodes are added in t8103-pmgr.dtsi */
2d5ce3fbef3242 Hector Martin     2023-03-07   837  		};
2d5ce3fbef3242 Hector Martin     2023-03-07   838  
2d5ce3fbef3242 Hector Martin     2023-03-07   839  		wdt: watchdog@23d2b0000 {
2d5ce3fbef3242 Hector Martin     2023-03-07   840  			compatible = "apple,t8112-wdt", "apple,wdt";
2d5ce3fbef3242 Hector Martin     2023-03-07   841  			reg = <0x2 0x3d2b0000 0x0 0x4000>;
2d5ce3fbef3242 Hector Martin     2023-03-07   842  			clocks = <&clkref>;
2d5ce3fbef3242 Hector Martin     2023-03-07   843  			interrupt-parent = <&aic>;
2d5ce3fbef3242 Hector Martin     2023-03-07   844  			interrupts = <AIC_IRQ 379 IRQ_TYPE_LEVEL_HIGH>;
2d5ce3fbef3242 Hector Martin     2023-03-07   845  		};
2d5ce3fbef3242 Hector Martin     2023-03-07   846  
2e0e70c9507717 Sasha Finkelstein 2025-04-09   847  		nub_spmi: spmi@23d714000 {
2e0e70c9507717 Sasha Finkelstein 2025-04-09   848  			compatible = "apple,t8112-spmi", "apple,spmi";
2e0e70c9507717 Sasha Finkelstein 2025-04-09   849  			reg = <0x2 0x3d714000 0x0 0x100>;
2e0e70c9507717 Sasha Finkelstein 2025-04-09   850  			#address-cells = <2>;
2e0e70c9507717 Sasha Finkelstein 2025-04-09   851  			#size-cells = <0>;
d8bf82081c9e5a Hector Martin     2025-04-23   852  
d8bf82081c9e5a Hector Martin     2025-04-23   853  			pmic1: pmic@e {
d8bf82081c9e5a Hector Martin     2025-04-23   854  				compatible = "apple,stowe-pmic", "apple,spmi-nvmem";
d8bf82081c9e5a Hector Martin     2025-04-23   855  				reg = <0xe SPMI_USID>;
d8bf82081c9e5a Hector Martin     2025-04-23   856  
d8bf82081c9e5a Hector Martin     2025-04-23   857  				nvmem-layout {
d8bf82081c9e5a Hector Martin     2025-04-23   858  					compatible = "fixed-layout";
d8bf82081c9e5a Hector Martin     2025-04-23   859  					#address-cells = <1>;
d8bf82081c9e5a Hector Martin     2025-04-23   860  					#size-cells = <1>;
d8bf82081c9e5a Hector Martin     2025-04-23   861  
d8bf82081c9e5a Hector Martin     2025-04-23   862  					fault_shadow: fault-shadow@867b {
d8bf82081c9e5a Hector Martin     2025-04-23   863  						reg = <0x867b 0x10>;
d8bf82081c9e5a Hector Martin     2025-04-23   864  					};
d8bf82081c9e5a Hector Martin     2025-04-23   865  
d8bf82081c9e5a Hector Martin     2025-04-23   866  					socd: socd@8b00 {
d8bf82081c9e5a Hector Martin     2025-04-23   867  						reg = <0x8b00 0x400>;
d8bf82081c9e5a Hector Martin     2025-04-23   868  					};
d8bf82081c9e5a Hector Martin     2025-04-23   869  
d8bf82081c9e5a Hector Martin     2025-04-23   870  					boot_stage: boot-stage@f701 {
d8bf82081c9e5a Hector Martin     2025-04-23   871  						reg = <0xf701 0x1>;
d8bf82081c9e5a Hector Martin     2025-04-23   872  					};
d8bf82081c9e5a Hector Martin     2025-04-23   873  
d8bf82081c9e5a Hector Martin     2025-04-23   874  					boot_error_count: boot-error-count@f702 {
d8bf82081c9e5a Hector Martin     2025-04-23   875  						reg = <0xf702 0x1>;
d8bf82081c9e5a Hector Martin     2025-04-23   876  						bits = <0 4>;
d8bf82081c9e5a Hector Martin     2025-04-23   877  					};
d8bf82081c9e5a Hector Martin     2025-04-23   878  
d8bf82081c9e5a Hector Martin     2025-04-23   879  					panic_count: panic-count@f702 {
d8bf82081c9e5a Hector Martin     2025-04-23   880  						reg = <0xf702 0x1>;
d8bf82081c9e5a Hector Martin     2025-04-23   881  						bits = <4 4>;
d8bf82081c9e5a Hector Martin     2025-04-23   882  					};
d8bf82081c9e5a Hector Martin     2025-04-23   883  
d8bf82081c9e5a Hector Martin     2025-04-23   884  					boot_error_stage: boot-error-stage@f703 {
d8bf82081c9e5a Hector Martin     2025-04-23   885  						reg = <0xf703 0x1>;
d8bf82081c9e5a Hector Martin     2025-04-23   886  					};
d8bf82081c9e5a Hector Martin     2025-04-23   887  
d8bf82081c9e5a Hector Martin     2025-04-23   888  					shutdown_flag: shutdown-flag@f70f {
d8bf82081c9e5a Hector Martin     2025-04-23   889  						reg = <0xf70f 0x1>;
d8bf82081c9e5a Hector Martin     2025-04-23   890  						bits = <3 1>;
d8bf82081c9e5a Hector Martin     2025-04-23   891  					};
d8bf82081c9e5a Hector Martin     2025-04-23   892  
d8bf82081c9e5a Hector Martin     2025-04-23   893  					pm_setting: pm-setting@f801 {
d8bf82081c9e5a Hector Martin     2025-04-23   894  						reg = <0xf801 0x1>;
d8bf82081c9e5a Hector Martin     2025-04-23   895  					};
d8bf82081c9e5a Hector Martin     2025-04-23   896  
d8bf82081c9e5a Hector Martin     2025-04-23   897  					rtc_offset: rtc-offset@f900 {
d8bf82081c9e5a Hector Martin     2025-04-23   898  						reg = <0xf900 0x6>;
d8bf82081c9e5a Hector Martin     2025-04-23   899  					};
d8bf82081c9e5a Hector Martin     2025-04-23   900  				};
d8bf82081c9e5a Hector Martin     2025-04-23   901  			};
2e0e70c9507717 Sasha Finkelstein 2025-04-09   902  		};
2e0e70c9507717 Sasha Finkelstein 2025-04-09   903  
2d5ce3fbef3242 Hector Martin     2023-03-07   904  		pinctrl_smc: pinctrl@23e820000 {
2d5ce3fbef3242 Hector Martin     2023-03-07   905  			compatible = "apple,t8112-pinctrl", "apple,pinctrl";
2d5ce3fbef3242 Hector Martin     2023-03-07   906  			reg = <0x2 0x3e820000 0x0 0x4000>;
2d5ce3fbef3242 Hector Martin     2023-03-07   907  
2d5ce3fbef3242 Hector Martin     2023-03-07   908  			gpio-controller;
2d5ce3fbef3242 Hector Martin     2023-03-07   909  			#gpio-cells = <2>;
2d5ce3fbef3242 Hector Martin     2023-03-07   910  			gpio-ranges = <&pinctrl_smc 0 0 18>;
2d5ce3fbef3242 Hector Martin     2023-03-07   911  			apple,npins = <18>;
2d5ce3fbef3242 Hector Martin     2023-03-07   912  
2d5ce3fbef3242 Hector Martin     2023-03-07   913  			interrupt-controller;
2d5ce3fbef3242 Hector Martin     2023-03-07   914  			#interrupt-cells = <2>;
2d5ce3fbef3242 Hector Martin     2023-03-07   915  			interrupt-parent = <&aic>;
2d5ce3fbef3242 Hector Martin     2023-03-07   916  			interrupts = <AIC_IRQ 490 IRQ_TYPE_LEVEL_HIGH>,
2d5ce3fbef3242 Hector Martin     2023-03-07   917  				     <AIC_IRQ 491 IRQ_TYPE_LEVEL_HIGH>,
2d5ce3fbef3242 Hector Martin     2023-03-07   918  				     <AIC_IRQ 492 IRQ_TYPE_LEVEL_HIGH>,
2d5ce3fbef3242 Hector Martin     2023-03-07   919  				     <AIC_IRQ 493 IRQ_TYPE_LEVEL_HIGH>,
2d5ce3fbef3242 Hector Martin     2023-03-07   920  				     <AIC_IRQ 494 IRQ_TYPE_LEVEL_HIGH>,
2d5ce3fbef3242 Hector Martin     2023-03-07   921  				     <AIC_IRQ 495 IRQ_TYPE_LEVEL_HIGH>,
2d5ce3fbef3242 Hector Martin     2023-03-07   922  				     <AIC_IRQ 496 IRQ_TYPE_LEVEL_HIGH>;
2d5ce3fbef3242 Hector Martin     2023-03-07   923  		};
2d5ce3fbef3242 Hector Martin     2023-03-07   924  
2d5ce3fbef3242 Hector Martin     2023-03-07   925  		pinctrl_aop: pinctrl@24a820000 {
2d5ce3fbef3242 Hector Martin     2023-03-07   926  			compatible = "apple,t8112-pinctrl", "apple,pinctrl";
2d5ce3fbef3242 Hector Martin     2023-03-07   927  			reg = <0x2 0x4a820000 0x0 0x4000>;
2d5ce3fbef3242 Hector Martin     2023-03-07   928  
2d5ce3fbef3242 Hector Martin     2023-03-07   929  			gpio-controller;
2d5ce3fbef3242 Hector Martin     2023-03-07   930  			#gpio-cells = <2>;
2d5ce3fbef3242 Hector Martin     2023-03-07   931  			gpio-ranges = <&pinctrl_aop 0 0 54>;
2d5ce3fbef3242 Hector Martin     2023-03-07   932  			apple,npins = <54>;
2d5ce3fbef3242 Hector Martin     2023-03-07   933  
2d5ce3fbef3242 Hector Martin     2023-03-07   934  			interrupt-controller;
2d5ce3fbef3242 Hector Martin     2023-03-07   935  			#interrupt-cells = <2>;
2d5ce3fbef3242 Hector Martin     2023-03-07   936  			interrupt-parent = <&aic>;
2d5ce3fbef3242 Hector Martin     2023-03-07   937  			interrupts = <AIC_IRQ 301 IRQ_TYPE_LEVEL_HIGH>,
2d5ce3fbef3242 Hector Martin     2023-03-07   938  				     <AIC_IRQ 302 IRQ_TYPE_LEVEL_HIGH>,
2d5ce3fbef3242 Hector Martin     2023-03-07   939  				     <AIC_IRQ 303 IRQ_TYPE_LEVEL_HIGH>,
2d5ce3fbef3242 Hector Martin     2023-03-07   940  				     <AIC_IRQ 304 IRQ_TYPE_LEVEL_HIGH>,
2d5ce3fbef3242 Hector Martin     2023-03-07   941  				     <AIC_IRQ 305 IRQ_TYPE_LEVEL_HIGH>,
2d5ce3fbef3242 Hector Martin     2023-03-07   942  				     <AIC_IRQ 306 IRQ_TYPE_LEVEL_HIGH>,
2d5ce3fbef3242 Hector Martin     2023-03-07   943  				     <AIC_IRQ 307 IRQ_TYPE_LEVEL_HIGH>;
2d5ce3fbef3242 Hector Martin     2023-03-07   944  		};
2d5ce3fbef3242 Hector Martin     2023-03-07   945  
2d5ce3fbef3242 Hector Martin     2023-03-07   946  		ans_mbox: mbox@277408000 {
2d5ce3fbef3242 Hector Martin     2023-03-07   947  			compatible = "apple,t8112-asc-mailbox", "apple,asc-mailbox-v4";
2d5ce3fbef3242 Hector Martin     2023-03-07   948  			reg = <0x2 0x77408000 0x0 0x4000>;
2d5ce3fbef3242 Hector Martin     2023-03-07   949  			interrupt-parent = <&aic>;
2d5ce3fbef3242 Hector Martin     2023-03-07   950  			interrupts = <AIC_IRQ 717 IRQ_TYPE_LEVEL_HIGH>,
2d5ce3fbef3242 Hector Martin     2023-03-07   951  				<AIC_IRQ 718 IRQ_TYPE_LEVEL_HIGH>,
2d5ce3fbef3242 Hector Martin     2023-03-07   952  				<AIC_IRQ 719 IRQ_TYPE_LEVEL_HIGH>,
2d5ce3fbef3242 Hector Martin     2023-03-07   953  				<AIC_IRQ 720 IRQ_TYPE_LEVEL_HIGH>;
2d5ce3fbef3242 Hector Martin     2023-03-07   954  			interrupt-names = "send-empty", "send-not-empty",
2d5ce3fbef3242 Hector Martin     2023-03-07   955  				"recv-empty", "recv-not-empty";
2d5ce3fbef3242 Hector Martin     2023-03-07   956  			#mbox-cells = <0>;
2d5ce3fbef3242 Hector Martin     2023-03-07   957  			power-domains = <&ps_ans>;
2d5ce3fbef3242 Hector Martin     2023-03-07   958  		};
2d5ce3fbef3242 Hector Martin     2023-03-07   959  
2d5ce3fbef3242 Hector Martin     2023-03-07   960  		sart: sart@27bc50000 {
2d5ce3fbef3242 Hector Martin     2023-03-07   961  			compatible = "apple,t8112-sart", "apple,t6000-sart";
2d5ce3fbef3242 Hector Martin     2023-03-07   962  			reg = <0x2 0x7bc50000 0x0 0x10000>;
2d5ce3fbef3242 Hector Martin     2023-03-07   963  			power-domains = <&ps_ans>;
2d5ce3fbef3242 Hector Martin     2023-03-07   964  		};
2d5ce3fbef3242 Hector Martin     2023-03-07   965  
2d5ce3fbef3242 Hector Martin     2023-03-07   966  		nvme@27bcc0000 {
2d5ce3fbef3242 Hector Martin     2023-03-07   967  			compatible = "apple,t8112-nvme-ans2", "apple,nvme-ans2";
2d5ce3fbef3242 Hector Martin     2023-03-07   968  			reg = <0x2 0x7bcc0000 0x0 0x40000>,
2d5ce3fbef3242 Hector Martin     2023-03-07   969  				<0x2 0x77400000 0x0 0x4000>;
2d5ce3fbef3242 Hector Martin     2023-03-07   970  			reg-names = "nvme", "ans";
2d5ce3fbef3242 Hector Martin     2023-03-07   971  			interrupt-parent = <&aic>;
2d5ce3fbef3242 Hector Martin     2023-03-07   972  			interrupts = <AIC_IRQ 724 IRQ_TYPE_LEVEL_HIGH>;
2d5ce3fbef3242 Hector Martin     2023-03-07   973  			mboxes = <&ans_mbox>;
2d5ce3fbef3242 Hector Martin     2023-03-07   974  			apple,sart = <&sart>;
2d5ce3fbef3242 Hector Martin     2023-03-07   975  			power-domains = <&ps_ans>, <&ps_apcie_st>;
2d5ce3fbef3242 Hector Martin     2023-03-07   976  			power-domain-names = "ans", "apcie0";
2d5ce3fbef3242 Hector Martin     2023-03-07   977  			resets = <&ps_ans>;
2d5ce3fbef3242 Hector Martin     2023-03-07   978  		};
2d5ce3fbef3242 Hector Martin     2023-03-07   979  
2d5ce3fbef3242 Hector Martin     2023-03-07   980  		pcie0_dart: iommu@681008000 {
2d5ce3fbef3242 Hector Martin     2023-03-07   981  			compatible = "apple,t8110-dart";
2d5ce3fbef3242 Hector Martin     2023-03-07   982  			reg = <0x6 0x81008000 0x0 0x4000>;
2d5ce3fbef3242 Hector Martin     2023-03-07   983  			#iommu-cells = <1>;
2d5ce3fbef3242 Hector Martin     2023-03-07   984  			interrupt-parent = <&aic>;
2d5ce3fbef3242 Hector Martin     2023-03-07   985  			interrupts = <AIC_IRQ 782 IRQ_TYPE_LEVEL_HIGH>;
2d5ce3fbef3242 Hector Martin     2023-03-07   986  			power-domains = <&ps_apcie_gp>;
2d5ce3fbef3242 Hector Martin     2023-03-07   987  		};
2d5ce3fbef3242 Hector Martin     2023-03-07   988  
2d5ce3fbef3242 Hector Martin     2023-03-07   989  		pcie1_dart: iommu@682008000 {
2d5ce3fbef3242 Hector Martin     2023-03-07   990  			compatible = "apple,t8110-dart";
2d5ce3fbef3242 Hector Martin     2023-03-07   991  			reg = <0x6 0x82008000 0x0 0x4000>;
2d5ce3fbef3242 Hector Martin     2023-03-07   992  			#iommu-cells = <1>;
2d5ce3fbef3242 Hector Martin     2023-03-07   993  			interrupt-parent = <&aic>;
2d5ce3fbef3242 Hector Martin     2023-03-07   994  			interrupts = <AIC_IRQ 785 IRQ_TYPE_LEVEL_HIGH>;
2d5ce3fbef3242 Hector Martin     2023-03-07   995  			power-domains = <&ps_apcie_gp>;
2d5ce3fbef3242 Hector Martin     2023-03-07   996  			status = "disabled";
2d5ce3fbef3242 Hector Martin     2023-03-07   997  		};
2d5ce3fbef3242 Hector Martin     2023-03-07   998  
2d5ce3fbef3242 Hector Martin     2023-03-07   999  		pcie2_dart: iommu@683008000 {
2d5ce3fbef3242 Hector Martin     2023-03-07  1000  			compatible = "apple,t8110-dart";
2d5ce3fbef3242 Hector Martin     2023-03-07  1001  			reg = <0x6 0x83008000 0x0 0x4000>;
2d5ce3fbef3242 Hector Martin     2023-03-07  1002  			#iommu-cells = <1>;
2d5ce3fbef3242 Hector Martin     2023-03-07  1003  			interrupt-parent = <&aic>;
2d5ce3fbef3242 Hector Martin     2023-03-07  1004  			interrupts = <AIC_IRQ 788 IRQ_TYPE_LEVEL_HIGH>;
2d5ce3fbef3242 Hector Martin     2023-03-07  1005  			power-domains = <&ps_apcie_gp>;
2d5ce3fbef3242 Hector Martin     2023-03-07  1006  			status = "disabled";
2d5ce3fbef3242 Hector Martin     2023-03-07  1007  		};
2d5ce3fbef3242 Hector Martin     2023-03-07  1008  
2d5ce3fbef3242 Hector Martin     2023-03-07  1009  		pcie3_dart: iommu@684008000 {
2d5ce3fbef3242 Hector Martin     2023-03-07  1010  			compatible = "apple,t8110-dart";
2d5ce3fbef3242 Hector Martin     2023-03-07  1011  			reg = <0x6 0x84008000 0x0 0x4000>;
2d5ce3fbef3242 Hector Martin     2023-03-07  1012  			#iommu-cells = <1>;
2d5ce3fbef3242 Hector Martin     2023-03-07  1013  			interrupt-parent = <&aic>;
2d5ce3fbef3242 Hector Martin     2023-03-07  1014  			interrupts = <AIC_IRQ 791 IRQ_TYPE_LEVEL_HIGH>;
2d5ce3fbef3242 Hector Martin     2023-03-07  1015  			power-domains = <&ps_apcie_gp>;
2d5ce3fbef3242 Hector Martin     2023-03-07  1016  			status = "disabled";
2d5ce3fbef3242 Hector Martin     2023-03-07  1017  		};
2d5ce3fbef3242 Hector Martin     2023-03-07  1018  
2d5ce3fbef3242 Hector Martin     2023-03-07  1019  		pcie0: pcie@690000000 {
2d5ce3fbef3242 Hector Martin     2023-03-07  1020  			compatible = "apple,t8112-pcie", "apple,pcie";
2d5ce3fbef3242 Hector Martin     2023-03-07  1021  			device_type = "pci";
2d5ce3fbef3242 Hector Martin     2023-03-07  1022  
2d5ce3fbef3242 Hector Martin     2023-03-07  1023  			reg = <0x6 0x90000000 0x0 0x1000000>,
2d5ce3fbef3242 Hector Martin     2023-03-07  1024  			      <0x6 0x80000000 0x0 0x100000>,
2d5ce3fbef3242 Hector Martin     2023-03-07  1025  			      <0x6 0x81000000 0x0 0x4000>,
2d5ce3fbef3242 Hector Martin     2023-03-07  1026  			      <0x6 0x82000000 0x0 0x4000>,
2d5ce3fbef3242 Hector Martin     2023-03-07  1027  			      <0x6 0x83000000 0x0 0x4000>,
2d5ce3fbef3242 Hector Martin     2023-03-07  1028  			      <0x6 0x84000000 0x0 0x4000>;
2d5ce3fbef3242 Hector Martin     2023-03-07  1029  			reg-names = "config", "rc", "port0", "port1", "port2", "port3";
2d5ce3fbef3242 Hector Martin     2023-03-07  1030  
2d5ce3fbef3242 Hector Martin     2023-03-07  1031  			interrupt-parent = <&aic>;
2d5ce3fbef3242 Hector Martin     2023-03-07  1032  			interrupts = <AIC_IRQ 781 IRQ_TYPE_LEVEL_HIGH>,
2d5ce3fbef3242 Hector Martin     2023-03-07  1033  				     <AIC_IRQ 784 IRQ_TYPE_LEVEL_HIGH>,
2d5ce3fbef3242 Hector Martin     2023-03-07  1034  				     <AIC_IRQ 787 IRQ_TYPE_LEVEL_HIGH>,
2d5ce3fbef3242 Hector Martin     2023-03-07  1035  				     <AIC_IRQ 790 IRQ_TYPE_LEVEL_HIGH>;
2d5ce3fbef3242 Hector Martin     2023-03-07  1036  
2d5ce3fbef3242 Hector Martin     2023-03-07  1037  			msi-controller;
2d5ce3fbef3242 Hector Martin     2023-03-07  1038  			msi-parent = <&pcie0>;
2d5ce3fbef3242 Hector Martin     2023-03-07  1039  			msi-ranges = <&aic AIC_IRQ 793 IRQ_TYPE_EDGE_RISING 32>;
2d5ce3fbef3242 Hector Martin     2023-03-07  1040  
2d5ce3fbef3242 Hector Martin     2023-03-07  1041  			iommu-map = <0x100 &pcie0_dart 0 1>,
2d5ce3fbef3242 Hector Martin     2023-03-07  1042  				    <0x200 &pcie1_dart 1 1>,
2d5ce3fbef3242 Hector Martin     2023-03-07  1043  				    <0x300 &pcie2_dart 2 1>,
2d5ce3fbef3242 Hector Martin     2023-03-07  1044  				    <0x400 &pcie3_dart 3 1>;
2d5ce3fbef3242 Hector Martin     2023-03-07  1045  			iommu-map-mask = <0xff00>;
2d5ce3fbef3242 Hector Martin     2023-03-07  1046  
2d5ce3fbef3242 Hector Martin     2023-03-07  1047  			bus-range = <0 4>;
2d5ce3fbef3242 Hector Martin     2023-03-07  1048  			#address-cells = <3>;
2d5ce3fbef3242 Hector Martin     2023-03-07  1049  			#size-cells = <2>;
2d5ce3fbef3242 Hector Martin     2023-03-07  1050  			ranges = <0x43000000 0x6 0xa0000000 0x6 0xa0000000 0x0 0x20000000>,
2d5ce3fbef3242 Hector Martin     2023-03-07  1051  				 <0x02000000 0x0 0xc0000000 0x6 0xc0000000 0x0 0x40000000>;
2d5ce3fbef3242 Hector Martin     2023-03-07  1052  
2d5ce3fbef3242 Hector Martin     2023-03-07  1053  			power-domains = <&ps_apcie_gp>;
2d5ce3fbef3242 Hector Martin     2023-03-07  1054  			pinctrl-0 = <&pcie_pins>;
2d5ce3fbef3242 Hector Martin     2023-03-07  1055  			pinctrl-names = "default";
2d5ce3fbef3242 Hector Martin     2023-03-07  1056  
2d5ce3fbef3242 Hector Martin     2023-03-07  1057  			port00: pci@0,0 {
2d5ce3fbef3242 Hector Martin     2023-03-07  1058  				device_type = "pci";
2d5ce3fbef3242 Hector Martin     2023-03-07  1059  				reg = <0x0 0x0 0x0 0x0 0x0>;
2d5ce3fbef3242 Hector Martin     2023-03-07  1060  				reset-gpios = <&pinctrl_ap 166 GPIO_ACTIVE_LOW>;
2d5ce3fbef3242 Hector Martin     2023-03-07  1061  
2d5ce3fbef3242 Hector Martin     2023-03-07  1062  				#address-cells = <3>;
2d5ce3fbef3242 Hector Martin     2023-03-07  1063  				#size-cells = <2>;
2d5ce3fbef3242 Hector Martin     2023-03-07  1064  				ranges;
2d5ce3fbef3242 Hector Martin     2023-03-07  1065  
2d5ce3fbef3242 Hector Martin     2023-03-07  1066  				interrupt-controller;
2d5ce3fbef3242 Hector Martin     2023-03-07  1067  				#interrupt-cells = <1>;
2d5ce3fbef3242 Hector Martin     2023-03-07  1068  
2d5ce3fbef3242 Hector Martin     2023-03-07  1069  				interrupt-map-mask = <0 0 0 7>;
2d5ce3fbef3242 Hector Martin     2023-03-07  1070  				interrupt-map = <0 0 0 1 &port00 0 0 0 0>,
2d5ce3fbef3242 Hector Martin     2023-03-07  1071  						<0 0 0 2 &port00 0 0 0 1>,
2d5ce3fbef3242 Hector Martin     2023-03-07  1072  						<0 0 0 3 &port00 0 0 0 2>,
2d5ce3fbef3242 Hector Martin     2023-03-07  1073  						<0 0 0 4 &port00 0 0 0 3>;
2d5ce3fbef3242 Hector Martin     2023-03-07  1074  			};
2d5ce3fbef3242 Hector Martin     2023-03-07  1075  
2d5ce3fbef3242 Hector Martin     2023-03-07  1076  			port01: pci@1,0 {
2d5ce3fbef3242 Hector Martin     2023-03-07  1077  				device_type = "pci";
2d5ce3fbef3242 Hector Martin     2023-03-07  1078  				reg = <0x800 0x0 0x0 0x0 0x0>;
2d5ce3fbef3242 Hector Martin     2023-03-07  1079  				reset-gpios = <&pinctrl_ap 167 GPIO_ACTIVE_LOW>;
2d5ce3fbef3242 Hector Martin     2023-03-07  1080  
2d5ce3fbef3242 Hector Martin     2023-03-07  1081  				#address-cells = <3>;
2d5ce3fbef3242 Hector Martin     2023-03-07  1082  				#size-cells = <2>;
2d5ce3fbef3242 Hector Martin     2023-03-07  1083  				ranges;
2d5ce3fbef3242 Hector Martin     2023-03-07  1084  
2d5ce3fbef3242 Hector Martin     2023-03-07  1085  				interrupt-controller;
2d5ce3fbef3242 Hector Martin     2023-03-07  1086  				#interrupt-cells = <1>;
2d5ce3fbef3242 Hector Martin     2023-03-07  1087  
2d5ce3fbef3242 Hector Martin     2023-03-07  1088  				interrupt-map-mask = <0 0 0 7>;
2d5ce3fbef3242 Hector Martin     2023-03-07  1089  				interrupt-map = <0 0 0 1 &port01 0 0 0 0>,
2d5ce3fbef3242 Hector Martin     2023-03-07  1090  						<0 0 0 2 &port01 0 0 0 1>,
2d5ce3fbef3242 Hector Martin     2023-03-07  1091  						<0 0 0 3 &port01 0 0 0 2>,
2d5ce3fbef3242 Hector Martin     2023-03-07  1092  						<0 0 0 4 &port01 0 0 0 3>;
2d5ce3fbef3242 Hector Martin     2023-03-07  1093  
2d5ce3fbef3242 Hector Martin     2023-03-07  1094  				status = "disabled";
2d5ce3fbef3242 Hector Martin     2023-03-07  1095  			};
2d5ce3fbef3242 Hector Martin     2023-03-07  1096  
2d5ce3fbef3242 Hector Martin     2023-03-07  1097  			port02: pci@2,0 {
2d5ce3fbef3242 Hector Martin     2023-03-07  1098  				device_type = "pci";
2d5ce3fbef3242 Hector Martin     2023-03-07  1099  				reg = <0x1000 0x0 0x0 0x0 0x0>;
2d5ce3fbef3242 Hector Martin     2023-03-07  1100  				reset-gpios = <&pinctrl_ap 168 GPIO_ACTIVE_LOW>;
2d5ce3fbef3242 Hector Martin     2023-03-07  1101  
2d5ce3fbef3242 Hector Martin     2023-03-07  1102  				#address-cells = <3>;
2d5ce3fbef3242 Hector Martin     2023-03-07  1103  				#size-cells = <2>;
2d5ce3fbef3242 Hector Martin     2023-03-07  1104  				ranges;
2d5ce3fbef3242 Hector Martin     2023-03-07  1105  
2d5ce3fbef3242 Hector Martin     2023-03-07  1106  				interrupt-controller;
2d5ce3fbef3242 Hector Martin     2023-03-07  1107  				#interrupt-cells = <1>;
2d5ce3fbef3242 Hector Martin     2023-03-07  1108  
2d5ce3fbef3242 Hector Martin     2023-03-07  1109  				interrupt-map-mask = <0 0 0 7>;
2d5ce3fbef3242 Hector Martin     2023-03-07  1110  				interrupt-map = <0 0 0 1 &port02 0 0 0 0>,
2d5ce3fbef3242 Hector Martin     2023-03-07  1111  						<0 0 0 2 &port02 0 0 0 1>,
2d5ce3fbef3242 Hector Martin     2023-03-07  1112  						<0 0 0 3 &port02 0 0 0 2>,
2d5ce3fbef3242 Hector Martin     2023-03-07  1113  						<0 0 0 4 &port02 0 0 0 3>;
2d5ce3fbef3242 Hector Martin     2023-03-07  1114  
2d5ce3fbef3242 Hector Martin     2023-03-07  1115  				status = "disabled";
2d5ce3fbef3242 Hector Martin     2023-03-07  1116  			};
2d5ce3fbef3242 Hector Martin     2023-03-07  1117  
2d5ce3fbef3242 Hector Martin     2023-03-07  1118  			/* TODO: GPIO unknown */
2d5ce3fbef3242 Hector Martin     2023-03-07  1119  			port03: pci@3,0 {
2d5ce3fbef3242 Hector Martin     2023-03-07  1120  				device_type = "pci";
2d5ce3fbef3242 Hector Martin     2023-03-07  1121  				reg = <0x1800 0x0 0x0 0x0 0x0>;
2d5ce3fbef3242 Hector Martin     2023-03-07  1122  				//reset-gpios = <&pinctrl_ap 33 GPIO_ACTIVE_LOW>;
2d5ce3fbef3242 Hector Martin     2023-03-07  1123  
2d5ce3fbef3242 Hector Martin     2023-03-07  1124  				#address-cells = <3>;
2d5ce3fbef3242 Hector Martin     2023-03-07  1125  				#size-cells = <2>;
2d5ce3fbef3242 Hector Martin     2023-03-07  1126  				ranges;
2d5ce3fbef3242 Hector Martin     2023-03-07  1127  
2d5ce3fbef3242 Hector Martin     2023-03-07  1128  				interrupt-controller;
2d5ce3fbef3242 Hector Martin     2023-03-07  1129  				#interrupt-cells = <1>;
2d5ce3fbef3242 Hector Martin     2023-03-07  1130  
2d5ce3fbef3242 Hector Martin     2023-03-07  1131  				interrupt-map-mask = <0 0 0 7>;
2d5ce3fbef3242 Hector Martin     2023-03-07  1132  				interrupt-map = <0 0 0 1 &port03 0 0 0 0>,
2d5ce3fbef3242 Hector Martin     2023-03-07  1133  						<0 0 0 2 &port03 0 0 0 1>,
2d5ce3fbef3242 Hector Martin     2023-03-07  1134  						<0 0 0 3 &port03 0 0 0 2>,
2d5ce3fbef3242 Hector Martin     2023-03-07  1135  						<0 0 0 4 &port03 0 0 0 3>;
2d5ce3fbef3242 Hector Martin     2023-03-07  1136  
2d5ce3fbef3242 Hector Martin     2023-03-07  1137  				status = "disabled";
2d5ce3fbef3242 Hector Martin     2023-03-07  1138  			};
2d5ce3fbef3242 Hector Martin     2023-03-07  1139  		};
2d5ce3fbef3242 Hector Martin     2023-03-07  1140  	};
2d5ce3fbef3242 Hector Martin     2023-03-07  1141  };
2d5ce3fbef3242 Hector Martin     2023-03-07  1142  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
