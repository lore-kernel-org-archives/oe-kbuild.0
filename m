Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33E503D16F8
	for <oe-kbuild@lists.linux.dev>; Sun, 16 Aug 2026 20:05:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786910728; cv=none; b=GKkss8BmmLirgC7SRELebGBLwiAsktmEOJRH5gQCvvvnlaM6qRsz6Flp8x9YbbzZlYGfy+FFgEX8R6XArWGA7UWmJQP5M0LlsUEZGcJsvNeA5uWm3WZH8g6MR8ZkI0CTXNxpKZeOaiGzQx9XO21GphO2eacUNxeVksQL2ixm1Vo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786910728; c=relaxed/simple;
	bh=gBs1qlt+/n+S3diUIke633Hfi3/+m+K51UWiL6wQNnQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=RhoLnz1+zaCCFxQ5OLWyc5W/xIw7ICIhI27pUxPHhGm5R54WuoSgsqlhWBWjqjo5dfIHwU0mFarHMNUj4Jw+Bg+qiPttsjbtqlFsu5SV/8i8wItxnXYw9B078T87o/FaqmuEIe7uwPCEMKa73Pg1+OE2N/JA3YKYpebY69DTg30=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OwAsX+AN; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OwAsX+AN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786910725; x=1818446725;
  h=date:from:to:cc:subject:message-id;
  bh=gBs1qlt+/n+S3diUIke633Hfi3/+m+K51UWiL6wQNnQ=;
  b=OwAsX+ANSckzCFsOyZbh24hcMl96HtxoSJMLsO3orX74nzc4WpyP4Vot
   JFfvg7T9ZSd3O8wlfzvT7qSTRj3sX7mKoQFASxzizUfVJENB9NWfsFZSg
   DD81sv0x0UGc7gj+NYW/V6FzGMdD5F4YGGuOXBpcB1EFaJeqyDbd11Fqm
   XcnPOms6cAJJOHa9wbgsYh8vytePf0FAnHL3j/Z75WKdNn9YLhX0Z94lM
   VybHMhJ8qqIEWaIwCJK+8wMT3qec9lleGc5i9phi5m63OyFKgcfSQoMM2
   tB/r4jNv/BXEKTQP5cY4FcZxG53qVAvwuei15kDiyUtkBqiH8MhrVPmb3
   Q==;
X-CSE-ConnectionGUID: 7hHvdNEuRpe96qOalfQplA==
X-CSE-MsgGUID: ldfhut/NSsWd/2bdkxu/mQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11877"; a="87464724"
X-IronPort-AV: E=Sophos;i="6.25,227,1779174000"; 
   d="scan'208";a="87464724"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Aug 2026 13:05:24 -0700
X-CSE-ConnectionGUID: kuX2Vw+SRxe0ME2VbaEO7g==
X-CSE-MsgGUID: yQkcS8GjSMKNN77rJ94hbw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,227,1779174000"; 
   d="scan'208";a="268573448"
Received: from igk-lkp-server01.igk.intel.com (HELO 3cba2a188a06) ([10.211.93.152])
  by orviesa004.jf.intel.com with ESMTP; 16 Aug 2026 13:05:22 -0700
Received: from kbuild by 3cba2a188a06 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wvh6e-000000006dB-1d42;
	Sun, 16 Aug 2026 20:05:20 +0000
Date: Sun, 16 Aug 2026 22:04:24 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [pci:controller/mediatek-gen3 1/2]
 arch/arm64/boot/dts/airoha/en7581-evb.dtb: pcie@1fc00000
 (airoha,en7581-pcie): reg: [[0, 532676608, 0, 5744]] is too short
Message-ID: <202608162236.D7GSc76I-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "dtcheck: binding changes may go via different trees"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-pci@vger.kernel.org
TO: Christian Marangi <ansuelsmth@gmail.com>
CC: Bjorn Helgaas <helgaas@kernel.org>
CC: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
CC: "Rob Herring (Arm)" <robh@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/pci/pci.git controller/mediatek-gen3
head:   26c53c644350f02a444b2e0dbee9f5cf78511ff5
commit: 39f758dc5fbd140e7ed5a595abf5fef630b1769f [1/2] dt-bindings: PCI: mediatek-gen3: Split Airoha schema and document 2-lanes
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: arm64-randconfig-2053-20260815 (https://download.01.org/0day-ci/archive/20260816/202608162236.D7GSc76I-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project daa9d09970fed49996f42a8f7000b584f295991d)
dtschema: 2026.7.dev15+g01b5073ab
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260816/202608162236.D7GSc76I-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202608162236.D7GSc76I-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/airoha/en7581-evb.dtb: pcie@1fc00000 (airoha,en7581-pcie): reg: [[0, 532676608, 0, 5744]] is too short
   	from schema $id: http://devicetree.org/schemas/pci/airoha,en7581-pcie.yaml
>> arch/arm64/boot/dts/airoha/en7581-evb.dtb: pcie@1fc00000 (airoha,en7581-pcie): reg-names: ['pcie-mac'] is too short
   	from schema $id: http://devicetree.org/schemas/pci/airoha,en7581-pcie.yaml
>> arch/arm64/boot/dts/airoha/en7581-evb.dtb: pcie@1fc00000 (airoha,en7581-pcie): reset-names:2: 'perstout' was expected
   	from schema $id: http://devicetree.org/schemas/pci/airoha,en7581-pcie.yaml
>> arch/arm64/boot/dts/airoha/en7581-evb.dtb: pcie@1fc00000 (airoha,en7581-pcie): reset-names: ['phy-lane0', 'phy-lane1', 'phy-lane2'] is too short
   	from schema $id: http://devicetree.org/schemas/pci/airoha,en7581-pcie.yaml
>> arch/arm64/boot/dts/airoha/en7581-evb.dtb: pcie@1fc00000 (airoha,en7581-pcie): resets: [[7, 48], [7, 49], [7, 25]] is too short
   	from schema $id: http://devicetree.org/schemas/pci/airoha,en7581-pcie.yaml
>> arch/arm64/boot/dts/airoha/en7581-evb.dtb: pcie@1fc00000 (airoha,en7581-pcie): 'airoha,scu' is a required property
   	from schema $id: http://devicetree.org/schemas/pci/airoha,en7581-pcie.yaml
>> arch/arm64/boot/dts/airoha/en7581-evb.dtb: pcie@1fc20000 (airoha,en7581-pcie): reg: [[0, 532807680, 0, 5744]] is too short
   	from schema $id: http://devicetree.org/schemas/pci/airoha,en7581-pcie.yaml
>> arch/arm64/boot/dts/airoha/en7581-evb.dtb: pcie@1fc20000 (airoha,en7581-pcie): reg-names: ['pcie-mac'] is too short
   	from schema $id: http://devicetree.org/schemas/pci/airoha,en7581-pcie.yaml
>> arch/arm64/boot/dts/airoha/en7581-evb.dtb: pcie@1fc20000 (airoha,en7581-pcie): reset-names:2: 'perstout' was expected
   	from schema $id: http://devicetree.org/schemas/pci/airoha,en7581-pcie.yaml
>> arch/arm64/boot/dts/airoha/en7581-evb.dtb: pcie@1fc20000 (airoha,en7581-pcie): reset-names: ['phy-lane0', 'phy-lane1', 'phy-lane2'] is too short
   	from schema $id: http://devicetree.org/schemas/pci/airoha,en7581-pcie.yaml
>> arch/arm64/boot/dts/airoha/en7581-evb.dtb: pcie@1fc20000 (airoha,en7581-pcie): resets: [[7, 48], [7, 49], [7, 25]] is too short
   	from schema $id: http://devicetree.org/schemas/pci/airoha,en7581-pcie.yaml
>> arch/arm64/boot/dts/airoha/en7581-evb.dtb: pcie@1fc20000 (airoha,en7581-pcie): 'airoha,scu' is a required property
   	from schema $id: http://devicetree.org/schemas/pci/airoha,en7581-pcie.yaml

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
