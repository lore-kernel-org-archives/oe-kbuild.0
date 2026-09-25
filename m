Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53B843E00B4
	for <oe-kbuild@lists.linux.dev>; Fri, 25 Sep 2026 23:03:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790377439; cv=none; b=H7CjykX+bweSHLVwWTtIkoze1hUPlopLf7pg2/+/3S5n8i95C/NfLYIVYo73TZGgmPyMVVZHneWQ3ZHHXEtzdPgantGbbLZmrEn5WhLmgvz+Hl5IMt1wGRTjwO4lbxrI/SptLR/n7u5gmeKitHbVTMxHjzwCPc8JlgTV5UkuHCM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790377439; c=relaxed/simple;
	bh=DRKFcLaVdgz6O/yEJs7w1sfiLtkEBauycqKxs6lPbNQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=P+Gz0xtoXIZjesU1M8dCd+ND4gYDHwkbkYshh0X/rkCRfqXOyXST8Gs/iLEP7pefugmlxN1dG4xQxhnH1cWVqnnkFmLBbVvf6FFI5qxdYleAhk8SjNp0C7w1iZtWexlMrk6JKk1f1+g8LlUBQDlZAlRkDDPOkR4RBySQ2CFkdfY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=d492g0yZ; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="d492g0yZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790377437; x=1821913437;
  h=date:from:to:cc:subject:message-id;
  bh=DRKFcLaVdgz6O/yEJs7w1sfiLtkEBauycqKxs6lPbNQ=;
  b=d492g0yZUxQiiEWkjK2beGs4oS3ydDSs+WmLPY+CmCcZiv/e1MTWpGnJ
   GySrnWJtSgmtN8qVsa9Ep/Zuq97KAFjyhxEUeNmXZEEyDhViRy9bXAXpg
   s6nNyDrHNniPq+yDGm1WKHz6cjGtcPYjRDPh1hgcr2NTeBWoUcT7fjpJf
   AbF3ES33m0II75HcDZMK0k4VSaZvVlpMrm072NRkM9QHuMryYxzZIh38I
   e1WhaOLJ68kMkAT11iE8sfpwKp/j0IHzE4nclclXNf4eaZANH5Oxm+6JC
   OofYu3dJX/cCLfpcL8fRi/PHbi6crQ3iLol/IlvR9+Kq1/seFLeNq+sQV
   Q==;
X-CSE-ConnectionGUID: 62m+lXf6T76neaWTBbQbsA==
X-CSE-MsgGUID: rzD+2mlESzO7JJ/aJxtEaA==
X-IronPort-AV: E=McAfee;i="6800,10657,11916"; a="94986138"
X-IronPort-AV: E=Sophos;i="6.27,123,1787036400"; 
   d="scan'208";a="94986138"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Sep 2026 16:03:56 -0700
X-CSE-ConnectionGUID: ktUTUJr9RpmZt5A/mHxvaw==
X-CSE-MsgGUID: N0wVwDZWR1i+HWoUY9iRXg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,123,1787036400"; 
   d="scan'208";a="277645501"
Received: from igk-lkp-server01.igk.intel.com (HELO 7278393c7b39) ([10.211.93.152])
  by orviesa003.jf.intel.com with ESMTP; 25 Sep 2026 16:03:55 -0700
Received: from kbuild by 7278393c7b39 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xAExM-0000000004F-1b55;
	Fri, 25 Sep 2026 23:03:52 +0000
Date: Sat, 26 Sep 2026 01:03:37 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: arch/arm/boot/dts/nvidia/tegra20-asus-sl101.dtb:
 linux,cma@30000000 (shared-dma-pool): Unevaluated properties are not allowed
 ('alloc-ranges', 'reusable', 'size' were unexpected)
Message-ID: <202609260043.lUguSxop-lkp@intel.com>
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
TO: Svyatoslav Ryhel <clamor95@gmail.com>
CC: Thierry Reding <treding@nvidia.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   165768bb70265b5c38cf0b73fafd75be235f8b14
commit: 73e23d3bd7220847c3b1554ebe29221f84a01e95 ARM: tegra: add support for ASUS Eee Pad Slider SL101
date:   1 year ago
:::::: branch date: 23 hours ago
:::::: commit date: 1 year ago
config: arm-randconfig-2401-20260919 (https://download.01.org/0day-ci/archive/20260926/202609260043.lUguSxop-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 8.5.0
dtschema: 2026.10.dev2+g840a01d41
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260926/202609260043.lUguSxop-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 73e23d3bd722 ("ARM: tegra: add support for ASUS Eee Pad Slider SL101")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202609260043.lUguSxop-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm/boot/dts/nvidia/tegra20-asus-sl101.dtb: /kbc@7000e200: failed to match any schema with compatible: ['nvidia,tegra20-kbc']
   arch/arm/boot/dts/nvidia/tegra20-asus-sl101.dtb: /pcie@80003000: failed to match any schema with compatible: ['nvidia,tegra20-pcie']
   arch/arm/boot/dts/nvidia/tegra20-asus-sl101.dtb: pci@1,0: nvidia,num-lanes: b'\x00\x00\x00\x02' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm/boot/dts/nvidia/tegra20-asus-sl101.dtb: pci@2,0: nvidia,num-lanes: b'\x00\x00\x00\x02' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   	from schema $id: http://devicetree.org/schemas/reserved-memory/ramoops.yaml
   	from schema $id: http://devicetree.org/schemas/reserved-memory/shared-dma-pool.yaml
>> arch/arm/boot/dts/nvidia/tegra20-asus-sl101.dtb: linux,cma@30000000 (shared-dma-pool): Unevaluated properties are not allowed ('alloc-ranges', 'reusable', 'size' were unexpected)
   	from schema $id: http://devicetree.org/schemas/reserved-memory/shared-dma-pool.yaml

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
