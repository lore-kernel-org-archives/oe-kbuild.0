Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4220819ABAC
	for <oe-kbuild@lists.linux.dev>; Sun,  3 Aug 2025 19:45:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754250314; cv=none; b=efNQpszh0gdI9dk48tjhG9WAeHGDvwZBbGufe/vHVyV3ANPqGIhJGM5Zz4rQaqNcodRPS22JYUTXgJrzj7MY+AApc+iPhMkpvMN/kAI24NK3kwPFAi2VuNwScGPEUljq6s6sgKc3fp4v5R+ojUpn7T8vKzSut+pSHOQt26xNkRg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754250314; c=relaxed/simple;
	bh=xnKw224OIvFQuTkdRPZ5FCHV2Fo7PLQ4XKlM3urN8GU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Uz7O2d+xi5pF/3Lo54pX6yaZw9BsKOHjdd8k9LqUaKfqE7rOILMEM73EfZ5Dipft0OY7WXFJmIny3FpLET2JmSdxxEONCMdhB54kKa9YOneNXrOJ+JCdaqulBcu8zgtZjw64u/duEZhXPvZYaH6+pbEifn0pCDEJT++FJHdycis=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=C9dKrn0a; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="C9dKrn0a"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754250312; x=1785786312;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xnKw224OIvFQuTkdRPZ5FCHV2Fo7PLQ4XKlM3urN8GU=;
  b=C9dKrn0a7XcAETrzMFFLS6TDgFdflhW4s7f8ohZiv2Kzsx0UDrU7OZPm
   g9vrQeLnoCox4UVDCwEa4y/NA1wI6gEsgA4j6ARlsl3Bv+McfTpR7oo+S
   4bPFu1GBC4pUtUOWUrMmCNI3Ju7yy1Zvv3udGpXp76jt4b0IqzCCfVlTK
   o1f0ODs6NjsAjxpL5+1DGlNS9yb0oALDSC9ngxxZloL/g++SFHCXPkma1
   LhdWw5DGEV4GlDMKChjx9FU9jW4RjAGXlFugejucLPhT2Eylb1mUtE7US
   8wxMGXyy8K59A7C/Q7M/FqzNwPhuoUBsRS1MZ105VxBeVZ5ai7FHouzDJ
   g==;
X-CSE-ConnectionGUID: RQw0Kg10TVm17Y7bYRNsjw==
X-CSE-MsgGUID: QRZthiocSAqUftPOCa6zkQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11511"; a="60344471"
X-IronPort-AV: E=Sophos;i="6.17,258,1747724400"; 
   d="scan'208";a="60344471"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Aug 2025 12:45:12 -0700
X-CSE-ConnectionGUID: DY04KaI4RkyuBr18RUc0FA==
X-CSE-MsgGUID: dKtNO6H6TLK5r7pTHZnHrg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,258,1747724400"; 
   d="scan'208";a="163991138"
Received: from lkp-server01.sh.intel.com (HELO 160750d4a34c) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 03 Aug 2025 12:45:11 -0700
Received: from kbuild by 160750d4a34c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uiedo-0006c4-2G;
	Sun, 03 Aug 2025 19:45:08 +0000
Date: Mon, 4 Aug 2025 03:44:18 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH 21/38] arm64: dts: mediatek: mt6795-sony-xperia-m5: Add
 pinctrl for mmc1/mmc2
Message-ID: <202508040342.W50ic3Gy-lkp@intel.com>
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
[also build test WARNING on linusw-pinctrl/devel linusw-pinctrl/for-next broonie-regulator/for-next v6.16]
[cannot apply to linus/master next-20250801]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/AngeloGioacchino-Del-Regno/dt-bindings-display-mediatek-dpi-Allow-specifying-resets/20250724-164429
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20250724083914.61351-22-angelogioacchino.delregno%40collabora.com
patch subject: [PATCH 21/38] arm64: dts: mediatek: mt6795-sony-xperia-m5: Add pinctrl for mmc1/mmc2
:::::: branch date: 10 days ago
:::::: commit date: 10 days ago
config: arm64-randconfig-051-20250728 (https://download.01.org/0day-ci/archive/20250804/202508040342.W50ic3Gy-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
dtschema version: 2025.6.2.dev4+g8f79ddd
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250804/202508040342.W50ic3Gy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202508040342.W50ic3Gy-lkp@intel.com/

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
