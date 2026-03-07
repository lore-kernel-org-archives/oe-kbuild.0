Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2394120A5F3
	for <oe-kbuild@lists.linux.dev>; Sat,  7 Mar 2026 12:24:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772886252; cv=none; b=ihLrRYUFFYVdAnM1pHNUHxnq5mfWp83BEOThN6FnCn1gyBorMKOw7gqnxv5bNhUl4xc0HcauQjr5Yyl3HOD06XfGi/w3eWsfz0RxKlMbGXa9sQg0dOchuEQag0gzhpDQgA5CNsWJj/Rr+jHIkEWvPz/OjUaEXUVVIe+Ctz/d4Qg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772886252; c=relaxed/simple;
	bh=kpK6L1uTGtzokkKjB5jzYWHk1vCMrFUUKAofegr2Sds=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=SOjl+iLRSHnQd7HUIxmnbM8Y1IHdMMW0KEGZL8W8gj1b5XyiQJ4hWnTMoGp53HI+4GCM2ABgGTH19YNHq6ZBO2HehrQAurwPp9n6fX725vkWrqVHvCDo8PNAghxdfrGjpqAylXGYwhSFIbLHUynTCVZ/82SHzTX52EK2BvZ4Csw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BdLr0BhJ; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BdLr0BhJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772886252; x=1804422252;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=kpK6L1uTGtzokkKjB5jzYWHk1vCMrFUUKAofegr2Sds=;
  b=BdLr0BhJf90OcKr+k6jDZC5QpwEUHo8Kzl9nGy9xPO3ToteowNbnU+ye
   gBFDQmItEv80amnP+y3TLlIxDRBZ05Z1gHTxcM4rqzdMxHHVBiwUkWAax
   Cq5eOi0xDwsFDIf583m1vyWaarVgUHTgBCGxK9st4MJjFLAMViD4mEutj
   nMdVNhyT2XsITv5b0OlJuAdJen+z4ljWvb0RXOWtoSx0FLkpfXl/WErBa
   PTS7lKZo8Uyy2Cq7qlgnUWj2x8Ufl7bYuKw7XJOMnwr9GTMXmmmF5vnR2
   60ZD8lPyOJF9dwQ2j22BfBNjyshVne7ujnzppWPuzwLZjvI0VAnEgtEtx
   A==;
X-CSE-ConnectionGUID: a3a9Eae3TbWoWtHXEidZDA==
X-CSE-MsgGUID: gV8RhN2qQL2sAy/CmFzAWg==
X-IronPort-AV: E=McAfee;i="6800,10657,11721"; a="74026187"
X-IronPort-AV: E=Sophos;i="6.23,106,1770624000"; 
   d="scan'208";a="74026187"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Mar 2026 04:24:11 -0800
X-CSE-ConnectionGUID: qHpGSmMmTVSts1uDLN6ovw==
X-CSE-MsgGUID: VKYhIcRSTPuaQ3mHCgSsww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,106,1770624000"; 
   d="scan'208";a="215884906"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by fmviesa006.fm.intel.com with ESMTP; 07 Mar 2026 04:24:09 -0800
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vyqhS-000000002U1-40Hc;
	Sat, 07 Mar 2026 12:24:06 +0000
Date: Sat, 7 Mar 2026 13:23:54 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH] spi: dt-bindings: mediatek,spi-mtk-nor: Add clock
 bindings for mt8189
Message-ID: <202603071329.kddrP4ST-lkp@intel.com>
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
In-Reply-To: <20260305071546.2603378-1-ot_meiker.gao@mediatek.com>
References: <20260305071546.2603378-1-ot_meiker.gao@mediatek.com>
TO: Meiker Gao <ot_meiker.gao@mediatek.com>
TO: Mark Brown <broonie@kernel.org>
TO: Rob Herring <robh@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
TO: Matthias Brugger <matthias.bgg@gmail.com>
TO: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
TO: Bayi Cheng <bayi.cheng@mediatek.com>
TO: Chuanhong Guo <gch981213@gmail.com>
CC: linux-spi@vger.kernel.org
CC: devicetree@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: linux-arm-kernel@lists.infradead.org
CC: linux-mediatek@lists.infradead.org
CC: Project_Global_Chrome_Upstream_Group@mediatek.com
CC: sirius.wang@mediatek.com
CC: vince-wl.liu@mediatek.com
CC: jh.hsu@mediatek.com
CC: Meiker Gao <ot_meiker.gao@mediatek.com>

Hi Meiker,

kernel test robot noticed the following build warnings:

[auto build test WARNING on broonie-spi/for-next]
[also build test WARNING on robh/for-next krzk-dt/for-next linus/master v6.16-rc1 next-20260305]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Meiker-Gao/spi-dt-bindings-mediatek-spi-mtk-nor-Add-clock-bindings-for-mt8189/20260305-151712
base:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next
patch link:    https://lore.kernel.org/r/20260305071546.2603378-1-ot_meiker.gao%40mediatek.com
patch subject: [PATCH] spi: dt-bindings: mediatek,spi-mtk-nor: Add clock bindings for mt8189
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: arm-randconfig-2052-20260305 (https://download.01.org/0day-ci/archive/20260307/202603071329.kddrP4ST-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 15.1.0
dtschema: 2025.13.dev8+g0515abdd9
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260307/202603071329.kddrP4ST-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202603071329.kddrP4ST-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm/boot/dts/mediatek/mt2701-evb.dtb: / (mediatek,mt2701-evb): False schema does not allow {'device_type': ['memory'], 'reg': [[0, 2147483648, 0, 1073741824]]}
   	from schema $id: http://devicetree.org/schemas/root-node.yaml
   arch/arm/boot/dts/mediatek/mt2701-evb.dtb: /reserved-memory/trustzone-bootinfo@80002000: failed to match any schema with compatible: ['mediatek,trustzone-bootinfo']
   arch/arm/boot/dts/mediatek/mt2701-evb.dtb: thermal-zones: 'cpu_thermal' does not match any of the regexes: '^[a-zA-Z][a-zA-Z0-9\\-]{1,10}-thermal$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml
   arch/arm/boot/dts/mediatek/mt2701-evb.dtb: /power-controller@10006000: failed to match any schema with compatible: ['mediatek,mt2701-scpsys', 'syscon']
   arch/arm/boot/dts/mediatek/mt2701-evb.dtb: pinctrl@1000b000 (mediatek,mt2701-pinctrl): 'audiodefault', 'i2c0@0', 'i2c1@0', 'i2c2@0', 'nor', 'pwm_bls_gpio', 'spi0@0', 'spi1@0', 'spi2@0' do not match any of the regexes: '^pinctrl-[0-9]+$', 'pins$'
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt65xx-pinctrl.yaml
   arch/arm/boot/dts/mediatek/mt2701-evb.dtb: thermal@1100b000 (mediatek,mt2701-thermal): Unevaluated properties are not allowed ('reset-names' was unexpected)
   	from schema $id: http://devicetree.org/schemas/thermal/mediatek,thermal.yaml
>> arch/arm/boot/dts/mediatek/mt2701-evb.dtb: spi@11014000 (mediatek,mt2701-nor): clock-names: ['spi', 'sf'] is too short
   	from schema $id: http://devicetree.org/schemas/spi/mediatek,spi-mtk-nor.yaml
>> arch/arm/boot/dts/mediatek/mt2701-evb.dtb: spi@11014000 (mediatek,mt2701-nor): Unevaluated properties are not allowed ('clock-names' was unexpected)
   	from schema $id: http://devicetree.org/schemas/spi/mediatek,spi-mtk-nor.yaml
   arch/arm/boot/dts/mediatek/mt2701-evb.dtb: ethernet@1b100000 (mediatek,mt2701-eth): clock-names: ['ethif', 'esw', 'gp1', 'gp2', 'trgpll'] is too long
   	from schema $id: http://devicetree.org/schemas/net/mediatek,net.yaml
   arch/arm/boot/dts/mediatek/mt2701-evb.dtb: ethernet@1b100000 (mediatek,mt2701-eth): clocks: [[5, 110], [41, 2], [41, 4], [41, 3], [21, 8]] is too long
   	from schema $id: http://devicetree.org/schemas/net/mediatek,net.yaml
   arch/arm/boot/dts/mediatek/mt2701-evb.dtb: ethernet@1b100000 (mediatek,mt2701-eth): compatible: ['mediatek,mt2701-eth', 'syscon'] is too long
   	from schema $id: http://devicetree.org/schemas/net/mediatek,net.yaml
   arch/arm/boot/dts/mediatek/mt2701-evb.dtb: /sound: failed to match any schema with compatible: ['mediatek,mt2701-cs42448-machine']
--
   arch/arm/boot/dts/mediatek/mt7623a-rfb-emmc.dtb: nfi@1100d000 (mediatek,mt7623-nfc): compatible:0: 'mediatek,mt7623-nfc' is not one of ['mediatek,mt2701-nfc', 'mediatek,mt2712-nfc', 'mediatek,mt7622-nfc']
   	from schema $id: http://devicetree.org/schemas/mtd/mediatek,mtk-nfc.yaml
   arch/arm/boot/dts/mediatek/mt7623a-rfb-emmc.dtb: nfi@1100d000 (mediatek,mt7623-nfc): compatible: ['mediatek,mt7623-nfc', 'mediatek,mt2701-nfc'] is too long
   	from schema $id: http://devicetree.org/schemas/mtd/mediatek,mtk-nfc.yaml
   arch/arm/boot/dts/mediatek/mt7623a-rfb-emmc.dtb: /nfi@1100d000: failed to match any schema with compatible: ['mediatek,mt7623-nfc', 'mediatek,mt2701-nfc']
   arch/arm/boot/dts/mediatek/mt7623a-rfb-emmc.dtb: ecc@1100e000 (mediatek,mt7623-ecc): compatible:0: 'mediatek,mt7623-ecc' is not one of ['mediatek,mt2701-ecc', 'mediatek,mt2712-ecc', 'mediatek,mt7622-ecc', 'mediatek,mt7986-ecc']
   	from schema $id: http://devicetree.org/schemas/mtd/mediatek,nand-ecc-engine.yaml
   arch/arm/boot/dts/mediatek/mt7623a-rfb-emmc.dtb: ecc@1100e000 (mediatek,mt7623-ecc): compatible: ['mediatek,mt7623-ecc', 'mediatek,mt2701-ecc'] is too long
   	from schema $id: http://devicetree.org/schemas/mtd/mediatek,nand-ecc-engine.yaml
   arch/arm/boot/dts/mediatek/mt7623a-rfb-emmc.dtb: /ecc@1100e000: failed to match any schema with compatible: ['mediatek,mt7623-ecc', 'mediatek,mt2701-ecc']
>> arch/arm/boot/dts/mediatek/mt7623a-rfb-emmc.dtb: spi@11014000 (mediatek,mt7623-nor): clock-names: ['spi', 'sf'] is too short
   	from schema $id: http://devicetree.org/schemas/spi/mediatek,spi-mtk-nor.yaml
   arch/arm/boot/dts/mediatek/mt7623a-rfb-emmc.dtb: spi@11016000 (mediatek,mt7623-spi): compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt7623-spi', 'mediatek,mt2701-spi'] is too long
   	'mediatek,mt7623-spi' is not one of ['mediatek,mt7629-spi', 'mediatek,mt8365-spi']
   	'mediatek,mt7623-spi' is not one of ['mediatek,mt8516-spi']
   	'mediatek,mt7623-spi' is not one of ['mediatek,mt6779-spi', 'mediatek,mt8186-spi', 'mediatek,mt8192-spi', 'mediatek,mt8195-spi']
   	'mediatek,mt7623-spi' is not one of ['mediatek,mt7981-spi-ipm', 'mediatek,mt7986-spi-ipm', 'mediatek,mt7988-spi-quad', 'mediatek,mt7988-spi-single', 'mediatek,mt8188-spi-ipm']
   	'mediatek,mt7623-spi' is not one of ['mediatek,mt8196-spi']
   	'mediatek,mt7623-spi' is not one of ['mediatek,mt2701-spi', 'mediatek,mt2712-spi', 'mediatek,mt6589-spi', 'mediatek,mt6765-spi', 'mediatek,mt6893-spi', 'mediatek,mt6991-spi', 'mediatek,mt7622-spi', 'mediatek,mt8135-spi', 'mediatek,mt8173-spi', 'mediatek,mt8183-spi']
   	'mediatek,mt7622-spi' was expected
--
   arch/arm/boot/dts/mediatek/mt7623a-rfb-nand.dtb: nfi@1100d000 (mediatek,mt7623-nfc): compatible: ['mediatek,mt7623-nfc', 'mediatek,mt2701-nfc'] is too long
   	from schema $id: http://devicetree.org/schemas/mtd/mediatek,mtk-nfc.yaml
   arch/arm/boot/dts/mediatek/mt7623a-rfb-nand.dtb: nfi@1100d000 (mediatek,mt7623-nfc): Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'power-domains' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mtd/mediatek,mtk-nfc.yaml
   arch/arm/boot/dts/mediatek/mt7623a-rfb-nand.dtb: /nfi@1100d000: failed to match any schema with compatible: ['mediatek,mt7623-nfc', 'mediatek,mt2701-nfc']
   arch/arm/boot/dts/mediatek/mt7623a-rfb-nand.dtb: ecc@1100e000 (mediatek,mt7623-ecc): compatible:0: 'mediatek,mt7623-ecc' is not one of ['mediatek,mt2701-ecc', 'mediatek,mt2712-ecc', 'mediatek,mt7622-ecc', 'mediatek,mt7986-ecc']
   	from schema $id: http://devicetree.org/schemas/mtd/mediatek,nand-ecc-engine.yaml
   arch/arm/boot/dts/mediatek/mt7623a-rfb-nand.dtb: ecc@1100e000 (mediatek,mt7623-ecc): compatible: ['mediatek,mt7623-ecc', 'mediatek,mt2701-ecc'] is too long
   	from schema $id: http://devicetree.org/schemas/mtd/mediatek,nand-ecc-engine.yaml
   arch/arm/boot/dts/mediatek/mt7623a-rfb-nand.dtb: /ecc@1100e000: failed to match any schema with compatible: ['mediatek,mt7623-ecc', 'mediatek,mt2701-ecc']
>> arch/arm/boot/dts/mediatek/mt7623a-rfb-nand.dtb: spi@11014000 (mediatek,mt7623-nor): clock-names: ['spi', 'sf'] is too short
   	from schema $id: http://devicetree.org/schemas/spi/mediatek,spi-mtk-nor.yaml
   arch/arm/boot/dts/mediatek/mt7623a-rfb-nand.dtb: spi@11016000 (mediatek,mt7623-spi): compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt7623-spi', 'mediatek,mt2701-spi'] is too long
   	'mediatek,mt7623-spi' is not one of ['mediatek,mt7629-spi', 'mediatek,mt8365-spi']
   	'mediatek,mt7623-spi' is not one of ['mediatek,mt8516-spi']
   	'mediatek,mt7623-spi' is not one of ['mediatek,mt6779-spi', 'mediatek,mt8186-spi', 'mediatek,mt8192-spi', 'mediatek,mt8195-spi']
   	'mediatek,mt7623-spi' is not one of ['mediatek,mt7981-spi-ipm', 'mediatek,mt7986-spi-ipm', 'mediatek,mt7988-spi-quad', 'mediatek,mt7988-spi-single', 'mediatek,mt8188-spi-ipm']
   	'mediatek,mt7623-spi' is not one of ['mediatek,mt8196-spi']
   	'mediatek,mt7623-spi' is not one of ['mediatek,mt2701-spi', 'mediatek,mt2712-spi', 'mediatek,mt6589-spi', 'mediatek,mt6765-spi', 'mediatek,mt6893-spi', 'mediatek,mt6991-spi', 'mediatek,mt7622-spi', 'mediatek,mt8135-spi', 'mediatek,mt8173-spi', 'mediatek,mt8183-spi']
   	'mediatek,mt7622-spi' was expected
--
   arch/arm/boot/dts/mediatek/mt7623n-rfb-emmc.dtb: nfi@1100d000 (mediatek,mt7623-nfc): compatible:0: 'mediatek,mt7623-nfc' is not one of ['mediatek,mt2701-nfc', 'mediatek,mt2712-nfc', 'mediatek,mt7622-nfc']
   	from schema $id: http://devicetree.org/schemas/mtd/mediatek,mtk-nfc.yaml
   arch/arm/boot/dts/mediatek/mt7623n-rfb-emmc.dtb: nfi@1100d000 (mediatek,mt7623-nfc): compatible: ['mediatek,mt7623-nfc', 'mediatek,mt2701-nfc'] is too long
   	from schema $id: http://devicetree.org/schemas/mtd/mediatek,mtk-nfc.yaml
   arch/arm/boot/dts/mediatek/mt7623n-rfb-emmc.dtb: /nfi@1100d000: failed to match any schema with compatible: ['mediatek,mt7623-nfc', 'mediatek,mt2701-nfc']
   arch/arm/boot/dts/mediatek/mt7623n-rfb-emmc.dtb: ecc@1100e000 (mediatek,mt7623-ecc): compatible:0: 'mediatek,mt7623-ecc' is not one of ['mediatek,mt2701-ecc', 'mediatek,mt2712-ecc', 'mediatek,mt7622-ecc', 'mediatek,mt7986-ecc']
   	from schema $id: http://devicetree.org/schemas/mtd/mediatek,nand-ecc-engine.yaml
   arch/arm/boot/dts/mediatek/mt7623n-rfb-emmc.dtb: ecc@1100e000 (mediatek,mt7623-ecc): compatible: ['mediatek,mt7623-ecc', 'mediatek,mt2701-ecc'] is too long
   	from schema $id: http://devicetree.org/schemas/mtd/mediatek,nand-ecc-engine.yaml
   arch/arm/boot/dts/mediatek/mt7623n-rfb-emmc.dtb: /ecc@1100e000: failed to match any schema with compatible: ['mediatek,mt7623-ecc', 'mediatek,mt2701-ecc']
>> arch/arm/boot/dts/mediatek/mt7623n-rfb-emmc.dtb: spi@11014000 (mediatek,mt7623-nor): clock-names: ['spi', 'sf'] is too short
   	from schema $id: http://devicetree.org/schemas/spi/mediatek,spi-mtk-nor.yaml
   arch/arm/boot/dts/mediatek/mt7623n-rfb-emmc.dtb: spi@11016000 (mediatek,mt7623-spi): compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt7623-spi', 'mediatek,mt2701-spi'] is too long
   	'mediatek,mt7623-spi' is not one of ['mediatek,mt7629-spi', 'mediatek,mt8365-spi']
   	'mediatek,mt7623-spi' is not one of ['mediatek,mt8516-spi']
   	'mediatek,mt7623-spi' is not one of ['mediatek,mt6779-spi', 'mediatek,mt8186-spi', 'mediatek,mt8192-spi', 'mediatek,mt8195-spi']
   	'mediatek,mt7623-spi' is not one of ['mediatek,mt7981-spi-ipm', 'mediatek,mt7986-spi-ipm', 'mediatek,mt7988-spi-quad', 'mediatek,mt7988-spi-single', 'mediatek,mt8188-spi-ipm']
   	'mediatek,mt7623-spi' is not one of ['mediatek,mt8196-spi']
   	'mediatek,mt7623-spi' is not one of ['mediatek,mt2701-spi', 'mediatek,mt2712-spi', 'mediatek,mt6589-spi', 'mediatek,mt6765-spi', 'mediatek,mt6893-spi', 'mediatek,mt6991-spi', 'mediatek,mt7622-spi', 'mediatek,mt8135-spi', 'mediatek,mt8173-spi', 'mediatek,mt8183-spi']
   	'mediatek,mt7622-spi' was expected
--
   arch/arm/boot/dts/mediatek/mt7623n-bananapi-bpi-r2.dtb: nfi@1100d000 (mediatek,mt7623-nfc): compatible:0: 'mediatek,mt7623-nfc' is not one of ['mediatek,mt2701-nfc', 'mediatek,mt2712-nfc', 'mediatek,mt7622-nfc']
   	from schema $id: http://devicetree.org/schemas/mtd/mediatek,mtk-nfc.yaml
   arch/arm/boot/dts/mediatek/mt7623n-bananapi-bpi-r2.dtb: nfi@1100d000 (mediatek,mt7623-nfc): compatible: ['mediatek,mt7623-nfc', 'mediatek,mt2701-nfc'] is too long
   	from schema $id: http://devicetree.org/schemas/mtd/mediatek,mtk-nfc.yaml
   arch/arm/boot/dts/mediatek/mt7623n-bananapi-bpi-r2.dtb: /nfi@1100d000: failed to match any schema with compatible: ['mediatek,mt7623-nfc', 'mediatek,mt2701-nfc']
   arch/arm/boot/dts/mediatek/mt7623n-bananapi-bpi-r2.dtb: ecc@1100e000 (mediatek,mt7623-ecc): compatible:0: 'mediatek,mt7623-ecc' is not one of ['mediatek,mt2701-ecc', 'mediatek,mt2712-ecc', 'mediatek,mt7622-ecc', 'mediatek,mt7986-ecc']
   	from schema $id: http://devicetree.org/schemas/mtd/mediatek,nand-ecc-engine.yaml
   arch/arm/boot/dts/mediatek/mt7623n-bananapi-bpi-r2.dtb: ecc@1100e000 (mediatek,mt7623-ecc): compatible: ['mediatek,mt7623-ecc', 'mediatek,mt2701-ecc'] is too long
   	from schema $id: http://devicetree.org/schemas/mtd/mediatek,nand-ecc-engine.yaml
   arch/arm/boot/dts/mediatek/mt7623n-bananapi-bpi-r2.dtb: /ecc@1100e000: failed to match any schema with compatible: ['mediatek,mt7623-ecc', 'mediatek,mt2701-ecc']
>> arch/arm/boot/dts/mediatek/mt7623n-bananapi-bpi-r2.dtb: spi@11014000 (mediatek,mt7623-nor): clock-names: ['spi', 'sf'] is too short
   	from schema $id: http://devicetree.org/schemas/spi/mediatek,spi-mtk-nor.yaml
   arch/arm/boot/dts/mediatek/mt7623n-bananapi-bpi-r2.dtb: spi@11016000 (mediatek,mt7623-spi): compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt7623-spi', 'mediatek,mt2701-spi'] is too long
   	'mediatek,mt7623-spi' is not one of ['mediatek,mt7629-spi', 'mediatek,mt8365-spi']
   	'mediatek,mt7623-spi' is not one of ['mediatek,mt8516-spi']
   	'mediatek,mt7623-spi' is not one of ['mediatek,mt6779-spi', 'mediatek,mt8186-spi', 'mediatek,mt8192-spi', 'mediatek,mt8195-spi']
   	'mediatek,mt7623-spi' is not one of ['mediatek,mt7981-spi-ipm', 'mediatek,mt7986-spi-ipm', 'mediatek,mt7988-spi-quad', 'mediatek,mt7988-spi-single', 'mediatek,mt8188-spi-ipm']
   	'mediatek,mt7623-spi' is not one of ['mediatek,mt8196-spi']
   	'mediatek,mt7623-spi' is not one of ['mediatek,mt2701-spi', 'mediatek,mt2712-spi', 'mediatek,mt6589-spi', 'mediatek,mt6765-spi', 'mediatek,mt6893-spi', 'mediatek,mt6991-spi', 'mediatek,mt7622-spi', 'mediatek,mt8135-spi', 'mediatek,mt8173-spi', 'mediatek,mt8183-spi']
   	'mediatek,mt7622-spi' was expected
--
   arch/arm/boot/dts/mediatek/mt7629.dtsi:163.38-172.5: Warning (simple_bus_reg): /soc/interrupt-controller@10300000: simple-bus unit address format error, expected "10310000"
   arch/arm/boot/dts/mediatek/mt7629-rfb.dtb: /soc/power-controller@10006000: failed to match any schema with compatible: ['mediatek,mt7629-scpsys', 'mediatek,mt7622-scpsys']
   arch/arm/boot/dts/mediatek/mt7629-rfb.dtb: /soc/power-controller@10006000: failed to match any schema with compatible: ['mediatek,mt7629-scpsys', 'mediatek,mt7622-scpsys']
   arch/arm/boot/dts/mediatek/mt7629-rfb.dtb: pinctrl@10217000 (mediatek,mt7629-pinctrl): ephy-leds-pins:mux:groups:0: 'gphy_leds_0' is not one of ['ephy_leds', 'ephy0_led', 'ephy1_led', 'ephy2_led', 'ephy3_led', 'ephy4_led', 'wled', 'wf2g_led', 'wf5g_led']
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt7622-pinctrl.yaml
   arch/arm/boot/dts/mediatek/mt7629-rfb.dtb: pinctrl@10217000 (mediatek,mt7629-pinctrl): ephy-leds-pins:mux:groups: ['gphy_leds_0', 'ephy_leds'] is too long
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt7622-pinctrl.yaml
>> arch/arm/boot/dts/mediatek/mt7629-rfb.dtb: spi@11014000 (mediatek,mt7629-nor): clock-names: ['spi', 'sf'] is too short
   	from schema $id: http://devicetree.org/schemas/spi/mediatek,spi-mtk-nor.yaml
>> arch/arm/boot/dts/mediatek/mt7629-rfb.dtb: spi@11014000 (mediatek,mt7629-nor): Unevaluated properties are not allowed ('clock-names' was unexpected)
   	from schema $id: http://devicetree.org/schemas/spi/mediatek,spi-mtk-nor.yaml
   arch/arm/boot/dts/mediatek/mt7629-rfb.dtb: syscon@1a000000 (mediatek,mt7629-ssusbsys): compatible: ['mediatek,mt7629-ssusbsys', 'syscon'] is too long
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,mt7622-ssusbsys.yaml
   arch/arm/boot/dts/mediatek/mt7629-rfb.dtb: syscon@1a100800 (mediatek,mt7629-pciesys): compatible: ['mediatek,mt7629-pciesys', 'syscon'] is too long
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,mt7622-pciesys.yaml
   arch/arm/boot/dts/mediatek/mt7629-rfb.dtb: ethernet@1b100000 (mediatek,mt7629-eth): compatible: ['mediatek,mt7629-eth', 'syscon'] is too long
   	from schema $id: http://devicetree.org/schemas/net/mediatek,net.yaml

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
