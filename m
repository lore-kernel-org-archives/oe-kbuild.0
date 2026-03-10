Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 153CA3E8C5F
	for <oe-kbuild@lists.linux.dev>; Tue, 10 Mar 2026 07:39:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773128393; cv=none; b=jxW626q1Fhgnmnzg+IA9G/kBuhj6UOBuHAj99JPO7U12OXdiN1zYOIcYu7FxjeYNP5cL+Bp5pXpcK0l4btdrQtknAu5xYgw0zo/HZBcYFNLak2uS33xLxe/BCp3A2gCkAnUqNa8v02pNbrqFlCxj7t3J7GGo9KPzupY0tvOBMXI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773128393; c=relaxed/simple;
	bh=z3RpuVwfzqio74qEpXrIScPfdzOh27srP+TK+vjOlfs=;
	h=Date:From:To:Cc:Subject:Message-ID; b=T6HMOVJw1VNPnFUfONCSwboDguAooyCeyrfk4/iNbP2zQQsYzWU4gwxVuKYVzFfoI0KBM86VB/Pj7DjOvf9t/qooJkbGTZ5flnZHTGIZhUdSEddUu6/2CB0vfmKFSzR41O54RrKmkwo0CLcCfM3V4Apy+Z4PHG0gwwNQAIS0KQ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HvY+U8En; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HvY+U8En"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773128386; x=1804664386;
  h=date:from:to:cc:subject:message-id;
  bh=z3RpuVwfzqio74qEpXrIScPfdzOh27srP+TK+vjOlfs=;
  b=HvY+U8Enn2IWBKNopoQeOLKs8LDBbGPd3swih7e8vX2PolbqZVAF0hJI
   dgo7rktc4UH/7up1i503p6e6vVWWp3qmKHPR7oqhZiYld0z2Vy1lWdtiA
   hsw7+BrtvR7tHlKZAG+CMceukZaRMPA41RTAKpKW/8D4zYCH/fh3q6izv
   +SO4C8D+Z2wdAGJ6vJ8EbDlVTX8Fyn23mUY4ekF8bV5XlJuttN0rjx5Zq
   WoPyHFU0S6hpCGYpWkOTxsRoLeMr7w7JaYiZj6Q9xcevJGE0FEACcW8D0
   6AxyT8/1mqQyjphUYYe4FmLDDbwiHKn0Vn3mFufNO5MfI5o7/52DACh+i
   A==;
X-CSE-ConnectionGUID: zavdVB02SW2AJjZ7XuDrOw==
X-CSE-MsgGUID: jrXzt9ttRfCE2fhxC3ftcA==
X-IronPort-AV: E=McAfee;i="6800,10657,11724"; a="73865913"
X-IronPort-AV: E=Sophos;i="6.23,111,1770624000"; 
   d="scan'208";a="73865913"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Mar 2026 00:39:43 -0700
X-CSE-ConnectionGUID: cSlWevO8RD+FtE6pSxuySg==
X-CSE-MsgGUID: q6sDzZi1RviHnbBWKWpJEQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,111,1770624000"; 
   d="scan'208";a="250510504"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by orviesa002.jf.intel.com with ESMTP; 10 Mar 2026 00:39:40 -0700
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vzrgl-0000000031h-2t9l;
	Tue, 10 Mar 2026 07:39:35 +0000
Date: Tue, 10 Mar 2026 08:38:57 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: arch/arm/boot/dts/ti/omap/am43x-epos-evm.dtb: wdt@0
 (ti,am4372-wdt): $nodename:0: 'wdt@0' does not match
 '^(pmic|timer|watchdog)(@.*|-([0-9]|[1-9][0-9]+))?$'
Message-ID: <202603100859.hFaeUeb4-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "dtcheck: too old problem, older than 3 months"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Krzysztof Kozlowski <krzk@kernel.org>
CC: Wim Van Sebroeck <wim@linux-watchdog.org>
CC: Guenter Roeck <linux@roeck-us.net>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   1f318b96cc84d7c2ab792fcc0bfd42a7ca890681
commit: 017bca91639f01302382013033b685ec8759aba4 dt-bindings: watchdog: Allow node names named 'pmic'
date:   4 months ago
:::::: branch date: 32 hours ago
:::::: commit date: 4 months ago
config: arm-randconfig-2051-20260307 (https://download.01.org/0day-ci/archive/20260310/202603100859.hFaeUeb4-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project f43d6834093b19baf79beda8c0337ab020ac5f17)
dtschema: 2025.13.dev8+g0515abdd9
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260310/202603100859.hFaeUeb4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202603100859.hFaeUeb4-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm/boot/dts/ti/omap/am43x-epos-evm.dtb: /ocp@44000000/interconnect@44c00000/segment@200000/target-module@10000/scm@0: failed to match any schema with compatible: ['ti,am4-scm', 'simple-bus']
   arch/arm/boot/dts/ti/omap/am43x-epos-evm.dtb: scm_conf@0 (syscon): clocks: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/ti/omap/am43x-epos-evm.dtb: scm_conf@0 (syscon): phy-gmii-sel: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/ti/omap/am43x-epos-evm.dtb: scm_conf@0 (syscon): $nodename:0: 'scm_conf@0' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/ti/omap/am43x-epos-evm.dtb: scm_conf@0 (syscon): 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/ti/omap/am43x-epos-evm.dtb: /ocp@44000000/interconnect@44c00000/segment@200000/target-module@10000/scm@0/dma-router@f90: failed to match any schema with compatible: ['ti,am335x-edma-crossbar']
>> arch/arm/boot/dts/ti/omap/am43x-epos-evm.dtb: wdt@0 (ti,am4372-wdt): $nodename:0: 'wdt@0' does not match '^(pmic|timer|watchdog)(@.*|-([0-9]|[1-9][0-9]+))?$'
   	from schema $id: http://devicetree.org/schemas/watchdog/ti,omap2-wdt.yaml
   arch/arm/boot/dts/ti/omap/am43x-epos-evm.dtb: /ocp@44000000/interconnect@44c00000/segment@200000/target-module@3e000/rtc@0: failed to match any schema with compatible: ['ti,am4372-rtc', 'ti,am3352-rtc', 'ti,da830-rtc']
   arch/arm/boot/dts/ti/omap/am43x-epos-evm.dtb: /ocp@44000000/interconnect@44c00000/segment@200000/target-module@3e000/rtc@0: failed to match any schema with compatible: ['ti,am4372-rtc', 'ti,am3352-rtc', 'ti,da830-rtc']
   arch/arm/boot/dts/ti/omap/am43x-epos-evm.dtb: /ocp@44000000/interconnect@44c00000/segment@200000/target-module@3e000/rtc@0: failed to match any schema with compatible: ['ti,am4372-rtc', 'ti,am3352-rtc', 'ti,da830-rtc']
   arch/arm/boot/dts/ti/omap/am43x-epos-evm.dtb: /ocp@44000000/interconnect@44c00000/segment@200000/target-module@86000/counter@0: failed to match any schema with compatible: ['ti,am4372-counter32k', 'ti,omap-counter32k']
   arch/arm/boot/dts/ti/omap/am43x-epos-evm.dtb: /ocp@44000000/interconnect@44c00000/segment@200000/target-module@86000/counter@0: failed to match any schema with compatible: ['ti,am4372-counter32k', 'ti,omap-counter32k']
   arch/arm/boot/dts/ti/omap/am43x-epos-evm.dtb: interconnect@48000000 (ti,am4-l4-per): $nodename:0: 'interconnect@48000000' does not match '^bus(@[0-9a-f]+)?$'
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/ti/omap/am43x-epos-evm.dtb: /ocp@44000000/interconnect@48000000: failed to match any schema with compatible: ['ti,am4-l4-per', 'simple-pm-bus']
   arch/arm/boot/dts/ti/omap/am43x-epos-evm.dtb: segment@0 (simple-pm-bus): 'anyOf' conditional failed, one must be fixed:
--
   arch/arm/boot/dts/ti/omap/am437x-cm-t43.dtb: /ocp@44000000/interconnect@44c00000/segment@200000/target-module@10000/scm@0: failed to match any schema with compatible: ['ti,am4-scm', 'simple-bus']
   arch/arm/boot/dts/ti/omap/am437x-cm-t43.dtb: scm_conf@0 (syscon): clocks: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/ti/omap/am437x-cm-t43.dtb: scm_conf@0 (syscon): phy-gmii-sel: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/ti/omap/am437x-cm-t43.dtb: scm_conf@0 (syscon): $nodename:0: 'scm_conf@0' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/ti/omap/am437x-cm-t43.dtb: scm_conf@0 (syscon): 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/ti/omap/am437x-cm-t43.dtb: /ocp@44000000/interconnect@44c00000/segment@200000/target-module@10000/scm@0/dma-router@f90: failed to match any schema with compatible: ['ti,am335x-edma-crossbar']
>> arch/arm/boot/dts/ti/omap/am437x-cm-t43.dtb: wdt@0 (ti,am4372-wdt): $nodename:0: 'wdt@0' does not match '^(pmic|timer|watchdog)(@.*|-([0-9]|[1-9][0-9]+))?$'
   	from schema $id: http://devicetree.org/schemas/watchdog/ti,omap2-wdt.yaml
   arch/arm/boot/dts/ti/omap/am437x-cm-t43.dtb: /ocp@44000000/interconnect@44c00000/segment@200000/target-module@3e000/rtc@0: failed to match any schema with compatible: ['ti,am4372-rtc', 'ti,am3352-rtc', 'ti,da830-rtc']
   arch/arm/boot/dts/ti/omap/am437x-cm-t43.dtb: /ocp@44000000/interconnect@44c00000/segment@200000/target-module@3e000/rtc@0: failed to match any schema with compatible: ['ti,am4372-rtc', 'ti,am3352-rtc', 'ti,da830-rtc']
   arch/arm/boot/dts/ti/omap/am437x-cm-t43.dtb: /ocp@44000000/interconnect@44c00000/segment@200000/target-module@3e000/rtc@0: failed to match any schema with compatible: ['ti,am4372-rtc', 'ti,am3352-rtc', 'ti,da830-rtc']
   arch/arm/boot/dts/ti/omap/am437x-cm-t43.dtb: /ocp@44000000/interconnect@44c00000/segment@200000/target-module@86000/counter@0: failed to match any schema with compatible: ['ti,am4372-counter32k', 'ti,omap-counter32k']
   arch/arm/boot/dts/ti/omap/am437x-cm-t43.dtb: /ocp@44000000/interconnect@44c00000/segment@200000/target-module@86000/counter@0: failed to match any schema with compatible: ['ti,am4372-counter32k', 'ti,omap-counter32k']
   arch/arm/boot/dts/ti/omap/am437x-cm-t43.dtb: interconnect@48000000 (ti,am4-l4-per): $nodename:0: 'interconnect@48000000' does not match '^bus(@[0-9a-f]+)?$'
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/ti/omap/am437x-cm-t43.dtb: /ocp@44000000/interconnect@48000000: failed to match any schema with compatible: ['ti,am4-l4-per', 'simple-pm-bus']
   arch/arm/boot/dts/ti/omap/am437x-cm-t43.dtb: segment@0 (simple-pm-bus): 'anyOf' conditional failed, one must be fixed:
--
   arch/arm/boot/dts/ti/omap/am437x-gp-evm.dtb: /ocp@44000000/interconnect@44c00000/segment@200000/target-module@10000/scm@0: failed to match any schema with compatible: ['ti,am4-scm', 'simple-bus']
   arch/arm/boot/dts/ti/omap/am437x-gp-evm.dtb: scm_conf@0 (syscon): clocks: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/ti/omap/am437x-gp-evm.dtb: scm_conf@0 (syscon): phy-gmii-sel: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/ti/omap/am437x-gp-evm.dtb: scm_conf@0 (syscon): $nodename:0: 'scm_conf@0' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/ti/omap/am437x-gp-evm.dtb: scm_conf@0 (syscon): 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/ti/omap/am437x-gp-evm.dtb: /ocp@44000000/interconnect@44c00000/segment@200000/target-module@10000/scm@0/dma-router@f90: failed to match any schema with compatible: ['ti,am335x-edma-crossbar']
>> arch/arm/boot/dts/ti/omap/am437x-gp-evm.dtb: wdt@0 (ti,am4372-wdt): $nodename:0: 'wdt@0' does not match '^(pmic|timer|watchdog)(@.*|-([0-9]|[1-9][0-9]+))?$'
   	from schema $id: http://devicetree.org/schemas/watchdog/ti,omap2-wdt.yaml
   arch/arm/boot/dts/ti/omap/am437x-gp-evm.dtb: /ocp@44000000/interconnect@44c00000/segment@200000/target-module@3e000/rtc@0: failed to match any schema with compatible: ['ti,am4372-rtc', 'ti,am3352-rtc', 'ti,da830-rtc']
   arch/arm/boot/dts/ti/omap/am437x-gp-evm.dtb: /ocp@44000000/interconnect@44c00000/segment@200000/target-module@3e000/rtc@0: failed to match any schema with compatible: ['ti,am4372-rtc', 'ti,am3352-rtc', 'ti,da830-rtc']
   arch/arm/boot/dts/ti/omap/am437x-gp-evm.dtb: /ocp@44000000/interconnect@44c00000/segment@200000/target-module@3e000/rtc@0: failed to match any schema with compatible: ['ti,am4372-rtc', 'ti,am3352-rtc', 'ti,da830-rtc']
   arch/arm/boot/dts/ti/omap/am437x-gp-evm.dtb: /ocp@44000000/interconnect@44c00000/segment@200000/target-module@86000/counter@0: failed to match any schema with compatible: ['ti,am4372-counter32k', 'ti,omap-counter32k']
   arch/arm/boot/dts/ti/omap/am437x-gp-evm.dtb: /ocp@44000000/interconnect@44c00000/segment@200000/target-module@86000/counter@0: failed to match any schema with compatible: ['ti,am4372-counter32k', 'ti,omap-counter32k']
   arch/arm/boot/dts/ti/omap/am437x-gp-evm.dtb: interconnect@48000000 (ti,am4-l4-per): $nodename:0: 'interconnect@48000000' does not match '^bus(@[0-9a-f]+)?$'
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/ti/omap/am437x-gp-evm.dtb: /ocp@44000000/interconnect@48000000: failed to match any schema with compatible: ['ti,am4-l4-per', 'simple-pm-bus']
   arch/arm/boot/dts/ti/omap/am437x-gp-evm.dtb: segment@0 (simple-pm-bus): 'anyOf' conditional failed, one must be fixed:
--
   arch/arm/boot/dts/ti/omap/am437x-idk-evm.dtb: /ocp@44000000/interconnect@44c00000/segment@200000/target-module@10000/scm@0: failed to match any schema with compatible: ['ti,am4-scm', 'simple-bus']
   arch/arm/boot/dts/ti/omap/am437x-idk-evm.dtb: scm_conf@0 (syscon): clocks: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/ti/omap/am437x-idk-evm.dtb: scm_conf@0 (syscon): phy-gmii-sel: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/ti/omap/am437x-idk-evm.dtb: scm_conf@0 (syscon): $nodename:0: 'scm_conf@0' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/ti/omap/am437x-idk-evm.dtb: scm_conf@0 (syscon): 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/ti/omap/am437x-idk-evm.dtb: /ocp@44000000/interconnect@44c00000/segment@200000/target-module@10000/scm@0/dma-router@f90: failed to match any schema with compatible: ['ti,am335x-edma-crossbar']
>> arch/arm/boot/dts/ti/omap/am437x-idk-evm.dtb: wdt@0 (ti,am4372-wdt): $nodename:0: 'wdt@0' does not match '^(pmic|timer|watchdog)(@.*|-([0-9]|[1-9][0-9]+))?$'
   	from schema $id: http://devicetree.org/schemas/watchdog/ti,omap2-wdt.yaml
   arch/arm/boot/dts/ti/omap/am437x-idk-evm.dtb: /ocp@44000000/interconnect@44c00000/segment@200000/target-module@3e000/rtc@0: failed to match any schema with compatible: ['ti,am4372-rtc', 'ti,am3352-rtc', 'ti,da830-rtc']
   arch/arm/boot/dts/ti/omap/am437x-idk-evm.dtb: /ocp@44000000/interconnect@44c00000/segment@200000/target-module@3e000/rtc@0: failed to match any schema with compatible: ['ti,am4372-rtc', 'ti,am3352-rtc', 'ti,da830-rtc']
   arch/arm/boot/dts/ti/omap/am437x-idk-evm.dtb: /ocp@44000000/interconnect@44c00000/segment@200000/target-module@3e000/rtc@0: failed to match any schema with compatible: ['ti,am4372-rtc', 'ti,am3352-rtc', 'ti,da830-rtc']
   arch/arm/boot/dts/ti/omap/am437x-idk-evm.dtb: /ocp@44000000/interconnect@44c00000/segment@200000/target-module@86000/counter@0: failed to match any schema with compatible: ['ti,am4372-counter32k', 'ti,omap-counter32k']
   arch/arm/boot/dts/ti/omap/am437x-idk-evm.dtb: /ocp@44000000/interconnect@44c00000/segment@200000/target-module@86000/counter@0: failed to match any schema with compatible: ['ti,am4372-counter32k', 'ti,omap-counter32k']
   arch/arm/boot/dts/ti/omap/am437x-idk-evm.dtb: interconnect@48000000 (ti,am4-l4-per): $nodename:0: 'interconnect@48000000' does not match '^bus(@[0-9a-f]+)?$'
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/ti/omap/am437x-idk-evm.dtb: /ocp@44000000/interconnect@48000000: failed to match any schema with compatible: ['ti,am4-l4-per', 'simple-pm-bus']
   arch/arm/boot/dts/ti/omap/am437x-idk-evm.dtb: segment@0 (simple-pm-bus): 'anyOf' conditional failed, one must be fixed:
--
   arch/arm/boot/dts/ti/omap/am437x-sbc-t43.dtb: /ocp@44000000/interconnect@44c00000/segment@200000/target-module@10000/scm@0: failed to match any schema with compatible: ['ti,am4-scm', 'simple-bus']
   arch/arm/boot/dts/ti/omap/am437x-sbc-t43.dtb: scm_conf@0 (syscon): clocks: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/ti/omap/am437x-sbc-t43.dtb: scm_conf@0 (syscon): phy-gmii-sel: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/ti/omap/am437x-sbc-t43.dtb: scm_conf@0 (syscon): $nodename:0: 'scm_conf@0' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/ti/omap/am437x-sbc-t43.dtb: scm_conf@0 (syscon): 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/ti/omap/am437x-sbc-t43.dtb: /ocp@44000000/interconnect@44c00000/segment@200000/target-module@10000/scm@0/dma-router@f90: failed to match any schema with compatible: ['ti,am335x-edma-crossbar']
>> arch/arm/boot/dts/ti/omap/am437x-sbc-t43.dtb: wdt@0 (ti,am4372-wdt): $nodename:0: 'wdt@0' does not match '^(pmic|timer|watchdog)(@.*|-([0-9]|[1-9][0-9]+))?$'
   	from schema $id: http://devicetree.org/schemas/watchdog/ti,omap2-wdt.yaml
   arch/arm/boot/dts/ti/omap/am437x-sbc-t43.dtb: /ocp@44000000/interconnect@44c00000/segment@200000/target-module@3e000/rtc@0: failed to match any schema with compatible: ['ti,am4372-rtc', 'ti,am3352-rtc', 'ti,da830-rtc']
   arch/arm/boot/dts/ti/omap/am437x-sbc-t43.dtb: /ocp@44000000/interconnect@44c00000/segment@200000/target-module@3e000/rtc@0: failed to match any schema with compatible: ['ti,am4372-rtc', 'ti,am3352-rtc', 'ti,da830-rtc']
   arch/arm/boot/dts/ti/omap/am437x-sbc-t43.dtb: /ocp@44000000/interconnect@44c00000/segment@200000/target-module@3e000/rtc@0: failed to match any schema with compatible: ['ti,am4372-rtc', 'ti,am3352-rtc', 'ti,da830-rtc']
   arch/arm/boot/dts/ti/omap/am437x-sbc-t43.dtb: /ocp@44000000/interconnect@44c00000/segment@200000/target-module@86000/counter@0: failed to match any schema with compatible: ['ti,am4372-counter32k', 'ti,omap-counter32k']
   arch/arm/boot/dts/ti/omap/am437x-sbc-t43.dtb: /ocp@44000000/interconnect@44c00000/segment@200000/target-module@86000/counter@0: failed to match any schema with compatible: ['ti,am4372-counter32k', 'ti,omap-counter32k']
   arch/arm/boot/dts/ti/omap/am437x-sbc-t43.dtb: interconnect@48000000 (ti,am4-l4-per): $nodename:0: 'interconnect@48000000' does not match '^bus(@[0-9a-f]+)?$'
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/ti/omap/am437x-sbc-t43.dtb: /ocp@44000000/interconnect@48000000: failed to match any schema with compatible: ['ti,am4-l4-per', 'simple-pm-bus']
   arch/arm/boot/dts/ti/omap/am437x-sbc-t43.dtb: segment@0 (simple-pm-bus): 'anyOf' conditional failed, one must be fixed:
--
   arch/arm/boot/dts/ti/omap/am437x-sk-evm.dtb: /ocp@44000000/interconnect@44c00000/segment@200000/target-module@10000/scm@0: failed to match any schema with compatible: ['ti,am4-scm', 'simple-bus']
   arch/arm/boot/dts/ti/omap/am437x-sk-evm.dtb: scm_conf@0 (syscon): phy-gmii-sel: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/ti/omap/am437x-sk-evm.dtb: scm_conf@0 (syscon): clocks: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/ti/omap/am437x-sk-evm.dtb: scm_conf@0 (syscon): $nodename:0: 'scm_conf@0' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/ti/omap/am437x-sk-evm.dtb: scm_conf@0 (syscon): 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/ti/omap/am437x-sk-evm.dtb: /ocp@44000000/interconnect@44c00000/segment@200000/target-module@10000/scm@0/dma-router@f90: failed to match any schema with compatible: ['ti,am335x-edma-crossbar']
>> arch/arm/boot/dts/ti/omap/am437x-sk-evm.dtb: wdt@0 (ti,am4372-wdt): $nodename:0: 'wdt@0' does not match '^(pmic|timer|watchdog)(@.*|-([0-9]|[1-9][0-9]+))?$'
   	from schema $id: http://devicetree.org/schemas/watchdog/ti,omap2-wdt.yaml
   arch/arm/boot/dts/ti/omap/am437x-sk-evm.dtb: /ocp@44000000/interconnect@44c00000/segment@200000/target-module@3e000/rtc@0: failed to match any schema with compatible: ['ti,am4372-rtc', 'ti,am3352-rtc', 'ti,da830-rtc']
   arch/arm/boot/dts/ti/omap/am437x-sk-evm.dtb: /ocp@44000000/interconnect@44c00000/segment@200000/target-module@3e000/rtc@0: failed to match any schema with compatible: ['ti,am4372-rtc', 'ti,am3352-rtc', 'ti,da830-rtc']
   arch/arm/boot/dts/ti/omap/am437x-sk-evm.dtb: /ocp@44000000/interconnect@44c00000/segment@200000/target-module@3e000/rtc@0: failed to match any schema with compatible: ['ti,am4372-rtc', 'ti,am3352-rtc', 'ti,da830-rtc']
   arch/arm/boot/dts/ti/omap/am437x-sk-evm.dtb: /ocp@44000000/interconnect@44c00000/segment@200000/target-module@86000/counter@0: failed to match any schema with compatible: ['ti,am4372-counter32k', 'ti,omap-counter32k']
   arch/arm/boot/dts/ti/omap/am437x-sk-evm.dtb: /ocp@44000000/interconnect@44c00000/segment@200000/target-module@86000/counter@0: failed to match any schema with compatible: ['ti,am4372-counter32k', 'ti,omap-counter32k']
   arch/arm/boot/dts/ti/omap/am437x-sk-evm.dtb: interconnect@48000000 (ti,am4-l4-per): $nodename:0: 'interconnect@48000000' does not match '^bus(@[0-9a-f]+)?$'
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/ti/omap/am437x-sk-evm.dtb: /ocp@44000000/interconnect@48000000: failed to match any schema with compatible: ['ti,am4-l4-per', 'simple-pm-bus']
   arch/arm/boot/dts/ti/omap/am437x-sk-evm.dtb: segment@0 (simple-pm-bus): 'anyOf' conditional failed, one must be fixed:

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
