Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69A9741379A
	for <oe-kbuild@lists.linux.dev>; Fri, 21 Aug 2026 06:28:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787293723; cv=none; b=h27aYif0Yq7Pe/w9wVFg3Kv4Plqi81zQqQ0REEilDF3n/5VbLPTP1DtlJuXxGipjYCa1Uk2I/Dj8Clk9fhMXRnstA8NDRo4MHya5qjAwKPqtpGQWepz+4vx0SWMvInAbQIGEtvDXKuL4BqyGTZuHm601EijHGLiQP00dHe3FnPE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787293723; c=relaxed/simple;
	bh=JLqi8YuD87PcueBL3a7nZ3R4kuiDu9gDKGTXkuzhsag=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ovewzpQJMNwb5xe+WjPhGTSIFge/AncLaKeXWS29Vru98grGPULByvJESvfqHGDCZLuedElkV8h4D9WaXpY61qN1rBCCVO3cu9rW2LH6KodRA8gMM9mlUN2jEWvQfsfEor/0lVn+EnMGTJyce1e56SPkiCv2pndIljcvCPvncBE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ffGkZmBa; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ffGkZmBa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787293720; x=1818829720;
  h=date:from:to:cc:subject:message-id;
  bh=JLqi8YuD87PcueBL3a7nZ3R4kuiDu9gDKGTXkuzhsag=;
  b=ffGkZmBa/XfwLp+hGIz35ahprtnSvBsmRKy1GCClM50MWgtTBX9JRGIf
   0Q+EfeP3rSl3BPhpX/e1oDn1fyOPbDYXbzuO+o/DuM4NU8qS0Vw0S8XWD
   Fr/VWY5zktILmDuhBQPI10U6SrZpvBCMIUaOs1bN6fO0bNS7c8syfw4wx
   OREOOjOZM4SfqWhFXHSqtLIqnW6oNXK4Cq6ZyFFs/8I6hXoH/NnLfS/r2
   9DjgXfOSv20Wiqp6bH47bthlBcUaiqh7LLxWvSka+YcOAJSGaVJuy5D5X
   GMgxUYZKXKNzIHOJcfbcwlmmhyyQ5SYmrmWSS6XzOHG+fbOoAvr5veOum
   Q==;
X-CSE-ConnectionGUID: NiRf0LdISuqmAUbw+BDTUA==
X-CSE-MsgGUID: MM/lBg1mTlOUEnyisz9VtA==
X-IronPort-AV: E=McAfee;i="6800,10657,11881"; a="86787317"
X-IronPort-AV: E=Sophos;i="6.25,234,1779174000"; 
   d="scan'208";a="86787317"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Aug 2026 23:28:39 -0700
X-CSE-ConnectionGUID: V+O9jSKtQDemWY9b/MTE2A==
X-CSE-MsgGUID: HOlSaM5PQ229vkiajUKoaw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,234,1779174000"; 
   d="scan'208";a="266306665"
Received: from igk-lkp-server01.igk.intel.com (HELO 3cba2a188a06) ([10.211.93.152])
  by orviesa007.jf.intel.com with ESMTP; 20 Aug 2026 23:28:38 -0700
Received: from kbuild by 3cba2a188a06 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wxIk0-000000007fV-2jEo;
	Fri, 21 Aug 2026 06:28:36 +0000
Date: Fri, 21 Aug 2026 08:28:28 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: arch/arm64/boot/dts/nvidia/tegra210-smaug.dtb:
 padctl@7009f000 (nvidia,tegra210-xusb-padctl): ports:usb2-0:
 'role-switch-default-mode' does not match any of the regexes:
 '^pinctrl-[0-9]+$'
Message-ID: <202608210856.sedUHnZg-lkp@intel.com>
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
TO: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
CC: Thierry Reding <treding@nvidia.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   818bebeb63dd6bf5f4e07e145f6cdbace520a34c
commit: dfa93788dd8b2f9c59adf45ecf592082b1847b7b arm64: tegra: smaug: Add usb-role-switch support
date:   7 months ago
:::::: branch date: 3 hours ago
:::::: commit date: 7 months ago
config: arm64-randconfig-2054-20260820 (https://download.01.org/0day-ci/archive/20260821/202608210856.sedUHnZg-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
dtschema: 2026.7.dev15+g01b5073ab
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260821/202608210856.sedUHnZg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: dfa93788dd8b ("arm64: tegra: smaug: Add usb-role-switch support")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202608210856.sedUHnZg-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm64/boot/dts/nvidia/tegra210-smaug.dtb: ldo8: maxim,active-fps-source: b'\x00\x00\x00\x03' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm64/boot/dts/nvidia/tegra210-smaug.dtb: ldo8: maxim,active-fps-power-up-slot: b'\x00\x00\x00\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm64/boot/dts/nvidia/tegra210-smaug.dtb: ldo8: maxim,active-fps-power-down-slot: b'\x00\x00\x00\x07' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm64/boot/dts/nvidia/tegra210-smaug.dtb: /memory-controller@70019000: failed to match any schema with compatible: ['nvidia,tegra210-mc']
   arch/arm64/boot/dts/nvidia/tegra210-smaug.dtb: external-memory-controller@7001b000 (nvidia,tegra210-emc): '#cooling-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/memory-controllers/nvidia,tegra210-emc.yaml
>> arch/arm64/boot/dts/nvidia/tegra210-smaug.dtb: padctl@7009f000 (nvidia,tegra210-xusb-padctl): ports:usb2-0: 'role-switch-default-mode' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/phy/nvidia,tegra210-xusb-padctl.yaml
>> arch/arm64/boot/dts/nvidia/tegra210-smaug.dtb: padctl@7009f000 (nvidia,tegra210-xusb-padctl): ports:usb2-0: 'connector' is a dependency of 'usb-role-switch'
   	from schema $id: http://devicetree.org/schemas/phy/nvidia,tegra210-xusb-padctl.yaml
   arch/arm64/boot/dts/nvidia/tegra210-smaug.dtb: /clock@70110000: failed to match any schema with compatible: ['nvidia,tegra210-dfll']
   arch/arm64/boot/dts/nvidia/tegra210-smaug.dtb: clock@70110000 (nvidia,tegra210-dfll): nvidia,cf: b'\x00\x00\x00\x06' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm64/boot/dts/nvidia/tegra210-smaug.dtb: clock@70110000 (nvidia,tegra210-dfll): nvidia,ci: b'\x00\x00\x00\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm64/boot/dts/nvidia/tegra210-smaug.dtb: clock@70110000 (nvidia,tegra210-dfll): nvidia,cg: b'\x00\x00\x00\x02' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm64/boot/dts/nvidia/tegra210-smaug.dtb: clock@70110000 (nvidia,tegra210-dfll): nvidia,droop-ctrl: b'\x00\x00\x0f\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
