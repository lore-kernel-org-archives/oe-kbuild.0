Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05BE9EACE
	for <oe-kbuild@lists.linux.dev>; Sat, 24 Jan 2026 05:46:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769233615; cv=none; b=Mf+CAMjGV4Kjnz+RpbWSa/lQVt3bAV3CHxqGyaBN6xsviE8QQ7SuYkRamawasTFE4Pqt3/mMQ2B9DNyyIEL3ng8NnC3e9nnqVWzUS+J3cMRNwUqnXI7WQr1z6OtNjvxGYltA0UphcW6dRMsHqM2UqVVgNBRAO8gc2XkU8neZHLI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769233615; c=relaxed/simple;
	bh=Y8s1KIzYvE13n8Ol7OctIwfcgQXjS6i9XPFXOX9xtR4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=LoAPNWIyv1/zcrgjy6CY2fkbFG8LctOk3SlqknWKse2Kgt+JZVTBoZfG2BREKQkMVlJxI/ilmE7Yxf714rbtt2NPaCNqZXEO6PBap8lIphjcya+RccWqfh24BVnZNcN+49VOHZJ8IeD86J8gyojBtiZ6DFn9rebEefNyGKRj2uM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fSPLM/+f; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fSPLM/+f"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769233613; x=1800769613;
  h=date:from:to:cc:subject:message-id;
  bh=Y8s1KIzYvE13n8Ol7OctIwfcgQXjS6i9XPFXOX9xtR4=;
  b=fSPLM/+fcrB1Mz6AhuvFrZ0vOiyMsXrPCeeCzvSCLMyi20ODkqUBOcwy
   3WlhGiKXm5EeCQD7D9xdP+Q7ZJ2xMftylljoGF7+hnVjlk4V0iu8sODZS
   wSuOba8JjHnqAt8h5qwLA204cEauh4ymOp9TcUqTfxKZfC3XjV9/kqEAC
   zol5C0iuwufuy35V/wBPVEBpPdWOSD4G3N0zurHDhvbjdQsqWpjnSdKKh
   ffcVH6GxCsowHTUomk6GEHftx7WH6aFPcSt2S6TQfcNFPX0QBfTWcw+FV
   43VFOKrPfQPEm4Qjo11EJVsRfC606r3qbhj9dl+i1drYf6yh74xH3BpS9
   w==;
X-CSE-ConnectionGUID: 42J94VgpSd+CX/AgtAVfqQ==
X-CSE-MsgGUID: guURMdcpQXGJmrxoJIGWvA==
X-IronPort-AV: E=McAfee;i="6800,10657,11680"; a="74111739"
X-IronPort-AV: E=Sophos;i="6.21,249,1763452800"; 
   d="scan'208";a="74111739"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2026 21:46:53 -0800
X-CSE-ConnectionGUID: jln0qY8PRciXD/2HC4USVQ==
X-CSE-MsgGUID: 03WFO+I0ScSUHHbneEGkqg==
X-ExtLoop1: 1
Received: from igk-lkp-server01.igk.intel.com (HELO afc5bfd7f602) ([10.211.93.152])
  by fmviesa003.fm.intel.com with ESMTP; 23 Jan 2026 21:46:51 -0800
Received: from kbuild by afc5bfd7f602 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vjWTx-000000000t3-1kaA;
	Sat, 24 Jan 2026 05:46:49 +0000
Date: Sat, 24 Jan 2026 06:46:06 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: arch/arm64/boot/dts/nvidia/tegra210-smaug.dtb: cpu@0
 (arm,cortex-a57): 'operating-points' is a dependency of 'clock-latency'
Message-ID: <202601240631.HdrFcmGH-lkp@intel.com>
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
TO: "Rob Herring (Arm)" <robh@kernel.org>
CC: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
CC: Sudeep Holla <sudeep.holla@arm.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   62085877ae6592be830c2267e35dc469cb706308
commit: 80728bfa8c79b81eeea305f555fe5582d1907286 dt-bindings: arm/cpus: Add missing properties
date:   9 months ago
:::::: branch date: 7 hours ago
:::::: commit date: 9 months ago
config: arm64-randconfig-2052-20260123 (https://download.01.org/0day-ci/archive/20260124/202601240631.HdrFcmGH-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
dtschema version: 2025.13.dev4+g85cec3155
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260124/202601240631.HdrFcmGH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202601240631.HdrFcmGH-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   	'nvidia,tegra210-usb-phy' is not one of ['nvidia,tegra124-usb-phy', 'nvidia,tegra114-usb-phy']
   	'nvidia,tegra210-usb-phy' is not one of ['nvidia,tegra30-usb-phy', 'nvidia,tegra20-usb-phy']
   	from schema $id: http://devicetree.org/schemas/phy/nvidia,tegra20-usb-phy.yaml
   arch/arm64/boot/dts/nvidia/tegra210-smaug.dtb: /usb-phy@7d000000: failed to match any schema with compatible: ['nvidia,tegra210-usb-phy', 'nvidia,tegra30-usb-phy']
   arch/arm64/boot/dts/nvidia/tegra210-smaug.dtb: usb-phy@7d004000 (nvidia,tegra210-usb-phy): compatible: 'oneOf' conditional failed, one must be fixed:
   	['nvidia,tegra210-usb-phy', 'nvidia,tegra30-usb-phy'] is too long
   	'nvidia,tegra210-usb-phy' is not one of ['nvidia,tegra124-usb-phy', 'nvidia,tegra114-usb-phy']
   	'nvidia,tegra210-usb-phy' is not one of ['nvidia,tegra30-usb-phy', 'nvidia,tegra20-usb-phy']
   	from schema $id: http://devicetree.org/schemas/phy/nvidia,tegra20-usb-phy.yaml
   arch/arm64/boot/dts/nvidia/tegra210-smaug.dtb: /usb-phy@7d004000: failed to match any schema with compatible: ['nvidia,tegra210-usb-phy', 'nvidia,tegra30-usb-phy']
>> arch/arm64/boot/dts/nvidia/tegra210-smaug.dtb: cpu@0 (arm,cortex-a57): 'operating-points' is a dependency of 'clock-latency'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml
>> arch/arm64/boot/dts/nvidia/tegra210-smaug.dtb: cpu@0 (arm,cortex-a57): Unevaluated properties are not allowed ('clock-latency' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml
   arch/arm64/boot/dts/nvidia/tegra210-smaug.dtb: thermal-zones: mem-thermal:cooling-maps: 'dram-active', 'dram-passive' do not match any of the regexes: '^map[-a-zA-Z0-9]*$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
