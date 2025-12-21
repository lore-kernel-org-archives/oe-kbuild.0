Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F011D2AE99
	for <oe-kbuild@lists.linux.dev>; Sun, 21 Dec 2025 06:05:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766297161; cv=none; b=nMTZnBdHt4FwbBGYbYdrzVntguX+tI9lNKtEG1j/s1T+mZ/rAWYaTq/zvMUgf1CZDCJ2gesVly10YR4zar7HdWcNimDNMmuTr7Xj5PedGnl7R2uG4uJcD7JJBoArXJm6t3NeslIlV6j/g2aj6yMGx1kUcAkKpEid27eRPzu8Emw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766297161; c=relaxed/simple;
	bh=GDh/lLewtifGvGNoC03H7FZ6dSAcaDAI39bycAJPWOo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=CcIld/TKT1xYjCvYkien1q2Dus6GGEvmlCsJzkCJn8G6AacaKHAhfV4XBIc4bYadmArUPXcVRJZTCZpscXpBmjFrlROMLEf4PvO4c1sDqW762kXHg2ODHRMSbub/+L3Y4wOzNXdj6rD4y/OM33CKoTtw8eDkG5bWQMTNEwmBCQI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kVcBtjnF; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kVcBtjnF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766297158; x=1797833158;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=GDh/lLewtifGvGNoC03H7FZ6dSAcaDAI39bycAJPWOo=;
  b=kVcBtjnFhln0cW7NUasQz3jK22KEOk2wyq1CzNZqaAwILxD1EnDGhmK3
   po5+6hKhUkCsMdYudPXrO0LDFeijgPgpF6x6PgqD9Tw02Yrg5z/D9/ZFG
   YDyud3+fSyqQ95jg9W+kuGdv5tp1aJzrU9QySn0RKY75OpNctlTiiNrLD
   QvNIkZ3gtsztEv/g6AXSifwCOYDVV5qiER7Qk+7fk8AoPz9u7+Tpd6iYF
   tgb6nysoiRMBKdjSFIUTz1pwtvx87ZvlXTgyvAnqUK+3QUmSBjaUvIUNw
   VEsiz8Buk4DWn8PLKQSJEqwh8eBTVUSN0yhgiF6zti4thMpWg+wZHS1mQ
   w==;
X-CSE-ConnectionGUID: lQiF//6/R1G2MfmZDmyMXw==
X-CSE-MsgGUID: TCoy600QQT+/R3UXPSPnBA==
X-IronPort-AV: E=McAfee;i="6800,10657,11648"; a="79562673"
X-IronPort-AV: E=Sophos;i="6.21,164,1763452800"; 
   d="scan'208";a="79562673"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Dec 2025 22:05:57 -0800
X-CSE-ConnectionGUID: kLtU7SAQQy+aIYc9RWO4iw==
X-CSE-MsgGUID: fmqpmGC0TzSmxoQalT4WJw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,164,1763452800"; 
   d="scan'208";a="198375939"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by orviesa006.jf.intel.com with ESMTP; 20 Dec 2025 22:05:55 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vXCZl-000000004wy-02ta;
	Sun, 21 Dec 2025 06:05:53 +0000
Date: Sun, 21 Dec 2025 07:05:31 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v4 02/25] dt-bindings: ufs: mediatek,ufs: Complete the
 binding
Message-ID: <202512210753.FcNUpIsl-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "dtcheck: binding changes may go via different trees"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20251218-mt8196-ufs-v4-2-ddec7a369dd2@collabora.com>
References: <20251218-mt8196-ufs-v4-2-ddec7a369dd2@collabora.com>
TO: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
TO: Alim Akhtar <alim.akhtar@samsung.com>
TO: Avri Altman <avri.altman@wdc.com>
TO: Bart Van Assche <bvanassche@acm.org>
TO: Rob Herring <robh@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
TO: Matthias Brugger <matthias.bgg@gmail.com>
TO: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
TO: Chunfeng Yun <chunfeng.yun@mediatek.com>
TO: Vinod Koul <vkoul@kernel.org>
TO: Kishon Vijay Abraham I <kishon@kernel.org>
TO: Peter Wang <peter.wang@mediatek.com>
TO: Stanley Jhu <chu.stanley@gmail.com>
TO: "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>
TO: "Martin K. Petersen" <martin.petersen@oracle.com>
TO: Philipp Zabel <p.zabel@pengutronix.de>
TO: Liam Girdwood <lgirdwood@gmail.com>
TO: Mark Brown <broonie@kernel.org>
TO: Chaotian Jing <Chaotian.Jing@mediatek.com>
TO: Neil Armstrong <neil.armstrong@linaro.org>
CC: "Louis-Alexis Eyraud" <louisalexis.eyraud@collabora.com>
CC: kernel@collabora.com
CC: linux-scsi@vger.kernel.org
CC: devicetree@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: linux-arm-kernel@lists.infradead.org
CC: linux-mediatek@lists.infradead.org
CC: linux-phy@lists.infradead.org
CC: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>

Hi Nicolas,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 3e7f562e20ee87a25e104ef4fce557d39d62fa85]

url:    https://github.com/intel-lab-lkp/linux/commits/Nicolas-Frattaroli/dt-bindings-phy-Add-mediatek-mt8196-ufsphy-variant/20251218-211517
base:   3e7f562e20ee87a25e104ef4fce557d39d62fa85
patch link:    https://lore.kernel.org/r/20251218-mt8196-ufs-v4-2-ddec7a369dd2%40collabora.com
patch subject: [PATCH v4 02/25] dt-bindings: ufs: mediatek,ufs: Complete the binding
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: arm64-randconfig-2052-20251220 (https://download.01.org/0day-ci/archive/20251221/202512210753.FcNUpIsl-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
dtschema version: 2025.12
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251221/202512210753.FcNUpIsl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202512210753.FcNUpIsl-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi:1514.7-1522.4: Warning (graph_child_address): /soc/syscon@1c01a000/port: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/mediatek/mt8195-cherry-dojo-r1.dtb: pmic (mediatek,mt6359): '#sound-dai-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml
   arch/arm64/boot/dts/mediatek/mt8195-cherry-dojo-r1.dtb: infra-iommu@10315000 (mediatek,mt8195-iommu-infra): interrupts: [[0, 795, 4, 0], [0, 796, 4, 0], [0, 797, 4, 0], [0, 798, 4, 0], [0, 799, 4, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/mediatek,iommu.yaml
>> arch/arm64/boot/dts/mediatek/mt8195-cherry-dojo-r1.dtb: ufshci@11270000 (mediatek,mt8195-ufshci): clock-names: ['ufs', 'ufs_aes', 'ufs_tick', 'unipro_sysclk', 'unipro_tick', 'unipro_mp_bclk', 'ufs_tx_symbol', 'ufs_mem_sub'] is too short
   	from schema $id: http://devicetree.org/schemas/ufs/mediatek,ufs.yaml
>> arch/arm64/boot/dts/mediatek/mt8195-cherry-dojo-r1.dtb: ufshci@11270000 (mediatek,mt8195-ufshci): clocks: [[35, 63], [35, 64], [35, 65], [35, 54], [35, 55], [35, 56], [35, 90], [35, 93]] is too short
   	from schema $id: http://devicetree.org/schemas/ufs/mediatek,ufs.yaml
>> arch/arm64/boot/dts/mediatek/mt8195-cherry-dojo-r1.dtb: ufshci@11270000 (mediatek,mt8195-ufshci): False schema does not allow [[0, 0], [0, 0], [0, 0], [0, 0], [0, 0], [0, 0], [0, 0], [0, 0]]
   	from schema $id: http://devicetree.org/schemas/ufs/mediatek,ufs.yaml
   arch/arm64/boot/dts/mediatek/mt8195-cherry-dojo-r1.dtb: pmic@34 (mediatek,mt6360): #interrupt-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6360.yaml
   arch/arm64/boot/dts/mediatek/mt8195-cherry-dojo-r1.dtb: jpeg-decoder@1a040000 (mediatek,mt8195-jpgdec): 'jpgdec@0,0', 'jpgdec@0,10000', 'jpgdec@1,0' do not match any of the regexes: '^jpgdec@[0-9a-f]+$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mt8195-jpegdec.yaml
   arch/arm64/boot/dts/mediatek/mt8195-cherry-dojo-r1.dtb: jpeg-encoder@1a030000 (mediatek,mt8195-jpgenc): 'jpgenc@0,0', 'jpgenc@1,0' do not match any of the regexes: '^jpgenc@[0-9a-f]+$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mt8195-jpegenc.yaml
   arch/arm64/boot/dts/mediatek/mt8195-cherry-dojo-r1.dtb: rt1019p (realtek,rt1019p): 'label' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/sound/realtek,rt1015p.yaml
--
   arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi:1514.7-1522.4: Warning (graph_child_address): /soc/syscon@1c01a000/port: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r1.dtb: pmic (mediatek,mt6359): '#sound-dai-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r1.dtb: infra-iommu@10315000 (mediatek,mt8195-iommu-infra): interrupts: [[0, 795, 4, 0], [0, 796, 4, 0], [0, 797, 4, 0], [0, 798, 4, 0], [0, 799, 4, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/mediatek,iommu.yaml
>> arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r1.dtb: ufshci@11270000 (mediatek,mt8195-ufshci): clock-names: ['ufs', 'ufs_aes', 'ufs_tick', 'unipro_sysclk', 'unipro_tick', 'unipro_mp_bclk', 'ufs_tx_symbol', 'ufs_mem_sub'] is too short
   	from schema $id: http://devicetree.org/schemas/ufs/mediatek,ufs.yaml
>> arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r1.dtb: ufshci@11270000 (mediatek,mt8195-ufshci): clocks: [[34, 63], [34, 64], [34, 65], [34, 54], [34, 55], [34, 56], [34, 90], [34, 93]] is too short
   	from schema $id: http://devicetree.org/schemas/ufs/mediatek,ufs.yaml
>> arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r1.dtb: ufshci@11270000 (mediatek,mt8195-ufshci): False schema does not allow [[0, 0], [0, 0], [0, 0], [0, 0], [0, 0], [0, 0], [0, 0], [0, 0]]
   	from schema $id: http://devicetree.org/schemas/ufs/mediatek,ufs.yaml
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r1.dtb: pmic@34 (mediatek,mt6360): #interrupt-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6360.yaml
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r1.dtb: jpeg-decoder@1a040000 (mediatek,mt8195-jpgdec): 'jpgdec@0,0', 'jpgdec@0,10000', 'jpgdec@1,0' do not match any of the regexes: '^jpgdec@[0-9a-f]+$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mt8195-jpegdec.yaml
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r1.dtb: jpeg-encoder@1a030000 (mediatek,mt8195-jpgenc): 'jpgenc@0,0', 'jpgenc@1,0' do not match any of the regexes: '^jpgenc@[0-9a-f]+$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mt8195-jpegenc.yaml
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r1.dtb: rt1019p (realtek,rt1019p): 'label' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/sound/realtek,rt1015p.yaml
--
   arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi:1514.7-1522.4: Warning (graph_child_address): /soc/syscon@1c01a000/port: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r2.dtb: pmic (mediatek,mt6359): '#sound-dai-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r2.dtb: infra-iommu@10315000 (mediatek,mt8195-iommu-infra): interrupts: [[0, 795, 4, 0], [0, 796, 4, 0], [0, 797, 4, 0], [0, 798, 4, 0], [0, 799, 4, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/mediatek,iommu.yaml
>> arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r2.dtb: ufshci@11270000 (mediatek,mt8195-ufshci): clock-names: ['ufs', 'ufs_aes', 'ufs_tick', 'unipro_sysclk', 'unipro_tick', 'unipro_mp_bclk', 'ufs_tx_symbol', 'ufs_mem_sub'] is too short
   	from schema $id: http://devicetree.org/schemas/ufs/mediatek,ufs.yaml
>> arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r2.dtb: ufshci@11270000 (mediatek,mt8195-ufshci): clocks: [[34, 63], [34, 64], [34, 65], [34, 54], [34, 55], [34, 56], [34, 90], [34, 93]] is too short
   	from schema $id: http://devicetree.org/schemas/ufs/mediatek,ufs.yaml
>> arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r2.dtb: ufshci@11270000 (mediatek,mt8195-ufshci): False schema does not allow [[0, 0], [0, 0], [0, 0], [0, 0], [0, 0], [0, 0], [0, 0], [0, 0]]
   	from schema $id: http://devicetree.org/schemas/ufs/mediatek,ufs.yaml
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r2.dtb: pmic@34 (mediatek,mt6360): #interrupt-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6360.yaml
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r2.dtb: jpeg-decoder@1a040000 (mediatek,mt8195-jpgdec): 'jpgdec@0,0', 'jpgdec@0,10000', 'jpgdec@1,0' do not match any of the regexes: '^jpgdec@[0-9a-f]+$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mt8195-jpegdec.yaml
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r2.dtb: jpeg-encoder@1a030000 (mediatek,mt8195-jpgenc): 'jpgenc@0,0', 'jpgenc@1,0' do not match any of the regexes: '^jpgenc@[0-9a-f]+$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mt8195-jpegenc.yaml
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r2.dtb: rt1019p (realtek,rt1019p): 'label' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/sound/realtek,rt1015p.yaml
--
   arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi:1514.7-1522.4: Warning (graph_child_address): /soc/syscon@1c01a000/port: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r3.dtb: pmic (mediatek,mt6359): '#sound-dai-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r3.dtb: infra-iommu@10315000 (mediatek,mt8195-iommu-infra): interrupts: [[0, 795, 4, 0], [0, 796, 4, 0], [0, 797, 4, 0], [0, 798, 4, 0], [0, 799, 4, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/mediatek,iommu.yaml
>> arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r3.dtb: ufshci@11270000 (mediatek,mt8195-ufshci): clock-names: ['ufs', 'ufs_aes', 'ufs_tick', 'unipro_sysclk', 'unipro_tick', 'unipro_mp_bclk', 'ufs_tx_symbol', 'ufs_mem_sub'] is too short
   	from schema $id: http://devicetree.org/schemas/ufs/mediatek,ufs.yaml
>> arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r3.dtb: ufshci@11270000 (mediatek,mt8195-ufshci): clocks: [[34, 63], [34, 64], [34, 65], [34, 54], [34, 55], [34, 56], [34, 90], [34, 93]] is too short
   	from schema $id: http://devicetree.org/schemas/ufs/mediatek,ufs.yaml
>> arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r3.dtb: ufshci@11270000 (mediatek,mt8195-ufshci): False schema does not allow [[0, 0], [0, 0], [0, 0], [0, 0], [0, 0], [0, 0], [0, 0], [0, 0]]
   	from schema $id: http://devicetree.org/schemas/ufs/mediatek,ufs.yaml
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r3.dtb: pmic@34 (mediatek,mt6360): #interrupt-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6360.yaml
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r3.dtb: jpeg-decoder@1a040000 (mediatek,mt8195-jpgdec): 'jpgdec@0,0', 'jpgdec@0,10000', 'jpgdec@1,0' do not match any of the regexes: '^jpgdec@[0-9a-f]+$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mt8195-jpegdec.yaml
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r3.dtb: jpeg-encoder@1a030000 (mediatek,mt8195-jpgenc): 'jpgenc@0,0', 'jpgenc@1,0' do not match any of the regexes: '^jpgenc@[0-9a-f]+$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mt8195-jpegenc.yaml
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r3.dtb: rt1019p (realtek,rt1019p): 'label' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/sound/realtek,rt1015p.yaml
--
   arch/arm64/boot/dts/mediatek/mt8195-demo.dtb: pmic (mediatek,mt6359): '#sound-dai-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml
   arch/arm64/boot/dts/mediatek/mt8195-demo.dtb: infra-iommu@10315000 (mediatek,mt8195-iommu-infra): interrupts: [[0, 795, 4, 0], [0, 796, 4, 0], [0, 797, 4, 0], [0, 798, 4, 0], [0, 799, 4, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/mediatek,iommu.yaml
>> arch/arm64/boot/dts/mediatek/mt8195-demo.dtb: ufshci@11270000 (mediatek,mt8195-ufshci): clock-names: ['ufs', 'ufs_aes', 'ufs_tick', 'unipro_sysclk', 'unipro_tick', 'unipro_mp_bclk', 'ufs_tx_symbol', 'ufs_mem_sub'] is too short
   	from schema $id: http://devicetree.org/schemas/ufs/mediatek,ufs.yaml
>> arch/arm64/boot/dts/mediatek/mt8195-demo.dtb: ufshci@11270000 (mediatek,mt8195-ufshci): clocks: [[25, 63], [25, 64], [25, 65], [25, 54], [25, 55], [25, 56], [25, 90], [25, 93]] is too short
   	from schema $id: http://devicetree.org/schemas/ufs/mediatek,ufs.yaml
>> arch/arm64/boot/dts/mediatek/mt8195-demo.dtb: ufshci@11270000 (mediatek,mt8195-ufshci): False schema does not allow [[0, 0], [0, 0], [0, 0], [0, 0], [0, 0], [0, 0], [0, 0], [0, 0]]
   	from schema $id: http://devicetree.org/schemas/ufs/mediatek,ufs.yaml
   arch/arm64/boot/dts/mediatek/mt8195-demo.dtb: jpeg-decoder@1a040000 (mediatek,mt8195-jpgdec): 'jpgdec@0,0', 'jpgdec@0,10000', 'jpgdec@1,0' do not match any of the regexes: '^jpgdec@[0-9a-f]+$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mt8195-jpegdec.yaml
   arch/arm64/boot/dts/mediatek/mt8195-demo.dtb: jpeg-encoder@1a030000 (mediatek,mt8195-jpgenc): 'jpgenc@0,0', 'jpgenc@1,0' do not match any of the regexes: '^jpgenc@[0-9a-f]+$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mt8195-jpegenc.yaml
--
   arch/arm64/boot/dts/mediatek/mt8195-evb.dtb: infra-iommu@10315000 (mediatek,mt8195-iommu-infra): interrupts: [[0, 795, 4, 0], [0, 796, 4, 0], [0, 797, 4, 0], [0, 798, 4, 0], [0, 799, 4, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/mediatek,iommu.yaml
>> arch/arm64/boot/dts/mediatek/mt8195-evb.dtb: ufshci@11270000 (mediatek,mt8195-ufshci): clock-names: ['ufs', 'ufs_aes', 'ufs_tick', 'unipro_sysclk', 'unipro_tick', 'unipro_mp_bclk', 'ufs_tx_symbol', 'ufs_mem_sub'] is too short
   	from schema $id: http://devicetree.org/schemas/ufs/mediatek,ufs.yaml
>> arch/arm64/boot/dts/mediatek/mt8195-evb.dtb: ufshci@11270000 (mediatek,mt8195-ufshci): clocks: [[25, 63], [25, 64], [25, 65], [25, 54], [25, 55], [25, 56], [25, 90], [25, 93]] is too short
   	from schema $id: http://devicetree.org/schemas/ufs/mediatek,ufs.yaml
>> arch/arm64/boot/dts/mediatek/mt8195-evb.dtb: ufshci@11270000 (mediatek,mt8195-ufshci): False schema does not allow [[0, 0], [0, 0], [0, 0], [0, 0], [0, 0], [0, 0], [0, 0], [0, 0]]
   	from schema $id: http://devicetree.org/schemas/ufs/mediatek,ufs.yaml
   arch/arm64/boot/dts/mediatek/mt8195-evb.dtb: jpeg-decoder@1a040000 (mediatek,mt8195-jpgdec): 'jpgdec@0,0', 'jpgdec@0,10000', 'jpgdec@1,0' do not match any of the regexes: '^jpgdec@[0-9a-f]+$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mt8195-jpegdec.yaml
   arch/arm64/boot/dts/mediatek/mt8195-evb.dtb: jpeg-encoder@1a030000 (mediatek,mt8195-jpgenc): 'jpgenc@0,0', 'jpgenc@1,0' do not match any of the regexes: '^jpgenc@[0-9a-f]+$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mt8195-jpegenc.yaml
--
   arch/arm64/boot/dts/mediatek/mt8395-genio-common.dtsi:1204.7-1212.4: Warning (graph_child_address): /soc/syscon@1c01a000/port: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/mediatek/mt8395-genio-1200-evk.dtb: pmic (mediatek,mt6359): '#sound-dai-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml
   arch/arm64/boot/dts/mediatek/mt8395-genio-1200-evk.dtb: infra-iommu@10315000 (mediatek,mt8195-iommu-infra): interrupts: [[0, 795, 4, 0], [0, 796, 4, 0], [0, 797, 4, 0], [0, 798, 4, 0], [0, 799, 4, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/mediatek,iommu.yaml
>> arch/arm64/boot/dts/mediatek/mt8395-genio-1200-evk.dtb: ufshci@11270000 (mediatek,mt8195-ufshci): clock-names: ['ufs', 'ufs_aes', 'ufs_tick', 'unipro_sysclk', 'unipro_tick', 'unipro_mp_bclk', 'ufs_tx_symbol', 'ufs_mem_sub'] is too short
   	from schema $id: http://devicetree.org/schemas/ufs/mediatek,ufs.yaml
>> arch/arm64/boot/dts/mediatek/mt8395-genio-1200-evk.dtb: ufshci@11270000 (mediatek,mt8195-ufshci): clocks: [[31, 63], [31, 64], [31, 65], [31, 54], [31, 55], [31, 56], [31, 90], [31, 93]] is too short
   	from schema $id: http://devicetree.org/schemas/ufs/mediatek,ufs.yaml
>> arch/arm64/boot/dts/mediatek/mt8395-genio-1200-evk.dtb: ufshci@11270000 (mediatek,mt8195-ufshci): False schema does not allow [[0, 0], [0, 0], [0, 0], [0, 0], [0, 0], [0, 0], [0, 0], [0, 0]]
   	from schema $id: http://devicetree.org/schemas/ufs/mediatek,ufs.yaml
   arch/arm64/boot/dts/mediatek/mt8395-genio-1200-evk.dtb: jpeg-decoder@1a040000 (mediatek,mt8195-jpgdec): 'jpgdec@0,0', 'jpgdec@0,10000', 'jpgdec@1,0' do not match any of the regexes: '^jpgdec@[0-9a-f]+$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mt8195-jpegdec.yaml
   arch/arm64/boot/dts/mediatek/mt8395-genio-1200-evk.dtb: jpeg-encoder@1a030000 (mediatek,mt8195-jpgenc): 'jpgenc@0,0', 'jpgenc@1,0' do not match any of the regexes: '^jpgenc@[0-9a-f]+$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mt8195-jpegenc.yaml
--
   arch/arm64/boot/dts/mediatek/mt8395-genio-common.dtsi:1204.7-1212.4: Warning (graph_child_address): /soc/syscon@1c01a000/port: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/mediatek/mt8395-genio-1200-evk-ufs.dtb: pmic (mediatek,mt6359): '#sound-dai-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml
   arch/arm64/boot/dts/mediatek/mt8395-genio-1200-evk-ufs.dtb: infra-iommu@10315000 (mediatek,mt8195-iommu-infra): interrupts: [[0, 795, 4, 0], [0, 796, 4, 0], [0, 797, 4, 0], [0, 798, 4, 0], [0, 799, 4, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/mediatek,iommu.yaml
>> arch/arm64/boot/dts/mediatek/mt8395-genio-1200-evk-ufs.dtb: ufshci@11270000 (mediatek,mt8195-ufshci): clock-names: ['ufs', 'ufs_aes', 'ufs_tick', 'unipro_sysclk', 'unipro_tick', 'unipro_mp_bclk', 'ufs_tx_symbol', 'ufs_mem_sub'] is too short
   	from schema $id: http://devicetree.org/schemas/ufs/mediatek,ufs.yaml
>> arch/arm64/boot/dts/mediatek/mt8395-genio-1200-evk-ufs.dtb: ufshci@11270000 (mediatek,mt8195-ufshci): clocks: [[31, 63], [31, 64], [31, 65], [31, 54], [31, 55], [31, 56], [31, 90], [31, 93]] is too short
   	from schema $id: http://devicetree.org/schemas/ufs/mediatek,ufs.yaml
>> arch/arm64/boot/dts/mediatek/mt8395-genio-1200-evk-ufs.dtb: ufshci@11270000 (mediatek,mt8195-ufshci): False schema does not allow [[0, 0], [0, 0], [0, 0], [0, 0], [0, 0], [0, 0], [0, 0], [0, 0]]
   	from schema $id: http://devicetree.org/schemas/ufs/mediatek,ufs.yaml
   arch/arm64/boot/dts/mediatek/mt8395-genio-1200-evk-ufs.dtb: jpeg-decoder@1a040000 (mediatek,mt8195-jpgdec): 'jpgdec@0,0', 'jpgdec@0,10000', 'jpgdec@1,0' do not match any of the regexes: '^jpgdec@[0-9a-f]+$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mt8195-jpegdec.yaml
   arch/arm64/boot/dts/mediatek/mt8395-genio-1200-evk-ufs.dtb: jpeg-encoder@1a030000 (mediatek,mt8195-jpgenc): 'jpgenc@0,0', 'jpgenc@1,0' do not match any of the regexes: '^jpgenc@[0-9a-f]+$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mt8195-jpegenc.yaml
--
   arch/arm64/boot/dts/mediatek/mt8395-kontron-3-5-sbc-i1200.dtb: pmic (mediatek,mt6359): '#sound-dai-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml
   arch/arm64/boot/dts/mediatek/mt8395-kontron-3-5-sbc-i1200.dtb: infra-iommu@10315000 (mediatek,mt8195-iommu-infra): interrupts: [[0, 795, 4, 0], [0, 796, 4, 0], [0, 797, 4, 0], [0, 798, 4, 0], [0, 799, 4, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/mediatek,iommu.yaml
>> arch/arm64/boot/dts/mediatek/mt8395-kontron-3-5-sbc-i1200.dtb: ufshci@11270000 (mediatek,mt8195-ufshci): clock-names: ['ufs', 'ufs_aes', 'ufs_tick', 'unipro_sysclk', 'unipro_tick', 'unipro_mp_bclk', 'ufs_tx_symbol', 'ufs_mem_sub'] is too short
   	from schema $id: http://devicetree.org/schemas/ufs/mediatek,ufs.yaml
>> arch/arm64/boot/dts/mediatek/mt8395-kontron-3-5-sbc-i1200.dtb: ufshci@11270000 (mediatek,mt8195-ufshci): clocks: [[25, 63], [25, 64], [25, 65], [25, 54], [25, 55], [25, 56], [25, 90], [25, 93]] is too short
   	from schema $id: http://devicetree.org/schemas/ufs/mediatek,ufs.yaml
>> arch/arm64/boot/dts/mediatek/mt8395-kontron-3-5-sbc-i1200.dtb: ufshci@11270000 (mediatek,mt8195-ufshci): False schema does not allow [[0, 0], [0, 0], [0, 0], [0, 0], [0, 0], [0, 0], [0, 0], [0, 0]]
   	from schema $id: http://devicetree.org/schemas/ufs/mediatek,ufs.yaml
   arch/arm64/boot/dts/mediatek/mt8395-kontron-3-5-sbc-i1200.dtb: jpeg-decoder@1a040000 (mediatek,mt8195-jpgdec): 'jpgdec@0,0', 'jpgdec@0,10000', 'jpgdec@1,0' do not match any of the regexes: '^jpgdec@[0-9a-f]+$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mt8195-jpegdec.yaml
   arch/arm64/boot/dts/mediatek/mt8395-kontron-3-5-sbc-i1200.dtb: jpeg-encoder@1a030000 (mediatek,mt8195-jpgenc): 'jpgenc@0,0', 'jpgenc@1,0' do not match any of the regexes: '^jpgenc@[0-9a-f]+$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mt8195-jpegenc.yaml
--
   arch/arm64/boot/dts/mediatek/mt8195.dtsi:3359.22-3371.5: Warning (avoid_unnecessary_addr_size): /soc/dsi@1c008000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l.dtb: pmic (mediatek,mt6359): '#sound-dai-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml
   arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l.dtb: infra-iommu@10315000 (mediatek,mt8195-iommu-infra): interrupts: [[0, 795, 4, 0], [0, 796, 4, 0], [0, 797, 4, 0], [0, 798, 4, 0], [0, 799, 4, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/mediatek,iommu.yaml
>> arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l.dtb: ufshci@11270000 (mediatek,mt8195-ufshci): clock-names: ['ufs', 'ufs_aes', 'ufs_tick', 'unipro_sysclk', 'unipro_tick', 'unipro_mp_bclk', 'ufs_tx_symbol', 'ufs_mem_sub'] is too short
   	from schema $id: http://devicetree.org/schemas/ufs/mediatek,ufs.yaml
>> arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l.dtb: ufshci@11270000 (mediatek,mt8195-ufshci): clocks: [[31, 63], [31, 64], [31, 65], [31, 54], [31, 55], [31, 56], [31, 90], [31, 93]] is too short
   	from schema $id: http://devicetree.org/schemas/ufs/mediatek,ufs.yaml
>> arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l.dtb: ufshci@11270000 (mediatek,mt8195-ufshci): False schema does not allow [[0, 0], [0, 0], [0, 0], [0, 0], [0, 0], [0, 0], [0, 0], [0, 0]]
   	from schema $id: http://devicetree.org/schemas/ufs/mediatek,ufs.yaml
   arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l.dtb: jpeg-decoder@1a040000 (mediatek,mt8195-jpgdec): 'jpgdec@0,0', 'jpgdec@0,10000', 'jpgdec@1,0' do not match any of the regexes: '^jpgdec@[0-9a-f]+$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mt8195-jpegdec.yaml
   arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l.dtb: jpeg-encoder@1a030000 (mediatek,mt8195-jpgenc): 'jpgenc@0,0', 'jpgenc@1,0' do not match any of the regexes: '^jpgenc@[0-9a-f]+$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mt8195-jpegenc.yaml

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
