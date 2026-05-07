Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA44D3EDAD0
	for <oe-kbuild@lists.linux.dev>; Thu,  7 May 2026 10:59:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778151588; cv=none; b=nYd8lCQUIsnnjiy6jXzgrl8wc8ovjO29mqcmmP3aZjtZLrU0TyLwz0ozwzTKlw3n2XG162JQvqYqQrkZRLlN+41ShcaReHASIItTjAaEhffbUVSHmMpdWgwdAVR7PzP0dlyP0UxFT6XfYo6jEFERX5kJtdWD5gRdOQ2R1IvyRqY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778151588; c=relaxed/simple;
	bh=ONT0Ws+mmzDhLKjL4OJmPNT7Wz4nScb1pNiaKTxgIdY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=MielzAb6z/bSsG44XBg0ZA1u4Bcafvr1EPh3z6/4XWtWVaaaHRp1eMlYytvreioWJo3PgMGh/bfqxuAxzIA44FIzSGQyLVh8IUdOQkCs7u8ueXl8E5a+JMVrEfW7dSV80wA6qJkdo81AE7mPIRlBhr8/4kiJAZapVaRAuEbuVy8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Fq4hXn+j; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Fq4hXn+j"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778151582; x=1809687582;
  h=date:from:to:cc:subject:message-id;
  bh=ONT0Ws+mmzDhLKjL4OJmPNT7Wz4nScb1pNiaKTxgIdY=;
  b=Fq4hXn+jpyJvAlENIWtwrwiSDibIQ4zGkekYVKsoj7PC7yxbVd9rEcQz
   3UABIQW5i/xRp/D5SWmAc4cKregl90ulf+cS+Izm5oB+Y9SZTkXxyBLdO
   9OCt9sSUpibu45FEa40Q3eMLCapvjwYdesWyPGDBEJCmboC1IlHNLeXyA
   nEbaPefe2mRwEAXvfg/zd1/L6z44NK4jTbrlUXP4+ZlgGvApsSoLNBPwi
   Rt+fg7KcpcVt5548X7kHZpYaDI6z0cuxXu/F8riUKVzMEKR3YKYu74XPd
   G1gggXD8FCA5DHFNosWmyb0mcnDVldtY0EsCmhfIEtiDfnuLuriB1Yw+R
   Q==;
X-CSE-ConnectionGUID: Yx4X2E/YRbm4qGR+62EPNA==
X-CSE-MsgGUID: VJncuJEVTbmtM9Spf5r85A==
X-IronPort-AV: E=McAfee;i="6800,10657,11778"; a="82719726"
X-IronPort-AV: E=Sophos;i="6.23,221,1770624000"; 
   d="scan'208";a="82719726"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2026 03:59:38 -0700
X-CSE-ConnectionGUID: phSGl3H9Sc6a64Cthba2Ww==
X-CSE-MsgGUID: oEUSp5MESSC4q0aYB42EdQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,221,1770624000"; 
   d="scan'208";a="233352198"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by fmviesa007.fm.intel.com with ESMTP; 07 May 2026 03:59:37 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wKwS6-000000006r5-2OXw;
	Thu, 07 May 2026 10:59:34 +0000
Date: Thu, 07 May 2026 12:59:09 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: arch/arm64/boot/dts/nvidia/tegra210-smaug.dtb: cpu@0
 (arm,cortex-a57): 'operating-points' is a dependency of 'clock-latency'
Message-ID: <202605071242.5TglK1NE-lkp@intel.com>
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
head:   f09079bd04a924c72d555cd97942d5f8d7eca98c
commit: 80728bfa8c79b81eeea305f555fe5582d1907286 dt-bindings: arm/cpus: Add missing properties
date:   1 year ago
:::::: branch date: 11 months ago
:::::: commit date: 1 year ago
config: arm64-randconfig-2055-20260506 (https://download.01.org/0day-ci/archive/20260507/202605071242.5TglK1NE-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project f43d6834093b19baf79beda8c0337ab020ac5f17)
dtschema: 2026.5.dev4+g4ccc1997d
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260507/202605071242.5TglK1NE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 80728bfa8c79 ("dt-bindings: arm/cpus: Add missing properties")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202605071242.5TglK1NE-lkp@intel.com/

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
