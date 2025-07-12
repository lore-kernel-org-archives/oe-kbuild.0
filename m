Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93F69275B12
	for <oe-kbuild@lists.linux.dev>; Sat, 12 Jul 2025 16:33:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752337982; cv=none; b=U3WZIzuoFhfS5VlbEVtcZetgS+xpZSO3w1BunrQ+bNeB4pC+ENkVSN9+77JqMlRLk44/0S4EGJINeYZT0YyZICUlpjiWDO+ntFT32oGwIm8yoN6uDx0Jt1aE7S6Ms8IgaR1rn+p8hzoosC6cjRXpOJfPJ+UTDz36eZ/Z4JGEiVs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752337982; c=relaxed/simple;
	bh=pEb3M709sn0VRR518FGlbDJ06sOB3bEEcfLOzPXaBi4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=FGFPMuuP+sOGz2TVMywfw1Vc+U739dKMzQ/AsjH8TTBVrosZrCJAEqiQNG1OOZLO+TM+5PDOUJqgahi+/dDcsNl1e+07AuzFEo6T30h4FyfuP4pbdVmEWods4kNkp8gFXgWhVr9ILNj91rQI59aP81VsTPBtyjIJiGU3MkK/kGc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KS9pk/tz; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KS9pk/tz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752337980; x=1783873980;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=pEb3M709sn0VRR518FGlbDJ06sOB3bEEcfLOzPXaBi4=;
  b=KS9pk/tzrM3kAW+b/JG5b5qL8+HYDrut3xOy+sOXVSUn7hgkPDTeslaK
   dVKLyOC3cvin+iaWpEu5FMfplxeHGZdvFli9rIz4W5SCB8nRZN0elkUHd
   LUfcKeT/a2vs+uBSJEks42KxYcv3vmkaSe4+cRXcmM6Q3tO59oF4qyZDp
   RKmcneVki1m45fm9QeYcDz3/7Jm/kJrm2LyL+YAI2tvM1WoJEeJ9laXOX
   0AQi3r6qjkm4gGKYWi3a12o46t1kURvy4+JqmaNOmoYJTX/UsXeY/zo1G
   Q/+cGW7Z5FPzRj/FM1bLpCRkLxZqfCbSY2yP/LmfyInnzh1UwyPRg00jW
   A==;
X-CSE-ConnectionGUID: Ii72IymBQ42JresO1adz5g==
X-CSE-MsgGUID: nyOPTDTDQAS0u3Glzi5pvA==
X-IronPort-AV: E=McAfee;i="6800,10657,11491"; a="65179277"
X-IronPort-AV: E=Sophos;i="6.16,306,1744095600"; 
   d="scan'208";a="65179277"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jul 2025 09:32:59 -0700
X-CSE-ConnectionGUID: 3hVo5nt0RWK1UogUS3i1ag==
X-CSE-MsgGUID: qjY1eA5MShGzMs9J+9a13w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,306,1744095600"; 
   d="scan'208";a="162167157"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 12 Jul 2025 09:32:58 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uad9k-0007UZ-23;
	Sat, 12 Jul 2025 16:32:56 +0000
Date: Sun, 13 Jul 2025 00:32:15 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v3 2/3] dt-bindings: thermal: mediatek: add falback
 compatible string for MT7981 and MT8516
Message-ID: <202507130002.L4DiUzEy-lkp@intel.com>
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
In-Reply-To: <20250708220405.1072393-3-olek2@wp.pl>
References: <20250708220405.1072393-3-olek2@wp.pl>
TO: Aleksander Jan Bajkowski <olek2@wp.pl>
TO: rafael@kernel.org
TO: daniel.lezcano@linaro.org
TO: rui.zhang@intel.com
TO: lukasz.luba@arm.com
TO: jic23@kernel.org
TO: dlechner@baylibre.com
TO: nuno.sa@analog.com
TO: andy@kernel.org
TO: robh@kernel.org
TO: krzk+dt@kernel.org
TO: conor+dt@kernel.org
TO: matthias.bgg@gmail.com
TO: angelogioacchino.delregno@collabora.com
TO: s.hauer@pengutronix.de
TO: olek2@wp.pl
TO: zhiyong.tao@mediatek.com
TO: linux-pm@vger.kernel.org
TO: linux-iio@vger.kernel.org
TO: devicetree@vger.kernel.org
TO: linux-kernel@vger.kernel.org
TO: linux-arm-kernel@lists.infradead.org
TO: linux-mediatek@lists.infradead.org

Hi Aleksander,

kernel test robot noticed the following build warnings:

[auto build test WARNING on jic23-iio/togreg]
[also build test WARNING on rafael-pm/thermal robh/for-next linus/master v6.16-rc5 next-20250711]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Aleksander-Jan-Bajkowski/dt-bindings-iio-adc-Add-support-for-MT7981/20250709-060616
base:   https://git.kernel.org/pub/scm/linux/kernel/git/jic23/iio.git togreg
patch link:    https://lore.kernel.org/r/20250708220405.1072393-3-olek2%40wp.pl
patch subject: [PATCH v3 2/3] dt-bindings: thermal: mediatek: add falback compatible string for MT7981 and MT8516
:::::: branch date: 4 days ago
:::::: commit date: 4 days ago
config: arm-randconfig-053-20250709 (https://download.01.org/0day-ci/archive/20250713/202507130002.L4DiUzEy-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project 01c97b4953e87ae455bd4c41e3de3f0f0f29c61c)
dtschema version: 2025.6.2.dev4+g8f79ddd
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250713/202507130002.L4DiUzEy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202507130002.L4DiUzEy-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   	'mediatek,mt7623-spi' is not one of ['mediatek,mt7981-spi-ipm', 'mediatek,mt7986-spi-ipm', 'mediatek,mt7988-spi-quad', 'mediatek,mt7988-spi-single', 'mediatek,mt8188-spi-ipm']
   	'mediatek,mt7623-spi' is not one of ['mediatek,mt2701-spi', 'mediatek,mt2712-spi', 'mediatek,mt6589-spi', 'mediatek,mt6765-spi', 'mediatek,mt6893-spi', 'mediatek,mt7622-spi', 'mediatek,mt8135-spi', 'mediatek,mt8173-spi', 'mediatek,mt8183-spi']
   	'mediatek,mt7622-spi' was expected
   	'mediatek,mt2712-spi' was expected
   	'mediatek,mt6765-spi' was expected
   	'mediatek,spi-ipm' was expected
   	from schema $id: http://devicetree.org/schemas/spi/mediatek,spi-mt65xx.yaml#
   arch/arm/boot/dts/mediatek/mt7623a-rfb-emmc.dtb: spi@1100a000 (mediatek,mt7623-spi): Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/spi/mediatek,spi-mt65xx.yaml#
   arch/arm/boot/dts/mediatek/mt7623a-rfb-emmc.dtb: /spi@1100a000: failed to match any schema with compatible: ['mediatek,mt7623-spi', 'mediatek,mt2701-spi']
>> arch/arm/boot/dts/mediatek/mt7623a-rfb-emmc.dtb: thermal@1100b000 (mediatek,mt7623-thermal): compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt7623-thermal', 'mediatek,mt2701-thermal'] is too long
   	'mediatek,mt7623-thermal' is not one of ['mediatek,mt2701-thermal', 'mediatek,mt2712-thermal', 'mediatek,mt7622-thermal', 'mediatek,mt7986-thermal', 'mediatek,mt8173-thermal', 'mediatek,mt8183-thermal', 'mediatek,mt8365-thermal']
   	'mediatek,mt7623-thermal' is not one of ['mediatek,mt7981-thermal']
   	'mediatek,mt7623-thermal' is not one of ['mediatek,mt8516-thermal']
   	'mediatek,mt7986-thermal' was expected
   	from schema $id: http://devicetree.org/schemas/thermal/mediatek,thermal.yaml#
   arch/arm/boot/dts/mediatek/mt7623a-rfb-emmc.dtb: thermal@1100b000 (mediatek,mt7623-thermal): Unevaluated properties are not allowed ('compatible', 'reset-names' were unexpected)
   	from schema $id: http://devicetree.org/schemas/thermal/mediatek,thermal.yaml#
   arch/arm/boot/dts/mediatek/mt7623a-rfb-emmc.dtb: /thermal@1100b000: failed to match any schema with compatible: ['mediatek,mt7623-thermal', 'mediatek,mt2701-thermal']
   arch/arm/boot/dts/mediatek/mt7623a-rfb-emmc.dtb: serial@1100c000 (mediatek,mt7623-btif): clock-names:0: 'core' was expected
--
   	'mediatek,mt7623-spi' is not one of ['mediatek,mt7981-spi-ipm', 'mediatek,mt7986-spi-ipm', 'mediatek,mt7988-spi-quad', 'mediatek,mt7988-spi-single', 'mediatek,mt8188-spi-ipm']
   	'mediatek,mt7623-spi' is not one of ['mediatek,mt2701-spi', 'mediatek,mt2712-spi', 'mediatek,mt6589-spi', 'mediatek,mt6765-spi', 'mediatek,mt6893-spi', 'mediatek,mt7622-spi', 'mediatek,mt8135-spi', 'mediatek,mt8173-spi', 'mediatek,mt8183-spi']
   	'mediatek,mt7622-spi' was expected
   	'mediatek,mt2712-spi' was expected
   	'mediatek,mt6765-spi' was expected
   	'mediatek,spi-ipm' was expected
   	from schema $id: http://devicetree.org/schemas/spi/mediatek,spi-mt65xx.yaml#
   arch/arm/boot/dts/mediatek/mt7623a-rfb-nand.dtb: spi@1100a000 (mediatek,mt7623-spi): Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/spi/mediatek,spi-mt65xx.yaml#
   arch/arm/boot/dts/mediatek/mt7623a-rfb-nand.dtb: /spi@1100a000: failed to match any schema with compatible: ['mediatek,mt7623-spi', 'mediatek,mt2701-spi']
>> arch/arm/boot/dts/mediatek/mt7623a-rfb-nand.dtb: thermal@1100b000 (mediatek,mt7623-thermal): compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt7623-thermal', 'mediatek,mt2701-thermal'] is too long
   	'mediatek,mt7623-thermal' is not one of ['mediatek,mt2701-thermal', 'mediatek,mt2712-thermal', 'mediatek,mt7622-thermal', 'mediatek,mt7986-thermal', 'mediatek,mt8173-thermal', 'mediatek,mt8183-thermal', 'mediatek,mt8365-thermal']
   	'mediatek,mt7623-thermal' is not one of ['mediatek,mt7981-thermal']
   	'mediatek,mt7623-thermal' is not one of ['mediatek,mt8516-thermal']
   	'mediatek,mt7986-thermal' was expected
   	from schema $id: http://devicetree.org/schemas/thermal/mediatek,thermal.yaml#
   arch/arm/boot/dts/mediatek/mt7623a-rfb-nand.dtb: thermal@1100b000 (mediatek,mt7623-thermal): Unevaluated properties are not allowed ('compatible', 'reset-names' were unexpected)
   	from schema $id: http://devicetree.org/schemas/thermal/mediatek,thermal.yaml#
   arch/arm/boot/dts/mediatek/mt7623a-rfb-nand.dtb: /thermal@1100b000: failed to match any schema with compatible: ['mediatek,mt7623-thermal', 'mediatek,mt2701-thermal']
   arch/arm/boot/dts/mediatek/mt7623a-rfb-nand.dtb: serial@1100c000 (mediatek,mt7623-btif): clock-names:0: 'core' was expected
--
   	'mediatek,mt7623-spi' is not one of ['mediatek,mt7981-spi-ipm', 'mediatek,mt7986-spi-ipm', 'mediatek,mt7988-spi-quad', 'mediatek,mt7988-spi-single', 'mediatek,mt8188-spi-ipm']
   	'mediatek,mt7623-spi' is not one of ['mediatek,mt2701-spi', 'mediatek,mt2712-spi', 'mediatek,mt6589-spi', 'mediatek,mt6765-spi', 'mediatek,mt6893-spi', 'mediatek,mt7622-spi', 'mediatek,mt8135-spi', 'mediatek,mt8173-spi', 'mediatek,mt8183-spi']
   	'mediatek,mt7622-spi' was expected
   	'mediatek,mt2712-spi' was expected
   	'mediatek,mt6765-spi' was expected
   	'mediatek,spi-ipm' was expected
   	from schema $id: http://devicetree.org/schemas/spi/mediatek,spi-mt65xx.yaml#
   arch/arm/boot/dts/mediatek/mt7623n-rfb-emmc.dtb: spi@1100a000 (mediatek,mt7623-spi): Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/spi/mediatek,spi-mt65xx.yaml#
   arch/arm/boot/dts/mediatek/mt7623n-rfb-emmc.dtb: /spi@1100a000: failed to match any schema with compatible: ['mediatek,mt7623-spi', 'mediatek,mt2701-spi']
>> arch/arm/boot/dts/mediatek/mt7623n-rfb-emmc.dtb: thermal@1100b000 (mediatek,mt7623-thermal): compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt7623-thermal', 'mediatek,mt2701-thermal'] is too long
   	'mediatek,mt7623-thermal' is not one of ['mediatek,mt2701-thermal', 'mediatek,mt2712-thermal', 'mediatek,mt7622-thermal', 'mediatek,mt7986-thermal', 'mediatek,mt8173-thermal', 'mediatek,mt8183-thermal', 'mediatek,mt8365-thermal']
   	'mediatek,mt7623-thermal' is not one of ['mediatek,mt7981-thermal']
   	'mediatek,mt7623-thermal' is not one of ['mediatek,mt8516-thermal']
   	'mediatek,mt7986-thermal' was expected
   	from schema $id: http://devicetree.org/schemas/thermal/mediatek,thermal.yaml#
   arch/arm/boot/dts/mediatek/mt7623n-rfb-emmc.dtb: thermal@1100b000 (mediatek,mt7623-thermal): Unevaluated properties are not allowed ('compatible', 'reset-names' were unexpected)
   	from schema $id: http://devicetree.org/schemas/thermal/mediatek,thermal.yaml#
   arch/arm/boot/dts/mediatek/mt7623n-rfb-emmc.dtb: /thermal@1100b000: failed to match any schema with compatible: ['mediatek,mt7623-thermal', 'mediatek,mt2701-thermal']
   arch/arm/boot/dts/mediatek/mt7623n-rfb-emmc.dtb: serial@1100c000 (mediatek,mt7623-btif): clock-names:0: 'core' was expected
--
   	'mediatek,mt7623-spi' is not one of ['mediatek,mt7981-spi-ipm', 'mediatek,mt7986-spi-ipm', 'mediatek,mt7988-spi-quad', 'mediatek,mt7988-spi-single', 'mediatek,mt8188-spi-ipm']
   	'mediatek,mt7623-spi' is not one of ['mediatek,mt2701-spi', 'mediatek,mt2712-spi', 'mediatek,mt6589-spi', 'mediatek,mt6765-spi', 'mediatek,mt6893-spi', 'mediatek,mt7622-spi', 'mediatek,mt8135-spi', 'mediatek,mt8173-spi', 'mediatek,mt8183-spi']
   	'mediatek,mt7622-spi' was expected
   	'mediatek,mt2712-spi' was expected
   	'mediatek,mt6765-spi' was expected
   	'mediatek,spi-ipm' was expected
   	from schema $id: http://devicetree.org/schemas/spi/mediatek,spi-mt65xx.yaml#
   arch/arm/boot/dts/mediatek/mt7623n-bananapi-bpi-r2.dtb: spi@1100a000 (mediatek,mt7623-spi): Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/spi/mediatek,spi-mt65xx.yaml#
   arch/arm/boot/dts/mediatek/mt7623n-bananapi-bpi-r2.dtb: /spi@1100a000: failed to match any schema with compatible: ['mediatek,mt7623-spi', 'mediatek,mt2701-spi']
>> arch/arm/boot/dts/mediatek/mt7623n-bananapi-bpi-r2.dtb: thermal@1100b000 (mediatek,mt7623-thermal): compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt7623-thermal', 'mediatek,mt2701-thermal'] is too long
   	'mediatek,mt7623-thermal' is not one of ['mediatek,mt2701-thermal', 'mediatek,mt2712-thermal', 'mediatek,mt7622-thermal', 'mediatek,mt7986-thermal', 'mediatek,mt8173-thermal', 'mediatek,mt8183-thermal', 'mediatek,mt8365-thermal']
   	'mediatek,mt7623-thermal' is not one of ['mediatek,mt7981-thermal']
   	'mediatek,mt7623-thermal' is not one of ['mediatek,mt8516-thermal']
   	'mediatek,mt7986-thermal' was expected
   	from schema $id: http://devicetree.org/schemas/thermal/mediatek,thermal.yaml#
   arch/arm/boot/dts/mediatek/mt7623n-bananapi-bpi-r2.dtb: thermal@1100b000 (mediatek,mt7623-thermal): Unevaluated properties are not allowed ('compatible', 'reset-names' were unexpected)
   	from schema $id: http://devicetree.org/schemas/thermal/mediatek,thermal.yaml#
   arch/arm/boot/dts/mediatek/mt7623n-bananapi-bpi-r2.dtb: /thermal@1100b000: failed to match any schema with compatible: ['mediatek,mt7623-thermal', 'mediatek,mt2701-thermal']
   arch/arm/boot/dts/mediatek/mt7623n-bananapi-bpi-r2.dtb: serial@1100c000 (mediatek,mt7623-btif): clock-names:0: 'core' was expected

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
