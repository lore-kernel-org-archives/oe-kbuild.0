Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 112CE23C51D
	for <oe-kbuild@lists.linux.dev>; Sun, 16 Aug 2026 03:39:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786851559; cv=none; b=A5qfo1d2tDnDI+jmyagVnitxgv6el+6XzdwSVmfc7aQZbT7M92VUPvh9zcjjXb6MEDejl94SKfLP0tNeOIdX5dV/L1QDaH8ldYR08SKe3LkmuQJkSJGfdHfuu3r3mPkGHKkODTK8J4gTYU+b+haSjCARvpAPn90T+Glx3F5GeUE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786851559; c=relaxed/simple;
	bh=qeQ8G37vEH3N+vifTI0M6qFjTu6InFNTyKBZW0wom3E=;
	h=Date:From:To:Cc:Subject:Message-ID; b=rsBMumAeSQwEOdUWEU8HRjB41FQE5Ff74bFK0ADbMZoibpqLNj7ZIPwE/zJVO1S9VwAdv/NL++IOpnG/ayiqqwD3abD95Wbpk1sNqiBiY6aS3dtoeWqkwP13yaz6OjvTIO3DVux+gO1k7f0tiJk+gY3ay3CvO/30PHv4kb5q4fM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bZHzrhH/; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bZHzrhH/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786851556; x=1818387556;
  h=date:from:to:cc:subject:message-id;
  bh=qeQ8G37vEH3N+vifTI0M6qFjTu6InFNTyKBZW0wom3E=;
  b=bZHzrhH/0/By/BGbfp1kspmzSad16vuIlYYH2P+3D/JoVWCBzPSpQd5c
   +t0OMdEE5WnihaLsJ49XyNoTrxoMTAQFJ/IdyUGD2Izp04sMEH/mhTQXd
   YNz0evqMmlya9eOzxABC0k0DKEalrW0UsZCB9PupRtrBLa5IffDtqk5k1
   6u84JfM8vq+KI8cyElQ+YDPv3RUa4Ey5bAOyjGQcCu2J87rZJ+kcNn2p8
   MdEQnH8MJKVDb61s4a8JLp0t4YnojdYvQ8b8diSOWFHFDIrJgG/q5jhQK
   mPjA0PB4/idBvQlPOyYKlJzVgqtUFw5sv4pPQ7QyY8o5V+ovJ5UIg5GJA
   w==;
X-CSE-ConnectionGUID: hqyAIyscRzmQf4UuQw8mJw==
X-CSE-MsgGUID: ASnOKbyjRp2lMLm3YDhldg==
X-IronPort-AV: E=McAfee;i="6800,10657,11876"; a="87291190"
X-IronPort-AV: E=Sophos;i="6.25,226,1779174000"; 
   d="scan'208";a="87291190"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Aug 2026 20:39:16 -0700
X-CSE-ConnectionGUID: gV2rTNTyTP6biOVHdOe3QQ==
X-CSE-MsgGUID: dvZeTgC+Q1ujT0YW7pV09A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,226,1779174000"; 
   d="scan'208";a="260353207"
Received: from igk-lkp-server01.igk.intel.com (HELO 3cba2a188a06) ([10.211.93.152])
  by fmviesa006.fm.intel.com with ESMTP; 15 Aug 2026 20:39:14 -0700
Received: from kbuild by 3cba2a188a06 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wvRiK-000000006Xl-1bok;
	Sun, 16 Aug 2026 03:39:12 +0000
Date: Sun, 16 Aug 2026 05:38:56 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: arch/arm64/boot/dts/nvidia/tegra210-p3541-0000.dtb: pci@1,0:
 nvidia,num-lanes: b'\x00\x00\x00\x04' is not of type 'object', 'integer',
 'array', 'boolean', 'null'
Message-ID: <202608160517.ZKMSU8zE-lkp@intel.com>
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
TO: Aaron Kling <webgeek1234@gmail.com>
CC: Thierry Reding <treding@nvidia.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   3eb40771c00a8488fa6ed2cc1fe203477908bf38
commit: ba97758a63b78f7e494ebdfb74ba8a8af702a33a arm64: tegra: Add NVIDIA Jetson Nano 2GB Developer Kit support
date:   10 months ago
:::::: branch date: 12 hours ago
:::::: commit date: 10 months ago
config: arm64-randconfig-2054-20260813 (https://download.01.org/0day-ci/archive/20260816/202608160517.ZKMSU8zE-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.3.0
dtschema: 2026.7.dev15+g01b5073ab
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260816/202608160517.ZKMSU8zE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: ba97758a63b7 ("arm64: tegra: Add NVIDIA Jetson Nano 2GB Developer Kit support")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202608160517.ZKMSU8zE-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/nvidia/tegra210.dtsi:31.3-41: Warning (interrupt_map): /pcie@1003000:interrupt-map: Missing property '#address-cells' in node /interrupt-controller@50041000, using 0 as fallback
   arch/arm64/boot/dts/nvidia/tegra210-p3541-0000.dtb: /pcie@1003000: failed to match any schema with compatible: ['nvidia,tegra210-pcie']
>> arch/arm64/boot/dts/nvidia/tegra210-p3541-0000.dtb: pci@1,0: nvidia,num-lanes: b'\x00\x00\x00\x04' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
>> arch/arm64/boot/dts/nvidia/tegra210-p3541-0000.dtb: pci@2,0: nvidia,num-lanes: b'\x00\x00\x00\x01' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm64/boot/dts/nvidia/tegra210-p3541-0000.dtb: vi@54080000 (nvidia,tegra210-vi): 'avdd-dsi-csi-supply' does not match any of the regexes: '^csi@[0-9a-f]+$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/display/tegra/nvidia,tegra20-vi.yaml
   arch/arm64/boot/dts/nvidia/tegra210-p3541-0000.dtb: /host1x@50000000/tsec@54100000: failed to match any schema with compatible: ['nvidia,tegra210-tsec']
   arch/arm64/boot/dts/nvidia/tegra210-p3541-0000.dtb: /host1x@50000000/tsec@54500000: failed to match any schema with compatible: ['nvidia,tegra210-tsec']
   arch/arm64/boot/dts/nvidia/tegra210-p3541-0000.dtb: /interrupt-controller@60004000: failed to match any schema with compatible: ['nvidia,tegra210-ictlr']
   arch/arm64/boot/dts/nvidia/tegra210-p3541-0000.dtb: dma@60020000 (nvidia,tegra210-apbdma): $nodename:0: 'dma@60020000' does not match '^dma-controller(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/dma/nvidia,tegra20-apbdma.yaml
   arch/arm64/boot/dts/nvidia/tegra210-p3541-0000.dtb: pmic@3c (maxim,max77620): '#interrupt-cells', 'fps', 'interrupt-controller', 'interrupt-parent', 'interrupts', 'pinmux', 'regulators' do not match any of the regexes: '^(hog-[0-9]+|.+-hog(-[0-9]+)?)$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/gpio/trivial-gpio.yaml

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
