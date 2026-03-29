Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02B7713A3ED
	for <oe-kbuild@lists.linux.dev>; Sun, 29 Mar 2026 02:25:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774751115; cv=none; b=oePdFQLRI/cr31tm54VMsixN+z45+bNXFqitYpzeg0FTXyuLiXG+5uHMjol+Yf6zPSVuk8lods45pp4ignOY7JXU/8CYHJdrbJ9WaAG7Gp6eqwxshkFFDwOGr+rYYPtbAohAr9IaLu+ABZtWSb6vm1G1ppeYm1k9n1qFOcfE2xo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774751115; c=relaxed/simple;
	bh=4ukyqkD0AkeVsQRZy7AvQoFpU9uff2DTgA5VpWHc6PQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Jiuxu7xTX0oHwgwJtxkLKuUCfMM7ayuZHcbwXrXEdyZxhu9m7sh7xtoqKtYFFHNzVgRiZfxjxiU+ZSFGWFfMznEyppoBMRSsUF/6YGM9vycJBvQSNFhEvDgCssPkevhs3ysWnftN4V77GXk2zp6fc0OVp5xYzBFn8DqvZO9BlSM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QDC9JRpT; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QDC9JRpT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774751113; x=1806287113;
  h=date:from:to:cc:subject:message-id;
  bh=4ukyqkD0AkeVsQRZy7AvQoFpU9uff2DTgA5VpWHc6PQ=;
  b=QDC9JRpT0PD5RaiT5kUXEqodxXenE9rwglde/Nxi+zXrTqiK2l7VEE8q
   f67quPMp7hzSpQOIoZtZ0cOb/Ge8k+0le50uhL1OOoiEknqI5eVuG/lpY
   x8Mwii/Uyy/r/2DfA69VQYO9v+r/BlIfMAUMkailiczI5JqFA5mKcOz+F
   FVAjXwEWlRSpq5LWe1TUNeekcJl13mDgB/fVLzGNTJR2j3SltkH4EraXi
   n4bUpJ9pQCiNxSHGrVmPCCNYObljd11xroMbGjd5qkZiV3zDG94Z94VQ1
   nFI7+PvkJC4t1tefiZUkRs1PC/Eljrz01L8tluSaS2cyl0bQcQ6nrAgNw
   g==;
X-CSE-ConnectionGUID: 2KMp8IXJQw2x117T9qsKMQ==
X-CSE-MsgGUID: 6Rx2SvBAQtqNaiZSCWH1Mg==
X-IronPort-AV: E=McAfee;i="6800,10657,11742"; a="75663445"
X-IronPort-AV: E=Sophos;i="6.23,147,1770624000"; 
   d="scan'208";a="75663445"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Mar 2026 19:25:13 -0700
X-CSE-ConnectionGUID: 7A7CNxSyQzOPsE6/yKTp/Q==
X-CSE-MsgGUID: JBIAJ46gTMupK8FJAqi5pQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,147,1770624000"; 
   d="scan'208";a="220830584"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by fmviesa006.fm.intel.com with ESMTP; 28 Mar 2026 19:25:11 -0700
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w6fpt-000000007nt-07Fw;
	Sun, 29 Mar 2026 02:25:09 +0000
Date: Sun, 29 Mar 2026 04:24:25 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: 
 arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3-emmc-nand.dtb: flash@0
 (spi-nand): Unevaluated properties are not allowed ('spi-rx-buswidth',
 'spi-tx-buswidth' were unexpected)
Message-ID: <202603290429.ZAP6sed3-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "only suspicious fbc files changed"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Frank Wunderlich <frank-w@public-files.de>
CC: "Rob Herring (Arm)" <robh@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   cbfffcca2bf0622b601b7eaf477aa29035169184
commit: 987697749def9c5e10d9a2d992f012db61ae1967 arm64: dts: mediatek: mt7986: add dtbs with applied overlays for bpi-r3
date:   3 months ago
:::::: branch date: 9 hours ago
:::::: commit date: 3 months ago
config: arm64-randconfig-2055-20260328 (https://download.01.org/0day-ci/archive/20260329/202603290429.ZAP6sed3-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project f43d6834093b19baf79beda8c0337ab020ac5f17)
dtschema: 2025.13.dev8+g0515abdd9
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260329/202603290429.ZAP6sed3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202603290429.ZAP6sed3-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3-emmc-nand.dtb: crypto@10320000 (inside-secure,safexcel-eip97): interrupt-names: ['ring0', 'ring1', 'ring2', 'ring3'] is too short
   	from schema $id: http://devicetree.org/schemas/crypto/inside-secure,safexcel.yaml
   arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3-emmc-nand.dtb: crypto@10320000 (inside-secure,safexcel-eip97): interrupts: [[0, 116, 4], [0, 117, 4], [0, 118, 4], [0, 119, 4]] is too short
   	from schema $id: http://devicetree.org/schemas/crypto/inside-secure,safexcel.yaml
>> arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3-emmc-nand.dtb: flash@0 (spi-nand): Unevaluated properties are not allowed ('spi-rx-buswidth', 'spi-tx-buswidth' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mtd/spi-nand.yaml
--
   arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3-sd-nand.dtb: crypto@10320000 (inside-secure,safexcel-eip97): interrupt-names: ['ring0', 'ring1', 'ring2', 'ring3'] is too short
   	from schema $id: http://devicetree.org/schemas/crypto/inside-secure,safexcel.yaml
   arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3-sd-nand.dtb: crypto@10320000 (inside-secure,safexcel-eip97): interrupts: [[0, 116, 4], [0, 117, 4], [0, 118, 4], [0, 119, 4]] is too short
   	from schema $id: http://devicetree.org/schemas/crypto/inside-secure,safexcel.yaml
>> arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3-sd-nand.dtb: flash@0 (spi-nand): Unevaluated properties are not allowed ('spi-rx-buswidth', 'spi-tx-buswidth' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mtd/spi-nand.yaml

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
