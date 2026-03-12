Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF80E3FB7E8
	for <oe-kbuild@lists.linux.dev>; Thu, 12 Mar 2026 17:00:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773334810; cv=none; b=M3L3Df3mXCIhlvfxdsKyy3OYP9Ge4qhxfLUxBlcU1OccAFMQYAuF3foPrbZi4G6zI0yRkPnXRd7G0fhMLI0pABkKFw0B+wuOM5KA3kD7n6ADtIGK9j7cAgXwYdLHC08PBvCRUf7r/nQXv8xyOBqb+vG5FlDBpE8WrFOwdwTGYh0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773334810; c=relaxed/simple;
	bh=qIpbN6XgblbWDQOlDk2C4lmgwVriC+z1rP9A7p1zSaE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Cs5dM2MIVgpP0WqnGikEVE5jsCKA2JTeoNVJIckVsI3HPAWGYnZiVWNXSpJnG2V9Hch51shDxNTtSR2W0l0cWOn/ubKf6wBvRu6NLP+iziWnC3HvHqG9xPNVsTT4C2pGeTrvF5dkeWyhogJ+7jpVD2fKocQy9VPscwMh6/oHohA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TaNyg7Qe; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TaNyg7Qe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773334808; x=1804870808;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=qIpbN6XgblbWDQOlDk2C4lmgwVriC+z1rP9A7p1zSaE=;
  b=TaNyg7QeVakfJ7JsIErp3TB7uKNbPh+l8DYY+MlIh6ruehOZRHFhOt1D
   Wz0Ibhq8xNmQpqIPEC19B3wKZQZoKIwYj9+KXFQLIM+PYctyKe1Uwbsju
   zOoB2LXBuUb/+LmjJPOpd8LBwlklFDeEOuiSEGITyDd9zaccNEZ9CmJqz
   jfBwI/yk43tMWwk7r5Jh2EC6lVQBplrb2Gf7cr4aPKKmKGpVgioo+1Yg1
   8Ddh2bZNo1G6Uyfq0cA03DAj5HBfQT0Y+8DyMmFhtTS8kGY1qm+nois1M
   8HyGSXkGOCbkpKzmr7xCKTg2iY3bPYqlsNTE6ApAVxZRb+YPffFiWNiuz
   w==;
X-CSE-ConnectionGUID: ObFGrFDtS/K1ymqC7bHY4Q==
X-CSE-MsgGUID: qVe4bNk2T1iD7oBCqv218g==
X-IronPort-AV: E=McAfee;i="6800,10657,11727"; a="85917305"
X-IronPort-AV: E=Sophos;i="6.23,116,1770624000"; 
   d="scan'208";a="85917305"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Mar 2026 10:00:07 -0700
X-CSE-ConnectionGUID: dq+J8eplT1y5aJyOvOZSYQ==
X-CSE-MsgGUID: TP+vYXtiRLOTt4GKPB/ZvQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,116,1770624000"; 
   d="scan'208";a="223316926"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by fmviesa004.fm.intel.com with ESMTP; 12 Mar 2026 10:00:06 -0700
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w0jOG-000000003YH-0iqd;
	Thu, 12 Mar 2026 17:00:04 +0000
Date: Thu, 12 Mar 2026 17:59:36 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH] spi: dt-bindings: mediatek,spi-mtk-nor: Add clock
 bindings for mt8189
Message-ID: <202603121723.8EBoD9Yd-lkp@intel.com>
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
In-Reply-To: <20260311053335.785292-1-ot_meiker.gao@mediatek.com>
References: <20260311053335.785292-1-ot_meiker.gao@mediatek.com>
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
[also build test WARNING on robh/for-next krzk-dt/for-next linus/master v6.16-rc1 next-20260311]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Meiker-Gao/spi-dt-bindings-mediatek-spi-mtk-nor-Add-clock-bindings-for-mt8189/20260311-133654
base:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next
patch link:    https://lore.kernel.org/r/20260311053335.785292-1-ot_meiker.gao%40mediatek.com
patch subject: [PATCH] spi: dt-bindings: mediatek,spi-mtk-nor: Add clock bindings for mt8189
:::::: branch date: 35 hours ago
:::::: commit date: 35 hours ago
config: arm64-randconfig-2051-20260311 (https://download.01.org/0day-ci/archive/20260312/202603121723.8EBoD9Yd-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 9.5.0
dtschema: 2025.13.dev8+g0515abdd9
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260312/202603121723.8EBoD9Yd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202603121723.8EBoD9Yd-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-chinchou-sku0.dtb: spi@11000000 (mediatek,mt8186-nor): clock-names: ['spi', 'sf', 'axi', 'axi_s'] is too long
   	from schema $id: http://devicetree.org/schemas/spi/mediatek,spi-mtk-nor.yaml
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-chinchou-sku0.dtb: spi@11000000 (mediatek,mt8186-nor): Unevaluated properties are not allowed ('clock-names' was unexpected)
   	from schema $id: http://devicetree.org/schemas/spi/mediatek,spi-mtk-nor.yaml
--
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-chinchou-sku1.dtb: spi@11000000 (mediatek,mt8186-nor): clock-names: ['spi', 'sf', 'axi', 'axi_s'] is too long
   	from schema $id: http://devicetree.org/schemas/spi/mediatek,spi-mtk-nor.yaml
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-chinchou-sku1.dtb: spi@11000000 (mediatek,mt8186-nor): Unevaluated properties are not allowed ('clock-names' was unexpected)
   	from schema $id: http://devicetree.org/schemas/spi/mediatek,spi-mtk-nor.yaml
--
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-chinchou-sku16.dtb: spi@11000000 (mediatek,mt8186-nor): clock-names: ['spi', 'sf', 'axi', 'axi_s'] is too long
   	from schema $id: http://devicetree.org/schemas/spi/mediatek,spi-mtk-nor.yaml
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-chinchou-sku16.dtb: spi@11000000 (mediatek,mt8186-nor): Unevaluated properties are not allowed ('clock-names' was unexpected)
   	from schema $id: http://devicetree.org/schemas/spi/mediatek,spi-mtk-nor.yaml
--
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-magneton-sku393216.dtb: spi@11000000 (mediatek,mt8186-nor): clock-names: ['spi', 'sf', 'axi', 'axi_s'] is too long
   	from schema $id: http://devicetree.org/schemas/spi/mediatek,spi-mtk-nor.yaml
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-magneton-sku393216.dtb: spi@11000000 (mediatek,mt8186-nor): Unevaluated properties are not allowed ('clock-names' was unexpected)
   	from schema $id: http://devicetree.org/schemas/spi/mediatek,spi-mtk-nor.yaml
   arch/arm64/boot/dts/mediatek/mt8186-corsola-magneton-sku393216.dtb: sound (mediatek,mt8186-mt6366-rt1019-rt5682s-sound): 'model' is a required property
   	from schema $id: http://devicetree.org/schemas/sound/mt8186-mt6366-rt1019-rt5682s.yaml
--
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-magneton-sku393217.dtb: spi@11000000 (mediatek,mt8186-nor): clock-names: ['spi', 'sf', 'axi', 'axi_s'] is too long
   	from schema $id: http://devicetree.org/schemas/spi/mediatek,spi-mtk-nor.yaml
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-magneton-sku393217.dtb: spi@11000000 (mediatek,mt8186-nor): Unevaluated properties are not allowed ('clock-names' was unexpected)
   	from schema $id: http://devicetree.org/schemas/spi/mediatek,spi-mtk-nor.yaml
   arch/arm64/boot/dts/mediatek/mt8186-corsola-magneton-sku393217.dtb: sound (mediatek,mt8186-mt6366-rt1019-rt5682s-sound): 'model' is a required property
   	from schema $id: http://devicetree.org/schemas/sound/mt8186-mt6366-rt1019-rt5682s.yaml
--
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-magneton-sku393218.dtb: spi@11000000 (mediatek,mt8186-nor): clock-names: ['spi', 'sf', 'axi', 'axi_s'] is too long
   	from schema $id: http://devicetree.org/schemas/spi/mediatek,spi-mtk-nor.yaml
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-magneton-sku393218.dtb: spi@11000000 (mediatek,mt8186-nor): Unevaluated properties are not allowed ('clock-names' was unexpected)
   	from schema $id: http://devicetree.org/schemas/spi/mediatek,spi-mtk-nor.yaml
   arch/arm64/boot/dts/mediatek/mt8186-corsola-magneton-sku393218.dtb: sound (mediatek,mt8186-mt6366-rt1019-rt5682s-sound): 'model' is a required property
   	from schema $id: http://devicetree.org/schemas/sound/mt8186-mt6366-rt1019-rt5682s.yaml
--
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-ponyta-sku0.dtb: spi@11000000 (mediatek,mt8186-nor): clock-names: ['spi', 'sf', 'axi', 'axi_s'] is too long
   	from schema $id: http://devicetree.org/schemas/spi/mediatek,spi-mtk-nor.yaml
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-ponyta-sku0.dtb: spi@11000000 (mediatek,mt8186-nor): Unevaluated properties are not allowed ('clock-names' was unexpected)
   	from schema $id: http://devicetree.org/schemas/spi/mediatek,spi-mtk-nor.yaml
--
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-ponyta-sku1.dtb: spi@11000000 (mediatek,mt8186-nor): clock-names: ['spi', 'sf', 'axi', 'axi_s'] is too long
   	from schema $id: http://devicetree.org/schemas/spi/mediatek,spi-mtk-nor.yaml
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-ponyta-sku1.dtb: spi@11000000 (mediatek,mt8186-nor): Unevaluated properties are not allowed ('clock-names' was unexpected)
   	from schema $id: http://devicetree.org/schemas/spi/mediatek,spi-mtk-nor.yaml
--
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-rusty-sku196608.dtb: spi@11000000 (mediatek,mt8186-nor): clock-names: ['spi', 'sf', 'axi', 'axi_s'] is too long
   	from schema $id: http://devicetree.org/schemas/spi/mediatek,spi-mtk-nor.yaml
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-rusty-sku196608.dtb: spi@11000000 (mediatek,mt8186-nor): Unevaluated properties are not allowed ('clock-names' was unexpected)
   	from schema $id: http://devicetree.org/schemas/spi/mediatek,spi-mtk-nor.yaml
   arch/arm64/boot/dts/mediatek/mt8186-corsola-rusty-sku196608.dtb: sound (mediatek,mt8186-mt6366-rt1019-rt5682s-sound): 'model' is a required property
   	from schema $id: http://devicetree.org/schemas/sound/mt8186-mt6366-rt1019-rt5682s.yaml
--
   arch/arm64/boot/dts/mediatek/mt8186-corsola-squirtle.dtb: spmi@10015000 (mediatek,mt8186-spmi): Unevaluated properties are not allowed ('interrupts' was unexpected)
   	from schema $id: http://devicetree.org/schemas/spmi/mtk,spmi-mtk-pmif.yaml
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-squirtle.dtb: spi@11000000 (mediatek,mt8186-nor): clock-names: ['spi', 'sf', 'axi', 'axi_s'] is too long
   	from schema $id: http://devicetree.org/schemas/spi/mediatek,spi-mtk-nor.yaml
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-squirtle.dtb: spi@11000000 (mediatek,mt8186-nor): Unevaluated properties are not allowed ('clock-names' was unexpected)
   	from schema $id: http://devicetree.org/schemas/spi/mediatek,spi-mtk-nor.yaml
--
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-starmie-sku0.dtb: spi@11000000 (mediatek,mt8186-nor): clock-names: ['spi', 'sf', 'axi', 'axi_s'] is too long
   	from schema $id: http://devicetree.org/schemas/spi/mediatek,spi-mtk-nor.yaml
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-starmie-sku0.dtb: spi@11000000 (mediatek,mt8186-nor): Unevaluated properties are not allowed ('clock-names' was unexpected)
   	from schema $id: http://devicetree.org/schemas/spi/mediatek,spi-mtk-nor.yaml
   arch/arm64/boot/dts/mediatek/mt8186-corsola-starmie-sku0.dtb: sound (mediatek,mt8186-mt6366-rt1019-rt5682s-sound): 'model' is a required property
   	from schema $id: http://devicetree.org/schemas/sound/mt8186-mt6366-rt1019-rt5682s.yaml
--
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-starmie-sku1.dtb: spi@11000000 (mediatek,mt8186-nor): clock-names: ['spi', 'sf', 'axi', 'axi_s'] is too long
   	from schema $id: http://devicetree.org/schemas/spi/mediatek,spi-mtk-nor.yaml
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-starmie-sku1.dtb: spi@11000000 (mediatek,mt8186-nor): Unevaluated properties are not allowed ('clock-names' was unexpected)
   	from schema $id: http://devicetree.org/schemas/spi/mediatek,spi-mtk-nor.yaml
   arch/arm64/boot/dts/mediatek/mt8186-corsola-starmie-sku1.dtb: sound (mediatek,mt8186-mt6366-rt1019-rt5682s-sound): 'model' is a required property
   	from schema $id: http://devicetree.org/schemas/sound/mt8186-mt6366-rt1019-rt5682s.yaml
--
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-steelix-sku131072.dtb: spi@11000000 (mediatek,mt8186-nor): clock-names: ['spi', 'sf', 'axi', 'axi_s'] is too long
   	from schema $id: http://devicetree.org/schemas/spi/mediatek,spi-mtk-nor.yaml
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-steelix-sku131072.dtb: spi@11000000 (mediatek,mt8186-nor): Unevaluated properties are not allowed ('clock-names' was unexpected)
   	from schema $id: http://devicetree.org/schemas/spi/mediatek,spi-mtk-nor.yaml
   arch/arm64/boot/dts/mediatek/mt8186-corsola-steelix-sku131072.dtb: sound (mediatek,mt8186-mt6366-rt1019-rt5682s-sound): 'model' is a required property
   	from schema $id: http://devicetree.org/schemas/sound/mt8186-mt6366-rt1019-rt5682s.yaml
--
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-steelix-sku131073.dtb: spi@11000000 (mediatek,mt8186-nor): clock-names: ['spi', 'sf', 'axi', 'axi_s'] is too long
   	from schema $id: http://devicetree.org/schemas/spi/mediatek,spi-mtk-nor.yaml
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-steelix-sku131073.dtb: spi@11000000 (mediatek,mt8186-nor): Unevaluated properties are not allowed ('clock-names' was unexpected)
   	from schema $id: http://devicetree.org/schemas/spi/mediatek,spi-mtk-nor.yaml
   arch/arm64/boot/dts/mediatek/mt8186-corsola-steelix-sku131073.dtb: sound (mediatek,mt8186-mt6366-rt1019-rt5682s-sound): 'model' is a required property
   	from schema $id: http://devicetree.org/schemas/sound/mt8186-mt6366-rt1019-rt5682s.yaml
--
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-tentacool-sku327681.dtb: spi@11000000 (mediatek,mt8186-nor): clock-names: ['spi', 'sf', 'axi', 'axi_s'] is too long
   	from schema $id: http://devicetree.org/schemas/spi/mediatek,spi-mtk-nor.yaml
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-tentacool-sku327681.dtb: spi@11000000 (mediatek,mt8186-nor): Unevaluated properties are not allowed ('clock-names' was unexpected)
   	from schema $id: http://devicetree.org/schemas/spi/mediatek,spi-mtk-nor.yaml
   arch/arm64/boot/dts/mediatek/mt8186-corsola-tentacool-sku327681.dtb: sound (mediatek,mt8186-mt6366-rt1019-rt5682s-sound): 'model' is a required property
   	from schema $id: http://devicetree.org/schemas/sound/mt8186-mt6366-rt1019-rt5682s.yaml
--
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-tentacool-sku327683.dtb: spi@11000000 (mediatek,mt8186-nor): clock-names: ['spi', 'sf', 'axi', 'axi_s'] is too long
   	from schema $id: http://devicetree.org/schemas/spi/mediatek,spi-mtk-nor.yaml
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-tentacool-sku327683.dtb: spi@11000000 (mediatek,mt8186-nor): Unevaluated properties are not allowed ('clock-names' was unexpected)
   	from schema $id: http://devicetree.org/schemas/spi/mediatek,spi-mtk-nor.yaml
   arch/arm64/boot/dts/mediatek/mt8186-corsola-tentacool-sku327683.dtb: sound (mediatek,mt8186-mt6366-rt1019-rt5682s-sound): 'model' is a required property
   	from schema $id: http://devicetree.org/schemas/sound/mt8186-mt6366-rt1019-rt5682s.yaml
--
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-tentacruel-sku262144.dtb: spi@11000000 (mediatek,mt8186-nor): clock-names: ['spi', 'sf', 'axi', 'axi_s'] is too long
   	from schema $id: http://devicetree.org/schemas/spi/mediatek,spi-mtk-nor.yaml
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-tentacruel-sku262144.dtb: spi@11000000 (mediatek,mt8186-nor): Unevaluated properties are not allowed ('clock-names' was unexpected)
   	from schema $id: http://devicetree.org/schemas/spi/mediatek,spi-mtk-nor.yaml
   arch/arm64/boot/dts/mediatek/mt8186-corsola-tentacruel-sku262144.dtb: sound (mediatek,mt8186-mt6366-rt1019-rt5682s-sound): 'model' is a required property
   	from schema $id: http://devicetree.org/schemas/sound/mt8186-mt6366-rt1019-rt5682s.yaml
--
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-tentacruel-sku262148.dtb: spi@11000000 (mediatek,mt8186-nor): clock-names: ['spi', 'sf', 'axi', 'axi_s'] is too long
   	from schema $id: http://devicetree.org/schemas/spi/mediatek,spi-mtk-nor.yaml
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-tentacruel-sku262148.dtb: spi@11000000 (mediatek,mt8186-nor): Unevaluated properties are not allowed ('clock-names' was unexpected)
   	from schema $id: http://devicetree.org/schemas/spi/mediatek,spi-mtk-nor.yaml
   arch/arm64/boot/dts/mediatek/mt8186-corsola-tentacruel-sku262148.dtb: sound (mediatek,mt8186-mt6366-rt1019-rt5682s-sound): 'model' is a required property
   	from schema $id: http://devicetree.org/schemas/sound/mt8186-mt6366-rt1019-rt5682s.yaml
--
   arch/arm64/boot/dts/mediatek/mt8186-corsola-voltorb.dtb: spmi@10015000 (mediatek,mt8186-spmi): Unevaluated properties are not allowed ('interrupts' was unexpected)
   	from schema $id: http://devicetree.org/schemas/spmi/mtk,spmi-mtk-pmif.yaml
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-voltorb.dtb: spi@11000000 (mediatek,mt8186-nor): clock-names: ['spi', 'sf', 'axi', 'axi_s'] is too long
   	from schema $id: http://devicetree.org/schemas/spi/mediatek,spi-mtk-nor.yaml
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-voltorb.dtb: spi@11000000 (mediatek,mt8186-nor): Unevaluated properties are not allowed ('clock-names' was unexpected)
   	from schema $id: http://devicetree.org/schemas/spi/mediatek,spi-mtk-nor.yaml
   arch/arm64/boot/dts/mediatek/mt8186-corsola-voltorb.dtb: sound (mediatek,mt8186-mt6366-rt5682s-max98360-sound): 'model' is a required property
   	from schema $id: http://devicetree.org/schemas/sound/mt8186-mt6366-rt1019-rt5682s.yaml
--
>> arch/arm64/boot/dts/mediatek/mt8186-evb.dtb: spi@11000000 (mediatek,mt8186-nor): clock-names: ['spi', 'sf', 'axi', 'axi_s'] is too long
   	from schema $id: http://devicetree.org/schemas/spi/mediatek,spi-mtk-nor.yaml

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
