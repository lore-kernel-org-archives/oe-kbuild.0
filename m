Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 532C82367B5
	for <oe-kbuild@lists.linux.dev>; Sun, 29 Mar 2026 07:10:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774768218; cv=none; b=ZJ1y9K/uBA3/ioBg7cD6p97IBz4Gya0wzEbIGXHF8p4VsjTn8R7Qzr6bTsvq8E996te+ycliNrZB9RLpQu/q5H5eN/CCgPevYISEaVNyAr2+2/gwWPoWxkHWEBeHW+fAYfOzZUd+JtMpE0M1iPXSWzxDwervPhfYO9mlTbf4O3A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774768218; c=relaxed/simple;
	bh=u7Z+b6xVMj1LInZD1/PyavsmE1iRv9+iWcd8vzrrJIc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=XVNXhOJUZbnY/isYnUJkeDFLbsIuvncUQ9c/b+h9MOGxalNaGROVT/oig43iwsV1r7ZjJ+gEQ8YYrRjwoN7tzv9ctlZnRHZLaLGhCn2csrajr29kGlzdLtY6KCbRjh7JMN6JtCVcyTeMnlriR6bap4sFaRSU3gfY62V1E83Cf2c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cyKHUry8; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cyKHUry8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774768216; x=1806304216;
  h=date:from:to:cc:subject:message-id;
  bh=u7Z+b6xVMj1LInZD1/PyavsmE1iRv9+iWcd8vzrrJIc=;
  b=cyKHUry8NyHKTUaT+eDo7QPFp9NNz0Ww/ZOs3I8e3g4Fr/8MTP2jdB2u
   sumhqMT+4c3Bh/g3ZE4RsFBCwFMFgZdFkiUMWjDGbP6lvU8jXYo7AZ14t
   iEQXtI/sxrdAy7yoPGDrwOq61zSaP3rmbGzYqTxywZqhMHLIs5gdLgcIW
   QYrbmtwO3VC8fmlTdZJ8llVDUznRpTakvTk6kRC0VAnvVfARuxgUYEUhM
   VJtB1CAoGO6IZPkPJdp2vKdsx3MWzsGGOQM6KjrpvEzPj+PL5HhXGrg7V
   XcqW2ATsqlubfbAnyFOiSTcocJysvtauzwNf/MluV65g2ZN4lcycjSh9F
   A==;
X-CSE-ConnectionGUID: UT6j+2rGSnysRpuA+xhmag==
X-CSE-MsgGUID: riaiTwSaQrOw/xBeACCHJg==
X-IronPort-AV: E=McAfee;i="6800,10657,11742"; a="75851487"
X-IronPort-AV: E=Sophos;i="6.23,147,1770624000"; 
   d="scan'208";a="75851487"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Mar 2026 00:10:15 -0700
X-CSE-ConnectionGUID: RHyXOGRKRLuOXq6xDXFvzw==
X-CSE-MsgGUID: sALiAMTDT46eY9YNyd+ykw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,147,1770624000"; 
   d="scan'208";a="222421393"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by fmviesa007.fm.intel.com with ESMTP; 29 Mar 2026 00:10:15 -0700
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w6kHk-000000007s5-1uxZ;
	Sun, 29 Mar 2026 07:10:12 +0000
Date: Sun, 29 Mar 2026 09:09:27 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: 
 arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l-8-hd-panel.dtb: pmic
 (mediatek,mt6359): '#sound-dai-cells' does not match any of the regexes:
 '^pinctrl-[0-9]+$'
Message-ID: <202603290938.O0uzLthO-lkp@intel.com>
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
TO: "Rob Herring (Arm)" <robh@kernel.org>
CC: Frank Wunderlich <frank-w@public-files.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   cbfffcca2bf0622b601b7eaf477aa29035169184
commit: ce7b1d58609abc2941a1f38094147f439fb74233 arm64: dts: mediatek: Apply mt8395-radxa DT overlay at build time
date:   3 months ago
:::::: branch date: 14 hours ago
:::::: commit date: 3 months ago
config: arm64-randconfig-2055-20260328 (https://download.01.org/0day-ci/archive/20260329/202603290938.O0uzLthO-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project f43d6834093b19baf79beda8c0337ab020ac5f17)
dtschema: 2025.13.dev8+g0515abdd9
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260329/202603290938.O0uzLthO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202603290938.O0uzLthO-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l-8-hd-panel.dtb: pmic (mediatek,mt6359): '#sound-dai-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml
>> arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l-8-hd-panel.dtb: infra-iommu@10315000 (mediatek,mt8195-iommu-infra): interrupts: [[0, 795, 4, 0], [0, 796, 4, 0], [0, 797, 4, 0], [0, 798, 4, 0], [0, 799, 4, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/mediatek,iommu.yaml
>> arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l-8-hd-panel.dtb: jpeg-decoder@1a040000 (mediatek,mt8195-jpgdec): 'jpgdec@0,0', 'jpgdec@0,10000', 'jpgdec@1,0' do not match any of the regexes: '^jpgdec@[0-9a-f]+$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mt8195-jpegdec.yaml
>> arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l-8-hd-panel.dtb: jpeg-encoder@1a030000 (mediatek,mt8195-jpgenc): 'jpgenc@0,0', 'jpgenc@1,0' do not match any of the regexes: '^jpgenc@[0-9a-f]+$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mt8195-jpegenc.yaml

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
