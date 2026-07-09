Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88BED3C5DBE
	for <oe-kbuild@lists.linux.dev>; Thu,  9 Jul 2026 21:40:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783633221; cv=none; b=nfZ/L/jRvOUAvFEiVInZCbD1UaSzIHh8M9rnpSLz2ZQexs1mZ0TtJmGxsnftmV3LjhvzoWUtY9vCF4YuUL/hJnLyDhRDoCzC7+HAhrXa215Lo0wmEQgqc6JsxRvs7WGDX+RkIdb01RlzYSSkBH7vOcujZPCrZvdxwGEk4C4UMYM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783633221; c=relaxed/simple;
	bh=LyfScjjWdyktbEa+43DaLcM7AzBaK44iePXZVyRkc7U=;
	h=Date:From:To:Cc:Subject:Message-ID; b=PLeYNQjg/va99c5JhKxhWs5+gpleQjR1CIY0JnWzPHwj5mHrf4BMNUhuNDw/lJFcUNa7ObDubw3eE5xfcTvBoZJ7yzTjGk9mDDi2MPenWNbhbbJH4oigL3TspEhXjPLOUE4RlavzKuBRyngpLTBByHVlAE44FW8esLdNrt+J0ns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TfpgnmoD; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TfpgnmoD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783633220; x=1815169220;
  h=date:from:to:cc:subject:message-id;
  bh=LyfScjjWdyktbEa+43DaLcM7AzBaK44iePXZVyRkc7U=;
  b=TfpgnmoDrpfBQOaD4zeiDXP6o5P3wX6cO1SFedmwnUKwG8CbYVC504+d
   dSlMRjxz81Mom7MOxa9BnfYaHjx8DALLXZGRN7WspFgTNljLelFz93wcr
   JlxVRenYwCA4ZaGPmkhJqwJaBdnZYCUTmL2PhGdRkGZcrHeYhV60a7ruh
   0nN1WGfgL2tPTa7JU2HgjrHFCXB+R9QqCmDjR+3M2Free5HGgU65IgX5k
   WO7EiB647cVd65NfnbuwG08k1Sc/h6Z76+mn4S4rXP19O8NecO06+j9V9
   wtDcjfudSjpocVNAc5cQ8IR6H3aN6+xyWVnld3sODW9PLRyt3+uk2TjE1
   A==;
X-CSE-ConnectionGUID: eVJZKIrYRWK01bPUUlfMmA==
X-CSE-MsgGUID: bKqocvYXSc2hk0dAPguLww==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="95485853"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="95485853"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jul 2026 14:40:19 -0700
X-CSE-ConnectionGUID: yMGFOw7TSRWev7SDtjHs0A==
X-CSE-MsgGUID: 1W145yzySXeafNgE/7vEOA==
X-ExtLoop1: 1
Received: from igk-lkp-server01.igk.intel.com (HELO e5a8ed462067) ([10.211.93.152])
  by fmviesa003.fm.intel.com with ESMTP; 09 Jul 2026 14:40:18 -0700
Received: from kbuild by e5a8ed462067 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1whwTg-0000000032P-1QdT;
	Thu, 09 Jul 2026 21:40:16 +0000
Date: Thu, 09 Jul 2026 23:40:06 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: 
 arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l-8-hd-panel.dtb:
 infra-iommu@10315000 (mediatek,mt8195-iommu-infra): interrupts: [[0, 795, 4,
 0], [0, 796, 4, 0], [0, 797, 4, 0], [0, 798, 4, 0], [0, 799, 4, 0]] is too
 long
Message-ID: <202607092333.nAdU2evq-lkp@intel.com>
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
CC: Frank Wunderlich <frank-w@public-files.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   2c7c88a412aa6d09cd04b414211b4ef8553b5309
commit: ce7b1d58609abc2941a1f38094147f439fb74233 arm64: dts: mediatek: Apply mt8395-radxa DT overlay at build time
date:   7 months ago
:::::: branch date: 6 hours ago
:::::: commit date: 7 months ago
config: arm64-randconfig-2055-20260708 (https://download.01.org/0day-ci/archive/20260709/202607092333.nAdU2evq-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.5.0
dtschema: 2026.7.dev1+g2203c1720
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260709/202607092333.nAdU2evq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: ce7b1d58609a ("arm64: dts: mediatek: Apply mt8395-radxa DT overlay at build time")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202607092333.nAdU2evq-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l-8-hd-panel.dtb: pmic (mediatek,mt6359): '#sound-dai-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'
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
