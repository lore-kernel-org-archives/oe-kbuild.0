Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C56AE22539D
	for <oe-kbuild@lists.linux.dev>; Tue, 29 Jul 2025 21:43:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753825394; cv=none; b=cUlfoDhtFtKSSNLqGL6qvoQ9TWD8aL6dgXYKwTl3KSCzM9PTpHtIjXiDxR2b5XaQTrdhxPeS3d4Ej+YJzJDKcu0iGc9P5fTYDIuus2XaePutiyXqUPFIkik1+uspzCsvJLRS576AvG5BMc6Ya8dx2rDx07FmVyRlkt0br4m6YxE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753825394; c=relaxed/simple;
	bh=sTQc3R5qP8+B54MBaHzERow8N9XF/mqPUPb9YSuVxLo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=nfOWAjgDrEKTrk14Pp5sD0arTOfZmhWJHqHT7Q1vh9bGR6mN9DcCJr7JmX+DLWG1hC1sqqUYhJI8Ml+oYY6BvF9O5Umd3Ia5JTm7TNbe/jmt5zt3onHyKmH5cVpk3/k7VKx+Hysw3Yu3nrYQSz12h8J/PNztGFyeNQPNl3yk3B4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gvFMC+9M; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gvFMC+9M"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753825392; x=1785361392;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=sTQc3R5qP8+B54MBaHzERow8N9XF/mqPUPb9YSuVxLo=;
  b=gvFMC+9MAr13eU0QIf2sZKUw20iv4XvjducbIjB2SqMkPi62RcMjojw8
   zRyS52lUombtPkG6BXfsCvh9eHqAJybAFdD1IH/V5Ud6+xRV7cdvcd+wy
   f15gwD1d8mpV/7DTeaEg4NRFKJ3r33C5nGTm9NDdt++CufsinPvQ4N07z
   GjH2WgU4KUAAzAWaSaJ24bxqe2VbZR75ewWVNfD/vGD4x/0qvLsGv/CsF
   JKKbFRjxcfbvP2/JOl6hJDwp9zcXi8fF/zqBlA4o8/ha0jCys865MbXcQ
   YqLGP7o87kD3jTXXtPQxP5PsP0O7kFx1yqw9CO7RTReghVPh9ZKN3ebLL
   A==;
X-CSE-ConnectionGUID: chnEbEMtRLGPiRwIxw/HoQ==
X-CSE-MsgGUID: tnWKZ3pJQCG855WuOOgTgg==
X-IronPort-AV: E=McAfee;i="6800,10657,11506"; a="81555810"
X-IronPort-AV: E=Sophos;i="6.16,350,1744095600"; 
   d="scan'208";a="81555810"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jul 2025 14:43:12 -0700
X-CSE-ConnectionGUID: JH+yEb6KSjmvLpMDObY/qg==
X-CSE-MsgGUID: a3zQZ4U0TryS/33HGa4J9w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,350,1744095600"; 
   d="scan'208";a="163591729"
Received: from lkp-server01.sh.intel.com (HELO 160750d4a34c) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 29 Jul 2025 14:43:11 -0700
Received: from kbuild by 160750d4a34c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ugs6H-0001id-0n;
	Tue, 29 Jul 2025 21:43:09 +0000
Date: Wed, 30 Jul 2025 05:43:08 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH 21/38] arm64: dts: mediatek: mt6795-sony-xperia-m5: Add
 pinctrl for mmc1/mmc2
Message-ID: <202507300521.1o42XBQk-lkp@intel.com>
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
In-Reply-To: <20250724083914.61351-22-angelogioacchino.delregno@collabora.com>
References: <20250724083914.61351-22-angelogioacchino.delregno@collabora.com>
TO: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
TO: linux-mediatek@lists.infradead.org
TO: robh@kernel.org
CC: herbert@gondor.apana.org.au
CC: davem@davemloft.net
CC: krzk+dt@kernel.org
CC: conor+dt@kernel.org
CC: chunkuang.hu@kernel.org
CC: p.zabel@pengutronix.de
CC: airlied@gmail.com
CC: simona@ffwll.ch
CC: maarten.lankhorst@linux.intel.com
CC: mripard@kernel.org
CC: tzimmermann@suse.de
CC: jassisinghbrar@gmail.com
CC: mchehab@kernel.org
CC: matthias.bgg@gmail.com
CC: angelogioacchino.delregno@collabora.com
CC: chunfeng.yun@mediatek.com
CC: vkoul@kernel.org
CC: kishon@kernel.org
CC: sean.wang@kernel.org
CC: linus.walleij@linaro.org
CC: lgirdwood@gmail.com
CC: broonie@kernel.org
CC: andersson@kernel.org
CC: mathieu.poirier@linaro.org
CC: daniel.lezcano@linaro.org
CC: tglx@linutronix.de
CC: atenart@kernel.org
CC: jitao.shi@mediatek.com

Hi AngeloGioacchino,

kernel test robot noticed the following build warnings:

[auto build test WARNING on robh/for-next]
[also build test WARNING on linusw-pinctrl/devel linusw-pinctrl/for-next broonie-regulator/for-next linus/master v6.16]
[cannot apply to next-20250729]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/AngeloGioacchino-Del-Regno/dt-bindings-display-mediatek-dpi-Allow-specifying-resets/20250724-164429
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20250724083914.61351-22-angelogioacchino.delregno%40collabora.com
patch subject: [PATCH 21/38] arm64: dts: mediatek: mt6795-sony-xperia-m5: Add pinctrl for mmc1/mmc2
:::::: branch date: 6 days ago
:::::: commit date: 6 days ago
config: arm64-randconfig-051-20250728 (https://download.01.org/0day-ci/archive/20250730/202507300521.1o42XBQk-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
dtschema version: 2025.6.2.dev4+g8f79ddd
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250730/202507300521.1o42XBQk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202507300521.1o42XBQk-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   	['mediatek,mt6331-regulator'] is too short
   	'mediatek,mt6331-regulator' is not one of ['mediatek,mt6323-regulator', 'mediatek,mt6328-regulator', 'mediatek,mt6358-regulator', 'mediatek,mt6359-regulator', 'mediatek,mt6397-regulator']
   	'mediatek,mt6331-regulator' is not one of ['mediatek,mt6366-regulator']
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml#
   arch/arm64/boot/dts/mediatek/mt6795-sony-xperia-m5.dtb: regulators (mediatek,mt6331-regulator): 'ldo-vio28' does not match any of the regexes: '^buck-v(core2|io18|dvfs11|dvfs12|dvfs13|dvfs14)$', '^ldo-(avdd32aud|vauxa32)$', '^ldo-v(dig18|emc33|ibr|mc|mch|mipi|rtc|sim1|sim2|sram|usb10)$', '^ldo-vcam(a|af|d|io)$', '^ldo-vgp[1234]$', '^ldo-vtcxo[12]$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/regulator/mediatek,mt6331-regulator.yaml#
   arch/arm64/boot/dts/mediatek/mt6795-sony-xperia-m5.dtb: regulators (mediatek,mt6331-regulator): ldo-vcamio:regulator-name:0: 'vcam_io' does not match '^vcam(a|_af|d|io)$'
   	from schema $id: http://devicetree.org/schemas/regulator/mediatek,mt6331-regulator.yaml#
   arch/arm64/boot/dts/mediatek/mt6795-sony-xperia-m5.dtb: intpol-controller@10200620 (mediatek,mt6795-sysirq): $nodename:0: 'intpol-controller@10200620' does not match '^interrupt-controller(@[0-9a-f,]+)*$'
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/mediatek,mt6577-sysirq.yaml#
>> arch/arm64/boot/dts/mediatek/mt6795-sony-xperia-m5.dtb: mmc@11240000 (mediatek,mt6795-mmc): pinctrl-names: ['default'] is too short
   	from schema $id: http://devicetree.org/schemas/mmc/mtk-sd.yaml#
   arch/arm64/boot/dts/mediatek/mt6795-sony-xperia-m5.dtb: mmc@11240000 (mediatek,mt6795-mmc): 'pinctrl-1' is a required property
   	from schema $id: http://devicetree.org/schemas/mmc/mtk-sd.yaml#
>> arch/arm64/boot/dts/mediatek/mt6795-sony-xperia-m5.dtb: mmc@11240000 (mediatek,mt6795-mmc): Unevaluated properties are not allowed ('pinctrl-names' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mmc/mtk-sd.yaml#
   arch/arm64/boot/dts/mediatek/mt6795-sony-xperia-m5.dtb: mmc@11250000 (mediatek,mt6795-mmc): pinctrl-names: ['default'] is too short
   	from schema $id: http://devicetree.org/schemas/mmc/mtk-sd.yaml#
   arch/arm64/boot/dts/mediatek/mt6795-sony-xperia-m5.dtb: mmc@11250000 (mediatek,mt6795-mmc): 'pinctrl-1' is a required property
   	from schema $id: http://devicetree.org/schemas/mmc/mtk-sd.yaml#
   arch/arm64/boot/dts/mediatek/mt6795-sony-xperia-m5.dtb: mmc@11250000 (mediatek,mt6795-mmc): Unevaluated properties are not allowed ('pinctrl-names' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mmc/mtk-sd.yaml#
   arch/arm64/boot/dts/mediatek/mt6795-sony-xperia-m5.dtb: syscon@14000000 (mediatek,mt6795-mmsys): 'assigned-clock-rates', 'assigned-clocks' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/arm/mediatek/mediatek,mmsys.yaml#
   arch/arm64/boot/dts/mediatek/mt6795-sony-xperia-m5.dtb: ufoe@1401a000 (mediatek,mt6795-disp-ufoe): 'mediatek,gce-client-reg' does not match any of the regexes: '^pinctrl-[0-9]+$'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
