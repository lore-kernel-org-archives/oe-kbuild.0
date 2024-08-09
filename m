Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93CEF6FDC
	for <oe-kbuild@lists.linux.dev>; Fri,  9 Aug 2024 01:32:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723167161; cv=none; b=VMIeF5IQRpICRbWxJ+kSxM2afqdNPPm8VwWlPq5zCHzA76CAQ9iGArMH4/Gt6OnhRXqYUYC99WGvn6VU5Vq5ga8Bezpc1lNZ0WTHJ/0KLxGmrT2PimZKuSlwjOiX8GLvxWyS6UOgxZFKcRohFsGnSXmQBiPnygxiNBuGZmMY15A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723167161; c=relaxed/simple;
	bh=KbktPwCHXKB7S5Nlgh3i/O2aLE19zH1z3gi17TE+L2w=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=d7Gi+EecmJUgy324vtcisSgReGvcmA85vZ0mohyYICO80NsP7bx1uuE+jzzCnzQGivg8X0p/UgMThatYUDPqYHJfVg/yHs5kfkFyidi4+WvdoGuYYLUG6LwlgHrGqa9DAU6LBdilFgLkU8oBXIW1S2Q3KtmxRTWYOiUWKQsiFho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=idwvOLrv; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="idwvOLrv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723167159; x=1754703159;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=KbktPwCHXKB7S5Nlgh3i/O2aLE19zH1z3gi17TE+L2w=;
  b=idwvOLrvgI7i2dhZoDhIwCmJU2lxahNuOcEqnKJO03xbh+JqonHvTJnj
   bqi/0A4GCifEApXMQePBKqaRfv+mu448NNhygwesJG/YDl/57b7Uok2PI
   iLVayHKMyWTA2UlSzyYH/K2KRP7qIXTrh1jZstJ5ETZ3idYM0SOZA9pls
   5BNFBIca66JRUZKzxuvpDmzDbulyvYMPt86YzKtEbBooj33Q5b66UAm6R
   IvW3/0HIeWpWZCcNCXdW1IMvk00FZ8bZo3K2UkonMfGyIrS6krM8IsXz3
   2rc4YKhwHYBnjJeitJi0DAEqShM36QbXigys0vx5zdToe1wE4HprqtwYm
   Q==;
X-CSE-ConnectionGUID: kQBD9PdvTu6srMRU42O27Q==
X-CSE-MsgGUID: mGK3721yTg6+vHTdaHpeKg==
X-IronPort-AV: E=McAfee;i="6700,10204,11158"; a="38835457"
X-IronPort-AV: E=Sophos;i="6.09,274,1716274800"; 
   d="scan'208";a="38835457"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Aug 2024 18:32:39 -0700
X-CSE-ConnectionGUID: G69SkjnZTvGHiwMFkzZxPg==
X-CSE-MsgGUID: F3ed5kesSxqNELaKNhPIOw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,274,1716274800"; 
   d="scan'208";a="57071042"
Received: from unknown (HELO b6bf6c95bbab) ([10.239.97.151])
  by fmviesa007.fm.intel.com with ESMTP; 08 Aug 2024 18:32:38 -0700
Received: from kbuild by b6bf6c95bbab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1scEUd-0006kK-2h;
	Fri, 09 Aug 2024 01:32:35 +0000
Date: Fri, 9 Aug 2024 09:31:42 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v4 6/6] arm64: dts: mediatek: mt8173-elm-hana: Mark
 touchscreens and trackpads as fail
Message-ID: <202408090805.kpqSiNAn-lkp@intel.com>
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
In-Reply-To: <20240808095931.2649657-7-wenst@chromium.org>
References: <20240808095931.2649657-7-wenst@chromium.org>
TO: "Chen-Yu Tsai" <wenst@chromium.org>

Hi Chen-Yu,

kernel test robot noticed the following build warnings:

[auto build test WARNING on robh/for-next]
[also build test WARNING on broonie-regulator/for-next wsa/i2c/for-next linus/master v6.11-rc2 next-20240808]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Chen-Yu-Tsai/of-dynamic-Add-of_changeset_update_prop_string/20240808-181544
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20240808095931.2649657-7-wenst%40chromium.org
patch subject: [PATCH v4 6/6] arm64: dts: mediatek: mt8173-elm-hana: Mark touchscreens and trackpads as fail
:::::: branch date: 15 hours ago
:::::: commit date: 15 hours ago
config: arm64-randconfig-051-20240809 (https://download.01.org/0day-ci/archive/20240809/202408090805.kpqSiNAn-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
dtschema version: 2024.6.dev8+gf13c181
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240809/202408090805.kpqSiNAn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202408090805.kpqSiNAn-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/mediatek/mt8173-elm-hana.dtb: /soc/pwrap@1000d000/pmic: failed to match any schema with compatible: ['mediatek,mt6397']
   arch/arm64/boot/dts/mediatek/mt8173-elm-hana.dtb: /soc/pwrap@1000d000/pmic/mt6397clock: failed to match any schema with compatible: ['mediatek,mt6397-clk']
   arch/arm64/boot/dts/mediatek/mt8173-elm-hana.dtb: /soc/pwrap@1000d000/pmic/mt6397regulator: failed to match any schema with compatible: ['mediatek,mt6397-regulator']
   arch/arm64/boot/dts/mediatek/mt8173-elm-hana.dtb: /soc/pwrap@1000d000/pmic/mt6397rtc: failed to match any schema with compatible: ['mediatek,mt6397-rtc']
   arch/arm64/boot/dts/mediatek/mt8173-elm-hana.dtb: /soc/vpu@10020000: failed to match any schema with compatible: ['mediatek,mt8173-vpu']
   arch/arm64/boot/dts/mediatek/mt8173-elm-hana.dtb: intpol-controller@10200620: $nodename:0: 'intpol-controller@10200620' does not match '^interrupt-controller(@[0-9a-f,]+)*$'
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/mediatek,mt6577-sysirq.yaml#
   arch/arm64/boot/dts/mediatek/mt8173-elm-hana.dtb: /soc/i2c@11008000/da9211@68: failed to match any schema with compatible: ['dlg,da9211']
   arch/arm64/boot/dts/mediatek/mt8173-elm-hana.dtb: thermal@1100b000: Unevaluated properties are not allowed ('bank0-supply', 'bank1-supply' were unexpected)
   	from schema $id: http://devicetree.org/schemas/thermal/mediatek,thermal.yaml#
>> arch/arm64/boot/dts/mediatek/mt8173-elm-hana.dtb: touchscreen@10: status: 'oneOf' conditional failed, one must be fixed:
   	['fail-needs-probe'] is not of type 'object'
   	'fail-needs-probe' is not one of ['okay', 'disabled', 'reserved', 'fail']
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm64/boot/dts/mediatek/mt8173-elm-hana.dtb: touchscreen@34: status: 'oneOf' conditional failed, one must be fixed:
   	['fail-needs-probe'] is not of type 'object'
   	'fail-needs-probe' is not one of ['okay', 'disabled', 'reserved', 'fail']
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm64/boot/dts/mediatek/mt8173-elm-hana.dtb: /soc/i2c@11010000/touchscreen@34: failed to match any schema with compatible: ['melfas,mip4_ts']
   arch/arm64/boot/dts/mediatek/mt8173-elm-hana.dtb: touchscreen@20: status: 'oneOf' conditional failed, one must be fixed:
   	['fail-needs-probe'] is not of type 'object'
   	'fail-needs-probe' is not one of ['okay', 'disabled', 'reserved', 'fail']
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/mediatek/mt8173-elm-hana.dtb: trackpad@15: status: 'oneOf' conditional failed, one must be fixed:
   	['fail-needs-probe'] is not of type 'object'
   	'fail-needs-probe' is not one of ['okay', 'disabled', 'reserved', 'fail']
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/mediatek/mt8173-elm-hana.dtb: trackpad@2c: status: 'oneOf' conditional failed, one must be fixed:
   	['fail-needs-probe'] is not of type 'object'
   	'fail-needs-probe' is not one of ['okay', 'disabled', 'reserved', 'fail']
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm64/boot/dts/mediatek/mt8173-elm-hana.dtb: /soc/audio-controller@11220000: failed to match any schema with compatible: ['mediatek,mt8173-afe-pcm']
   arch/arm64/boot/dts/mediatek/mt8173-elm-hana.dtb: btmrvl@2: marvell,wakeup-pin: b'\x00\r' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm64/boot/dts/mediatek/mt8173-elm-hana.dtb: btmrvl@2: marvell,wakeup-gap-ms:0: size is 16, expected 32
   	from schema $id: http://devicetree.org/schemas/property-units.yaml#
   arch/arm64/boot/dts/mediatek/mt8173-elm-hana.dtb: /soc/mmc@11260000/btmrvl@2: failed to match any schema with compatible: ['marvell,sd8897-bt']
   arch/arm64/boot/dts/mediatek/mt8173-elm-hana.dtb: /soc/mmc@11260000/mwifiex@1: failed to match any schema with compatible: ['marvell,sd8897']
--
   arch/arm64/boot/dts/mediatek/mt8173-elm-hana-rev7.dtb: /soc/pwrap@1000d000/pmic: failed to match any schema with compatible: ['mediatek,mt6397']
   arch/arm64/boot/dts/mediatek/mt8173-elm-hana-rev7.dtb: /soc/pwrap@1000d000/pmic/mt6397clock: failed to match any schema with compatible: ['mediatek,mt6397-clk']
   arch/arm64/boot/dts/mediatek/mt8173-elm-hana-rev7.dtb: /soc/pwrap@1000d000/pmic/mt6397regulator: failed to match any schema with compatible: ['mediatek,mt6397-regulator']
   arch/arm64/boot/dts/mediatek/mt8173-elm-hana-rev7.dtb: /soc/pwrap@1000d000/pmic/mt6397rtc: failed to match any schema with compatible: ['mediatek,mt6397-rtc']
   arch/arm64/boot/dts/mediatek/mt8173-elm-hana-rev7.dtb: /soc/vpu@10020000: failed to match any schema with compatible: ['mediatek,mt8173-vpu']
   arch/arm64/boot/dts/mediatek/mt8173-elm-hana-rev7.dtb: intpol-controller@10200620: $nodename:0: 'intpol-controller@10200620' does not match '^interrupt-controller(@[0-9a-f,]+)*$'
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/mediatek,mt6577-sysirq.yaml#
   arch/arm64/boot/dts/mediatek/mt8173-elm-hana-rev7.dtb: /soc/i2c@11008000/da9211@68: failed to match any schema with compatible: ['dlg,da9211']
   arch/arm64/boot/dts/mediatek/mt8173-elm-hana-rev7.dtb: thermal@1100b000: Unevaluated properties are not allowed ('bank0-supply', 'bank1-supply' were unexpected)
   	from schema $id: http://devicetree.org/schemas/thermal/mediatek,thermal.yaml#
>> arch/arm64/boot/dts/mediatek/mt8173-elm-hana-rev7.dtb: touchscreen@10: status: 'oneOf' conditional failed, one must be fixed:
   	['fail-needs-probe'] is not of type 'object'
   	'fail-needs-probe' is not one of ['okay', 'disabled', 'reserved', 'fail']
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm64/boot/dts/mediatek/mt8173-elm-hana-rev7.dtb: touchscreen@34: status: 'oneOf' conditional failed, one must be fixed:
   	['fail-needs-probe'] is not of type 'object'
   	'fail-needs-probe' is not one of ['okay', 'disabled', 'reserved', 'fail']
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm64/boot/dts/mediatek/mt8173-elm-hana-rev7.dtb: /soc/i2c@11010000/touchscreen@34: failed to match any schema with compatible: ['melfas,mip4_ts']
   arch/arm64/boot/dts/mediatek/mt8173-elm-hana-rev7.dtb: touchscreen@20: status: 'oneOf' conditional failed, one must be fixed:
   	['fail-needs-probe'] is not of type 'object'
   	'fail-needs-probe' is not one of ['okay', 'disabled', 'reserved', 'fail']
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/mediatek/mt8173-elm-hana-rev7.dtb: trackpad@15: status: 'oneOf' conditional failed, one must be fixed:
   	['fail-needs-probe'] is not of type 'object'
   	'fail-needs-probe' is not one of ['okay', 'disabled', 'reserved', 'fail']
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/mediatek/mt8173-elm-hana-rev7.dtb: trackpad@2c: status: 'oneOf' conditional failed, one must be fixed:
   	['fail-needs-probe'] is not of type 'object'
   	'fail-needs-probe' is not one of ['okay', 'disabled', 'reserved', 'fail']
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm64/boot/dts/mediatek/mt8173-elm-hana-rev7.dtb: /soc/audio-controller@11220000: failed to match any schema with compatible: ['mediatek,mt8173-afe-pcm']
   arch/arm64/boot/dts/mediatek/mt8173-elm-hana-rev7.dtb: btmrvl@2: marvell,wakeup-pin: b'\x00\r' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm64/boot/dts/mediatek/mt8173-elm-hana-rev7.dtb: btmrvl@2: marvell,wakeup-gap-ms:0: size is 16, expected 32
   	from schema $id: http://devicetree.org/schemas/property-units.yaml#
   arch/arm64/boot/dts/mediatek/mt8173-elm-hana-rev7.dtb: /soc/mmc@11260000/btmrvl@2: failed to match any schema with compatible: ['marvell,sd8897-bt']
   arch/arm64/boot/dts/mediatek/mt8173-elm-hana-rev7.dtb: /soc/mmc@11260000/mwifiex@1: failed to match any schema with compatible: ['marvell,sd8897']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
