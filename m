Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 357B025332E
	for <oe-kbuild@lists.linux.dev>; Tue, 23 Dec 2025 09:52:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766483563; cv=none; b=r7kkhOo/bB5W8bpk0Hp1rjIMK0k5oFU8fyiE156BxBa+UVW/CYhWWXg4mug6ltv+qi6vQofLrHVoi4VmRo0t4s7qhhhxuYbUX4RLRxBlJc0yLtTE/GQJK2DaPqhfF5JD0N0Z6x9RtEM46QmkgSikiqeceFErrvOrkMcHzNUvOGM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766483563; c=relaxed/simple;
	bh=Q7Sz5NMxYfxAXS0Q1ywWluEHrn8vP3CTBjXluHf+ywQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=e4GUKrMcTaEyLCWHE09BJGl/D1fHTNkzkgsSBBq7s/59GQM8R1KxpNMhBP6MeQj+/A641cB/ieTtAxtj3qyBZ9lScLdDieWcQ9EXuAGzlKn8qFKpx+t/eRjDsJPdIUdAwUw5QvQ9IMhUhHXzj6QN7h/neY5r0oHIuUgWaevZyuo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BGu3+uBC; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BGu3+uBC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766483562; x=1798019562;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Q7Sz5NMxYfxAXS0Q1ywWluEHrn8vP3CTBjXluHf+ywQ=;
  b=BGu3+uBCaCVL/2Gz7tVYJN0GYFYuZBwqQBcioRWM0mfUp/29B74+w/DE
   Ts7Eyz9i64qZlYITb4sQWzf/70lQOL3uGaa5sPLX+za+Du0mvHktGkXvg
   QuRSSXpIrGTavZjwzmxqgAvmczDi4EcyallAAr/194kW6BdVemotyzG6G
   WWuNgreLRUAylpEBE6fM1ubhwGOe/Gj6l0oL0bOM3mLgk54yMpZOiWtC/
   lqYCWsBBe0RiiFsIQSB5EokJQ7aA3HL6OJEm7dVuzsivcbIIC8PUsA34A
   sbPsmlW/1hxGvrcdn21g9+tsX9pOYbu8dhE69GOZ8rGcgO0c3edyyGg/A
   w==;
X-CSE-ConnectionGUID: oTVpEmQCSLGba7a6VA8TVw==
X-CSE-MsgGUID: Cj5oJNrWQMGTZhMVzNrEAg==
X-IronPort-AV: E=McAfee;i="6800,10657,11650"; a="71960733"
X-IronPort-AV: E=Sophos;i="6.21,170,1763452800"; 
   d="scan'208";a="71960733"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Dec 2025 01:52:41 -0800
X-CSE-ConnectionGUID: wRN1eaZ/S/e3kzqVbcdbcg==
X-CSE-MsgGUID: ZPfmiM8pQAGU7RpvxHZUZg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,170,1763452800"; 
   d="scan'208";a="204240875"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by fmviesa005.fm.intel.com with ESMTP; 23 Dec 2025 01:52:39 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vXz4G-000000005u0-3lVj;
	Tue, 23 Dec 2025 09:52:36 +0000
Date: Tue, 23 Dec 2025 10:51:50 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v4 02/25] dt-bindings: ufs: mediatek,ufs: Complete the
 binding
Message-ID: <202512231010.fu55T00s-lkp@intel.com>
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
:::::: branch date: 5 days ago
:::::: commit date: 5 days ago
config: arm64-randconfig-2052-20251220 (https://download.01.org/0day-ci/archive/20251223/202512231010.fu55T00s-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
dtschema version: 2025.12
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251223/202512231010.fu55T00s-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202512231010.fu55T00s-lkp@intel.com/

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
