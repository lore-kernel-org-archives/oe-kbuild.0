Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72BA92C235E
	for <oe-kbuild@lists.linux.dev>; Mon, 26 Jan 2026 20:59:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769461167; cv=none; b=XRC0YzFYHbME20qeApij//gm63xrU/cAvjV4sWu9o0P4isNQohXDjq8znDRVFSbiTU5+pnqTvklphuR4WsM8m1ReKRPaEHKUh2MZSgrA2M6pYFwyfijWdR4QVBDq8oHQcnRp+1JQEXFdKugxsiL0fU5dsJ5010YtFFSW/1J1CT0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769461167; c=relaxed/simple;
	bh=jAIO6JXyQlZcdIRlsNvNLnjiWZKcFN0kepz8omPXBGI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=cBPpBhUl08C78ucdXndA/N9ALM3DisnZ5Mi3HG+X1W5Eu+/6wy1qc6gkXQ0U8CAeCGzNwIugiwLwjbNtlSSaAu6VBMt+wenwxpo0SWQRgGSJhbZ30iqjIlI7gmOqDRll4ZAuY/4WFZeNyk9ydTD8qF/targhGnOQN8fjUL89nKg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kLzQc0QK; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kLzQc0QK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769461165; x=1800997165;
  h=date:from:to:cc:subject:message-id;
  bh=jAIO6JXyQlZcdIRlsNvNLnjiWZKcFN0kepz8omPXBGI=;
  b=kLzQc0QKr/BYCpu7+HM/y+BaYDIQeics7mxTvpJ6dIRxclEWZ61x5v1C
   SaKx+V0bTyGtRfoJQo9e9Ru1HjGQX2IVvzDxZW+1qvIgx6NP+Qy/OiFh7
   awiTzipDci6AUSuQXFFWJkGFk7Jc8meC8zmcZdNcKP5PR3MmB5DpH/sBz
   eoJ72RIdLu5D/g8z9pDGzMeTDGpeDln+69wbZA10q1dv859i+aVmiwmd/
   Akx0SYH9yGoBWXgbQfkbclMS0Zo09V/HcvzX4OytCTOxhad98HKZ1FVFc
   aXuv8LQD/KCltuPeyb9Bebtp5/sP8t2xfdyjXO0kn0sbJKWFKcu3tbzFe
   g==;
X-CSE-ConnectionGUID: Hf1VgQajR3eY53DJvaZ+QA==
X-CSE-MsgGUID: A3b6aaldQM2BQ1YlC4GXEw==
X-IronPort-AV: E=McAfee;i="6800,10657,11683"; a="93306319"
X-IronPort-AV: E=Sophos;i="6.21,256,1763452800"; 
   d="scan'208";a="93306319"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jan 2026 12:59:25 -0800
X-CSE-ConnectionGUID: 6kuyI5METf6lt6TIsJQqJg==
X-CSE-MsgGUID: Kttu20boQ7Gl5is4xuameg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,256,1763452800"; 
   d="scan'208";a="208224719"
Received: from igk-lkp-server01.igk.intel.com (HELO afc5bfd7f602) ([10.211.93.152])
  by fmviesa009.fm.intel.com with ESMTP; 26 Jan 2026 12:59:23 -0800
Received: from kbuild by afc5bfd7f602 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vkTg9-000000001bN-324y;
	Mon, 26 Jan 2026 20:59:21 +0000
Date: Mon, 26 Jan 2026 21:58:34 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: arch/arm64/boot/dts/mediatek/mt8195-cherry-dojo-r1.dtb:
 jpeg-encoder@1a030000 (mediatek,mt8195-jpgenc): 'jpgenc@0,0', 'jpgenc@1,0' do
 not match any of the regexes: '^jpgenc@[0-9a-f]+$', '^pinctrl-[0-9]+$'
Message-ID: <202601262103.cKSLp0ts-lkp@intel.com>
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
TO: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
CC: Matthias Brugger <matthias.bgg@gmail.com>
CC: Fei Shao <fshao@chromium.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   fcb70a56f4d81450114034b2c61f48ce7444a0e2
commit: a9eac43d039f86518595a8a731064309f1088fc6 arm64: dts: mediatek: mt8195: Fix ranges for jpeg enc/decoder nodes
date:   5 months ago
:::::: branch date: 3 hours ago
:::::: commit date: 5 months ago
config: arm64-randconfig-2052-20260123 (https://download.01.org/0day-ci/archive/20260126/202601262103.cKSLp0ts-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
dtschema version: 2025.13.dev4+g85cec3155
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260126/202601262103.cKSLp0ts-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202601262103.cKSLp0ts-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/mediatek/mt8195-cherry-dojo-r1.dtb: pmic@34 (mediatek,mt6360): #interrupt-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6360.yaml
   arch/arm64/boot/dts/mediatek/mt8195-cherry-dojo-r1.dtb: codec@1a (realtek,rt5682s): 'DBVDD-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/sound/realtek,rt5682s.yaml
   arch/arm64/boot/dts/mediatek/mt8195-cherry-dojo-r1.dtb: codec@1a (realtek,rt5682s): 'LDO1-IN-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/sound/realtek,rt5682s.yaml
   arch/arm64/boot/dts/mediatek/mt8195-cherry-dojo-r1.dtb: codec@1a (realtek,rt5682s): Unevaluated properties are not allowed ('VBAT-supply' was unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/realtek,rt5682s.yaml
   arch/arm64/boot/dts/mediatek/mt8195-cherry-dojo-r1.dtb: jpeg-decoder@1a040000 (mediatek,mt8195-jpgdec): 'jpgdec@0,0', 'jpgdec@0,10000', 'jpgdec@1,0' do not match any of the regexes: '^jpgdec@[0-9a-f]+$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mt8195-jpegdec.yaml
>> arch/arm64/boot/dts/mediatek/mt8195-cherry-dojo-r1.dtb: jpeg-encoder@1a030000 (mediatek,mt8195-jpgenc): 'jpgenc@0,0', 'jpgenc@1,0' do not match any of the regexes: '^jpgenc@[0-9a-f]+$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mt8195-jpegenc.yaml
   arch/arm64/boot/dts/mediatek/mt8195-cherry-dojo-r1.dtb: rt1019p (realtek,rt1019p): 'label' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/sound/realtek,rt1015p.yaml
--
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r1.dtb: pmic (mediatek,mt6359): '#sound-dai-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r1.dtb: infra-iommu@10315000 (mediatek,mt8195-iommu-infra): interrupts: [[0, 795, 4, 0], [0, 796, 4, 0], [0, 797, 4, 0], [0, 798, 4, 0], [0, 799, 4, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/mediatek,iommu.yaml
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r1.dtb: pmic@34 (mediatek,mt6360): #interrupt-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6360.yaml
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r1.dtb: codec@1a (realtek,rt5682i): 'DBVDD-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/sound/realtek,rt5682.yaml
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r1.dtb: codec@1a (realtek,rt5682i): 'LDO1-IN-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/sound/realtek,rt5682.yaml
>> arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r1.dtb: jpeg-decoder@1a040000 (mediatek,mt8195-jpgdec): 'jpgdec@0,0', 'jpgdec@0,10000', 'jpgdec@1,0' do not match any of the regexes: '^jpgdec@[0-9a-f]+$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mt8195-jpegdec.yaml
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r1.dtb: jpeg-encoder@1a030000 (mediatek,mt8195-jpgenc): 'jpgenc@0,0', 'jpgenc@1,0' do not match any of the regexes: '^jpgenc@[0-9a-f]+$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mt8195-jpegenc.yaml
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r1.dtb: rt1019p (realtek,rt1019p): 'label' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/sound/realtek,rt1015p.yaml
--
   arch/arm64/boot/dts/mediatek/mt8195-evb.dtb: infra-iommu@10315000 (mediatek,mt8195-iommu-infra): interrupts: [[0, 795, 4, 0], [0, 796, 4, 0], [0, 797, 4, 0], [0, 798, 4, 0], [0, 799, 4, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/mediatek,iommu.yaml
   arch/arm64/boot/dts/mediatek/mt8195-evb.dtb: jpeg-decoder@1a040000 (mediatek,mt8195-jpgdec): 'jpgdec@0,0', 'jpgdec@0,10000', 'jpgdec@1,0' do not match any of the regexes: '^jpgdec@[0-9a-f]+$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mt8195-jpegdec.yaml
>> arch/arm64/boot/dts/mediatek/mt8195-evb.dtb: jpeg-encoder@1a030000 (mediatek,mt8195-jpgenc): 'jpgenc@0,0', 'jpgenc@1,0' do not match any of the regexes: '^jpgenc@[0-9a-f]+$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mt8195-jpegenc.yaml
--
   arch/arm64/boot/dts/mediatek/mt8195.dtsi:3359.22-3371.5: Warning (avoid_unnecessary_addr_size): /soc/dsi@1c008000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l.dtb: pmic (mediatek,mt6359): '#sound-dai-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml
   arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l.dtb: infra-iommu@10315000 (mediatek,mt8195-iommu-infra): interrupts: [[0, 795, 4, 0], [0, 796, 4, 0], [0, 797, 4, 0], [0, 798, 4, 0], [0, 799, 4, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/mediatek,iommu.yaml
>> arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l.dtb: jpeg-decoder@1a040000 (mediatek,mt8195-jpgdec): 'jpgdec@0,0', 'jpgdec@0,10000', 'jpgdec@1,0' do not match any of the regexes: '^jpgdec@[0-9a-f]+$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mt8195-jpegdec.yaml
   arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l.dtb: jpeg-encoder@1a030000 (mediatek,mt8195-jpgenc): 'jpgenc@0,0', 'jpgenc@1,0' do not match any of the regexes: '^jpgenc@[0-9a-f]+$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mt8195-jpegenc.yaml

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
