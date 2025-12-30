Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD9321A3154
	for <oe-kbuild@lists.linux.dev>; Tue, 30 Dec 2025 08:57:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767085036; cv=none; b=ZybU1C8u1vVbbUBFhLDMgbY4XRPO8lOh7IqVVRDy7nRcnaBu8cDl/L1k7cTzWxdMR8JD5jI9XDcUOLoJ2nLJX4j4lj0ZRpYi5zziUzBKHzBufzAjq6I/WiJYrCxiO18Ql55WrdRCzyUYpLpYNTZn4n5WqnPSdJuCcxTlbLNKR9w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767085036; c=relaxed/simple;
	bh=2SRCLmQF8m/HwlKmYff8Eulr/Qas2mDw/5LltLSS9MQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Y9CTqAguquvGmcRUR2f2w8Peq0JeC5iP0Gm6qcWTF1GzmHZX8ays7px5ls0Ni3RVTzLSVBijwo/ncu7UCidRTSZLsbKo6/TkVCvEo/b9y31tVMJNMABUJ8MWfs2Ff0MU/pdmOEWinUbwaEmmWSJIQhMKu10HBOMAE7by7EGqTzQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fumAY+0C; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fumAY+0C"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767085034; x=1798621034;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=2SRCLmQF8m/HwlKmYff8Eulr/Qas2mDw/5LltLSS9MQ=;
  b=fumAY+0CYLkBP0s8APi4yH6pv0GGACaDTaPF9oazp3R3IgKdgD8wqfyR
   eZq51UHFXFgmRktHlAH7cMiubJSTlG8Qe/fYL3eBHaaOZrWD8tcld0vrs
   CxzHJkXij7VuUhR5NQZKFyi+9CiIrfld/njEzDjbF+OLHXcq9cpYZnusE
   sd4gWkk7m+BR926492rScx6QBDvpFQuNZA5ZrlRjVsvDwAEkhBj9qyOkV
   dEz18ZD4H2ARcm6gne0Z2Cn4MYtIdWjINOQi044sXyfUk+tCiB47zE0dB
   I/aQzZprH1dJGmqeizzGTPodsOY95PpFAGZhrFqHqGSBm6g9vr8v4DSLn
   w==;
X-CSE-ConnectionGUID: AZEaD61nQ/OZiqGd6FeMiw==
X-CSE-MsgGUID: +SVaMi/lTwiu/rg7uHGPJw==
X-IronPort-AV: E=McAfee;i="6800,10657,11656"; a="68567232"
X-IronPort-AV: E=Sophos;i="6.21,188,1763452800"; 
   d="scan'208";a="68567232"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Dec 2025 00:57:13 -0800
X-CSE-ConnectionGUID: 44M/D5a+TFiHWqJefzPfFQ==
X-CSE-MsgGUID: N4ZEUbkQQuKdiQrLub5yAg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,188,1763452800"; 
   d="scan'208";a="201435167"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by fmviesa008.fm.intel.com with ESMTP; 30 Dec 2025 00:57:12 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vaVXR-000000007vU-45vN;
	Tue, 30 Dec 2025 08:57:09 +0000
Date: Tue, 30 Dec 2025 09:57:05 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v4 02/25] dt-bindings: ufs: mediatek,ufs: Complete the
 binding
Message-ID: <202512300906.An5xY0sW-lkp@intel.com>
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
:::::: branch date: 12 days ago
:::::: commit date: 12 days ago
config: arm64-randconfig-2052-20251220 (https://download.01.org/0day-ci/archive/20251230/202512300906.An5xY0sW-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
dtschema version: 2025.12
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251230/202512300906.An5xY0sW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202512300906.An5xY0sW-lkp@intel.com/

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
