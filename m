Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64139BA36
	for <oe-kbuild@lists.linux.dev>; Thu,  7 Aug 2025 11:51:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754567489; cv=none; b=U5N1N9FhZAEFSKP8702vJkdvwnmUjCjoLMIw12cRBcsLtxLvqcoxbS4ReExtZ43e1voExakzCRfWiWX9LFKwzyTW2mAwnyvBBHcqsYV3d/xaolltSj0KZ0V6Bfj6OJ3eIiT5E7+sECQc7vAHXrs0Geg2pR6gPWKOPk5aZKUPRlw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754567489; c=relaxed/simple;
	bh=7k3FCuwebfHCAE9Lzc65v4rpZA+cSLLp+MUC6yjXiJo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=VneQazhcMrBAWyuj4fSjTbIhegTiokmcuvL0zH2wIZvySDZ/E9afDp3hIOayOjXGmLjiOH8gP25IUq6eaY76yeE+rqOgxll8vxnTSit27TkrqFNLJQwmm0eO6c1XVFuZxR7oOH9rR+NbF+MzpgkClT0OBSQxn2yH2FPdsRUMLt4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GGF1cyLw; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GGF1cyLw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754567488; x=1786103488;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=7k3FCuwebfHCAE9Lzc65v4rpZA+cSLLp+MUC6yjXiJo=;
  b=GGF1cyLwDFYjrKn450z3UhO8US2A5JsP/7kzBqD8j8wZ/d3hUoiQgljv
   m+GaMztF/NafVWj/QQ3ZxiyUY01qI809WmIbZvDJtMmUNBkYlWqw49qaQ
   YWgiZrg0XiVmc3K3tPBCRlZdIIOCwApKeBW0KqsyLX0QNjrAW2MxreLCU
   Lmz6HMu16WjB4Wr0UTQ8gcP5jwvrRLwTKySQCCE3xhlBzB7sS9LZpV/De
   cm/wBuSp4XZh1cIqfJyA+KlwxBWO8j7VSLxvet/Zgc1B0o2GoO6lxXEMd
   pBqtms9Em7RzdbctJRukKvxwT/HNRaaNMXrn37BGM4z5cZhjzZ5clybdf
   Q==;
X-CSE-ConnectionGUID: 5yv9nnQlSY2tDXiptlY1dA==
X-CSE-MsgGUID: LsCkthsJT2KBIm0U/hFU3w==
X-IronPort-AV: E=McAfee;i="6800,10657,11514"; a="56770458"
X-IronPort-AV: E=Sophos;i="6.17,271,1747724400"; 
   d="scan'208";a="56770458"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Aug 2025 04:51:28 -0700
X-CSE-ConnectionGUID: S1QjD6S2RQGecAMjzRAE1g==
X-CSE-MsgGUID: zhei1VoURaiHIIKtkOKvmA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,271,1747724400"; 
   d="scan'208";a="169505017"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 07 Aug 2025 04:51:27 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ujz9X-0002kG-2a;
	Thu, 07 Aug 2025 11:51:23 +0000
Date: Thu, 7 Aug 2025 19:50:53 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [robh:dt-convert 239/801]
 Documentation/devicetree/bindings/iommu/nvidia,tegra30-smmu.yaml: ignoring,
 error parsing file
Message-ID: <202508071915.Axzq2lkx-lkp@intel.com>
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
TO: "Rob Herring (Arm)" <robh@kernel.org>
CC: linux-doc@vger.kernel.org

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git dt-convert
head:   6752ef54777b7f91fb5cae7cfac46af194c15d1b
commit: f76c3773c918c61a45d043097766b088056f90e5 [239/801] dt-bindings: iommu: Convert nvidia,tegra30-smmu to DT schema
:::::: branch date: 18 hours ago
:::::: commit date: 18 hours ago
config: arc-randconfig-052-20250807 (https://download.01.org/0day-ci/archive/20250807/202508071915.Axzq2lkx-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 13.4.0
dtschema version: 2025.6.2.dev4+g8f79ddd
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250807/202508071915.Axzq2lkx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202508071915.Axzq2lkx-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> Documentation/devicetree/bindings/iommu/nvidia,tegra30-smmu.yaml: ignoring, error parsing file
   Documentation/devicetree/bindings/dma/ti,edma3-tpcc.yaml: ti,tptcs: missing type definition
   Documentation/devicetree/bindings/dma/ti,edma3-tpcc.yaml: ti,edma-reserved-slot-ranges: missing type definition
   Documentation/devicetree/bindings/display/smi-sm501.yaml: edid: missing type definition
   Documentation/devicetree/bindings/cpufreq/operating-points-v2.yaml: opp-supported-hw: multiple incompatible types: uint32-array
   Documentation/devicetree/bindings/opp/opp-v2-base.yaml: opp-supported-hw: multiple incompatible types: uint32-matrix
   Documentation/devicetree/bindings/arm/vexpress-config.yaml: arm,vexpress-sysreg,func: multiple incompatible types: uint32-array
   Documentation/devicetree/bindings/hwmon/vexpress.yaml: arm,vexpress-sysreg,func: multiple incompatible types: phandle-array
   Warning: Duplicate compatible "operating-points-v2" found in schemas matching "$id":
   	http://devicetree.org/schemas/cpufreq/operating-points-v2.yaml#
   	http://devicetree.org/schemas/opp/opp-v2.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
