Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14FBE38DC48
	for <oe-kbuild@lists.linux.dev>; Thu, 30 Jul 2026 05:31:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785389477; cv=none; b=fhM/YK5LRJtKMqPGUgIo9h6n9B8bgDdz0Bp4vb9cFBSJRJuE76sQLQyqG1xdUXRQUXz8IP8b2NprbXOK12agXIMdOGtMvK/iwwORtsDh0VxwNT/wOiM71LC7ONylnTzlWRWSS6NchZXRkYquP8UHmJHYDmvuQAOo621UAs0wH0s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785389477; c=relaxed/simple;
	bh=fTBPDR7T+thzUBl302lNT2mqiFfuJsNTh/0POqVwf1g=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Bz24dTmhRvqKEkRJudY4EhHqCzA2VaaB6WcEJ1SHV1e7wwhPc/ExmtbvrKt48O+XIdV3diOUi8I2Ybb2+532e+ulblTPh08I8Yup56rfoMf99emrEeeQO1TEk4I+8EX9A0y0EuDvVGsodJbIrzmB2CnJIxNx4UYEmaD3u0chcF4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ARKnfZL9; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ARKnfZL9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785389475; x=1816925475;
  h=date:from:to:cc:subject:message-id;
  bh=fTBPDR7T+thzUBl302lNT2mqiFfuJsNTh/0POqVwf1g=;
  b=ARKnfZL9pwTYsXdLUVHTxV2JU62p/gRqr3C+boyI5HNJazuDvb3+6gUX
   SRQGFqfzKzkpw6WbVkoucZf/Xl4jBVxPusAbgqJOIi5TwHLvug9kDX/J1
   mXXxKk0ltr46zR56UCP/u9F1PSUocgI8LSO0F4Dt9Dy2J9+X0NBD+ZJIE
   B7nFHw3/NsWb+c3NUSSeAUvVFCt91rg833RmlwGo87v20oJmShPr41Mx+
   DZySLvISwQ3j4l9/gAA4rO1+y1Cqf0/krz9L7CG+QK5aUiuyZlc3z/lUU
   ZllnFpnGffnFakwsaMMEeA2adz/2VSVpaDlPpdt/jjeuao0r5DvwYvBhf
   Q==;
X-CSE-ConnectionGUID: 2fvtgJtlSjWkAuiEcKoQFw==
X-CSE-MsgGUID: rC4MivEdRZefHX1OF9PtYQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11859"; a="97516010"
X-IronPort-AV: E=Sophos;i="6.25,193,1779174000"; 
   d="scan'208";a="97516010"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jul 2026 22:31:15 -0700
X-CSE-ConnectionGUID: MSiSsL88Q/GGwk/yZXrsQQ==
X-CSE-MsgGUID: bmNVb3G4R5WLgJST1yHZuA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,193,1779174000"; 
   d="scan'208";a="259627027"
Received: from igk-lkp-server01.igk.intel.com (HELO 3cba2a188a06) ([10.211.93.152])
  by orviesa008.jf.intel.com with ESMTP; 29 Jul 2026 22:31:13 -0700
Received: from kbuild by 3cba2a188a06 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wpJMN-000000002K6-2wxw;
	Thu, 30 Jul 2026 05:31:11 +0000
Date: Thu, 30 Jul 2026 07:31:11 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: arch/arm64/boot/dts/mediatek/mt8395-genio-1200-evk-ufs.dtb:
 jpeg-decoder@1a040000 (mediatek,mt8195-jpgdec): 'jpgdec@0,0',
 'jpgdec@0,10000', 'jpgdec@1,0' do not match any of the regexes:
 '^jpgdec@[0-9a-f]+$', '^pinctrl-[0-9]+$'
Message-ID: <202607300750.8Q2jBBez-lkp@intel.com>
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
head:   11028ab62899e4191e074ee364c712b77823a9c4
commit: e6bd92bb204757a7b1f4b4dc263a82b3985fadd3 arm64: dts: mediatek: add device-tree for Genio 1200 EVK UFS board
date:   10 months ago
:::::: branch date: 5 hours ago
:::::: commit date: 10 months ago
config: arm64-randconfig-2054-20260729 (https://download.01.org/0day-ci/archive/20260730/202607300750.8Q2jBBez-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 9521d0c03324fb5950727522cdf71d94fd3f68b1)
dtschema: 2026.7.dev1+g2203c1720
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260730/202607300750.8Q2jBBez-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: e6bd92bb2047 ("arm64: dts: mediatek: add device-tree for Genio 1200 EVK UFS board")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202607300750.8Q2jBBez-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/mediatek/mt8395-genio-common.dtsi:1172.7-1180.4: Warning (graph_child_address): /soc/syscon@1c01a000/port: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/mediatek/mt8395-genio-1200-evk-ufs.dtb: pmic (mediatek,mt6359): '#sound-dai-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml
   arch/arm64/boot/dts/mediatek/mt8395-genio-1200-evk-ufs.dtb: infra-iommu@10315000 (mediatek,mt8195-iommu-infra): interrupts: [[0, 795, 4, 0], [0, 796, 4, 0], [0, 797, 4, 0], [0, 798, 4, 0], [0, 799, 4, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/mediatek,iommu.yaml
>> arch/arm64/boot/dts/mediatek/mt8395-genio-1200-evk-ufs.dtb: jpeg-decoder@1a040000 (mediatek,mt8195-jpgdec): 'jpgdec@0,0', 'jpgdec@0,10000', 'jpgdec@1,0' do not match any of the regexes: '^jpgdec@[0-9a-f]+$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mt8195-jpegdec.yaml
>> arch/arm64/boot/dts/mediatek/mt8395-genio-1200-evk-ufs.dtb: jpeg-encoder@1a030000 (mediatek,mt8195-jpgenc): 'jpgenc@0,0', 'jpgenc@1,0' do not match any of the regexes: '^jpgenc@[0-9a-f]+$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mt8195-jpegenc.yaml

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
