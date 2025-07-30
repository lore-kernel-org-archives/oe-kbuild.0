Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 103011DFD96
	for <oe-kbuild@lists.linux.dev>; Wed, 30 Jul 2025 16:28:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753892930; cv=none; b=Mmr9fSHsoag8bTJ/HKHrNx9yYWh8SNBva5HLTAM7/dPMJTZb18Ndh5y5h4cWIKk2FvbIWpk/IM+1zxP82tu88kNy3rSL+tWNunQnke8AQiuEXI+HlqayXIeSp2Qj0NA9Opj5SM1cw3N7Cnfgdsq7I7R0RON/Xx0/VA/aHLl2rJw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753892930; c=relaxed/simple;
	bh=Q3dhbTEF4gZNO3s0exwfkt6kZ7kUglm/tEHW79NU8uY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Ft23BV0VaC+pQlfy1khgnZyT5SoHjA6F6Fwj3/6C5OARZLwyyIfzQG80qBOSJ8UHJOU1Dt/eths8yPVEDUDkfXnpTHQdDLn59jCJTUIM00LAYTiOtXkUrOQlduxPpGw5L/Kbu9e7JQAnzi45lWj1LXUuMa8oIoXcQQ6MbE3hZo4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HE7m9uZH; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HE7m9uZH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753892928; x=1785428928;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Q3dhbTEF4gZNO3s0exwfkt6kZ7kUglm/tEHW79NU8uY=;
  b=HE7m9uZHXsxXNxTyNoyC8BmrmbpjCVIdL1cFO6UEwA+TrQDsejS2G0dn
   kPsVDMovXEc+m8A0ZGO9Yag65Wr8LBiJzmlzLnPDVzBcZGOrhgToH/V9Q
   njJLscjP8G1eILJmC3AV7VhsbR3h2WN3jFdskT7Ed36W9ca0748wMCgAe
   aEMOqHS8dUBUSInDjZ5OeU4OZEUHelRDQvLNqrj+S3bOxBuuAU4AI9O1l
   Fc0488Q0vcOUTySckvFcZL4WprCUc1xuIZfM9DmXn+ySs8ymXxg7Ui4L5
   SXgayWDZVVb7kAgRZoYv+vXZaJYAhCsyeUBfIZzDuvC+8Ipd+wpIs3Ctr
   g==;
X-CSE-ConnectionGUID: dQeL5MKoQXq3xYogbcxM/Q==
X-CSE-MsgGUID: 624rrP+0T1KERn2ulzunjw==
X-IronPort-AV: E=McAfee;i="6800,10657,11507"; a="56167933"
X-IronPort-AV: E=Sophos;i="6.16,350,1744095600"; 
   d="scan'208";a="56167933"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jul 2025 09:28:48 -0700
X-CSE-ConnectionGUID: q2dyq1S1TtODKlsXNvRgQA==
X-CSE-MsgGUID: V9PAQgUbTrSwe1gpoyz02Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,350,1744095600"; 
   d="scan'208";a="194007912"
Received: from lkp-server01.sh.intel.com (HELO 160750d4a34c) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 30 Jul 2025 09:28:47 -0700
Received: from kbuild by 160750d4a34c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uh9fX-0002w0-3B;
	Wed, 30 Jul 2025 16:28:43 +0000
Date: Thu, 31 Jul 2025 00:27:47 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH 16/38] arm64: dts: mediatek: mt6331: Fix pmic,
 regulators, rtc, keys node names
Message-ID: <202507310007.iKZbHGT6-lkp@intel.com>
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
In-Reply-To: <20250724083914.61351-17-angelogioacchino.delregno@collabora.com>
References: <20250724083914.61351-17-angelogioacchino.delregno@collabora.com>
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
[also build test WARNING on linusw-pinctrl/devel linusw-pinctrl/for-next broonie-regulator/for-next v6.16]
[cannot apply to linus/master next-20250730]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/AngeloGioacchino-Del-Regno/dt-bindings-display-mediatek-dpi-Allow-specifying-resets/20250724-164429
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20250724083914.61351-17-angelogioacchino.delregno%40collabora.com
patch subject: [PATCH 16/38] arm64: dts: mediatek: mt6331: Fix pmic, regulators, rtc, keys node names
:::::: branch date: 6 days ago
:::::: commit date: 6 days ago
config: arm64-randconfig-051-20250728 (https://download.01.org/0day-ci/archive/20250731/202507310007.iKZbHGT6-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
dtschema version: 2025.6.2.dev4+g8f79ddd
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250731/202507310007.iKZbHGT6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202507310007.iKZbHGT6-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/mediatek/mt6795-sony-xperia-m5.dtb: syscon@10006000 (syscon): compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
>> arch/arm64/boot/dts/mediatek/mt6795-sony-xperia-m5.dtb: pmic (mediatek,mt6331): 'mt6332-led' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml#
>> arch/arm64/boot/dts/mediatek/mt6795-sony-xperia-m5.dtb: pmic (mediatek,mt6331): regulators:compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt6331-regulator'] is too short
   	'mediatek,mt6331-regulator' is not one of ['mediatek,mt6323-regulator', 'mediatek,mt6328-regulator', 'mediatek,mt6358-regulator', 'mediatek,mt6359-regulator', 'mediatek,mt6397-regulator']
   	'mediatek,mt6331-regulator' is not one of ['mediatek,mt6366-regulator']
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml#
>> arch/arm64/boot/dts/mediatek/mt6795-sony-xperia-m5.dtb: regulators (mediatek,mt6331-regulator): 'ldo-vio28' does not match any of the regexes: '^buck-v(core2|io18|dvfs11|dvfs12|dvfs13|dvfs14)$', '^ldo-(avdd32aud|vauxa32)$', '^ldo-v(dig18|emc33|ibr|mc|mch|mipi|rtc|sim1|sim2|sram|usb10)$', '^ldo-vcam(a|af|d|io)$', '^ldo-vgp[1234]$', '^ldo-vtcxo[12]$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/regulator/mediatek,mt6331-regulator.yaml#
>> arch/arm64/boot/dts/mediatek/mt6795-sony-xperia-m5.dtb: regulators (mediatek,mt6331-regulator): ldo-vcamio:regulator-name:0: 'vcam_io' does not match '^vcam(a|_af|d|io)$'
   	from schema $id: http://devicetree.org/schemas/regulator/mediatek,mt6331-regulator.yaml#
   arch/arm64/boot/dts/mediatek/mt6795-sony-xperia-m5.dtb: intpol-controller@10200620 (mediatek,mt6795-sysirq): $nodename:0: 'intpol-controller@10200620' does not match '^interrupt-controller(@[0-9a-f,]+)*$'
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/mediatek,mt6577-sysirq.yaml#
   arch/arm64/boot/dts/mediatek/mt6795-sony-xperia-m5.dtb: iommu@10205000 (mediatek,mt6795-m4u): 'mediatek,infracfg' is a required property
   	from schema $id: http://devicetree.org/schemas/iommu/mediatek,iommu.yaml#
   arch/arm64/boot/dts/mediatek/mt6795-sony-xperia-m5.dtb: mmc@11230000 (mediatek,mt6795-mmc): mediatek,latch-ck: 20 is greater than the maximum of 7
   	from schema $id: http://devicetree.org/schemas/mmc/mtk-sd.yaml#
   arch/arm64/boot/dts/mediatek/mt6795-sony-xperia-m5.dtb: mmc@11230000 (mediatek,mt6795-mmc): Unevaluated properties are not allowed ('mediatek,latch-ck' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mmc/mtk-sd.yaml#
   arch/arm64/boot/dts/mediatek/mt6795-sony-xperia-m5.dtb: mmc@11240000 (mediatek,mt6795-mmc): 'pinctrl-names' is a required property

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
