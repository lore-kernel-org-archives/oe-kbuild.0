Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D8AE3B9610
	for <oe-kbuild@lists.linux.dev>; Wed,  9 Sep 2026 07:01:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788937268; cv=none; b=WbNqBQkoilt6r37/nE2x0EUkUZXWXWSCj/+x1/+GAKSoolgEcbNBwzgo5cG1pJhQcUzo2zqAeVv+LZ68/dtVCSZNNl/EVc0LQvfxhjvYjSLWeZLon5yChdtTmtnU5WDwIc9CXn2c5TEZ5FX8XcyklcN2h5hQeD6h/tksV61qKC8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788937268; c=relaxed/simple;
	bh=ycXwzZEfMjtbdJjvuWtnrycCDi5b4wGr2+2eDD9Hwl8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=c8Ut7k/lqHCP8ZVVaksFJd7FO4mBg8boQqFa8N9/h5J51wdI037o8GQEnKY8kbmPcGQXBdm4u1XWekUOeAwnsaG0e6sGfLMFI3seNgH2squuPO2HJjFUwgjbD6elPvahHye8VQiE5sQGgf0aIh5g4Z0mlFkA6t5s9smtnDFV8D4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=A3jkC+pf; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="A3jkC+pf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788937266; x=1820473266;
  h=date:from:to:cc:subject:message-id;
  bh=ycXwzZEfMjtbdJjvuWtnrycCDi5b4wGr2+2eDD9Hwl8=;
  b=A3jkC+pfMmXQ8Daw7EqUjkZvk5aI4+ozoL24qxQb3WEPEirLKJYa6nvn
   gOBwA8YMl49yP5W33rqdzrJ7KzpoHkUiceoBMlco7dt9yQdjSjC9WkzBQ
   ifMQbgcHV5RF7Y9UqIVPY1pRAW0etYXbcR1r9kOX76JndW1BB7xh1oshA
   I6tuzp9f7ZCf+mbYamkE8GL0M9MRw9zWsr/7KSnJ8TrWWiMm+GmIzsP8N
   AOHO3Hibr8GqWa7AgRZWXi+VitCPcrYK0136pB64G6l7gKgH/Pqw+Si6P
   UObDdnFuqWJgXDEbA2nFSaFICikpnoGrDXBb9cg17kqVPu4sN1zpySeRE
   A==;
X-CSE-ConnectionGUID: hqdgmH7jRtSj2lsqACCXrg==
X-CSE-MsgGUID: 2GQWbQveTqSB/7S9GAGvQw==
X-IronPort-AV: E=McAfee;i="6800,10657,11900"; a="89384601"
X-IronPort-AV: E=Sophos;i="6.25,270,1779174000"; 
   d="scan'208";a="89384601"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2026 00:01:05 -0700
X-CSE-ConnectionGUID: tYHw/PhTT7uWWq87S9Vpbw==
X-CSE-MsgGUID: vxHh6/2VS3iJ+TCUTvN5PQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,270,1779174000"; 
   d="scan'208";a="269478610"
Received: from igk-lkp-server01.igk.intel.com (HELO cc074f2a4298) ([10.211.93.152])
  by orviesa006.jf.intel.com with ESMTP; 09 Sep 2026 00:01:04 -0700
Received: from kbuild by cc074f2a4298 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x4CIn-000000001uU-40QE;
	Wed, 09 Sep 2026 07:01:01 +0000
Date: Wed, 09 Sep 2026 09:00:09 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: arch/arm64/boot/dts/mediatek/mt8395-genio-1200-evk-ufs.dtb:
 infra-iommu@10315000 (mediatek,mt8195-iommu-infra): interrupts: [[0, 795, 4,
 0], [0, 796, 4, 0], [0, 797, 4, 0], [0, 798, 4, 0], [0, 799, 4, 0]] is too
 long
Message-ID: <202609090806.ZAmlmwwV-lkp@intel.com>
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
TO: Macpaul Lin <macpaul.lin@mediatek.com>
CC: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   893e11787f78e43b534e252249ac3fff4d1333f8
commit: e6bd92bb204757a7b1f4b4dc263a82b3985fadd3 arm64: dts: mediatek: add device-tree for Genio 1200 EVK UFS board
date:   11 months ago
:::::: branch date: 11 hours ago
:::::: commit date: 11 months ago
config: arm64-randconfig-2051-20260908 (https://download.01.org/0day-ci/archive/20260909/202609090806.ZAmlmwwV-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.4.0
dtschema: 2026.7.dev16+g39602f98e
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260909/202609090806.ZAmlmwwV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: e6bd92bb2047 ("arm64: dts: mediatek: add device-tree for Genio 1200 EVK UFS board")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202609090806.ZAmlmwwV-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/mediatek/mt8395-genio-common.dtsi:1172.7-1180.4: Warning (graph_child_address): /soc/syscon@1c01a000/port: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/mediatek/mt8395-genio-1200-evk-ufs.dtb: pmic (mediatek,mt6359): '#sound-dai-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml
>> arch/arm64/boot/dts/mediatek/mt8395-genio-1200-evk-ufs.dtb: infra-iommu@10315000 (mediatek,mt8195-iommu-infra): interrupts: [[0, 795, 4, 0], [0, 796, 4, 0], [0, 797, 4, 0], [0, 798, 4, 0], [0, 799, 4, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/mediatek,iommu.yaml
   arch/arm64/boot/dts/mediatek/mt8395-genio-1200-evk-ufs.dtb: jpeg-decoder@1a040000 (mediatek,mt8195-jpgdec): 'jpgdec@0,0', 'jpgdec@0,10000', 'jpgdec@1,0' do not match any of the regexes: '^jpgdec@[0-9a-f]+$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mt8195-jpegdec.yaml
   arch/arm64/boot/dts/mediatek/mt8395-genio-1200-evk-ufs.dtb: jpeg-encoder@1a030000 (mediatek,mt8195-jpgenc): 'jpgenc@0,0', 'jpgenc@1,0' do not match any of the regexes: '^jpgenc@[0-9a-f]+$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mt8195-jpegenc.yaml

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
