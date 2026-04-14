Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 573783D88E8
	for <oe-kbuild@lists.linux.dev>; Tue, 14 Apr 2026 15:22:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776180126; cv=none; b=GvTGkbWo3lihJR/yek1ywq8oKLU0NuqmxhQYa5pqSqZJXL47t4xdK/Rylsd8DABpW7jqSTZL6IRnl4C3WmDkhWCC3VLTQKjiKxho/jwJw0OZpzoJyJ7AvFxPmeoqt7Uq9aD+QrDxO3bcJG7ZR2SoCUm9CORHv5hxgE3wSnR3gNk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776180126; c=relaxed/simple;
	bh=F5Oh7qWfbYQfi9tqbZJt7wwUbTSuITpSfRSM5FUsRnQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=OyFRmtpU0Tjm8AT0JUBfc9Rpyw1pAI3cUv/XcKF1B/GbDGstwayAZOOh0O3/MGveKQw07iwgci2I8SrbmBRtAXih7brHo3t8NO/RxSg/tmgVxv0W5HailDJtHgsvz+Rgf5oStV5XrWDpqkTsFxKzU9St0idjxtaE07DQwlIXB2c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=I6O1l2fb; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="I6O1l2fb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776180124; x=1807716124;
  h=date:from:to:cc:subject:message-id;
  bh=F5Oh7qWfbYQfi9tqbZJt7wwUbTSuITpSfRSM5FUsRnQ=;
  b=I6O1l2fbOqjdvnNVghAP9ybd0OEWVPtRzaHLnl6g49pfVOVnCfSFRpVS
   KUS3qg8xHxo+5E55Tw9fqEu1i/f0t3YHRreOb662FAGDlpuCrz6oWL0gf
   R3fLW3Kx18cvgEJo4YsLoqN72+vZxV4ewGIegEg/l3mR286R3CkbymYI4
   kqdGqVHtjNXuXpp1p+AOlq9onmbHet6cEmrgRe6CPdBd/SnGHvpiHCvib
   NYhScYLlOK4MYvoqkb/MFWKKGKy+pF1UT1fKHsl8SURmtCdQI9u5FRRi1
   FJxCOZ1tG9E5P9JWgUWIe+bDb+GlrIoA8brct5Yj0PKVufz7q0vZjytih
   A==;
X-CSE-ConnectionGUID: JSl5NCInTp+D1Y1qdP8IJg==
X-CSE-MsgGUID: Kok0xHYWQVihGht5aqpHQQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11759"; a="88219121"
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; 
   d="scan'208";a="88219121"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2026 08:22:04 -0700
X-CSE-ConnectionGUID: ep+ZJTgTSoiZiiaq4m2RzQ==
X-CSE-MsgGUID: wrrz3IHsTDS2qJuP/ADBtA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; 
   d="scan'208";a="253342375"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by fmviesa002.fm.intel.com with ESMTP; 14 Apr 2026 08:22:03 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wCfaS-000000000Qv-2xcb;
	Tue, 14 Apr 2026 15:22:00 +0000
Date: Tue, 14 Apr 2026 17:21:59 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: arch/arm64/boot/dts/mediatek/mt8395-genio-1200-evk-ufs.dtb:
 jpeg-decoder@1a040000 (mediatek,mt8195-jpgdec): 'jpgdec@0,0',
 'jpgdec@0,10000', 'jpgdec@1,0' do not match any of the regexes:
 '^jpgdec@[0-9a-f]+$', '^pinctrl-[0-9]+$'
Message-ID: <202604141755.2tLO4e3C-lkp@intel.com>
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
head:   d60bc140158342716e13ff0f8aa65642f43ba053
commit: e6bd92bb204757a7b1f4b4dc263a82b3985fadd3 arm64: dts: mediatek: add device-tree for Genio 1200 EVK UFS board
date:   6 months ago
:::::: branch date: 12 hours ago
:::::: commit date: 6 months ago
config: arm64-randconfig-2051-20260413 (https://download.01.org/0day-ci/archive/20260414/202604141755.2tLO4e3C-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.5.0
dtschema: 2026.5.dev2+g3579443c5
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260414/202604141755.2tLO4e3C-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: e6bd92bb2047 ("arm64: dts: mediatek: add device-tree for Genio 1200 EVK UFS board")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202604141755.2tLO4e3C-lkp@intel.com/

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
