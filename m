Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA3032F2C4C
	for <oe-kbuild@lists.linux.dev>; Wed, 16 Jul 2025 10:50:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752663009; cv=none; b=NSxXniY09V9nFfGWCffuetylNzd1seXzpptNDvqff7cMlM1H1Co3DHijSq04TVm9SCE+5E366nQJksm5Ul7FGQ4IAYu8wQBtoF8OlApIFC65DeLz1NtfowUVLRpZOdjLh8muAStyO78J7NIpmhVirKHJfxRKTIB+HfUOjFmIN2I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752663009; c=relaxed/simple;
	bh=fVyvYPBrVfFOkM01PRadZLBrq/LKBsHAMyCvIROa0JE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=PIVLkjEbQpNcAAzYZRIpql2+oWbixjaogmVhIXLx+pZS4k9eZj+2llRirnMRKSZWhoQ0zV98k0ULucmidJRg3jVOUcf+XuALnEBMP8AJ63LJo3Na/wrekX++0lpOGyppyWHeyw6g19SU6xzmbnfjUJ/tQ3g3NBwszIxW6ERxr6I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Wr+GxVUU; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Wr+GxVUU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752663009; x=1784199009;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=fVyvYPBrVfFOkM01PRadZLBrq/LKBsHAMyCvIROa0JE=;
  b=Wr+GxVUUM5/WNKGITG6TYxFgYE8jNdSFCzmF3ndxO2EtA3C9Wyo+7gVg
   qhzYMlWKXAjT+wAJlkTgs8NC5I5hbbPJJEMCKtQxfVg3vrniJeYu1A/EF
   Tq7mvbLrW94oq235s4nneM0cNzU3lefFKwG2TJsEAZo39XP2Ne3+fyWgc
   AuKvixM/zVWsuxsvgQNUg3uMjztsBUpRcR3t03ErPlzjFYQVkbSEEKV9r
   NaZa0idqfs0jqX1+AwN9y1c9PURSV0Iyu40vwX4aHKyB0P44rlMMmdH7n
   t13fiJ1ZQEbAkbjWBg8ytDsV/8gCGWWoJnhnGYUyXg8D6WG5FT26kB4Jy
   A==;
X-CSE-ConnectionGUID: JE9dlsiaQumBekRLphuGmQ==
X-CSE-MsgGUID: uc3m/ANuSXGD3n7B27Mzow==
X-IronPort-AV: E=McAfee;i="6800,10657,11493"; a="54611015"
X-IronPort-AV: E=Sophos;i="6.16,315,1744095600"; 
   d="scan'208";a="54611015"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jul 2025 03:50:08 -0700
X-CSE-ConnectionGUID: Xdn3P64sS6e7tYK3o0v5JA==
X-CSE-MsgGUID: 2oeg0G4jQT6jKdYAEdpKMw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,315,1744095600"; 
   d="scan'208";a="156871304"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 16 Jul 2025 03:50:06 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ubzi7-000CGd-2X;
	Wed, 16 Jul 2025 10:50:03 +0000
Date: Wed, 16 Jul 2025 18:49:54 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH 15/17] arm64: tegra: Add BPMP node for Tegra210
Message-ID: <202507161854.c1dJsJ04-lkp@intel.com>
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
In-Reply-To: <20250714-t210b01-v1-15-e3f5f7de5dce@gmail.com>
References: <20250714-t210b01-v1-15-e3f5f7de5dce@gmail.com>
TO: Aaron Kling <webgeek1234@gmail.com>
TO: Rob Herring <robh@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
TO: Thierry Reding <thierry.reding@gmail.com>
TO: Jonathan Hunter <jonathanh@nvidia.com>
TO: Vinod Koul <vkoul@kernel.org>
TO: Kishon Vijay Abraham I <kishon@kernel.org>
TO: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
TO: Nagarjuna Kristam <nkristam@nvidia.com>
TO: JC Kuo <jckuo@nvidia.com>
TO: "Rafael J. Wysocki" <rafael@kernel.org>
TO: Daniel Lezcano <daniel.lezcano@linaro.org>
TO: Zhang Rui <rui.zhang@intel.com>
TO: Lukasz Luba <lukasz.luba@arm.com>
TO: Michael Turquette <mturquette@baylibre.com>
TO: Stephen Boyd <sboyd@kernel.org>
TO: Mathias Nyman <mathias.nyman@intel.com>
TO: Peter De Schrijver <pdeschrijver@nvidia.com>
TO: Prashant Gaikwad <pgaikwad@nvidia.com>
CC: devicetree@vger.kernel.org
CC: linux-tegra@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: linux-phy@lists.infradead.org
CC: linux-usb@vger.kernel.org
CC: linux-pm@vger.kernel.org
CC: linux-clk@vger.kernel.org
CC: Aaron Kling <webgeek1234@gmail.com>

Hi Aaron,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 347e9f5043c89695b01e66b3ed111755afcf1911]

url:    https://github.com/intel-lab-lkp/linux/commits/Aaron-Kling/dt-bindings-arm-tegra-pmc-Document-Tegra210B01/20250715-160630
base:   347e9f5043c89695b01e66b3ed111755afcf1911
patch link:    https://lore.kernel.org/r/20250714-t210b01-v1-15-e3f5f7de5dce%40gmail.com
patch subject: [PATCH 15/17] arm64: tegra: Add BPMP node for Tegra210
:::::: branch date: 27 hours ago
:::::: commit date: 27 hours ago
config: arm64-randconfig-051-20250716 (https://download.01.org/0day-ci/archive/20250716/202507161854.c1dJsJ04-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
dtschema version: 2025.6.2.dev4+g8f79ddd
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250716/202507161854.c1dJsJ04-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202507161854.c1dJsJ04-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/nvidia/tegra210-p2371-0000.dtb: /pcie@1003000: failed to match any schema with compatible: ['nvidia,tegra210-pcie']
   arch/arm64/boot/dts/nvidia/tegra210-p2371-0000.dtb: /host1x@50000000/tsec@54100000: failed to match any schema with compatible: ['nvidia,tegra210-tsec']
   arch/arm64/boot/dts/nvidia/tegra210-p2371-0000.dtb: /host1x@50000000/tsec@54500000: failed to match any schema with compatible: ['nvidia,tegra210-tsec']
   arch/arm64/boot/dts/nvidia/tegra210-p2371-0000.dtb: /gpu@57000000: failed to match any schema with compatible: ['nvidia,gm20b']
   arch/arm64/boot/dts/nvidia/tegra210-p2371-0000.dtb: /interrupt-controller@60004000: failed to match any schema with compatible: ['nvidia,tegra210-ictlr']
   arch/arm64/boot/dts/nvidia/tegra210-p2371-0000.dtb: /dma@60020000: failed to match any schema with compatible: ['nvidia,tegra210-apbdma', 'nvidia,tegra148-apbdma']
   arch/arm64/boot/dts/nvidia/tegra210-p2371-0000.dtb: /dma@60020000: failed to match any schema with compatible: ['nvidia,tegra210-apbdma', 'nvidia,tegra148-apbdma']
>> arch/arm64/boot/dts/nvidia/tegra210-p2371-0000.dtb: /bpmp@70016000: failed to match any schema with compatible: ['nvidia,tegra210-bpmp']
   arch/arm64/boot/dts/nvidia/tegra210-p2371-0000.dtb: /memory-controller@70019000: failed to match any schema with compatible: ['nvidia,tegra210-mc']
   arch/arm64/boot/dts/nvidia/tegra210-p2371-0000.dtb: external-memory-controller@7001b000 (nvidia,tegra210-emc): '#cooling-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/memory-controllers/nvidia,tegra210-emc.yaml#
   arch/arm64/boot/dts/nvidia/tegra210-p2371-0000.dtb: /clock@70110000: failed to match any schema with compatible: ['nvidia,tegra210-dfll']
   arch/arm64/boot/dts/nvidia/tegra210-p2371-0000.dtb: usb-phy@7d000000 (nvidia,tegra210-usb-phy): compatible: 'oneOf' conditional failed, one must be fixed:
   	['nvidia,tegra210-usb-phy', 'nvidia,tegra30-usb-phy'] is too long
   	'nvidia,tegra210-usb-phy' is not one of ['nvidia,tegra124-usb-phy', 'nvidia,tegra114-usb-phy']
   	'nvidia,tegra210-usb-phy' is not one of ['nvidia,tegra30-usb-phy', 'nvidia,tegra20-usb-phy']
   	from schema $id: http://devicetree.org/schemas/phy/nvidia,tegra20-usb-phy.yaml#
   arch/arm64/boot/dts/nvidia/tegra210-p2371-0000.dtb: /usb-phy@7d000000: failed to match any schema with compatible: ['nvidia,tegra210-usb-phy', 'nvidia,tegra30-usb-phy']
--
   arch/arm64/boot/dts/nvidia/tegra210-p2571.dtb: /pcie@1003000: failed to match any schema with compatible: ['nvidia,tegra210-pcie']
   arch/arm64/boot/dts/nvidia/tegra210-p2571.dtb: /host1x@50000000/tsec@54100000: failed to match any schema with compatible: ['nvidia,tegra210-tsec']
   arch/arm64/boot/dts/nvidia/tegra210-p2571.dtb: /host1x@50000000/tsec@54500000: failed to match any schema with compatible: ['nvidia,tegra210-tsec']
   arch/arm64/boot/dts/nvidia/tegra210-p2571.dtb: /gpu@57000000: failed to match any schema with compatible: ['nvidia,gm20b']
   arch/arm64/boot/dts/nvidia/tegra210-p2571.dtb: /interrupt-controller@60004000: failed to match any schema with compatible: ['nvidia,tegra210-ictlr']
   arch/arm64/boot/dts/nvidia/tegra210-p2571.dtb: /dma@60020000: failed to match any schema with compatible: ['nvidia,tegra210-apbdma', 'nvidia,tegra148-apbdma']
   arch/arm64/boot/dts/nvidia/tegra210-p2571.dtb: /dma@60020000: failed to match any schema with compatible: ['nvidia,tegra210-apbdma', 'nvidia,tegra148-apbdma']
>> arch/arm64/boot/dts/nvidia/tegra210-p2571.dtb: /bpmp@70016000: failed to match any schema with compatible: ['nvidia,tegra210-bpmp']
   arch/arm64/boot/dts/nvidia/tegra210-p2571.dtb: /memory-controller@70019000: failed to match any schema with compatible: ['nvidia,tegra210-mc']
   arch/arm64/boot/dts/nvidia/tegra210-p2571.dtb: external-memory-controller@7001b000 (nvidia,tegra210-emc): '#cooling-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/memory-controllers/nvidia,tegra210-emc.yaml#
   arch/arm64/boot/dts/nvidia/tegra210-p2571.dtb: /clock@70110000: failed to match any schema with compatible: ['nvidia,tegra210-dfll']
   arch/arm64/boot/dts/nvidia/tegra210-p2571.dtb: usb-phy@7d000000 (nvidia,tegra210-usb-phy): compatible: 'oneOf' conditional failed, one must be fixed:
   	['nvidia,tegra210-usb-phy', 'nvidia,tegra30-usb-phy'] is too long
   	'nvidia,tegra210-usb-phy' is not one of ['nvidia,tegra124-usb-phy', 'nvidia,tegra114-usb-phy']
   	'nvidia,tegra210-usb-phy' is not one of ['nvidia,tegra30-usb-phy', 'nvidia,tegra20-usb-phy']
   	from schema $id: http://devicetree.org/schemas/phy/nvidia,tegra20-usb-phy.yaml#
   arch/arm64/boot/dts/nvidia/tegra210-p2571.dtb: /usb-phy@7d000000: failed to match any schema with compatible: ['nvidia,tegra210-usb-phy', 'nvidia,tegra30-usb-phy']
--
   	from schema $id: http://devicetree.org/schemas/arm/tegra.yaml#
   arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dtb: /: failed to match any schema with compatible: ['nvidia,p3450-0000', 'nvidia,tegra210']
   arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dtb: /pcie@1003000: failed to match any schema with compatible: ['nvidia,tegra210-pcie']
   arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dtb: /host1x@50000000/tsec@54100000: failed to match any schema with compatible: ['nvidia,tegra210-tsec']
   arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dtb: /host1x@50000000/tsec@54500000: failed to match any schema with compatible: ['nvidia,tegra210-tsec']
   arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dtb: /gpu@57000000: failed to match any schema with compatible: ['nvidia,gm20b']
   arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dtb: /interrupt-controller@60004000: failed to match any schema with compatible: ['nvidia,tegra210-ictlr']
   arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dtb: /dma@60020000: failed to match any schema with compatible: ['nvidia,tegra210-apbdma', 'nvidia,tegra148-apbdma']
   arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dtb: /dma@60020000: failed to match any schema with compatible: ['nvidia,tegra210-apbdma', 'nvidia,tegra148-apbdma']
   arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dtb: /i2c@7000d000/pmic@3c: failed to match any schema with compatible: ['maxim,max77620']
>> arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dtb: /bpmp@70016000: failed to match any schema with compatible: ['nvidia,tegra210-bpmp']
   arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dtb: /memory-controller@70019000: failed to match any schema with compatible: ['nvidia,tegra210-mc']
   arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dtb: external-memory-controller@7001b000 (nvidia,tegra210-emc): '#cooling-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/memory-controllers/nvidia,tegra210-emc.yaml#
   arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dtb: /clock@70110000: failed to match any schema with compatible: ['nvidia,tegra210-dfll']
   arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dtb: usb-phy@7d000000 (nvidia,tegra210-usb-phy): compatible: 'oneOf' conditional failed, one must be fixed:
   	['nvidia,tegra210-usb-phy', 'nvidia,tegra30-usb-phy'] is too long
   	'nvidia,tegra210-usb-phy' is not one of ['nvidia,tegra124-usb-phy', 'nvidia,tegra114-usb-phy']
   	'nvidia,tegra210-usb-phy' is not one of ['nvidia,tegra30-usb-phy', 'nvidia,tegra20-usb-phy']
   	from schema $id: http://devicetree.org/schemas/phy/nvidia,tegra20-usb-phy.yaml#
   arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dtb: /usb-phy@7d000000: failed to match any schema with compatible: ['nvidia,tegra210-usb-phy', 'nvidia,tegra30-usb-phy']
--
   arch/arm64/boot/dts/nvidia/tegra210-smaug.dtb: /: failed to match any schema with compatible: ['google,smaug-rev8', 'google,smaug-rev7', 'google,smaug-rev6', 'google,smaug-rev5', 'google,smaug-rev4', 'google,smaug-rev3', 'google,smaug-rev2', 'google,smaug-rev1', 'google,smaug', 'nvidia,tegra210']
   arch/arm64/boot/dts/nvidia/tegra210-smaug.dtb: /: failed to match any schema with compatible: ['google,smaug-rev8', 'google,smaug-rev7', 'google,smaug-rev6', 'google,smaug-rev5', 'google,smaug-rev4', 'google,smaug-rev3', 'google,smaug-rev2', 'google,smaug-rev1', 'google,smaug', 'nvidia,tegra210']
   arch/arm64/boot/dts/nvidia/tegra210-smaug.dtb: /pcie@1003000: failed to match any schema with compatible: ['nvidia,tegra210-pcie']
   arch/arm64/boot/dts/nvidia/tegra210-smaug.dtb: /host1x@50000000/tsec@54100000: failed to match any schema with compatible: ['nvidia,tegra210-tsec']
   arch/arm64/boot/dts/nvidia/tegra210-smaug.dtb: /host1x@50000000/tsec@54500000: failed to match any schema with compatible: ['nvidia,tegra210-tsec']
   arch/arm64/boot/dts/nvidia/tegra210-smaug.dtb: /gpu@57000000: failed to match any schema with compatible: ['nvidia,gm20b']
   arch/arm64/boot/dts/nvidia/tegra210-smaug.dtb: /interrupt-controller@60004000: failed to match any schema with compatible: ['nvidia,tegra210-ictlr']
   arch/arm64/boot/dts/nvidia/tegra210-smaug.dtb: /dma@60020000: failed to match any schema with compatible: ['nvidia,tegra210-apbdma', 'nvidia,tegra148-apbdma']
   arch/arm64/boot/dts/nvidia/tegra210-smaug.dtb: /dma@60020000: failed to match any schema with compatible: ['nvidia,tegra210-apbdma', 'nvidia,tegra148-apbdma']
   arch/arm64/boot/dts/nvidia/tegra210-smaug.dtb: /i2c@7000d000/pmic@3c: failed to match any schema with compatible: ['maxim,max77620']
>> arch/arm64/boot/dts/nvidia/tegra210-smaug.dtb: /bpmp@70016000: failed to match any schema with compatible: ['nvidia,tegra210-bpmp']
   arch/arm64/boot/dts/nvidia/tegra210-smaug.dtb: /memory-controller@70019000: failed to match any schema with compatible: ['nvidia,tegra210-mc']
   arch/arm64/boot/dts/nvidia/tegra210-smaug.dtb: external-memory-controller@7001b000 (nvidia,tegra210-emc): '#cooling-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/memory-controllers/nvidia,tegra210-emc.yaml#
   arch/arm64/boot/dts/nvidia/tegra210-smaug.dtb: /clock@70110000: failed to match any schema with compatible: ['nvidia,tegra210-dfll']
   arch/arm64/boot/dts/nvidia/tegra210-smaug.dtb: usb-phy@7d000000 (nvidia,tegra210-usb-phy): compatible: 'oneOf' conditional failed, one must be fixed:
   	['nvidia,tegra210-usb-phy', 'nvidia,tegra30-usb-phy'] is too long
   	'nvidia,tegra210-usb-phy' is not one of ['nvidia,tegra124-usb-phy', 'nvidia,tegra114-usb-phy']
   	'nvidia,tegra210-usb-phy' is not one of ['nvidia,tegra30-usb-phy', 'nvidia,tegra20-usb-phy']
   	from schema $id: http://devicetree.org/schemas/phy/nvidia,tegra20-usb-phy.yaml#
   arch/arm64/boot/dts/nvidia/tegra210-smaug.dtb: /usb-phy@7d000000: failed to match any schema with compatible: ['nvidia,tegra210-usb-phy', 'nvidia,tegra30-usb-phy']
--
   	'nvidia,tegra210b01' was expected
   	from schema $id: http://devicetree.org/schemas/arm/tegra.yaml#
   arch/arm64/boot/dts/nvidia/tegra210-p2894-0050-a08.dtb: /pcie@1003000: failed to match any schema with compatible: ['nvidia,tegra210-pcie']
   arch/arm64/boot/dts/nvidia/tegra210-p2894-0050-a08.dtb: /host1x@50000000/tsec@54100000: failed to match any schema with compatible: ['nvidia,tegra210-tsec']
   arch/arm64/boot/dts/nvidia/tegra210-p2894-0050-a08.dtb: /host1x@50000000/tsec@54500000: failed to match any schema with compatible: ['nvidia,tegra210-tsec']
   arch/arm64/boot/dts/nvidia/tegra210-p2894-0050-a08.dtb: /gpu@57000000: failed to match any schema with compatible: ['nvidia,gm20b']
   arch/arm64/boot/dts/nvidia/tegra210-p2894-0050-a08.dtb: /interrupt-controller@60004000: failed to match any schema with compatible: ['nvidia,tegra210-ictlr']
   arch/arm64/boot/dts/nvidia/tegra210-p2894-0050-a08.dtb: /dma@60020000: failed to match any schema with compatible: ['nvidia,tegra210-apbdma', 'nvidia,tegra148-apbdma']
   arch/arm64/boot/dts/nvidia/tegra210-p2894-0050-a08.dtb: /dma@60020000: failed to match any schema with compatible: ['nvidia,tegra210-apbdma', 'nvidia,tegra148-apbdma']
   arch/arm64/boot/dts/nvidia/tegra210-p2894-0050-a08.dtb: /i2c@7000d000/pmic@3c: failed to match any schema with compatible: ['maxim,max77620']
>> arch/arm64/boot/dts/nvidia/tegra210-p2894-0050-a08.dtb: /bpmp@70016000: failed to match any schema with compatible: ['nvidia,tegra210-bpmp']
   arch/arm64/boot/dts/nvidia/tegra210-p2894-0050-a08.dtb: /memory-controller@70019000: failed to match any schema with compatible: ['nvidia,tegra210-mc']
   arch/arm64/boot/dts/nvidia/tegra210-p2894-0050-a08.dtb: external-memory-controller@7001b000 (nvidia,tegra210-emc): '#cooling-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/memory-controllers/nvidia,tegra210-emc.yaml#
   arch/arm64/boot/dts/nvidia/tegra210-p2894-0050-a08.dtb: /clock@70110000: failed to match any schema with compatible: ['nvidia,tegra210-dfll']
   arch/arm64/boot/dts/nvidia/tegra210-p2894-0050-a08.dtb: usb-phy@7d000000 (nvidia,tegra210-usb-phy): compatible: 'oneOf' conditional failed, one must be fixed:
   	['nvidia,tegra210-usb-phy', 'nvidia,tegra30-usb-phy'] is too long
   	'nvidia,tegra210-usb-phy' is not one of ['nvidia,tegra124-usb-phy', 'nvidia,tegra114-usb-phy']
   	'nvidia,tegra210-usb-phy' is not one of ['nvidia,tegra30-usb-phy', 'nvidia,tegra20-usb-phy']
   	from schema $id: http://devicetree.org/schemas/phy/nvidia,tegra20-usb-phy.yaml#
   arch/arm64/boot/dts/nvidia/tegra210-p2894-0050-a08.dtb: /usb-phy@7d000000: failed to match any schema with compatible: ['nvidia,tegra210-usb-phy', 'nvidia,tegra30-usb-phy']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
