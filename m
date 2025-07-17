Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4FB41B983F
	for <oe-kbuild@lists.linux.dev>; Thu, 17 Jul 2025 02:11:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752718272; cv=none; b=TTDBMUbE7LUDEelyJI4Vnc7QNUxn1Yc2LhvuaTcTnGDniW0VIWyZqlr9exOkGiMVyyzFoZedr3N5+BpDBVL7y4zKc+/IVy3ID2tuH34cLj9nvovRjc0fXwH9Makg8dzGzNGrn5/hao3jYphRFkdlUb77RO4Fjb/kxYo/7ieEENQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752718272; c=relaxed/simple;
	bh=dT9h3solMZyRNWN/NmPJNihogjSmirmqkrmhunOmS3s=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HGgWbnaL5rPqiRkScU239Qj2fuk8vVK6N4ityxqQYT0M/LAQYxKIjVRsOK6fCMuavMPofrfu9Zdp+Ry1eu4FrS/FBixfMbSv5t0d8elEFyk4/8Ws108bNiyd5uB9rLd+R39PcvNdZdS9AUsVTVKA0VZq1yOmbCgk2Q+fQJJPmQY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=j0wkTW6e; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="j0wkTW6e"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752718271; x=1784254271;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=dT9h3solMZyRNWN/NmPJNihogjSmirmqkrmhunOmS3s=;
  b=j0wkTW6ekFAnEEBCCd4kHk6N7vZ9mfA3/Ku/+a3h12RspU5QzRkJ3NJQ
   MU5Qh7eWKpuD8Y8beAnr30U9mCk1igwIyjLDVwR1FlUKCMRJdVQHCnBtM
   lsjBM56wXzuArzPeSRHVCEWqyU544RkDjjSrCiNYrIZ0TBRv4Au6AophJ
   g5gHXH1krfdruMd/b9Cx1hR66cvvT5KAgt5usw98l+AhhPX17u/Hs/2Lq
   h7mz2rdWOvnwLpZ/y5UzTxxZGqJXQlZ38hxgjON67iTPeJ7ypgMrBUUSp
   2ztqjI3WygMuVMInIG35/8o5CGwxpOy0+mQiXHH2cMBjo3pIQ3NKB2eZn
   A==;
X-CSE-ConnectionGUID: WZJwNWdFTSeluWrjm5UqmQ==
X-CSE-MsgGUID: drIdN8/ISY6snF/Uz4pF/w==
X-IronPort-AV: E=McAfee;i="6800,10657,11493"; a="54088397"
X-IronPort-AV: E=Sophos;i="6.16,317,1744095600"; 
   d="scan'208";a="54088397"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jul 2025 19:11:10 -0700
X-CSE-ConnectionGUID: Ge2T9ow2QwWT+ojL2w75cQ==
X-CSE-MsgGUID: uwsmx1K4SRakb4c2zSJNcg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,317,1744095600"; 
   d="scan'208";a="157735085"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 16 Jul 2025 19:11:09 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ucE5S-000D3n-1e;
	Thu, 17 Jul 2025 02:11:06 +0000
Date: Thu, 17 Jul 2025 10:10:25 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH 17/17] arm64: tegra: Add support for NVIDIA Shield TV Pro
 2019
Message-ID: <202507171017.TTPR8EdF-lkp@intel.com>
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
In-Reply-To: <20250714-t210b01-v1-17-e3f5f7de5dce@gmail.com>
References: <20250714-t210b01-v1-17-e3f5f7de5dce@gmail.com>
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
patch link:    https://lore.kernel.org/r/20250714-t210b01-v1-17-e3f5f7de5dce%40gmail.com
patch subject: [PATCH 17/17] arm64: tegra: Add support for NVIDIA Shield TV Pro 2019
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: arm64-randconfig-051-20250716 (https://download.01.org/0day-ci/archive/20250717/202507171017.TTPR8EdF-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
dtschema version: 2025.6.2.dev4+g8f79ddd
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250717/202507171017.TTPR8EdF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202507171017.TTPR8EdF-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/nvidia/tegra210b01-p2894-0050-a08.dtb: /pcie@1003000: failed to match any schema with compatible: ['nvidia,tegra210-pcie']
>> arch/arm64/boot/dts/nvidia/tegra210b01-p2894-0050-a08.dtb: /host1x@50000000/tsec@54100000: failed to match any schema with compatible: ['nvidia,tegra210-tsec']
   arch/arm64/boot/dts/nvidia/tegra210b01-p2894-0050-a08.dtb: /host1x@50000000/tsec@54500000: failed to match any schema with compatible: ['nvidia,tegra210-tsec']
>> arch/arm64/boot/dts/nvidia/tegra210b01-p2894-0050-a08.dtb: /gpu@57000000: failed to match any schema with compatible: ['nvidia,gm20b']
>> arch/arm64/boot/dts/nvidia/tegra210b01-p2894-0050-a08.dtb: /interrupt-controller@60004000: failed to match any schema with compatible: ['nvidia,tegra210-ictlr']
>> arch/arm64/boot/dts/nvidia/tegra210b01-p2894-0050-a08.dtb: /dma@60020000: failed to match any schema with compatible: ['nvidia,tegra210-apbdma', 'nvidia,tegra148-apbdma']
>> arch/arm64/boot/dts/nvidia/tegra210b01-p2894-0050-a08.dtb: /dma@60020000: failed to match any schema with compatible: ['nvidia,tegra210-apbdma', 'nvidia,tegra148-apbdma']
>> arch/arm64/boot/dts/nvidia/tegra210b01-p2894-0050-a08.dtb: /bpmp@70016000: failed to match any schema with compatible: ['nvidia,tegra210-bpmp']
>> arch/arm64/boot/dts/nvidia/tegra210b01-p2894-0050-a08.dtb: /memory-controller@70019000: failed to match any schema with compatible: ['nvidia,tegra210-mc']
>> arch/arm64/boot/dts/nvidia/tegra210b01-p2894-0050-a08.dtb: external-memory-controller@7001b000 (nvidia,tegra210-emc): '#cooling-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/memory-controllers/nvidia,tegra210-emc.yaml#
>> arch/arm64/boot/dts/nvidia/tegra210b01-p2894-0050-a08.dtb: /clock@70110000: failed to match any schema with compatible: ['nvidia,tegra210b01-dfll']
>> arch/arm64/boot/dts/nvidia/tegra210b01-p2894-0050-a08.dtb: usb-phy@7d000000 (nvidia,tegra210-usb-phy): compatible: 'oneOf' conditional failed, one must be fixed:
   	['nvidia,tegra210-usb-phy', 'nvidia,tegra30-usb-phy'] is too long
   	'nvidia,tegra210-usb-phy' is not one of ['nvidia,tegra124-usb-phy', 'nvidia,tegra114-usb-phy']
   	'nvidia,tegra210-usb-phy' is not one of ['nvidia,tegra30-usb-phy', 'nvidia,tegra20-usb-phy']
   	from schema $id: http://devicetree.org/schemas/phy/nvidia,tegra20-usb-phy.yaml#
>> arch/arm64/boot/dts/nvidia/tegra210b01-p2894-0050-a08.dtb: /usb-phy@7d000000: failed to match any schema with compatible: ['nvidia,tegra210-usb-phy', 'nvidia,tegra30-usb-phy']
>> arch/arm64/boot/dts/nvidia/tegra210b01-p2894-0050-a08.dtb: usb-phy@7d004000 (nvidia,tegra210-usb-phy): compatible: 'oneOf' conditional failed, one must be fixed:
   	['nvidia,tegra210-usb-phy', 'nvidia,tegra30-usb-phy'] is too long
   	'nvidia,tegra210-usb-phy' is not one of ['nvidia,tegra124-usb-phy', 'nvidia,tegra114-usb-phy']
   	'nvidia,tegra210-usb-phy' is not one of ['nvidia,tegra30-usb-phy', 'nvidia,tegra20-usb-phy']
   	from schema $id: http://devicetree.org/schemas/phy/nvidia,tegra20-usb-phy.yaml#
>> arch/arm64/boot/dts/nvidia/tegra210b01-p2894-0050-a08.dtb: /usb-phy@7d004000: failed to match any schema with compatible: ['nvidia,tegra210-usb-phy', 'nvidia,tegra30-usb-phy']
>> arch/arm64/boot/dts/nvidia/tegra210b01-p2894-0050-a08.dtb: cpu@0 (arm,cortex-a57): 'operating-points' is a dependency of 'clock-latency'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
>> arch/arm64/boot/dts/nvidia/tegra210b01-p2894-0050-a08.dtb: cpu@0 (arm,cortex-a57): Unevaluated properties are not allowed ('clock-latency' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
>> arch/arm64/boot/dts/nvidia/tegra210b01-p2894-0050-a08.dtb: thermal-zones: mem-thermal:cooling-maps: 'dram-active', 'dram-passive' do not match any of the regexes: '^map[-a-zA-Z0-9]*$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
