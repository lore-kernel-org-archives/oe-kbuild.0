Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95FCF1D6DB5
	for <oe-kbuild@lists.linux.dev>; Thu, 23 Oct 2025 02:47:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761187664; cv=none; b=OAdISR/UM1EiaHKKYvkgEXqWPqL5RLaFAZVerXNHdN3RkszwsNJktXTci/d2NQuOXmhV/RkkfwCkdUneN0nFbxKcwDuHwqU22ec0eNzzSO0sIcI/TE2nkmDvHtQQPZmepEHvwAkoQXn59tsJMMpYpq1SA8gRY8mjJY1sm72bQ9g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761187664; c=relaxed/simple;
	bh=aUfA4MRZ7OpC4bpE3XG6wgvDqbHIAKgs+Yb18PvbDUg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=YK+ZnFCkrTeN2Cag9/SKMfdi0QXM6BW44OqAG+DHtadJGXygxWI+dW4URPWloMhgqEafeGUvJHS5aptQWTUltlo05Ea11kPS3pAcpRKzWjAU6Hhr7Q+q1kcThJLM8BuQzJ7y91ATzW6foIChwuGbZ1vuAMFQSMXERbNVwDxg7vc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fadcqxyW; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fadcqxyW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761187663; x=1792723663;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=aUfA4MRZ7OpC4bpE3XG6wgvDqbHIAKgs+Yb18PvbDUg=;
  b=fadcqxyW0psltEof8ZG3EUW329RTQdGP8DEauifaIsy15ZqL4WxGIM0b
   nMQ9mGedyE1U4oXUEP+w6Tnd6s2vXdW10vvKgoV1NeGE+EwukLu3LW6Ck
   FssT7dx1tC9WNzuLrxId80xt4wg8AXNWBESXJl/ZSo3izo5HgpB5Q9jSQ
   PkNT4yigIv/mZnDAEVhK3NrB+aQw78UIzR+vkpx3PPtmuAMJyCUtBXYAa
   4sfGxdpD1vJ7y9ldwAC30PF9/O4X5IH9bF27bQ+Rqx3nANRFHmevccRPy
   O6QEa/Ei1X7tGF5rdkNjOnhtp7SQw+hr6GBcFX5Pv50gJA7vlGWIVmRwe
   g==;
X-CSE-ConnectionGUID: 9dmu9QBsQc6igrHg9uiB4g==
X-CSE-MsgGUID: blmR+U6NSiSKd9oemG7StA==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="66991893"
X-IronPort-AV: E=Sophos;i="6.19,248,1754982000"; 
   d="scan'208";a="66991893"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Oct 2025 19:47:43 -0700
X-CSE-ConnectionGUID: 9FPnJ4wQReymJct0pJeI7Q==
X-CSE-MsgGUID: 4uSs7oJBTK2EWCJJ0401mg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,248,1754982000"; 
   d="scan'208";a="183932543"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa007.jf.intel.com with ESMTP; 22 Oct 2025 19:47:40 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vBlMY-000Cwz-1s;
	Thu, 23 Oct 2025 02:47:38 +0000
Date: Thu, 23 Oct 2025 10:46:57 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v5 1/3] arm64: tegra: tegra210: Add actmon
Message-ID: <202510231048.afxWlKtw-lkp@intel.com>
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
In-Reply-To: <20251021-t210-actmon-p4-v5-1-4a4dbc49fbc8@gmail.com>
References: <20251021-t210-actmon-p4-v5-1-4a4dbc49fbc8@gmail.com>
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

[auto build test WARNING on 211ddde0823f1442e4ad052a2f30f050145ccada]

url:    https://github.com/intel-lab-lkp/linux/commits/Aaron-Kling-via-B4-Relay/arm64-tegra-tegra210-Add-actmon/20251022-111535
base:   211ddde0823f1442e4ad052a2f30f050145ccada
patch link:    https://lore.kernel.org/r/20251021-t210-actmon-p4-v5-1-4a4dbc49fbc8%40gmail.com
patch subject: [PATCH v5 1/3] arm64: tegra: tegra210: Add actmon
:::::: branch date: 24 hours ago
:::::: commit date: 24 hours ago
config: arm64-randconfig-052-20251023 (https://download.01.org/0day-ci/archive/20251023/202510231048.afxWlKtw-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 754ebc6ebb9fb9fbee7aef33478c74ea74949853)
dtschema version: 2025.9.dev7+g3b6fdac89
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251023/202510231048.afxWlKtw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202510231048.afxWlKtw-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/nvidia/tegra210.dtsi:31.3-41: Warning (interrupt_map): /pcie@1003000:interrupt-map: Missing property '#address-cells' in node /interrupt-controller@50041000, using 0 as fallback
   arch/arm64/boot/dts/nvidia/tegra210-p2371-0000.dtb: /pcie@1003000: failed to match any schema with compatible: ['nvidia,tegra210-pcie']
   arch/arm64/boot/dts/nvidia/tegra210-p2371-0000.dtb: /host1x@50000000/tsec@54100000: failed to match any schema with compatible: ['nvidia,tegra210-tsec']
   arch/arm64/boot/dts/nvidia/tegra210-p2371-0000.dtb: /host1x@50000000/tsec@54500000: failed to match any schema with compatible: ['nvidia,tegra210-tsec']
   arch/arm64/boot/dts/nvidia/tegra210-p2371-0000.dtb: /interrupt-controller@60004000: failed to match any schema with compatible: ['nvidia,tegra210-ictlr']
>> arch/arm64/boot/dts/nvidia/tegra210-p2371-0000.dtb: actmon@6000c800 (nvidia,tegra210-actmon): compatible: ['nvidia,tegra210-actmon', 'nvidia,tegra124-actmon'] is too long
   	from schema $id: http://devicetree.org/schemas/devfreq/nvidia,tegra30-actmon.yaml#
   arch/arm64/boot/dts/nvidia/tegra210-p2371-0000.dtb: actmon@6000c800 (nvidia,tegra210-actmon): 'interconnects' is a required property
   	from schema $id: http://devicetree.org/schemas/devfreq/nvidia,tegra30-actmon.yaml#
   arch/arm64/boot/dts/nvidia/tegra210-p2371-0000.dtb: actmon@6000c800 (nvidia,tegra210-actmon): 'interconnect-names' is a required property
   	from schema $id: http://devicetree.org/schemas/devfreq/nvidia,tegra30-actmon.yaml#
   arch/arm64/boot/dts/nvidia/tegra210-p2371-0000.dtb: actmon@6000c800 (nvidia,tegra210-actmon): 'operating-points-v2' is a required property
   	from schema $id: http://devicetree.org/schemas/devfreq/nvidia,tegra30-actmon.yaml#
   arch/arm64/boot/dts/nvidia/tegra210-p2371-0000.dtb: dma@60020000 (nvidia,tegra210-apbdma): $nodename:0: 'dma@60020000' does not match '^dma-controller(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/dma/nvidia,tegra20-apbdma.yaml#
   arch/arm64/boot/dts/nvidia/tegra210-p2371-0000.dtb: /memory-controller@70019000: failed to match any schema with compatible: ['nvidia,tegra210-mc']
--
   arch/arm64/boot/dts/nvidia/tegra210.dtsi:31.3-41: Warning (interrupt_map): /pcie@1003000:interrupt-map: Missing property '#address-cells' in node /interrupt-controller@50041000, using 0 as fallback
   arch/arm64/boot/dts/nvidia/tegra210-p2571.dtb: /pcie@1003000: failed to match any schema with compatible: ['nvidia,tegra210-pcie']
   arch/arm64/boot/dts/nvidia/tegra210-p2571.dtb: /host1x@50000000/tsec@54100000: failed to match any schema with compatible: ['nvidia,tegra210-tsec']
   arch/arm64/boot/dts/nvidia/tegra210-p2571.dtb: /host1x@50000000/tsec@54500000: failed to match any schema with compatible: ['nvidia,tegra210-tsec']
   arch/arm64/boot/dts/nvidia/tegra210-p2571.dtb: /interrupt-controller@60004000: failed to match any schema with compatible: ['nvidia,tegra210-ictlr']
>> arch/arm64/boot/dts/nvidia/tegra210-p2571.dtb: actmon@6000c800 (nvidia,tegra210-actmon): compatible: ['nvidia,tegra210-actmon', 'nvidia,tegra124-actmon'] is too long
   	from schema $id: http://devicetree.org/schemas/devfreq/nvidia,tegra30-actmon.yaml#
   arch/arm64/boot/dts/nvidia/tegra210-p2571.dtb: actmon@6000c800 (nvidia,tegra210-actmon): 'interconnects' is a required property
   	from schema $id: http://devicetree.org/schemas/devfreq/nvidia,tegra30-actmon.yaml#
   arch/arm64/boot/dts/nvidia/tegra210-p2571.dtb: actmon@6000c800 (nvidia,tegra210-actmon): 'interconnect-names' is a required property
   	from schema $id: http://devicetree.org/schemas/devfreq/nvidia,tegra30-actmon.yaml#
   arch/arm64/boot/dts/nvidia/tegra210-p2571.dtb: actmon@6000c800 (nvidia,tegra210-actmon): 'operating-points-v2' is a required property
   	from schema $id: http://devicetree.org/schemas/devfreq/nvidia,tegra30-actmon.yaml#
   arch/arm64/boot/dts/nvidia/tegra210-p2571.dtb: dma@60020000 (nvidia,tegra210-apbdma): $nodename:0: 'dma@60020000' does not match '^dma-controller(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/dma/nvidia,tegra20-apbdma.yaml#
   arch/arm64/boot/dts/nvidia/tegra210-p2571.dtb: /memory-controller@70019000: failed to match any schema with compatible: ['nvidia,tegra210-mc']
--
   	'nvidia,p3701-0008' was expected
   	'nvidia,p3834-0008' was expected
   	from schema $id: http://devicetree.org/schemas/arm/tegra.yaml#
   arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dtb: /: failed to match any schema with compatible: ['nvidia,p3450-0000', 'nvidia,tegra210']
   arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dtb: /pcie@1003000: failed to match any schema with compatible: ['nvidia,tegra210-pcie']
   arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dtb: vi@54080000 (nvidia,tegra210-vi): 'avdd-dsi-csi-supply' does not match any of the regexes: '^csi@[0-9a-f]+$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/display/tegra/nvidia,tegra20-vi.yaml#
   arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dtb: /host1x@50000000/tsec@54100000: failed to match any schema with compatible: ['nvidia,tegra210-tsec']
   arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dtb: /host1x@50000000/tsec@54500000: failed to match any schema with compatible: ['nvidia,tegra210-tsec']
   arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dtb: /interrupt-controller@60004000: failed to match any schema with compatible: ['nvidia,tegra210-ictlr']
>> arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dtb: actmon@6000c800 (nvidia,tegra210-actmon): compatible: ['nvidia,tegra210-actmon', 'nvidia,tegra124-actmon'] is too long
   	from schema $id: http://devicetree.org/schemas/devfreq/nvidia,tegra30-actmon.yaml#
   arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dtb: actmon@6000c800 (nvidia,tegra210-actmon): 'interconnects' is a required property
   	from schema $id: http://devicetree.org/schemas/devfreq/nvidia,tegra30-actmon.yaml#
   arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dtb: actmon@6000c800 (nvidia,tegra210-actmon): 'interconnect-names' is a required property
   	from schema $id: http://devicetree.org/schemas/devfreq/nvidia,tegra30-actmon.yaml#
   arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dtb: actmon@6000c800 (nvidia,tegra210-actmon): 'operating-points-v2' is a required property
   	from schema $id: http://devicetree.org/schemas/devfreq/nvidia,tegra30-actmon.yaml#
   arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dtb: dma@60020000 (nvidia,tegra210-apbdma): $nodename:0: 'dma@60020000' does not match '^dma-controller(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/dma/nvidia,tegra20-apbdma.yaml#
   arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dtb: pmic@3c (maxim,max77620): '#interrupt-cells', 'fps', 'interrupt-controller', 'interrupt-parent', 'interrupts', 'pinmux', 'regulators' do not match any of the regexes: '^(hog-[0-9]+|.+-hog(-[0-9]+)?)$', '^pinctrl-[0-9]+$'
--
   arch/arm64/boot/dts/nvidia/tegra210-smaug.dtb: /: failed to match any schema with compatible: ['google,smaug-rev8', 'google,smaug-rev7', 'google,smaug-rev6', 'google,smaug-rev5', 'google,smaug-rev4', 'google,smaug-rev3', 'google,smaug-rev2', 'google,smaug-rev1', 'google,smaug', 'nvidia,tegra210']
   arch/arm64/boot/dts/nvidia/tegra210-smaug.dtb: /: failed to match any schema with compatible: ['google,smaug-rev8', 'google,smaug-rev7', 'google,smaug-rev6', 'google,smaug-rev5', 'google,smaug-rev4', 'google,smaug-rev3', 'google,smaug-rev2', 'google,smaug-rev1', 'google,smaug', 'nvidia,tegra210']
   arch/arm64/boot/dts/nvidia/tegra210-smaug.dtb: /: failed to match any schema with compatible: ['google,smaug-rev8', 'google,smaug-rev7', 'google,smaug-rev6', 'google,smaug-rev5', 'google,smaug-rev4', 'google,smaug-rev3', 'google,smaug-rev2', 'google,smaug-rev1', 'google,smaug', 'nvidia,tegra210']
   arch/arm64/boot/dts/nvidia/tegra210-smaug.dtb: /: failed to match any schema with compatible: ['google,smaug-rev8', 'google,smaug-rev7', 'google,smaug-rev6', 'google,smaug-rev5', 'google,smaug-rev4', 'google,smaug-rev3', 'google,smaug-rev2', 'google,smaug-rev1', 'google,smaug', 'nvidia,tegra210']
   arch/arm64/boot/dts/nvidia/tegra210-smaug.dtb: /: failed to match any schema with compatible: ['google,smaug-rev8', 'google,smaug-rev7', 'google,smaug-rev6', 'google,smaug-rev5', 'google,smaug-rev4', 'google,smaug-rev3', 'google,smaug-rev2', 'google,smaug-rev1', 'google,smaug', 'nvidia,tegra210']
   arch/arm64/boot/dts/nvidia/tegra210-smaug.dtb: /: failed to match any schema with compatible: ['google,smaug-rev8', 'google,smaug-rev7', 'google,smaug-rev6', 'google,smaug-rev5', 'google,smaug-rev4', 'google,smaug-rev3', 'google,smaug-rev2', 'google,smaug-rev1', 'google,smaug', 'nvidia,tegra210']
   arch/arm64/boot/dts/nvidia/tegra210-smaug.dtb: /pcie@1003000: failed to match any schema with compatible: ['nvidia,tegra210-pcie']
   arch/arm64/boot/dts/nvidia/tegra210-smaug.dtb: /host1x@50000000/tsec@54100000: failed to match any schema with compatible: ['nvidia,tegra210-tsec']
   arch/arm64/boot/dts/nvidia/tegra210-smaug.dtb: /host1x@50000000/tsec@54500000: failed to match any schema with compatible: ['nvidia,tegra210-tsec']
   arch/arm64/boot/dts/nvidia/tegra210-smaug.dtb: /interrupt-controller@60004000: failed to match any schema with compatible: ['nvidia,tegra210-ictlr']
>> arch/arm64/boot/dts/nvidia/tegra210-smaug.dtb: actmon@6000c800 (nvidia,tegra210-actmon): compatible: ['nvidia,tegra210-actmon', 'nvidia,tegra124-actmon'] is too long
   	from schema $id: http://devicetree.org/schemas/devfreq/nvidia,tegra30-actmon.yaml#
   arch/arm64/boot/dts/nvidia/tegra210-smaug.dtb: actmon@6000c800 (nvidia,tegra210-actmon): 'interconnects' is a required property
   	from schema $id: http://devicetree.org/schemas/devfreq/nvidia,tegra30-actmon.yaml#
   arch/arm64/boot/dts/nvidia/tegra210-smaug.dtb: actmon@6000c800 (nvidia,tegra210-actmon): 'interconnect-names' is a required property
   	from schema $id: http://devicetree.org/schemas/devfreq/nvidia,tegra30-actmon.yaml#
   arch/arm64/boot/dts/nvidia/tegra210-smaug.dtb: actmon@6000c800 (nvidia,tegra210-actmon): 'operating-points-v2' is a required property
   	from schema $id: http://devicetree.org/schemas/devfreq/nvidia,tegra30-actmon.yaml#
   arch/arm64/boot/dts/nvidia/tegra210-smaug.dtb: dma@60020000 (nvidia,tegra210-apbdma): $nodename:0: 'dma@60020000' does not match '^dma-controller(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/dma/nvidia,tegra20-apbdma.yaml#
   arch/arm64/boot/dts/nvidia/tegra210-smaug.dtb: pmic@3c (maxim,max77620): '#interrupt-cells', 'fps', 'interrupt-controller', 'interrupts', 'pinmux', 'regulators' do not match any of the regexes: '^(hog-[0-9]+|.+-hog(-[0-9]+)?)$', '^pinctrl-[0-9]+$'
--
   	'toradex,apalis-tk1-v1.2' was expected
   	'google,nyan-blaze-rev8' was expected
   	'google,nyan-big-rev8' was expected
   	'google,nyan-big-rev5' was expected
   	'nvidia,tegra264' was expected
   	from schema $id: http://devicetree.org/schemas/arm/tegra.yaml#
   arch/arm64/boot/dts/nvidia/tegra210-p2894-0050-a08.dtb: /pcie@1003000: failed to match any schema with compatible: ['nvidia,tegra210-pcie']
   arch/arm64/boot/dts/nvidia/tegra210-p2894-0050-a08.dtb: /host1x@50000000/tsec@54100000: failed to match any schema with compatible: ['nvidia,tegra210-tsec']
   arch/arm64/boot/dts/nvidia/tegra210-p2894-0050-a08.dtb: /host1x@50000000/tsec@54500000: failed to match any schema with compatible: ['nvidia,tegra210-tsec']
   arch/arm64/boot/dts/nvidia/tegra210-p2894-0050-a08.dtb: /interrupt-controller@60004000: failed to match any schema with compatible: ['nvidia,tegra210-ictlr']
>> arch/arm64/boot/dts/nvidia/tegra210-p2894-0050-a08.dtb: actmon@6000c800 (nvidia,tegra210-actmon): compatible: ['nvidia,tegra210-actmon', 'nvidia,tegra124-actmon'] is too long
   	from schema $id: http://devicetree.org/schemas/devfreq/nvidia,tegra30-actmon.yaml#
   arch/arm64/boot/dts/nvidia/tegra210-p2894-0050-a08.dtb: actmon@6000c800 (nvidia,tegra210-actmon): 'interconnects' is a required property
   	from schema $id: http://devicetree.org/schemas/devfreq/nvidia,tegra30-actmon.yaml#
   arch/arm64/boot/dts/nvidia/tegra210-p2894-0050-a08.dtb: actmon@6000c800 (nvidia,tegra210-actmon): 'interconnect-names' is a required property
   	from schema $id: http://devicetree.org/schemas/devfreq/nvidia,tegra30-actmon.yaml#
   arch/arm64/boot/dts/nvidia/tegra210-p2894-0050-a08.dtb: actmon@6000c800 (nvidia,tegra210-actmon): 'operating-points-v2' is a required property
   	from schema $id: http://devicetree.org/schemas/devfreq/nvidia,tegra30-actmon.yaml#
   arch/arm64/boot/dts/nvidia/tegra210-p2894-0050-a08.dtb: dma@60020000 (nvidia,tegra210-apbdma): $nodename:0: 'dma@60020000' does not match '^dma-controller(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/dma/nvidia,tegra20-apbdma.yaml#
   arch/arm64/boot/dts/nvidia/tegra210-p2894-0050-a08.dtb: pmic@3c (maxim,max77620): '#interrupt-cells', 'fps', 'interrupt-controller', 'interrupts', 'pinmux', 'regulators' do not match any of the regexes: '^(hog-[0-9]+|.+-hog(-[0-9]+)?)$', '^pinctrl-[0-9]+$'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
