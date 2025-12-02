Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F8612F691E
	for <oe-kbuild@lists.linux.dev>; Tue,  2 Dec 2025 22:42:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764715362; cv=none; b=utWBlQUwykugtcAUgeRGY94u9VtAAd/XUEB5NujOxnd2EYjGi67YDVQQSL3kvIyB9mQ5nhrvwRe8bitwtAaLzH7RKYhD1mMtVg4/FQD3Rj50uy9BQU9E6Q4TzIzQNawqJkJQJdxuj66spqZ1yusGZEeedrXXmKy9eEWYWkiuzBk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764715362; c=relaxed/simple;
	bh=C1XKUlFcMmTjHtPLcz5NZu9mXPc23vXp/e5KaCJkS5s=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=UFvZ+xoK2kRJcHlYD9tSLpe5qV+Uh1piz7p9/BGmQMoU45mZKVwFVpreg0iCVDTc8CWgNwZHLIue0K30BM+q3QMnR7FgfyR6nb/DSVmonr39XOdw/+qGw9tCMuyrfNsL8QCnIOnKi8aXDz+oxFUV9xNLuzqvA4BuY88PeDJQ4DY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=R+VkSlif; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="R+VkSlif"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764715361; x=1796251361;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=C1XKUlFcMmTjHtPLcz5NZu9mXPc23vXp/e5KaCJkS5s=;
  b=R+VkSlifBqr9Pdqh6L/AMYvE/7zace5iiFN8xUo3PSUakXR8qgiuPgGv
   P/O6NQwfAD81Pe6sW84/C8fAitPbf/1gyl2TSQ7ZcQ/2tBboB8lb45fp0
   4JQV7vGv6SY1kyDgvfuBbaQkZ0FXsRJfKBtnkfvqtlkjwK1re0tNDdfF5
   Ao/0ox/KSwDjj6zoCg3YtHXcdRCDTmrk3tVAwLrBUT6xz/iaGb1WTp9r0
   v5y3x/nUnApczvAFIDAmres1KWTRXPO7Vr/bq0vsfqK0ypB2BuqV59Zb3
   LwV0BiBMPcq7hF8MQYIuOYocZCBGa3DcViw4e09IbQlX8augyG5AZDO4J
   w==;
X-CSE-ConnectionGUID: OdyFNjhTSp6zfNloDE1i5Q==
X-CSE-MsgGUID: 1jVLpkfkSp2ktS475jJvsg==
X-IronPort-AV: E=McAfee;i="6800,10657,11631"; a="66420482"
X-IronPort-AV: E=Sophos;i="6.20,244,1758610800"; 
   d="scan'208";a="66420482"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Dec 2025 14:42:41 -0800
X-CSE-ConnectionGUID: iZMrU3dZSEyPqZoM0dG8Tw==
X-CSE-MsgGUID: MHzxxFv6ScOk1KGD/LXc5w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,244,1758610800"; 
   d="scan'208";a="198681139"
Received: from igk-lkp-server01.igk.intel.com (HELO 1f7de368ad0d) ([10.211.93.152])
  by orviesa003.jf.intel.com with ESMTP; 02 Dec 2025 14:42:40 -0800
Received: from kbuild by 1f7de368ad0d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vQZ4v-000000002zF-28rF;
	Tue, 02 Dec 2025 22:42:37 +0000
Date: Tue, 2 Dec 2025 23:42:04 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: arch/arm64/boot/dts/renesas/r8a779f0-spider-ep.dtb: pcie-ep@e65d0000
 (renesas,r8a779f0-pcie-ep): interrupt-names:0: 'dma' was expected
Message-ID: <202512022345.54OLppI2-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "bisect to a FBC not belonging to original linux-review patches: branch: linux-review/Koichiro-Den/PCI-endpoint-pci-epf-vntb-Use-array_index_nospec-on-mws_size-access/20251130-001424, commit: d93f31b06e8a88719a5007d818256c572151a8bf"
:::::: Manual check reason: "dtcheck: binding changes may go via different trees"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Koichiro Den <den@valinux.co.jp>
CC: 0day robot <lkp@intel.com>

tree:   https://github.com/intel-lab-lkp/linux/commits/Koichiro-Den/PCI-endpoint-pci-epf-vntb-Use-array_index_nospec-on-mws_size-access/20251130-001424
head:   87cdc4c7eaef841a607491db40b8d66c37ec2459
commit: d93f31b06e8a88719a5007d818256c572151a8bf arm64: dts: renesas: Add Spider RC/EP DTs for NTB with remote DW PCIe eDMA
date:   3 days ago
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: arm64-randconfig-2053-20251202 (https://download.01.org/0day-ci/archive/20251202/202512022345.54OLppI2-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.3.0
dtschema version: 2025.9.dev21+gaa859412c
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251202/202512022345.54OLppI2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202512022345.54OLppI2-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/renesas/r8a779f0-spider-ep.dtb: pcie-ep@e65d0000 (renesas,r8a779f0-pcie-ep): interrupt-names:0: 'dma' was expected
   	from schema $id: http://devicetree.org/schemas/pci/rcar-gen4-pci-ep.yaml
>> arch/arm64/boot/dts/renesas/r8a779f0-spider-ep.dtb: pcie-ep@e65d0000 (renesas,r8a779f0-pcie-ep): interrupt-names:1: 'sft_ce' was expected
   	from schema $id: http://devicetree.org/schemas/pci/rcar-gen4-pci-ep.yaml
>> arch/arm64/boot/dts/renesas/r8a779f0-spider-ep.dtb: pcie-ep@e65d0000 (renesas,r8a779f0-pcie-ep): interrupt-names: ['sft_ce', 'app'] is too short
   	from schema $id: http://devicetree.org/schemas/pci/rcar-gen4-pci-ep.yaml
>> arch/arm64/boot/dts/renesas/r8a779f0-spider-ep.dtb: pcie-ep@e65d0000 (renesas,r8a779f0-pcie-ep): interrupts: [[0, 418, 4], [0, 422, 4]] is too short
   	from schema $id: http://devicetree.org/schemas/pci/rcar-gen4-pci-ep.yaml
>> arch/arm64/boot/dts/renesas/r8a779f0-spider-ep.dtb: pcie-ep@e65d0000 (renesas,r8a779f0-pcie-ep): reg: [[0, 3864854528, 0, 8192], [0, 3864862720, 0, 4096], [0, 3864866816, 0, 8192], [0, 3864879616, 0, 3584], [0, 3864883200, 0, 1024], [0, 4261412864, 0, 4194304]] is too short
   	from schema $id: http://devicetree.org/schemas/pci/rcar-gen4-pci-ep.yaml
>> arch/arm64/boot/dts/renesas/r8a779f0-spider-ep.dtb: pcie-ep@e65d0000 (renesas,r8a779f0-pcie-ep): reg-names:3: 'dma' was expected
   	from schema $id: http://devicetree.org/schemas/pci/rcar-gen4-pci-ep.yaml
>> arch/arm64/boot/dts/renesas/r8a779f0-spider-ep.dtb: pcie-ep@e65d0000 (renesas,r8a779f0-pcie-ep): reg-names:4: 'app' was expected
   	from schema $id: http://devicetree.org/schemas/pci/rcar-gen4-pci-ep.yaml
>> arch/arm64/boot/dts/renesas/r8a779f0-spider-ep.dtb: pcie-ep@e65d0000 (renesas,r8a779f0-pcie-ep): reg-names:5: 'phy' was expected
   	from schema $id: http://devicetree.org/schemas/pci/rcar-gen4-pci-ep.yaml
>> arch/arm64/boot/dts/renesas/r8a779f0-spider-ep.dtb: pcie-ep@e65d0000 (renesas,r8a779f0-pcie-ep): reg-names: ['dbi', 'dbi2', 'atu', 'app', 'phy', 'addr_space'] is too short
   	from schema $id: http://devicetree.org/schemas/pci/rcar-gen4-pci-ep.yaml
>> arch/arm64/boot/dts/renesas/r8a779f0-spider-ep.dtb: pcie-ep@e65d0000 (renesas,r8a779f0-pcie-ep): Unevaluated properties are not allowed ('iommus' was unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/rcar-gen4-pci-ep.yaml
--
>> arch/arm64/boot/dts/renesas/r8a779f0-spider-rc.dtb: pcie@e65d0000 (renesas,r8a779f0-pcie): Unevaluated properties are not allowed ('iommus', 'memory-region' were unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/rcar-gen4-pci-host.yaml

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
