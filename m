Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A93E13939B1
	for <oe-kbuild@lists.linux.dev>; Sat, 26 Sep 2026 13:18:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790428741; cv=none; b=UU0PAGCOj2NtKSqvCdZ75EIi8r/755GPAg+OQDH22lit/JB6+syvwTAaOSEboIN5aw5al4zsnSBzidPQaUNKzw0/zPn7XzecpLvvUQyYnq+abPEkZ7XX/FqoENChgcj/Lm4dmPQnhsycJ30lgFPlLpulGOaGMG0ejW4lajrlLvs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790428741; c=relaxed/simple;
	bh=eZlvzVgSEet2pVpRY1lyS6ukdmlb3wjAIeH8UZjxqWc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=YLdMIrEhH5kRgxSb8Xh4PeH50GdXy91wB46jufRNXh9gL25OEMqpvvIT7QArxYrioxHRx1PvUEWGVCKB+I0i73bEbLQSiryuGkcgSgeh+6VeMCFXkMa4hFzPvb32a1PQOTVqioxPQdwzcpWH4XNSR/RDJ+stY7MmvyGSo7yC8+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Zw1siAeX; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Zw1siAeX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790428737; x=1821964737;
  h=date:from:to:cc:subject:message-id;
  bh=eZlvzVgSEet2pVpRY1lyS6ukdmlb3wjAIeH8UZjxqWc=;
  b=Zw1siAeXvMpzRGBPufzU2PZbR993pu7c25RdZW7aX7Drw5brw0SXyKjB
   D9589QkaMt/o2i6cWL4KGqW+be0wp82/RSwRPeg3zOlXp7w5E1zEgCFlt
   zqRlS7NjFt/uKe1X0do9DsV5Bmwbd18NwNJNMS4kzHy/TY2LPHMUt9RsK
   FpOassdAE0N4vbBW2Enovm/+Y6ao5KVK1xAYlwYJDkXgW/EAr+yss/76y
   ho96Xh+YJYuc4IfTASiRaMM4vUY6jTlz3JLNF53G6gXipSCqRrD7Axeki
   k7Ya2xQ9fmEZKPizk7oUvsFo789tXVYmA9pEh1YIVt6RXZc4L/HtdsMoM
   g==;
X-CSE-ConnectionGUID: xUUbE05WTbqxhnAPMaGw1A==
X-CSE-MsgGUID: CxvsWVThQpe29l05qaPBew==
X-IronPort-AV: E=McAfee;i="6800,10657,11916"; a="94073443"
X-IronPort-AV: E=Sophos;i="6.27,124,1787036400"; 
   d="scan'208";a="94073443"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Sep 2026 06:18:57 -0700
X-CSE-ConnectionGUID: LhsgYtxxSSiruZgA26gIog==
X-CSE-MsgGUID: FB8J7OoSRL6duhxJN6sE4w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,124,1787036400"; 
   d="scan'208";a="272736924"
Received: from igk-lkp-server01.igk.intel.com (HELO 7278393c7b39) ([10.211.93.152])
  by orviesa010.jf.intel.com with ESMTP; 26 Sep 2026 06:18:55 -0700
Received: from kbuild by 7278393c7b39 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xASIe-000000000XD-2H7W;
	Sat, 26 Sep 2026 13:18:48 +0000
Date: Sat, 26 Sep 2026 15:18:28 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: arch/arm64/boot/dts/mediatek/mt8195-evb.dtb: ufshci@11270000
 (mediatek,mt8195-ufshci): clock-names: ['ufs', 'ufs_aes', 'ufs_tick',
 'unipro_sysclk', 'unipro_tick', 'unipro_mp_bclk', 'ufs_tx_symbol',
 'ufs_mem_sub'] is too short
Message-ID: <202609261517.vwShTIHo-lkp@intel.com>
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
TO: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
CC: 0day robot <lkp@intel.com>
CC: Chaotian Jing <chaotian.jing@mediatek.com>
CC: "Louis-Alexis Eyraud" <louisalexis.eyraud@collabora.com>

tree:   https://github.com/intel-lab-lkp/linux/commits/Louis-Alexis-Eyraud/dt-bindings-phy-Add-mediatek-mt8196-ufsphy-variant/20260914-133847
head:   480eb6f0beac6185dd01583a82cbc0e8ce702127
commit: 8b6f7071e28ba8807e69e6d9887666320478fed1 dt-bindings: ufs: mediatek,ufs: Complete the binding
date:   12 days ago
:::::: branch date: 12 days ago
:::::: commit date: 12 days ago
config: arm64-randconfig-2401-20260926 (https://download.01.org/0day-ci/archive/20260926/202609261517.vwShTIHo-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
dtschema: 2026.10.dev2+g840a01d41
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260926/202609261517.vwShTIHo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202609261517.vwShTIHo-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/mediatek/mt8195-evb.dtb: infra-iommu@10315000 (mediatek,mt8195-iommu-infra): interrupts: [[0, 795, 4, 0], [0, 796, 4, 0], [0, 797, 4, 0], [0, 798, 4, 0], [0, 799, 4, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/mediatek,iommu.yaml
>> arch/arm64/boot/dts/mediatek/mt8195-evb.dtb: ufshci@11270000 (mediatek,mt8195-ufshci): clock-names: ['ufs', 'ufs_aes', 'ufs_tick', 'unipro_sysclk', 'unipro_tick', 'unipro_mp_bclk', 'ufs_tx_symbol', 'ufs_mem_sub'] is too short
   	from schema $id: http://devicetree.org/schemas/ufs/mediatek,ufs.yaml
>> arch/arm64/boot/dts/mediatek/mt8195-evb.dtb: ufshci@11270000 (mediatek,mt8195-ufshci): clocks: [[25, 63], [25, 64], [25, 65], [25, 54], [25, 55], [25, 56], [25, 90], [25, 93]] is too short
   	from schema $id: http://devicetree.org/schemas/ufs/mediatek,ufs.yaml
>> arch/arm64/boot/dts/mediatek/mt8195-evb.dtb: ufshci@11270000 (mediatek,mt8195-ufshci): clock-names:0: 'main' was expected
   	from schema $id: http://devicetree.org/schemas/ufs/mediatek,ufs.yaml
>> arch/arm64/boot/dts/mediatek/mt8195-evb.dtb: ufshci@11270000 (mediatek,mt8195-ufshci): clock-names:1: 'aes' was expected
   	from schema $id: http://devicetree.org/schemas/ufs/mediatek,ufs.yaml
>> arch/arm64/boot/dts/mediatek/mt8195-evb.dtb: ufshci@11270000 (mediatek,mt8195-ufshci): clock-names:2: 'tick' was expected
   	from schema $id: http://devicetree.org/schemas/ufs/mediatek,ufs.yaml
>> arch/arm64/boot/dts/mediatek/mt8195-evb.dtb: ufshci@11270000 (mediatek,mt8195-ufshci): clock-names:6: 'tx_symbol' was expected
   	from schema $id: http://devicetree.org/schemas/ufs/mediatek,ufs.yaml
>> arch/arm64/boot/dts/mediatek/mt8195-evb.dtb: ufshci@11270000 (mediatek,mt8195-ufshci): clock-names:7: 'mem_sub' was expected
   	from schema $id: http://devicetree.org/schemas/ufs/mediatek,ufs.yaml
>> arch/arm64/boot/dts/mediatek/mt8195-evb.dtb: ufshci@11270000 (mediatek,mt8195-ufshci): False schema does not allow [[0, 0], [0, 0], [0, 0], [0, 0], [0, 0], [0, 0], [0, 0], [0, 0]]
   	from schema $id: http://devicetree.org/schemas/ufs/mediatek,ufs.yaml
   arch/arm64/boot/dts/mediatek/mt8195-evb.dtb: jpeg-decoder@1a040000 (mediatek,mt8195-jpgdec): 'jpgdec@0,0', 'jpgdec@0,10000', 'jpgdec@1,0' do not match any of the regexes: '^jpgdec@[0-9a-f]+$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mt8195-jpegdec.yaml
   arch/arm64/boot/dts/mediatek/mt8195-evb.dtb: jpeg-encoder@1a030000 (mediatek,mt8195-jpgenc): 'jpgenc@0,0', 'jpgenc@1,0' do not match any of the regexes: '^jpgenc@[0-9a-f]+$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mt8195-jpegenc.yaml
--
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r3.dtb: pmic (mediatek,mt6359): '#sound-dai-cells' does not match any of the regexes: '^pinctrl-[0-9]+$', '^vs(ys|[12])-ldo[1-9]-supply$', '^vsys-v[a-z]+[0-9]*-supply$'
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r3.dtb: infra-iommu@10315000 (mediatek,mt8195-iommu-infra): interrupts: [[0, 795, 4, 0], [0, 796, 4, 0], [0, 797, 4, 0], [0, 798, 4, 0], [0, 799, 4, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/mediatek,iommu.yaml
>> arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r3.dtb: ufshci@11270000 (mediatek,mt8195-ufshci): clock-names: ['ufs', 'ufs_aes', 'ufs_tick', 'unipro_sysclk', 'unipro_tick', 'unipro_mp_bclk', 'ufs_tx_symbol', 'ufs_mem_sub'] is too short
   	from schema $id: http://devicetree.org/schemas/ufs/mediatek,ufs.yaml
>> arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r3.dtb: ufshci@11270000 (mediatek,mt8195-ufshci): clocks: [[34, 63], [34, 64], [34, 65], [34, 54], [34, 55], [34, 56], [34, 90], [34, 93]] is too short
   	from schema $id: http://devicetree.org/schemas/ufs/mediatek,ufs.yaml
>> arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r3.dtb: ufshci@11270000 (mediatek,mt8195-ufshci): clock-names:0: 'main' was expected
   	from schema $id: http://devicetree.org/schemas/ufs/mediatek,ufs.yaml
>> arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r3.dtb: ufshci@11270000 (mediatek,mt8195-ufshci): clock-names:1: 'aes' was expected
   	from schema $id: http://devicetree.org/schemas/ufs/mediatek,ufs.yaml
>> arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r3.dtb: ufshci@11270000 (mediatek,mt8195-ufshci): clock-names:2: 'tick' was expected
   	from schema $id: http://devicetree.org/schemas/ufs/mediatek,ufs.yaml
>> arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r3.dtb: ufshci@11270000 (mediatek,mt8195-ufshci): clock-names:6: 'tx_symbol' was expected
   	from schema $id: http://devicetree.org/schemas/ufs/mediatek,ufs.yaml
>> arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r3.dtb: ufshci@11270000 (mediatek,mt8195-ufshci): clock-names:7: 'mem_sub' was expected
   	from schema $id: http://devicetree.org/schemas/ufs/mediatek,ufs.yaml
>> arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r3.dtb: ufshci@11270000 (mediatek,mt8195-ufshci): False schema does not allow [[0, 0], [0, 0], [0, 0], [0, 0], [0, 0], [0, 0], [0, 0], [0, 0]]
   	from schema $id: http://devicetree.org/schemas/ufs/mediatek,ufs.yaml
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r3.dtb: pmic@34 (mediatek,mt6360): #interrupt-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6360.yaml
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r3.dtb: jpeg-decoder@1a040000 (mediatek,mt8195-jpgdec): 'jpgdec@0,0', 'jpgdec@0,10000', 'jpgdec@1,0' do not match any of the regexes: '^jpgdec@[0-9a-f]+$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mt8195-jpegdec.yaml
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r3.dtb: jpeg-encoder@1a030000 (mediatek,mt8195-jpgenc): 'jpgenc@0,0', 'jpgenc@1,0' do not match any of the regexes: '^jpgenc@[0-9a-f]+$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mt8195-jpegenc.yaml
   	from schema $id: http://devicetree.org/schemas/reserved-memory/shared-dma-pool.yaml
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r3.dtb: memory@50000000 (shared-dma-pool): Unevaluated properties are not allowed ('no-map', 'reg' were unexpected)
--
   arch/arm64/boot/dts/mediatek/mt8195-demo.dtb: pmic (mediatek,mt6359): '#sound-dai-cells' does not match any of the regexes: '^pinctrl-[0-9]+$', '^vs(ys|[12])-ldo[1-9]-supply$', '^vsys-v[a-z]+[0-9]*-supply$'
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml
   arch/arm64/boot/dts/mediatek/mt8195-demo.dtb: infra-iommu@10315000 (mediatek,mt8195-iommu-infra): interrupts: [[0, 795, 4, 0], [0, 796, 4, 0], [0, 797, 4, 0], [0, 798, 4, 0], [0, 799, 4, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/mediatek,iommu.yaml
>> arch/arm64/boot/dts/mediatek/mt8195-demo.dtb: ufshci@11270000 (mediatek,mt8195-ufshci): clock-names: ['ufs', 'ufs_aes', 'ufs_tick', 'unipro_sysclk', 'unipro_tick', 'unipro_mp_bclk', 'ufs_tx_symbol', 'ufs_mem_sub'] is too short
   	from schema $id: http://devicetree.org/schemas/ufs/mediatek,ufs.yaml
>> arch/arm64/boot/dts/mediatek/mt8195-demo.dtb: ufshci@11270000 (mediatek,mt8195-ufshci): clocks: [[25, 63], [25, 64], [25, 65], [25, 54], [25, 55], [25, 56], [25, 90], [25, 93]] is too short
   	from schema $id: http://devicetree.org/schemas/ufs/mediatek,ufs.yaml
>> arch/arm64/boot/dts/mediatek/mt8195-demo.dtb: ufshci@11270000 (mediatek,mt8195-ufshci): clock-names:0: 'main' was expected
   	from schema $id: http://devicetree.org/schemas/ufs/mediatek,ufs.yaml
>> arch/arm64/boot/dts/mediatek/mt8195-demo.dtb: ufshci@11270000 (mediatek,mt8195-ufshci): clock-names:1: 'aes' was expected
   	from schema $id: http://devicetree.org/schemas/ufs/mediatek,ufs.yaml
>> arch/arm64/boot/dts/mediatek/mt8195-demo.dtb: ufshci@11270000 (mediatek,mt8195-ufshci): clock-names:2: 'tick' was expected
   	from schema $id: http://devicetree.org/schemas/ufs/mediatek,ufs.yaml
>> arch/arm64/boot/dts/mediatek/mt8195-demo.dtb: ufshci@11270000 (mediatek,mt8195-ufshci): clock-names:6: 'tx_symbol' was expected
   	from schema $id: http://devicetree.org/schemas/ufs/mediatek,ufs.yaml
>> arch/arm64/boot/dts/mediatek/mt8195-demo.dtb: ufshci@11270000 (mediatek,mt8195-ufshci): clock-names:7: 'mem_sub' was expected
   	from schema $id: http://devicetree.org/schemas/ufs/mediatek,ufs.yaml
>> arch/arm64/boot/dts/mediatek/mt8195-demo.dtb: ufshci@11270000 (mediatek,mt8195-ufshci): False schema does not allow [[0, 0], [0, 0], [0, 0], [0, 0], [0, 0], [0, 0], [0, 0], [0, 0]]
   	from schema $id: http://devicetree.org/schemas/ufs/mediatek,ufs.yaml
   arch/arm64/boot/dts/mediatek/mt8195-demo.dtb: jpeg-decoder@1a040000 (mediatek,mt8195-jpgdec): 'jpgdec@0,0', 'jpgdec@0,10000', 'jpgdec@1,0' do not match any of the regexes: '^jpgdec@[0-9a-f]+$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mt8195-jpegdec.yaml
   arch/arm64/boot/dts/mediatek/mt8195-demo.dtb: jpeg-encoder@1a030000 (mediatek,mt8195-jpgenc): 'jpgenc@0,0', 'jpgenc@1,0' do not match any of the regexes: '^jpgenc@[0-9a-f]+$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mt8195-jpegenc.yaml
   	from schema $id: http://devicetree.org/schemas/reserved-memory/shared-dma-pool.yaml
   arch/arm64/boot/dts/mediatek/mt8195-demo.dtb: memory@50000000 (shared-dma-pool): Unevaluated properties are not allowed ('no-map', 'reg' were unexpected)
   	from schema $id: http://devicetree.org/schemas/reserved-memory/shared-dma-pool.yaml
--
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r2.dtb: pmic (mediatek,mt6359): '#sound-dai-cells' does not match any of the regexes: '^pinctrl-[0-9]+$', '^vs(ys|[12])-ldo[1-9]-supply$', '^vsys-v[a-z]+[0-9]*-supply$'
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r2.dtb: infra-iommu@10315000 (mediatek,mt8195-iommu-infra): interrupts: [[0, 795, 4, 0], [0, 796, 4, 0], [0, 797, 4, 0], [0, 798, 4, 0], [0, 799, 4, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/mediatek,iommu.yaml
>> arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r2.dtb: ufshci@11270000 (mediatek,mt8195-ufshci): clock-names: ['ufs', 'ufs_aes', 'ufs_tick', 'unipro_sysclk', 'unipro_tick', 'unipro_mp_bclk', 'ufs_tx_symbol', 'ufs_mem_sub'] is too short
   	from schema $id: http://devicetree.org/schemas/ufs/mediatek,ufs.yaml
>> arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r2.dtb: ufshci@11270000 (mediatek,mt8195-ufshci): clocks: [[34, 63], [34, 64], [34, 65], [34, 54], [34, 55], [34, 56], [34, 90], [34, 93]] is too short
   	from schema $id: http://devicetree.org/schemas/ufs/mediatek,ufs.yaml
>> arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r2.dtb: ufshci@11270000 (mediatek,mt8195-ufshci): clock-names:0: 'main' was expected
   	from schema $id: http://devicetree.org/schemas/ufs/mediatek,ufs.yaml
>> arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r2.dtb: ufshci@11270000 (mediatek,mt8195-ufshci): clock-names:1: 'aes' was expected
   	from schema $id: http://devicetree.org/schemas/ufs/mediatek,ufs.yaml
>> arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r2.dtb: ufshci@11270000 (mediatek,mt8195-ufshci): clock-names:2: 'tick' was expected
   	from schema $id: http://devicetree.org/schemas/ufs/mediatek,ufs.yaml
>> arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r2.dtb: ufshci@11270000 (mediatek,mt8195-ufshci): clock-names:6: 'tx_symbol' was expected
   	from schema $id: http://devicetree.org/schemas/ufs/mediatek,ufs.yaml
>> arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r2.dtb: ufshci@11270000 (mediatek,mt8195-ufshci): clock-names:7: 'mem_sub' was expected
   	from schema $id: http://devicetree.org/schemas/ufs/mediatek,ufs.yaml
>> arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r2.dtb: ufshci@11270000 (mediatek,mt8195-ufshci): False schema does not allow [[0, 0], [0, 0], [0, 0], [0, 0], [0, 0], [0, 0], [0, 0], [0, 0]]
   	from schema $id: http://devicetree.org/schemas/ufs/mediatek,ufs.yaml
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r2.dtb: pmic@34 (mediatek,mt6360): #interrupt-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6360.yaml
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r2.dtb: jpeg-decoder@1a040000 (mediatek,mt8195-jpgdec): 'jpgdec@0,0', 'jpgdec@0,10000', 'jpgdec@1,0' do not match any of the regexes: '^jpgdec@[0-9a-f]+$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mt8195-jpegdec.yaml
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r2.dtb: jpeg-encoder@1a030000 (mediatek,mt8195-jpgenc): 'jpgenc@0,0', 'jpgenc@1,0' do not match any of the regexes: '^jpgenc@[0-9a-f]+$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mt8195-jpegenc.yaml
   	from schema $id: http://devicetree.org/schemas/reserved-memory/shared-dma-pool.yaml
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r2.dtb: memory@50000000 (shared-dma-pool): Unevaluated properties are not allowed ('no-map', 'reg' were unexpected)
--
   arch/arm64/boot/dts/mediatek/mt8195-cherry-dojo-r1.dtb: pmic (mediatek,mt6359): '#sound-dai-cells' does not match any of the regexes: '^pinctrl-[0-9]+$', '^vs(ys|[12])-ldo[1-9]-supply$', '^vsys-v[a-z]+[0-9]*-supply$'
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml
   arch/arm64/boot/dts/mediatek/mt8195-cherry-dojo-r1.dtb: infra-iommu@10315000 (mediatek,mt8195-iommu-infra): interrupts: [[0, 795, 4, 0], [0, 796, 4, 0], [0, 797, 4, 0], [0, 798, 4, 0], [0, 799, 4, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/mediatek,iommu.yaml
>> arch/arm64/boot/dts/mediatek/mt8195-cherry-dojo-r1.dtb: ufshci@11270000 (mediatek,mt8195-ufshci): clock-names: ['ufs', 'ufs_aes', 'ufs_tick', 'unipro_sysclk', 'unipro_tick', 'unipro_mp_bclk', 'ufs_tx_symbol', 'ufs_mem_sub'] is too short
   	from schema $id: http://devicetree.org/schemas/ufs/mediatek,ufs.yaml
>> arch/arm64/boot/dts/mediatek/mt8195-cherry-dojo-r1.dtb: ufshci@11270000 (mediatek,mt8195-ufshci): clocks: [[35, 63], [35, 64], [35, 65], [35, 54], [35, 55], [35, 56], [35, 90], [35, 93]] is too short
   	from schema $id: http://devicetree.org/schemas/ufs/mediatek,ufs.yaml
>> arch/arm64/boot/dts/mediatek/mt8195-cherry-dojo-r1.dtb: ufshci@11270000 (mediatek,mt8195-ufshci): clock-names:0: 'main' was expected
   	from schema $id: http://devicetree.org/schemas/ufs/mediatek,ufs.yaml
>> arch/arm64/boot/dts/mediatek/mt8195-cherry-dojo-r1.dtb: ufshci@11270000 (mediatek,mt8195-ufshci): clock-names:1: 'aes' was expected
   	from schema $id: http://devicetree.org/schemas/ufs/mediatek,ufs.yaml
>> arch/arm64/boot/dts/mediatek/mt8195-cherry-dojo-r1.dtb: ufshci@11270000 (mediatek,mt8195-ufshci): clock-names:2: 'tick' was expected
   	from schema $id: http://devicetree.org/schemas/ufs/mediatek,ufs.yaml
>> arch/arm64/boot/dts/mediatek/mt8195-cherry-dojo-r1.dtb: ufshci@11270000 (mediatek,mt8195-ufshci): clock-names:6: 'tx_symbol' was expected
   	from schema $id: http://devicetree.org/schemas/ufs/mediatek,ufs.yaml
>> arch/arm64/boot/dts/mediatek/mt8195-cherry-dojo-r1.dtb: ufshci@11270000 (mediatek,mt8195-ufshci): clock-names:7: 'mem_sub' was expected
   	from schema $id: http://devicetree.org/schemas/ufs/mediatek,ufs.yaml
>> arch/arm64/boot/dts/mediatek/mt8195-cherry-dojo-r1.dtb: ufshci@11270000 (mediatek,mt8195-ufshci): False schema does not allow [[0, 0], [0, 0], [0, 0], [0, 0], [0, 0], [0, 0], [0, 0], [0, 0]]
   	from schema $id: http://devicetree.org/schemas/ufs/mediatek,ufs.yaml
   arch/arm64/boot/dts/mediatek/mt8195-cherry-dojo-r1.dtb: pmic@34 (mediatek,mt6360): #interrupt-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6360.yaml
   arch/arm64/boot/dts/mediatek/mt8195-cherry-dojo-r1.dtb: jpeg-decoder@1a040000 (mediatek,mt8195-jpgdec): 'jpgdec@0,0', 'jpgdec@0,10000', 'jpgdec@1,0' do not match any of the regexes: '^jpgdec@[0-9a-f]+$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mt8195-jpegdec.yaml
   arch/arm64/boot/dts/mediatek/mt8195-cherry-dojo-r1.dtb: jpeg-encoder@1a030000 (mediatek,mt8195-jpgenc): 'jpgenc@0,0', 'jpgenc@1,0' do not match any of the regexes: '^jpgenc@[0-9a-f]+$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mt8195-jpegenc.yaml
   	from schema $id: http://devicetree.org/schemas/reserved-memory/shared-dma-pool.yaml
   arch/arm64/boot/dts/mediatek/mt8195-cherry-dojo-r1.dtb: memory@50000000 (shared-dma-pool): Unevaluated properties are not allowed ('no-map', 'reg' were unexpected)
--
   arch/arm64/boot/dts/mediatek/mt8195.dtsi:3415.22-3427.5: Warning (avoid_unnecessary_addr_size): /soc/dsi@1c008000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l.dtb: pmic (mediatek,mt6365): '#sound-dai-cells' does not match any of the regexes: '^pinctrl-[0-9]+$', '^vs(ys|[12])-ldo[1-9]-supply$', '^vsys-v[a-z]+[0-9]*-supply$'
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml
   arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l.dtb: infra-iommu@10315000 (mediatek,mt8195-iommu-infra): interrupts: [[0, 795, 4, 0], [0, 796, 4, 0], [0, 797, 4, 0], [0, 798, 4, 0], [0, 799, 4, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/mediatek,iommu.yaml
>> arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l.dtb: ufshci@11270000 (mediatek,mt8195-ufshci): clock-names: ['ufs', 'ufs_aes', 'ufs_tick', 'unipro_sysclk', 'unipro_tick', 'unipro_mp_bclk', 'ufs_tx_symbol', 'ufs_mem_sub'] is too short
   	from schema $id: http://devicetree.org/schemas/ufs/mediatek,ufs.yaml
>> arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l.dtb: ufshci@11270000 (mediatek,mt8195-ufshci): clocks: [[32, 63], [32, 64], [32, 65], [32, 54], [32, 55], [32, 56], [32, 90], [32, 93]] is too short
   	from schema $id: http://devicetree.org/schemas/ufs/mediatek,ufs.yaml
>> arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l.dtb: ufshci@11270000 (mediatek,mt8195-ufshci): clock-names:0: 'main' was expected
   	from schema $id: http://devicetree.org/schemas/ufs/mediatek,ufs.yaml
>> arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l.dtb: ufshci@11270000 (mediatek,mt8195-ufshci): clock-names:1: 'aes' was expected
   	from schema $id: http://devicetree.org/schemas/ufs/mediatek,ufs.yaml
>> arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l.dtb: ufshci@11270000 (mediatek,mt8195-ufshci): clock-names:2: 'tick' was expected
   	from schema $id: http://devicetree.org/schemas/ufs/mediatek,ufs.yaml
>> arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l.dtb: ufshci@11270000 (mediatek,mt8195-ufshci): clock-names:6: 'tx_symbol' was expected
   	from schema $id: http://devicetree.org/schemas/ufs/mediatek,ufs.yaml
>> arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l.dtb: ufshci@11270000 (mediatek,mt8195-ufshci): clock-names:7: 'mem_sub' was expected
   	from schema $id: http://devicetree.org/schemas/ufs/mediatek,ufs.yaml
>> arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l.dtb: ufshci@11270000 (mediatek,mt8195-ufshci): False schema does not allow [[0, 0], [0, 0], [0, 0], [0, 0], [0, 0], [0, 0], [0, 0], [0, 0]]
   	from schema $id: http://devicetree.org/schemas/ufs/mediatek,ufs.yaml
   arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l.dtb: jpeg-decoder@1a040000 (mediatek,mt8195-jpgdec): 'jpgdec@0,0', 'jpgdec@0,10000', 'jpgdec@1,0' do not match any of the regexes: '^jpgdec@[0-9a-f]+$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mt8195-jpegdec.yaml
   arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l.dtb: jpeg-encoder@1a030000 (mediatek,mt8195-jpgenc): 'jpgenc@0,0', 'jpgenc@1,0' do not match any of the regexes: '^jpgenc@[0-9a-f]+$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mt8195-jpegenc.yaml
   	from schema $id: http://devicetree.org/schemas/reserved-memory/shared-dma-pool.yaml
   arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l.dtb: memory@50000000 (shared-dma-pool): Unevaluated properties are not allowed ('no-map', 'reg' were unexpected)
   	from schema $id: http://devicetree.org/schemas/reserved-memory/shared-dma-pool.yaml
--
   arch/arm64/boot/dts/mediatek/mt8395-kontron-3-5-sbc-i1200.dtb: pmic (mediatek,mt6359): '#sound-dai-cells' does not match any of the regexes: '^pinctrl-[0-9]+$', '^vs(ys|[12])-ldo[1-9]-supply$', '^vsys-v[a-z]+[0-9]*-supply$'
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml
   arch/arm64/boot/dts/mediatek/mt8395-kontron-3-5-sbc-i1200.dtb: infra-iommu@10315000 (mediatek,mt8195-iommu-infra): interrupts: [[0, 795, 4, 0], [0, 796, 4, 0], [0, 797, 4, 0], [0, 798, 4, 0], [0, 799, 4, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/mediatek,iommu.yaml
>> arch/arm64/boot/dts/mediatek/mt8395-kontron-3-5-sbc-i1200.dtb: ufshci@11270000 (mediatek,mt8195-ufshci): clock-names: ['ufs', 'ufs_aes', 'ufs_tick', 'unipro_sysclk', 'unipro_tick', 'unipro_mp_bclk', 'ufs_tx_symbol', 'ufs_mem_sub'] is too short
   	from schema $id: http://devicetree.org/schemas/ufs/mediatek,ufs.yaml
>> arch/arm64/boot/dts/mediatek/mt8395-kontron-3-5-sbc-i1200.dtb: ufshci@11270000 (mediatek,mt8195-ufshci): clocks: [[25, 63], [25, 64], [25, 65], [25, 54], [25, 55], [25, 56], [25, 90], [25, 93]] is too short
   	from schema $id: http://devicetree.org/schemas/ufs/mediatek,ufs.yaml
>> arch/arm64/boot/dts/mediatek/mt8395-kontron-3-5-sbc-i1200.dtb: ufshci@11270000 (mediatek,mt8195-ufshci): clock-names:0: 'main' was expected
   	from schema $id: http://devicetree.org/schemas/ufs/mediatek,ufs.yaml
>> arch/arm64/boot/dts/mediatek/mt8395-kontron-3-5-sbc-i1200.dtb: ufshci@11270000 (mediatek,mt8195-ufshci): clock-names:1: 'aes' was expected
   	from schema $id: http://devicetree.org/schemas/ufs/mediatek,ufs.yaml
>> arch/arm64/boot/dts/mediatek/mt8395-kontron-3-5-sbc-i1200.dtb: ufshci@11270000 (mediatek,mt8195-ufshci): clock-names:2: 'tick' was expected
   	from schema $id: http://devicetree.org/schemas/ufs/mediatek,ufs.yaml
>> arch/arm64/boot/dts/mediatek/mt8395-kontron-3-5-sbc-i1200.dtb: ufshci@11270000 (mediatek,mt8195-ufshci): clock-names:6: 'tx_symbol' was expected
   	from schema $id: http://devicetree.org/schemas/ufs/mediatek,ufs.yaml
>> arch/arm64/boot/dts/mediatek/mt8395-kontron-3-5-sbc-i1200.dtb: ufshci@11270000 (mediatek,mt8195-ufshci): clock-names:7: 'mem_sub' was expected
   	from schema $id: http://devicetree.org/schemas/ufs/mediatek,ufs.yaml
>> arch/arm64/boot/dts/mediatek/mt8395-kontron-3-5-sbc-i1200.dtb: ufshci@11270000 (mediatek,mt8195-ufshci): False schema does not allow [[0, 0], [0, 0], [0, 0], [0, 0], [0, 0], [0, 0], [0, 0], [0, 0]]
   	from schema $id: http://devicetree.org/schemas/ufs/mediatek,ufs.yaml
   arch/arm64/boot/dts/mediatek/mt8395-kontron-3-5-sbc-i1200.dtb: jpeg-decoder@1a040000 (mediatek,mt8195-jpgdec): 'jpgdec@0,0', 'jpgdec@0,10000', 'jpgdec@1,0' do not match any of the regexes: '^jpgdec@[0-9a-f]+$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mt8195-jpegdec.yaml
   arch/arm64/boot/dts/mediatek/mt8395-kontron-3-5-sbc-i1200.dtb: jpeg-encoder@1a030000 (mediatek,mt8195-jpgenc): 'jpgenc@0,0', 'jpgenc@1,0' do not match any of the regexes: '^jpgenc@[0-9a-f]+$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mt8195-jpegenc.yaml
   	from schema $id: http://devicetree.org/schemas/reserved-memory/shared-dma-pool.yaml
   arch/arm64/boot/dts/mediatek/mt8395-kontron-3-5-sbc-i1200.dtb: memory@50000000 (shared-dma-pool): Unevaluated properties are not allowed ('no-map', 'reg' were unexpected)
   	from schema $id: http://devicetree.org/schemas/reserved-memory/shared-dma-pool.yaml
--
   arch/arm64/boot/dts/mediatek/mt8395-genio-1200-evk-ufs.dtb: pmic (mediatek,mt6365): '#sound-dai-cells' does not match any of the regexes: '^pinctrl-[0-9]+$', '^vs(ys|[12])-ldo[1-9]-supply$', '^vsys-v[a-z]+[0-9]*-supply$'
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml
   arch/arm64/boot/dts/mediatek/mt8395-genio-1200-evk-ufs.dtb: infra-iommu@10315000 (mediatek,mt8195-iommu-infra): interrupts: [[0, 795, 4, 0], [0, 796, 4, 0], [0, 797, 4, 0], [0, 798, 4, 0], [0, 799, 4, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/mediatek,iommu.yaml
>> arch/arm64/boot/dts/mediatek/mt8395-genio-1200-evk-ufs.dtb: ufshci@11270000 (mediatek,mt8195-ufshci): clock-names: ['ufs', 'ufs_aes', 'ufs_tick', 'unipro_sysclk', 'unipro_tick', 'unipro_mp_bclk', 'ufs_tx_symbol', 'ufs_mem_sub'] is too short
   	from schema $id: http://devicetree.org/schemas/ufs/mediatek,ufs.yaml
>> arch/arm64/boot/dts/mediatek/mt8395-genio-1200-evk-ufs.dtb: ufshci@11270000 (mediatek,mt8195-ufshci): clocks: [[32, 63], [32, 64], [32, 65], [32, 54], [32, 55], [32, 56], [32, 90], [32, 93]] is too short
   	from schema $id: http://devicetree.org/schemas/ufs/mediatek,ufs.yaml
>> arch/arm64/boot/dts/mediatek/mt8395-genio-1200-evk-ufs.dtb: ufshci@11270000 (mediatek,mt8195-ufshci): clock-names:0: 'main' was expected
   	from schema $id: http://devicetree.org/schemas/ufs/mediatek,ufs.yaml
>> arch/arm64/boot/dts/mediatek/mt8395-genio-1200-evk-ufs.dtb: ufshci@11270000 (mediatek,mt8195-ufshci): clock-names:1: 'aes' was expected
   	from schema $id: http://devicetree.org/schemas/ufs/mediatek,ufs.yaml
>> arch/arm64/boot/dts/mediatek/mt8395-genio-1200-evk-ufs.dtb: ufshci@11270000 (mediatek,mt8195-ufshci): clock-names:2: 'tick' was expected
   	from schema $id: http://devicetree.org/schemas/ufs/mediatek,ufs.yaml
>> arch/arm64/boot/dts/mediatek/mt8395-genio-1200-evk-ufs.dtb: ufshci@11270000 (mediatek,mt8195-ufshci): clock-names:6: 'tx_symbol' was expected
   	from schema $id: http://devicetree.org/schemas/ufs/mediatek,ufs.yaml
>> arch/arm64/boot/dts/mediatek/mt8395-genio-1200-evk-ufs.dtb: ufshci@11270000 (mediatek,mt8195-ufshci): clock-names:7: 'mem_sub' was expected
   	from schema $id: http://devicetree.org/schemas/ufs/mediatek,ufs.yaml
>> arch/arm64/boot/dts/mediatek/mt8395-genio-1200-evk-ufs.dtb: ufshci@11270000 (mediatek,mt8195-ufshci): False schema does not allow [[0, 0], [0, 0], [0, 0], [0, 0], [0, 0], [0, 0], [0, 0], [0, 0]]
   	from schema $id: http://devicetree.org/schemas/ufs/mediatek,ufs.yaml
   arch/arm64/boot/dts/mediatek/mt8395-genio-1200-evk-ufs.dtb: jpeg-decoder@1a040000 (mediatek,mt8195-jpgdec): 'jpgdec@0,0', 'jpgdec@0,10000', 'jpgdec@1,0' do not match any of the regexes: '^jpgdec@[0-9a-f]+$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mt8195-jpegdec.yaml
   arch/arm64/boot/dts/mediatek/mt8395-genio-1200-evk-ufs.dtb: jpeg-encoder@1a030000 (mediatek,mt8195-jpgenc): 'jpgenc@0,0', 'jpgenc@1,0' do not match any of the regexes: '^jpgenc@[0-9a-f]+$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mt8195-jpegenc.yaml
   	from schema $id: http://devicetree.org/schemas/reserved-memory/shared-dma-pool.yaml
   arch/arm64/boot/dts/mediatek/mt8395-genio-1200-evk-ufs.dtb: memory@50000000 (shared-dma-pool): Unevaluated properties are not allowed ('no-map', 'reg' were unexpected)
   	from schema $id: http://devicetree.org/schemas/reserved-memory/shared-dma-pool.yaml
--
   arch/arm64/boot/dts/mediatek/mt8395-genio-1200-evk.dtb: pmic (mediatek,mt6365): '#sound-dai-cells' does not match any of the regexes: '^pinctrl-[0-9]+$', '^vs(ys|[12])-ldo[1-9]-supply$', '^vsys-v[a-z]+[0-9]*-supply$'
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml
   arch/arm64/boot/dts/mediatek/mt8395-genio-1200-evk.dtb: infra-iommu@10315000 (mediatek,mt8195-iommu-infra): interrupts: [[0, 795, 4, 0], [0, 796, 4, 0], [0, 797, 4, 0], [0, 798, 4, 0], [0, 799, 4, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/mediatek,iommu.yaml
>> arch/arm64/boot/dts/mediatek/mt8395-genio-1200-evk.dtb: ufshci@11270000 (mediatek,mt8195-ufshci): clock-names: ['ufs', 'ufs_aes', 'ufs_tick', 'unipro_sysclk', 'unipro_tick', 'unipro_mp_bclk', 'ufs_tx_symbol', 'ufs_mem_sub'] is too short
   	from schema $id: http://devicetree.org/schemas/ufs/mediatek,ufs.yaml
>> arch/arm64/boot/dts/mediatek/mt8395-genio-1200-evk.dtb: ufshci@11270000 (mediatek,mt8195-ufshci): clocks: [[32, 63], [32, 64], [32, 65], [32, 54], [32, 55], [32, 56], [32, 90], [32, 93]] is too short
   	from schema $id: http://devicetree.org/schemas/ufs/mediatek,ufs.yaml
>> arch/arm64/boot/dts/mediatek/mt8395-genio-1200-evk.dtb: ufshci@11270000 (mediatek,mt8195-ufshci): clock-names:0: 'main' was expected
   	from schema $id: http://devicetree.org/schemas/ufs/mediatek,ufs.yaml
>> arch/arm64/boot/dts/mediatek/mt8395-genio-1200-evk.dtb: ufshci@11270000 (mediatek,mt8195-ufshci): clock-names:1: 'aes' was expected
   	from schema $id: http://devicetree.org/schemas/ufs/mediatek,ufs.yaml
>> arch/arm64/boot/dts/mediatek/mt8395-genio-1200-evk.dtb: ufshci@11270000 (mediatek,mt8195-ufshci): clock-names:2: 'tick' was expected
   	from schema $id: http://devicetree.org/schemas/ufs/mediatek,ufs.yaml
>> arch/arm64/boot/dts/mediatek/mt8395-genio-1200-evk.dtb: ufshci@11270000 (mediatek,mt8195-ufshci): clock-names:6: 'tx_symbol' was expected
   	from schema $id: http://devicetree.org/schemas/ufs/mediatek,ufs.yaml
>> arch/arm64/boot/dts/mediatek/mt8395-genio-1200-evk.dtb: ufshci@11270000 (mediatek,mt8195-ufshci): clock-names:7: 'mem_sub' was expected
   	from schema $id: http://devicetree.org/schemas/ufs/mediatek,ufs.yaml
>> arch/arm64/boot/dts/mediatek/mt8395-genio-1200-evk.dtb: ufshci@11270000 (mediatek,mt8195-ufshci): False schema does not allow [[0, 0], [0, 0], [0, 0], [0, 0], [0, 0], [0, 0], [0, 0], [0, 0]]
   	from schema $id: http://devicetree.org/schemas/ufs/mediatek,ufs.yaml
   arch/arm64/boot/dts/mediatek/mt8395-genio-1200-evk.dtb: jpeg-decoder@1a040000 (mediatek,mt8195-jpgdec): 'jpgdec@0,0', 'jpgdec@0,10000', 'jpgdec@1,0' do not match any of the regexes: '^jpgdec@[0-9a-f]+$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mt8195-jpegdec.yaml
   arch/arm64/boot/dts/mediatek/mt8395-genio-1200-evk.dtb: jpeg-encoder@1a030000 (mediatek,mt8195-jpgenc): 'jpgenc@0,0', 'jpgenc@1,0' do not match any of the regexes: '^jpgenc@[0-9a-f]+$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mt8195-jpegenc.yaml
   	from schema $id: http://devicetree.org/schemas/reserved-memory/shared-dma-pool.yaml
   arch/arm64/boot/dts/mediatek/mt8395-genio-1200-evk.dtb: memory@50000000 (shared-dma-pool): Unevaluated properties are not allowed ('no-map', 'reg' were unexpected)
   	from schema $id: http://devicetree.org/schemas/reserved-memory/shared-dma-pool.yaml
--
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r1.dtb: pmic (mediatek,mt6359): '#sound-dai-cells' does not match any of the regexes: '^pinctrl-[0-9]+$', '^vs(ys|[12])-ldo[1-9]-supply$', '^vsys-v[a-z]+[0-9]*-supply$'
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r1.dtb: infra-iommu@10315000 (mediatek,mt8195-iommu-infra): interrupts: [[0, 795, 4, 0], [0, 796, 4, 0], [0, 797, 4, 0], [0, 798, 4, 0], [0, 799, 4, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/mediatek,iommu.yaml
>> arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r1.dtb: ufshci@11270000 (mediatek,mt8195-ufshci): clock-names: ['ufs', 'ufs_aes', 'ufs_tick', 'unipro_sysclk', 'unipro_tick', 'unipro_mp_bclk', 'ufs_tx_symbol', 'ufs_mem_sub'] is too short
   	from schema $id: http://devicetree.org/schemas/ufs/mediatek,ufs.yaml
>> arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r1.dtb: ufshci@11270000 (mediatek,mt8195-ufshci): clocks: [[34, 63], [34, 64], [34, 65], [34, 54], [34, 55], [34, 56], [34, 90], [34, 93]] is too short
   	from schema $id: http://devicetree.org/schemas/ufs/mediatek,ufs.yaml
>> arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r1.dtb: ufshci@11270000 (mediatek,mt8195-ufshci): clock-names:0: 'main' was expected
   	from schema $id: http://devicetree.org/schemas/ufs/mediatek,ufs.yaml
>> arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r1.dtb: ufshci@11270000 (mediatek,mt8195-ufshci): clock-names:1: 'aes' was expected
   	from schema $id: http://devicetree.org/schemas/ufs/mediatek,ufs.yaml
>> arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r1.dtb: ufshci@11270000 (mediatek,mt8195-ufshci): clock-names:2: 'tick' was expected
   	from schema $id: http://devicetree.org/schemas/ufs/mediatek,ufs.yaml
>> arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r1.dtb: ufshci@11270000 (mediatek,mt8195-ufshci): clock-names:6: 'tx_symbol' was expected
   	from schema $id: http://devicetree.org/schemas/ufs/mediatek,ufs.yaml
>> arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r1.dtb: ufshci@11270000 (mediatek,mt8195-ufshci): clock-names:7: 'mem_sub' was expected
   	from schema $id: http://devicetree.org/schemas/ufs/mediatek,ufs.yaml
>> arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r1.dtb: ufshci@11270000 (mediatek,mt8195-ufshci): False schema does not allow [[0, 0], [0, 0], [0, 0], [0, 0], [0, 0], [0, 0], [0, 0], [0, 0]]
   	from schema $id: http://devicetree.org/schemas/ufs/mediatek,ufs.yaml
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r1.dtb: pmic@34 (mediatek,mt6360): #interrupt-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6360.yaml
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r1.dtb: jpeg-decoder@1a040000 (mediatek,mt8195-jpgdec): 'jpgdec@0,0', 'jpgdec@0,10000', 'jpgdec@1,0' do not match any of the regexes: '^jpgdec@[0-9a-f]+$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mt8195-jpegdec.yaml
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r1.dtb: jpeg-encoder@1a030000 (mediatek,mt8195-jpgenc): 'jpgenc@0,0', 'jpgenc@1,0' do not match any of the regexes: '^jpgenc@[0-9a-f]+$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mt8195-jpegenc.yaml
   	from schema $id: http://devicetree.org/schemas/reserved-memory/shared-dma-pool.yaml
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r1.dtb: memory@50000000 (shared-dma-pool): Unevaluated properties are not allowed ('no-map', 'reg' were unexpected)
--
   arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l-8-hd-panel.dtb: pmic (mediatek,mt6365): '#sound-dai-cells' does not match any of the regexes: '^pinctrl-[0-9]+$', '^vs(ys|[12])-ldo[1-9]-supply$', '^vsys-v[a-z]+[0-9]*-supply$'
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml
   arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l-8-hd-panel.dtb: infra-iommu@10315000 (mediatek,mt8195-iommu-infra): interrupts: [[0, 795, 4, 0], [0, 796, 4, 0], [0, 797, 4, 0], [0, 798, 4, 0], [0, 799, 4, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/mediatek,iommu.yaml
>> arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l-8-hd-panel.dtb: ufshci@11270000 (mediatek,mt8195-ufshci): clock-names: ['ufs', 'ufs_aes', 'ufs_tick', 'unipro_sysclk', 'unipro_tick', 'unipro_mp_bclk', 'ufs_tx_symbol', 'ufs_mem_sub'] is too short
   	from schema $id: http://devicetree.org/schemas/ufs/mediatek,ufs.yaml
>> arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l-8-hd-panel.dtb: ufshci@11270000 (mediatek,mt8195-ufshci): clocks: [[32, 63], [32, 64], [32, 65], [32, 54], [32, 55], [32, 56], [32, 90], [32, 93]] is too short
   	from schema $id: http://devicetree.org/schemas/ufs/mediatek,ufs.yaml
>> arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l-8-hd-panel.dtb: ufshci@11270000 (mediatek,mt8195-ufshci): clock-names:0: 'main' was expected
   	from schema $id: http://devicetree.org/schemas/ufs/mediatek,ufs.yaml
>> arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l-8-hd-panel.dtb: ufshci@11270000 (mediatek,mt8195-ufshci): clock-names:1: 'aes' was expected
   	from schema $id: http://devicetree.org/schemas/ufs/mediatek,ufs.yaml
>> arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l-8-hd-panel.dtb: ufshci@11270000 (mediatek,mt8195-ufshci): clock-names:2: 'tick' was expected
   	from schema $id: http://devicetree.org/schemas/ufs/mediatek,ufs.yaml
>> arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l-8-hd-panel.dtb: ufshci@11270000 (mediatek,mt8195-ufshci): clock-names:6: 'tx_symbol' was expected
   	from schema $id: http://devicetree.org/schemas/ufs/mediatek,ufs.yaml
>> arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l-8-hd-panel.dtb: ufshci@11270000 (mediatek,mt8195-ufshci): clock-names:7: 'mem_sub' was expected
   	from schema $id: http://devicetree.org/schemas/ufs/mediatek,ufs.yaml
>> arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l-8-hd-panel.dtb: ufshci@11270000 (mediatek,mt8195-ufshci): False schema does not allow [[0, 0], [0, 0], [0, 0], [0, 0], [0, 0], [0, 0], [0, 0], [0, 0]]
   	from schema $id: http://devicetree.org/schemas/ufs/mediatek,ufs.yaml
   arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l-8-hd-panel.dtb: jpeg-decoder@1a040000 (mediatek,mt8195-jpgdec): 'jpgdec@0,0', 'jpgdec@0,10000', 'jpgdec@1,0' do not match any of the regexes: '^jpgdec@[0-9a-f]+$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mt8195-jpegdec.yaml
   arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l-8-hd-panel.dtb: jpeg-encoder@1a030000 (mediatek,mt8195-jpgenc): 'jpgenc@0,0', 'jpgenc@1,0' do not match any of the regexes: '^jpgenc@[0-9a-f]+$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mt8195-jpegenc.yaml
   	from schema $id: http://devicetree.org/schemas/reserved-memory/shared-dma-pool.yaml
   arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l-8-hd-panel.dtb: memory@50000000 (shared-dma-pool): Unevaluated properties are not allowed ('no-map', 'reg' were unexpected)
   	from schema $id: http://devicetree.org/schemas/reserved-memory/shared-dma-pool.yaml

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
