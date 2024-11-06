Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10A5AA2D
	for <oe-kbuild@lists.linux.dev>; Wed,  6 Nov 2024 07:09:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730876956; cv=none; b=BAFnEJpNxyLHYkI4btWZAvQN3KOIMC4pPFue/iXOpGowL0pLS3eqegR1zLM3W9jjAVBWTelKd/gkdXLW3CO7qYBROTwbCxOQp7VyB0Fd23FrmtJd9pRur/6Yp61STNuygij3Z3PzTVXwyPulIyTs59/NL+u2u2zXhzpGPPe3Tlg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730876956; c=relaxed/simple;
	bh=XKCM9DKlKK6p0vhJhdRHg1QoVgLPXpHv+Gel301M+Xo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=bsrY++lwsu+qC2JCGZ7dFCAI0CeulE6/D9VgMMrTsOvmGoEQ7110O0HqjRd4iXpW6FObDDv8VzcjR1jm94b9PSaBr2/a+HXuAMaitzWA4kLpZvtKXfubKKDuuzPwdswWdwJyVQyXWCVFfCpk8fVdd5a7PC2BWaE46VdhOvJoruc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Au9yAt9P; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Au9yAt9P"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730876955; x=1762412955;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=XKCM9DKlKK6p0vhJhdRHg1QoVgLPXpHv+Gel301M+Xo=;
  b=Au9yAt9P63kScausBskAMzqFZu7R3xI5+TxGp0zMSEslt4isECDU7NzT
   TtF7yIkEsunwNLoAUHl8F4uPrlsFS+BVJKCHSvY/fH5OW3ZseU0Q16yPI
   7PYBs1XD19Fd4adwLegKmmgvnd2+6p0rXrfLa24ttkApBT6jNmQpBwrjE
   Qswm4YqodM1h/97Qd+AhRVknMFiH80kgKJM4fp2i5ewCaue8I9TtQlFUQ
   DMThYJmZ7yvK9K/eU5p3aXEjC51ueMs7Ud1vdfNAYKyhCGAw/x6x5o4v8
   5teP9EadgDVixY/1HV110w17f5EyYTNOZOVTv7i53werpsl+I8rOSSzmb
   w==;
X-CSE-ConnectionGUID: OwCMix2yQyOlGyzm8xHXNQ==
X-CSE-MsgGUID: NoIjs+nnRY+S9zF0p81/ww==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="30819268"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="30819268"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2024 23:09:14 -0800
X-CSE-ConnectionGUID: 0e/M9PimR62PW9QUlilDJw==
X-CSE-MsgGUID: FKrrL6WPQFOukNTSA5wNZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,262,1725346800"; 
   d="scan'208";a="89213845"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 05 Nov 2024 23:09:13 -0800
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t8aAA-000n2G-10;
	Wed, 06 Nov 2024 07:09:10 +0000
Date: Wed, 6 Nov 2024 15:08:52 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v2] dt-bindings: display: mediatek: dp: Reference common
 DAI properties
Message-ID: <202411061445.KedaiT7w-lkp@intel.com>
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
In-Reply-To: <20241105090207.3892242-1-fshao@chromium.org>
References: <20241105090207.3892242-1-fshao@chromium.org>
TO: Fei Shao <fshao@chromium.org>
TO: "Chun-Kuang Hu" <chunkuang.hu@kernel.org>
CC: Fei Shao <fshao@chromium.org>
CC: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
CC: Conor Dooley <conor+dt@kernel.org>
CC: Krzysztof Kozlowski <krzk@kernel.org>
CC: Matthias Brugger <matthias.bgg@gmail.com>
CC: Rob Herring <robh@kernel.org>
CC: devicetree@vger.kernel.org
CC: dri-devel@lists.freedesktop.org
CC: linux-arm-kernel@lists.infradead.org
CC: linux-kernel@vger.kernel.org
CC: linux-mediatek@lists.infradead.org

Hi Fei,

kernel test robot noticed the following build warnings:

[auto build test WARNING on robh/for-next]
[also build test WARNING on linus/master v6.12-rc6 next-20241105]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Fei-Shao/dt-bindings-display-mediatek-dp-Reference-common-DAI-properties/20241105-170422
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20241105090207.3892242-1-fshao%40chromium.org
patch subject: [PATCH v2] dt-bindings: display: mediatek: dp: Reference common DAI properties
:::::: branch date: 22 hours ago
:::::: commit date: 22 hours ago
config: arm64-randconfig-051-20241106 (https://download.01.org/0day-ci/archive/20241106/202411061445.KedaiT7w-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
dtschema version: 2024.10.dev6+g12c3cd5
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241106/202411061445.KedaiT7w-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202411061445.KedaiT7w-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/mediatek/mt8195-cherry-dojo-r1.dtb: amplifier@39: '#sound-dai-cells', 'sound-name-prefix' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/sound/maxim,max98390.yaml#
   arch/arm64/boot/dts/mediatek/mt8195-cherry-dojo-r1.dtb: t-phy@11e30000: 'power-domains' does not match any of the regexes: '^(usb|pcie|sata)-phy@[0-9a-f]+$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/phy/mediatek,tphy.yaml#
   arch/arm64/boot/dts/mediatek/mt8195-cherry-dojo-r1.dtb: display@14f06000: clocks: [[41, 14], [41, 43], [41, 44]] is too long
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,split.yaml#
   arch/arm64/boot/dts/mediatek/mt8195-cherry-dojo-r1.dtb: mutex@1c101000: 'clock-names', 'reg-names' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/soc/mediatek/mediatek,mutex.yaml#
   arch/arm64/boot/dts/mediatek/mt8195-cherry-dojo-r1.dtb: dp-intf@1c113000: power-domains: False schema does not allow [[55, 18]]
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,dpi.yaml#
>> arch/arm64/boot/dts/mediatek/mt8195-cherry-dojo-r1.dtb: edp-tx@1c500000: Unevaluated properties are not allowed ('aux-bus' was unexpected)
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,dp.yaml#
   arch/arm64/boot/dts/mediatek/mt8195-cherry-dojo-r1.dtb: rt1019p: 'label' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/sound/realtek,rt1015p.yaml#
--
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6360.yaml#
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r1.dtb: /soc/i2c@11e02000/codec@1a: failed to match any schema with compatible: ['realtek,rt5682i']
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r1.dtb: t-phy@11e30000: 'power-domains' does not match any of the regexes: '^(usb|pcie|sata)-phy@[0-9a-f]+$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/phy/mediatek,tphy.yaml#
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r1.dtb: display@14f06000: clocks: [[40, 14], [40, 43], [40, 44]] is too long
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,split.yaml#
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r1.dtb: mutex@1c101000: 'clock-names', 'reg-names' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/soc/mediatek/mediatek,mutex.yaml#
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r1.dtb: dp-intf@1c113000: power-domains: False schema does not allow [[54, 18]]
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,dpi.yaml#
>> arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r1.dtb: edp-tx@1c500000: Unevaluated properties are not allowed ('aux-bus' was unexpected)
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,dp.yaml#
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r1.dtb: rt1019p: 'label' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/sound/realtek,rt1015p.yaml#
--
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6360.yaml#
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r2.dtb: /soc/i2c@11e02000/codec@1a: failed to match any schema with compatible: ['realtek,rt5682i']
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r2.dtb: t-phy@11e30000: 'power-domains' does not match any of the regexes: '^(usb|pcie|sata)-phy@[0-9a-f]+$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/phy/mediatek,tphy.yaml#
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r2.dtb: display@14f06000: clocks: [[40, 14], [40, 43], [40, 44]] is too long
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,split.yaml#
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r2.dtb: mutex@1c101000: 'clock-names', 'reg-names' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/soc/mediatek/mediatek,mutex.yaml#
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r2.dtb: dp-intf@1c113000: power-domains: False schema does not allow [[54, 18]]
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,dpi.yaml#
>> arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r2.dtb: edp-tx@1c500000: Unevaluated properties are not allowed ('aux-bus' was unexpected)
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,dp.yaml#
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r2.dtb: rt1019p: 'label' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/sound/realtek,rt1015p.yaml#
--
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r3.dtb: codec@1a: 'LDO1-IN-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/sound/realtek,rt5682s.yaml#
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r3.dtb: t-phy@11e30000: 'power-domains' does not match any of the regexes: '^(usb|pcie|sata)-phy@[0-9a-f]+$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/phy/mediatek,tphy.yaml#
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r3.dtb: display@14f06000: clocks: [[40, 14], [40, 43], [40, 44]] is too long
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,split.yaml#
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r3.dtb: mutex@1c101000: 'clock-names', 'reg-names' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/soc/mediatek/mediatek,mutex.yaml#
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r3.dtb: dp-intf@1c113000: power-domains: False schema does not allow [[54, 18]]
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,dpi.yaml#
>> arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r3.dtb: edp-tx@1c500000: Unevaluated properties are not allowed ('aux-bus' was unexpected)
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,dp.yaml#
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r3.dtb: rt1019p: 'label' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/sound/realtek,rt1015p.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
