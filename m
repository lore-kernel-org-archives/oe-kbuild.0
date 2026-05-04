Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3676226D4DD
	for <oe-kbuild@lists.linux.dev>; Mon,  4 May 2026 05:25:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777872335; cv=none; b=abq2q8IVSVKXiDUHnS8ocLVljvk/l1qjWjzu+bIMTTBiOGwUvp90HTQfRGpLuEskXQMYo8sG5a14fg+nnNAh1Zzhr5FcABPbc9lewBSzaZFxXSC/HeKEyRFhtAXi7MVp+uTF42pZ9WrUJ/Bg6XLtPIObwHSf9DpOFYEyk6rtsiI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777872335; c=relaxed/simple;
	bh=tY8Whyufi8G8Avp1g8otE5GdOkJno1H6Qgh1iTxrrto=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qt8/JvCgjgQV38CQFJGCJoOvvFuNXqigX8825/HDJXpRVWRG077582WqQ64zMXSEMG3SiYIrJFFyTMHt8lfuNIVtDoWaeZuK4IkKMElZ+33gEsbAELqI2ZejCap+ktjvSB/8kZ1ljjrlaQp4y9kFHlDI5MVSFksu9FjK3x9/VjM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ecIkdnKA; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ecIkdnKA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777872332; x=1809408332;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=tY8Whyufi8G8Avp1g8otE5GdOkJno1H6Qgh1iTxrrto=;
  b=ecIkdnKAEZgQH2xgcE12H0l+F0xhhlI1N4871WCELe/zUHdlCkH1M2xs
   Cj55sbb5xK9pnKBK0ogR0xNfX5Lf6QJKkEgwy+jaDGZu31Im2dKQwhK05
   HjuWxsHdw9rGsFGFS+XPM8YqQKJ/iXTlbcwNdU7txrasHxG/jo9Pu6L0z
   5UnUUJPbzmERaFY4Cisz2Z9ss+pxG2fSd493OkiWrgre+nst0RKl2mDh+
   Hq0/UmJtsJ4YX9w87sIPjH9lgTCREspbiGtyu/Gz9qMhxF7Xv2RcsRzF3
   oUQE+7z1I0OA768+sChdXTF4QN42zgNq/aUPMq/V3tiNy6D2DSPuil1lc
   g==;
X-CSE-ConnectionGUID: ikyx/mrMQS6rD2YXVOtxbA==
X-CSE-MsgGUID: SjUsd1nVTsiK2Dwrj+RCLA==
X-IronPort-AV: E=McAfee;i="6800,10657,11775"; a="77747154"
X-IronPort-AV: E=Sophos;i="6.23,214,1770624000"; 
   d="scan'208";a="77747154"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 May 2026 22:25:31 -0700
X-CSE-ConnectionGUID: IMREPj3LQa+2DcYnjt6QzA==
X-CSE-MsgGUID: 3PrLneCFTkuDwiqrwCt2ow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,214,1770624000"; 
   d="scan'208";a="239384345"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by orviesa003.jf.intel.com with ESMTP; 03 May 2026 22:25:30 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wJlo8-000000005kr-0o0Y;
	Mon, 04 May 2026 05:25:28 +0000
Date: Mon, 4 May 2026 07:25:05 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v2 6/6] regulator: mt6359: Add proper ldo_vcn33_[12]
 regulators
Message-ID: <202605040742.W7MV3Ivm-lkp@intel.com>
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
In-Reply-To: <20260429074113.3720271-7-wenst@chromium.org>
References: <20260429074113.3720271-7-wenst@chromium.org>
TO: "Chen-Yu Tsai" <wenst@chromium.org>
TO: Mark Brown <broonie@kernel.org>
TO: Liam Girdwood <lgirdwood@gmail.com>
TO: Rob Herring <robh@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
TO: Matthias Brugger <matthias.bgg@gmail.com>
TO: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
CC: "Chen-Yu Tsai" <wenst@chromium.org>
CC: linux-arm-kernel@lists.infradead.org
CC: linux-mediatek@lists.infradead.org
CC: devicetree@vger.kernel.org

Hi Chen-Yu,

kernel test robot noticed the following build warnings:

[auto build test WARNING on broonie-regulator/for-next]
[also build test WARNING on lee-mfd/for-mfd-next robh/for-next linus/master lee-mfd/for-mfd-fixes v6.16-rc1 next-20260430]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Chen-Yu-Tsai/mfd-dt-bindings-mt6397-Add-regulator-supplies/20260503-065349
base:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git for-next
patch link:    https://lore.kernel.org/r/20260429074113.3720271-7-wenst%40chromium.org
patch subject: [PATCH v2 6/6] regulator: mt6359: Add proper ldo_vcn33_[12] regulators
:::::: branch date: 30 hours ago
:::::: commit date: 30 hours ago
config: arm64-randconfig-2052-20260503 (https://download.01.org/0day-ci/archive/20260504/202605040742.W7MV3Ivm-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 15.1.0
dtschema: 2026.5.dev4+g4ccc1997d
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260504/202605040742.W7MV3Ivm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202605040742.W7MV3Ivm-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/mediatek/mt8188-evb.dtb: pmic (mediatek,mt6359): '#sound-dai-cells' does not match any of the regexes: '^pinctrl-[0-9]+$', '^vs(ys|[12])-ldo[1-9]-supply$', '^vsys-v[a-z]+[0-9]*-supply$'
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml
   arch/arm64/boot/dts/mediatek/mt8188-evb.dtb: scp@10720000 (mediatek,mt8188-scp-dual): reg-names: ['cfg'] is too short
   	from schema $id: http://devicetree.org/schemas/remoteproc/mtk,scp.yaml
   arch/arm64/boot/dts/mediatek/mt8188-evb.dtb: scp@10720000 (mediatek,mt8188-scp-dual): reg: [[0, 275906560, 0, 917504]] is too short
   	from schema $id: http://devicetree.org/schemas/remoteproc/mtk,scp.yaml
   arch/arm64/boot/dts/mediatek/mt8188-evb.dtb: scp@10720000 (mediatek,mt8188-scp-dual): reg-names: ['cfg'] is too short
   	from schema $id: http://devicetree.org/schemas/remoteproc/mtk,scp.yaml
--
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku0.dtb: pmic (mediatek,mt6359): '#sound-dai-cells' does not match any of the regexes: '^pinctrl-[0-9]+$', '^vs(ys|[12])-ldo[1-9]-supply$', '^vsys-v[a-z]+[0-9]*-supply$'
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku0.dtb: scp@10720000 (mediatek,mt8188-scp-dual): reg-names: ['cfg'] is too short
   	from schema $id: http://devicetree.org/schemas/remoteproc/mtk,scp.yaml
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku0.dtb: scp@10720000 (mediatek,mt8188-scp-dual): reg: [[0, 275906560, 0, 917504]] is too short
   	from schema $id: http://devicetree.org/schemas/remoteproc/mtk,scp.yaml
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku0.dtb: scp@10720000 (mediatek,mt8188-scp-dual): reg-names: ['cfg'] is too short
   	from schema $id: http://devicetree.org/schemas/remoteproc/mtk,scp.yaml
--
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku1.dtb: pmic (mediatek,mt6359): '#sound-dai-cells' does not match any of the regexes: '^pinctrl-[0-9]+$', '^vs(ys|[12])-ldo[1-9]-supply$', '^vsys-v[a-z]+[0-9]*-supply$'
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku1.dtb: scp@10720000 (mediatek,mt8188-scp-dual): reg-names: ['cfg'] is too short
   	from schema $id: http://devicetree.org/schemas/remoteproc/mtk,scp.yaml
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku1.dtb: scp@10720000 (mediatek,mt8188-scp-dual): reg: [[0, 275906560, 0, 917504]] is too short
   	from schema $id: http://devicetree.org/schemas/remoteproc/mtk,scp.yaml
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku1.dtb: scp@10720000 (mediatek,mt8188-scp-dual): reg-names: ['cfg'] is too short
   	from schema $id: http://devicetree.org/schemas/remoteproc/mtk,scp.yaml
--
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku2.dtb: pmic (mediatek,mt6359): '#sound-dai-cells' does not match any of the regexes: '^pinctrl-[0-9]+$', '^vs(ys|[12])-ldo[1-9]-supply$', '^vsys-v[a-z]+[0-9]*-supply$'
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku2.dtb: scp@10720000 (mediatek,mt8188-scp-dual): reg-names: ['cfg'] is too short
   	from schema $id: http://devicetree.org/schemas/remoteproc/mtk,scp.yaml
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku2.dtb: scp@10720000 (mediatek,mt8188-scp-dual): reg: [[0, 275906560, 0, 917504]] is too short
   	from schema $id: http://devicetree.org/schemas/remoteproc/mtk,scp.yaml
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku2.dtb: scp@10720000 (mediatek,mt8188-scp-dual): reg-names: ['cfg'] is too short
   	from schema $id: http://devicetree.org/schemas/remoteproc/mtk,scp.yaml
--
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku3.dtb: pmic (mediatek,mt6359): '#sound-dai-cells' does not match any of the regexes: '^pinctrl-[0-9]+$', '^vs(ys|[12])-ldo[1-9]-supply$', '^vsys-v[a-z]+[0-9]*-supply$'
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku3.dtb: scp@10720000 (mediatek,mt8188-scp-dual): reg-names: ['cfg'] is too short
   	from schema $id: http://devicetree.org/schemas/remoteproc/mtk,scp.yaml
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku3.dtb: scp@10720000 (mediatek,mt8188-scp-dual): reg: [[0, 275906560, 0, 917504]] is too short
   	from schema $id: http://devicetree.org/schemas/remoteproc/mtk,scp.yaml
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku3.dtb: scp@10720000 (mediatek,mt8188-scp-dual): reg-names: ['cfg'] is too short
   	from schema $id: http://devicetree.org/schemas/remoteproc/mtk,scp.yaml
--
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku4.dtb: pmic (mediatek,mt6359): '#sound-dai-cells' does not match any of the regexes: '^pinctrl-[0-9]+$', '^vs(ys|[12])-ldo[1-9]-supply$', '^vsys-v[a-z]+[0-9]*-supply$'
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku4.dtb: scp@10720000 (mediatek,mt8188-scp-dual): reg-names: ['cfg'] is too short
   	from schema $id: http://devicetree.org/schemas/remoteproc/mtk,scp.yaml
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku4.dtb: scp@10720000 (mediatek,mt8188-scp-dual): reg: [[0, 275906560, 0, 917504]] is too short
   	from schema $id: http://devicetree.org/schemas/remoteproc/mtk,scp.yaml
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku4.dtb: scp@10720000 (mediatek,mt8188-scp-dual): reg-names: ['cfg'] is too short
   	from schema $id: http://devicetree.org/schemas/remoteproc/mtk,scp.yaml
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku4.dtb: amplifier@4f (ti,tas2563): reg:0:0: 79 is greater than the maximum of 63
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas2781.yaml
--
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku5.dtb: pmic (mediatek,mt6359): '#sound-dai-cells' does not match any of the regexes: '^pinctrl-[0-9]+$', '^vs(ys|[12])-ldo[1-9]-supply$', '^vsys-v[a-z]+[0-9]*-supply$'
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku5.dtb: scp@10720000 (mediatek,mt8188-scp-dual): reg-names: ['cfg'] is too short
   	from schema $id: http://devicetree.org/schemas/remoteproc/mtk,scp.yaml
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku5.dtb: scp@10720000 (mediatek,mt8188-scp-dual): reg: [[0, 275906560, 0, 917504]] is too short
   	from schema $id: http://devicetree.org/schemas/remoteproc/mtk,scp.yaml
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku5.dtb: scp@10720000 (mediatek,mt8188-scp-dual): reg-names: ['cfg'] is too short
   	from schema $id: http://devicetree.org/schemas/remoteproc/mtk,scp.yaml
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku5.dtb: amplifier@4f (ti,tas2563): reg:0:0: 79 is greater than the maximum of 63
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas2781.yaml
--
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku6.dtb: pmic (mediatek,mt6359): '#sound-dai-cells' does not match any of the regexes: '^pinctrl-[0-9]+$', '^vs(ys|[12])-ldo[1-9]-supply$', '^vsys-v[a-z]+[0-9]*-supply$'
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku6.dtb: scp@10720000 (mediatek,mt8188-scp-dual): reg-names: ['cfg'] is too short
   	from schema $id: http://devicetree.org/schemas/remoteproc/mtk,scp.yaml
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku6.dtb: scp@10720000 (mediatek,mt8188-scp-dual): reg: [[0, 275906560, 0, 917504]] is too short
   	from schema $id: http://devicetree.org/schemas/remoteproc/mtk,scp.yaml
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku6.dtb: scp@10720000 (mediatek,mt8188-scp-dual): reg-names: ['cfg'] is too short
   	from schema $id: http://devicetree.org/schemas/remoteproc/mtk,scp.yaml
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku6.dtb: amplifier@4f (ti,tas2563): reg:0:0: 79 is greater than the maximum of 63
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas2781.yaml
--
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku7.dtb: pmic (mediatek,mt6359): '#sound-dai-cells' does not match any of the regexes: '^pinctrl-[0-9]+$', '^vs(ys|[12])-ldo[1-9]-supply$', '^vsys-v[a-z]+[0-9]*-supply$'
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku7.dtb: scp@10720000 (mediatek,mt8188-scp-dual): reg-names: ['cfg'] is too short
   	from schema $id: http://devicetree.org/schemas/remoteproc/mtk,scp.yaml
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku7.dtb: scp@10720000 (mediatek,mt8188-scp-dual): reg: [[0, 275906560, 0, 917504]] is too short
   	from schema $id: http://devicetree.org/schemas/remoteproc/mtk,scp.yaml
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku7.dtb: scp@10720000 (mediatek,mt8188-scp-dual): reg-names: ['cfg'] is too short
   	from schema $id: http://devicetree.org/schemas/remoteproc/mtk,scp.yaml
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku7.dtb: amplifier@4f (ti,tas2563): reg:0:0: 79 is greater than the maximum of 63
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas2781.yaml
--
>> arch/arm64/boot/dts/mediatek/mt8192-asurada-hayato-r1.dtb: pmic (mediatek,mt6359): '#sound-dai-cells' does not match any of the regexes: '^pinctrl-[0-9]+$', '^vs(ys|[12])-ldo[1-9]-supply$', '^vsys-v[a-z]+[0-9]*-supply$'
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml
   arch/arm64/boot/dts/mediatek/mt8192-asurada-hayato-r1.dtb: pcie@0,0: wifi@0,0:reg:0:4: 0 was expected
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
   arch/arm64/boot/dts/mediatek/mt8192-asurada-hayato-r1.dtb: pcie@0,0: wifi@0,0:reg: [[65536, 0, 0, 0, 1048576], [65536, 0, 1048576, 0, 1048576]] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
   arch/arm64/boot/dts/mediatek/mt8192-asurada-hayato-r1.dtb: flash@0 (winbond,w25q64jwm): compatible: 'oneOf' conditional failed, one must be fixed:
   	['winbond,w25q64jwm', 'jedec,spi-nor'] is too long
   	'winbond,w25q64jwm' does not match '^((((micron|spansion|st),)?(m25p(40|80|16|32|64|128)|n25q(32b|064|128a11|128a13|256a|512a|164k)))|atmel,at(25|26)df(321a|641|081a)|everspin,mr25h(10|40|128|256)|(mxicy|macronix),mx25l(4005a|1606e|6405d|8005|12805d|25635e)|(mxicy|macronix),mx25u(4033|4035)|(spansion,)?s25fl(128s|256s1|512s|008k|064k|164k)|(sst|microchip),sst25vf(016b|032b|040b)|(sst,)?sst26wf016b|(sst,)?sst25wf(040b|080)|winbond,w25x(80|32)|(winbond,)?w25q(16|32(w|dw)?|64(dw)?|80bl|128(fw)?|256))$'
   	'winbond,w25q64jwm' is not one of ['issi,is25lp016d', 'micron,mt25qu02g', 'mxicy,mx25r1635f', 'mxicy,mx25u6435f', 'mxicy,mx25v8035f', 'spansion,s25sl12801', 'spansion,s25fs512s']
   	'jedec,spi-nor' was expected
--
>> arch/arm64/boot/dts/mediatek/mt8192-asurada-spherion-r0.dtb: pmic (mediatek,mt6359): '#sound-dai-cells' does not match any of the regexes: '^pinctrl-[0-9]+$', '^vs(ys|[12])-ldo[1-9]-supply$', '^vsys-v[a-z]+[0-9]*-supply$'
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml
   arch/arm64/boot/dts/mediatek/mt8192-asurada-spherion-r0.dtb: pcie@0,0: wifi@0,0:reg:0:4: 0 was expected
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
   arch/arm64/boot/dts/mediatek/mt8192-asurada-spherion-r0.dtb: pcie@0,0: wifi@0,0:reg: [[65536, 0, 0, 0, 1048576], [65536, 0, 1048576, 0, 1048576]] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
   arch/arm64/boot/dts/mediatek/mt8192-asurada-spherion-r0.dtb: flash@0 (winbond,w25q64jwm): compatible: 'oneOf' conditional failed, one must be fixed:
   	['winbond,w25q64jwm', 'jedec,spi-nor'] is too long
   	'winbond,w25q64jwm' does not match '^((((micron|spansion|st),)?(m25p(40|80|16|32|64|128)|n25q(32b|064|128a11|128a13|256a|512a|164k)))|atmel,at(25|26)df(321a|641|081a)|everspin,mr25h(10|40|128|256)|(mxicy|macronix),mx25l(4005a|1606e|6405d|8005|12805d|25635e)|(mxicy|macronix),mx25u(4033|4035)|(spansion,)?s25fl(128s|256s1|512s|008k|064k|164k)|(sst|microchip),sst25vf(016b|032b|040b)|(sst,)?sst26wf016b|(sst,)?sst25wf(040b|080)|winbond,w25x(80|32)|(winbond,)?w25q(16|32(w|dw)?|64(dw)?|80bl|128(fw)?|256))$'
   	'winbond,w25q64jwm' is not one of ['issi,is25lp016d', 'micron,mt25qu02g', 'mxicy,mx25r1635f', 'mxicy,mx25u6435f', 'mxicy,mx25v8035f', 'spansion,s25sl12801', 'spansion,s25fs512s']
   	'jedec,spi-nor' was expected
--
>> arch/arm64/boot/dts/mediatek/mt8192-evb.dtb: pmic (mediatek,mt6359): '#sound-dai-cells' does not match any of the regexes: '^pinctrl-[0-9]+$', '^vs(ys|[12])-ldo[1-9]-supply$', '^vsys-v[a-z]+[0-9]*-supply$'
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml
--
>> arch/arm64/boot/dts/mediatek/mt8195-cherry-dojo-r1.dtb: pmic (mediatek,mt6359): '#sound-dai-cells' does not match any of the regexes: '^pinctrl-[0-9]+$', '^vs(ys|[12])-ldo[1-9]-supply$', '^vsys-v[a-z]+[0-9]*-supply$'
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml
   arch/arm64/boot/dts/mediatek/mt8195-cherry-dojo-r1.dtb: infra-iommu@10315000 (mediatek,mt8195-iommu-infra): interrupts: [[0, 795, 4, 0], [0, 796, 4, 0], [0, 797, 4, 0], [0, 798, 4, 0], [0, 799, 4, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/mediatek,iommu.yaml
   arch/arm64/boot/dts/mediatek/mt8195-cherry-dojo-r1.dtb: pmic@34 (mediatek,mt6360): #interrupt-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6360.yaml
   arch/arm64/boot/dts/mediatek/mt8195-cherry-dojo-r1.dtb: jpeg-decoder@1a040000 (mediatek,mt8195-jpgdec): 'jpgdec@0,0', 'jpgdec@0,10000', 'jpgdec@1,0' do not match any of the regexes: '^jpgdec@[0-9a-f]+$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mt8195-jpegdec.yaml
   arch/arm64/boot/dts/mediatek/mt8195-cherry-dojo-r1.dtb: jpeg-encoder@1a030000 (mediatek,mt8195-jpgenc): 'jpgenc@0,0', 'jpgenc@1,0' do not match any of the regexes: '^jpgenc@[0-9a-f]+$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mt8195-jpegenc.yaml
   arch/arm64/boot/dts/mediatek/mt8195-cherry-dojo-r1.dtb: rt1019p (realtek,rt1019p): 'label' does not match any of the regexes: '^pinctrl-[0-9]+$'
--
>> arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r1.dtb: pmic (mediatek,mt6359): '#sound-dai-cells' does not match any of the regexes: '^pinctrl-[0-9]+$', '^vs(ys|[12])-ldo[1-9]-supply$', '^vsys-v[a-z]+[0-9]*-supply$'
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r1.dtb: infra-iommu@10315000 (mediatek,mt8195-iommu-infra): interrupts: [[0, 795, 4, 0], [0, 796, 4, 0], [0, 797, 4, 0], [0, 798, 4, 0], [0, 799, 4, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/mediatek,iommu.yaml
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r1.dtb: pmic@34 (mediatek,mt6360): #interrupt-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6360.yaml
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r1.dtb: jpeg-decoder@1a040000 (mediatek,mt8195-jpgdec): 'jpgdec@0,0', 'jpgdec@0,10000', 'jpgdec@1,0' do not match any of the regexes: '^jpgdec@[0-9a-f]+$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mt8195-jpegdec.yaml
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r1.dtb: jpeg-encoder@1a030000 (mediatek,mt8195-jpgenc): 'jpgenc@0,0', 'jpgenc@1,0' do not match any of the regexes: '^jpgenc@[0-9a-f]+$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mt8195-jpegenc.yaml
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r1.dtb: rt1019p (realtek,rt1019p): 'label' does not match any of the regexes: '^pinctrl-[0-9]+$'
--
>> arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r2.dtb: pmic (mediatek,mt6359): '#sound-dai-cells' does not match any of the regexes: '^pinctrl-[0-9]+$', '^vs(ys|[12])-ldo[1-9]-supply$', '^vsys-v[a-z]+[0-9]*-supply$'
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r2.dtb: infra-iommu@10315000 (mediatek,mt8195-iommu-infra): interrupts: [[0, 795, 4, 0], [0, 796, 4, 0], [0, 797, 4, 0], [0, 798, 4, 0], [0, 799, 4, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/mediatek,iommu.yaml
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r2.dtb: pmic@34 (mediatek,mt6360): #interrupt-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6360.yaml
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r2.dtb: jpeg-decoder@1a040000 (mediatek,mt8195-jpgdec): 'jpgdec@0,0', 'jpgdec@0,10000', 'jpgdec@1,0' do not match any of the regexes: '^jpgdec@[0-9a-f]+$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mt8195-jpegdec.yaml
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r2.dtb: jpeg-encoder@1a030000 (mediatek,mt8195-jpgenc): 'jpgenc@0,0', 'jpgenc@1,0' do not match any of the regexes: '^jpgenc@[0-9a-f]+$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mt8195-jpegenc.yaml
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r2.dtb: rt1019p (realtek,rt1019p): 'label' does not match any of the regexes: '^pinctrl-[0-9]+$'
--
>> arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r3.dtb: pmic (mediatek,mt6359): '#sound-dai-cells' does not match any of the regexes: '^pinctrl-[0-9]+$', '^vs(ys|[12])-ldo[1-9]-supply$', '^vsys-v[a-z]+[0-9]*-supply$'
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r3.dtb: infra-iommu@10315000 (mediatek,mt8195-iommu-infra): interrupts: [[0, 795, 4, 0], [0, 796, 4, 0], [0, 797, 4, 0], [0, 798, 4, 0], [0, 799, 4, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/mediatek,iommu.yaml
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r3.dtb: pmic@34 (mediatek,mt6360): #interrupt-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6360.yaml
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r3.dtb: jpeg-decoder@1a040000 (mediatek,mt8195-jpgdec): 'jpgdec@0,0', 'jpgdec@0,10000', 'jpgdec@1,0' do not match any of the regexes: '^jpgdec@[0-9a-f]+$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mt8195-jpegdec.yaml
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r3.dtb: jpeg-encoder@1a030000 (mediatek,mt8195-jpgenc): 'jpgenc@0,0', 'jpgenc@1,0' do not match any of the regexes: '^jpgenc@[0-9a-f]+$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mt8195-jpegenc.yaml
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r3.dtb: rt1019p (realtek,rt1019p): 'label' does not match any of the regexes: '^pinctrl-[0-9]+$'
--
>> arch/arm64/boot/dts/mediatek/mt8195-demo.dtb: pmic (mediatek,mt6359): '#sound-dai-cells' does not match any of the regexes: '^pinctrl-[0-9]+$', '^vs(ys|[12])-ldo[1-9]-supply$', '^vsys-v[a-z]+[0-9]*-supply$'
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml
   arch/arm64/boot/dts/mediatek/mt8195-demo.dtb: infra-iommu@10315000 (mediatek,mt8195-iommu-infra): interrupts: [[0, 795, 4, 0], [0, 796, 4, 0], [0, 797, 4, 0], [0, 798, 4, 0], [0, 799, 4, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/mediatek,iommu.yaml
   arch/arm64/boot/dts/mediatek/mt8195-demo.dtb: jpeg-decoder@1a040000 (mediatek,mt8195-jpgdec): 'jpgdec@0,0', 'jpgdec@0,10000', 'jpgdec@1,0' do not match any of the regexes: '^jpgdec@[0-9a-f]+$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mt8195-jpegdec.yaml
   arch/arm64/boot/dts/mediatek/mt8195-demo.dtb: jpeg-encoder@1a030000 (mediatek,mt8195-jpgenc): 'jpgenc@0,0', 'jpgenc@1,0' do not match any of the regexes: '^jpgenc@[0-9a-f]+$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mt8195-jpegenc.yaml
--
>> arch/arm64/boot/dts/mediatek/mt8370-genio-510-evk.dtb: pmic (mediatek,mt6359): '#sound-dai-cells' does not match any of the regexes: '^pinctrl-[0-9]+$', '^vs(ys|[12])-ldo[1-9]-supply$', '^vsys-v[a-z]+[0-9]*-supply$'
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml
   arch/arm64/boot/dts/mediatek/mt8370-genio-510-evk.dtb: scp@10720000 (mediatek,mt8188-scp-dual): reg-names: ['cfg'] is too short
   	from schema $id: http://devicetree.org/schemas/remoteproc/mtk,scp.yaml
   arch/arm64/boot/dts/mediatek/mt8370-genio-510-evk.dtb: scp@10720000 (mediatek,mt8188-scp-dual): reg: [[0, 275906560, 0, 917504]] is too short
   	from schema $id: http://devicetree.org/schemas/remoteproc/mtk,scp.yaml
   arch/arm64/boot/dts/mediatek/mt8370-genio-510-evk.dtb: scp@10720000 (mediatek,mt8188-scp-dual): reg-names: ['cfg'] is too short
   	from schema $id: http://devicetree.org/schemas/remoteproc/mtk,scp.yaml
--
   arch/arm64/boot/dts/mediatek/mt8370-grinn-genio-510-sbc.dtb: pinctrl@10005000 (mediatek,mt8188-pinctrl): 'pcie-default' does not match any of the regexes: '-pins$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8188-pinctrl.yaml
>> arch/arm64/boot/dts/mediatek/mt8370-grinn-genio-510-sbc.dtb: pmic (mediatek,mt6359): '#sound-dai-cells' does not match any of the regexes: '^pinctrl-[0-9]+$', '^vs(ys|[12])-ldo[1-9]-supply$', '^vsys-v[a-z]+[0-9]*-supply$'
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml
   arch/arm64/boot/dts/mediatek/mt8370-grinn-genio-510-sbc.dtb: scp@10720000 (mediatek,mt8188-scp-dual): reg-names: ['cfg'] is too short
   	from schema $id: http://devicetree.org/schemas/remoteproc/mtk,scp.yaml
   arch/arm64/boot/dts/mediatek/mt8370-grinn-genio-510-sbc.dtb: scp@10720000 (mediatek,mt8188-scp-dual): reg: [[0, 275906560, 0, 917504]] is too short
   	from schema $id: http://devicetree.org/schemas/remoteproc/mtk,scp.yaml
   arch/arm64/boot/dts/mediatek/mt8370-grinn-genio-510-sbc.dtb: scp@10720000 (mediatek,mt8188-scp-dual): reg-names: ['cfg'] is too short
   	from schema $id: http://devicetree.org/schemas/remoteproc/mtk,scp.yaml
   arch/arm64/boot/dts/mediatek/mt8370-grinn-genio-510-sbc.dtb: usb@112a1000 (mediatek,mt8188-mtu3): usb@0:hub@1:compatible: ['microchip,usb2513bi'] does not contain items matching the given schema
   	from schema $id: http://devicetree.org/schemas/usb/mediatek,mtu3.yaml
   arch/arm64/boot/dts/mediatek/mt8370-grinn-genio-510-sbc.dtb: usb@0 (mediatek,mt8188-xhci): hub@1:compatible: ['microchip,usb2513bi'] does not contain items matching the given schema
--
   arch/arm64/boot/dts/mediatek/mt8390-tungsten-smarc.dtsi:945.13-965.4: Warning (avoid_unnecessary_addr_size): /soc/usb@112a1000/usb@0/ethernet@1: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/mediatek/mt8188.dtsi:3081.27-3094.5: Warning (avoid_unnecessary_addr_size): /soc/dsi@1c008000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/arm64/boot/dts/mediatek/mt8370-tungsten-smarc.dtb: pmic (mediatek,mt6359): '#sound-dai-cells' does not match any of the regexes: '^pinctrl-[0-9]+$', '^vs(ys|[12])-ldo[1-9]-supply$', '^vsys-v[a-z]+[0-9]*-supply$'
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml
   arch/arm64/boot/dts/mediatek/mt8370-tungsten-smarc.dtb: scp@10720000 (mediatek,mt8188-scp-dual): reg-names: ['cfg'] is too short
   	from schema $id: http://devicetree.org/schemas/remoteproc/mtk,scp.yaml
   arch/arm64/boot/dts/mediatek/mt8370-tungsten-smarc.dtb: scp@10720000 (mediatek,mt8188-scp-dual): reg: [[0, 275906560, 0, 917504]] is too short
   	from schema $id: http://devicetree.org/schemas/remoteproc/mtk,scp.yaml
   arch/arm64/boot/dts/mediatek/mt8370-tungsten-smarc.dtb: scp@10720000 (mediatek,mt8188-scp-dual): reg-names: ['cfg'] is too short
   	from schema $id: http://devicetree.org/schemas/remoteproc/mtk,scp.yaml
--
>> arch/arm64/boot/dts/mediatek/mt8395-genio-1200-evk.dtb: pmic (mediatek,mt6359): '#sound-dai-cells' does not match any of the regexes: '^pinctrl-[0-9]+$', '^vs(ys|[12])-ldo[1-9]-supply$', '^vsys-v[a-z]+[0-9]*-supply$'
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml
   arch/arm64/boot/dts/mediatek/mt8395-genio-1200-evk.dtb: infra-iommu@10315000 (mediatek,mt8195-iommu-infra): interrupts: [[0, 795, 4, 0], [0, 796, 4, 0], [0, 797, 4, 0], [0, 798, 4, 0], [0, 799, 4, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/mediatek,iommu.yaml
   arch/arm64/boot/dts/mediatek/mt8395-genio-1200-evk.dtb: jpeg-decoder@1a040000 (mediatek,mt8195-jpgdec): 'jpgdec@0,0', 'jpgdec@0,10000', 'jpgdec@1,0' do not match any of the regexes: '^jpgdec@[0-9a-f]+$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mt8195-jpegdec.yaml
   arch/arm64/boot/dts/mediatek/mt8395-genio-1200-evk.dtb: jpeg-encoder@1a030000 (mediatek,mt8195-jpgenc): 'jpgenc@0,0', 'jpgenc@1,0' do not match any of the regexes: '^jpgenc@[0-9a-f]+$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mt8195-jpegenc.yaml
--
>> arch/arm64/boot/dts/mediatek/mt8395-genio-1200-evk-ufs.dtb: pmic (mediatek,mt6359): '#sound-dai-cells' does not match any of the regexes: '^pinctrl-[0-9]+$', '^vs(ys|[12])-ldo[1-9]-supply$', '^vsys-v[a-z]+[0-9]*-supply$'
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml
   arch/arm64/boot/dts/mediatek/mt8395-genio-1200-evk-ufs.dtb: infra-iommu@10315000 (mediatek,mt8195-iommu-infra): interrupts: [[0, 795, 4, 0], [0, 796, 4, 0], [0, 797, 4, 0], [0, 798, 4, 0], [0, 799, 4, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/mediatek,iommu.yaml
   arch/arm64/boot/dts/mediatek/mt8395-genio-1200-evk-ufs.dtb: jpeg-decoder@1a040000 (mediatek,mt8195-jpgdec): 'jpgdec@0,0', 'jpgdec@0,10000', 'jpgdec@1,0' do not match any of the regexes: '^jpgdec@[0-9a-f]+$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mt8195-jpegdec.yaml
   arch/arm64/boot/dts/mediatek/mt8395-genio-1200-evk-ufs.dtb: jpeg-encoder@1a030000 (mediatek,mt8195-jpgenc): 'jpgenc@0,0', 'jpgenc@1,0' do not match any of the regexes: '^jpgenc@[0-9a-f]+$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mt8195-jpegenc.yaml
--
>> arch/arm64/boot/dts/mediatek/mt8390-genio-700-evk.dtb: pmic (mediatek,mt6359): '#sound-dai-cells' does not match any of the regexes: '^pinctrl-[0-9]+$', '^vs(ys|[12])-ldo[1-9]-supply$', '^vsys-v[a-z]+[0-9]*-supply$'
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml
   arch/arm64/boot/dts/mediatek/mt8390-genio-700-evk.dtb: scp@10720000 (mediatek,mt8188-scp-dual): reg-names: ['cfg'] is too short
   	from schema $id: http://devicetree.org/schemas/remoteproc/mtk,scp.yaml
   arch/arm64/boot/dts/mediatek/mt8390-genio-700-evk.dtb: scp@10720000 (mediatek,mt8188-scp-dual): reg: [[0, 275906560, 0, 917504]] is too short
   	from schema $id: http://devicetree.org/schemas/remoteproc/mtk,scp.yaml
   arch/arm64/boot/dts/mediatek/mt8390-genio-700-evk.dtb: scp@10720000 (mediatek,mt8188-scp-dual): reg-names: ['cfg'] is too short
   	from schema $id: http://devicetree.org/schemas/remoteproc/mtk,scp.yaml
--
   arch/arm64/boot/dts/mediatek/mt8390-grinn-genio-700-sbc.dtb: pinctrl@10005000 (mediatek,mt8188-pinctrl): 'pcie-default' does not match any of the regexes: '-pins$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8188-pinctrl.yaml
>> arch/arm64/boot/dts/mediatek/mt8390-grinn-genio-700-sbc.dtb: pmic (mediatek,mt6359): '#sound-dai-cells' does not match any of the regexes: '^pinctrl-[0-9]+$', '^vs(ys|[12])-ldo[1-9]-supply$', '^vsys-v[a-z]+[0-9]*-supply$'
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml
   arch/arm64/boot/dts/mediatek/mt8390-grinn-genio-700-sbc.dtb: scp@10720000 (mediatek,mt8188-scp-dual): reg-names: ['cfg'] is too short
   	from schema $id: http://devicetree.org/schemas/remoteproc/mtk,scp.yaml
   arch/arm64/boot/dts/mediatek/mt8390-grinn-genio-700-sbc.dtb: scp@10720000 (mediatek,mt8188-scp-dual): reg: [[0, 275906560, 0, 917504]] is too short
   	from schema $id: http://devicetree.org/schemas/remoteproc/mtk,scp.yaml
   arch/arm64/boot/dts/mediatek/mt8390-grinn-genio-700-sbc.dtb: scp@10720000 (mediatek,mt8188-scp-dual): reg-names: ['cfg'] is too short
   	from schema $id: http://devicetree.org/schemas/remoteproc/mtk,scp.yaml
   arch/arm64/boot/dts/mediatek/mt8390-grinn-genio-700-sbc.dtb: usb@112a1000 (mediatek,mt8188-mtu3): usb@0:hub@1:compatible: ['microchip,usb2513bi'] does not contain items matching the given schema
   	from schema $id: http://devicetree.org/schemas/usb/mediatek,mtu3.yaml
   arch/arm64/boot/dts/mediatek/mt8390-grinn-genio-700-sbc.dtb: usb@0 (mediatek,mt8188-xhci): hub@1:compatible: ['microchip,usb2513bi'] does not contain items matching the given schema
--
   arch/arm64/boot/dts/mediatek/mt8390-tungsten-smarc.dtsi:945.13-965.4: Warning (avoid_unnecessary_addr_size): /soc/usb@112a1000/usb@0/ethernet@1: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/mediatek/mt8188.dtsi:3081.27-3094.5: Warning (avoid_unnecessary_addr_size): /soc/dsi@1c008000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/arm64/boot/dts/mediatek/mt8390-tungsten-smarc.dtb: pmic (mediatek,mt6359): '#sound-dai-cells' does not match any of the regexes: '^pinctrl-[0-9]+$', '^vs(ys|[12])-ldo[1-9]-supply$', '^vsys-v[a-z]+[0-9]*-supply$'
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml
   arch/arm64/boot/dts/mediatek/mt8390-tungsten-smarc.dtb: scp@10720000 (mediatek,mt8188-scp-dual): reg-names: ['cfg'] is too short
   	from schema $id: http://devicetree.org/schemas/remoteproc/mtk,scp.yaml
   arch/arm64/boot/dts/mediatek/mt8390-tungsten-smarc.dtb: scp@10720000 (mediatek,mt8188-scp-dual): reg: [[0, 275906560, 0, 917504]] is too short
   	from schema $id: http://devicetree.org/schemas/remoteproc/mtk,scp.yaml
   arch/arm64/boot/dts/mediatek/mt8390-tungsten-smarc.dtb: scp@10720000 (mediatek,mt8188-scp-dual): reg-names: ['cfg'] is too short
   	from schema $id: http://devicetree.org/schemas/remoteproc/mtk,scp.yaml
--
>> arch/arm64/boot/dts/mediatek/mt8395-kontron-3-5-sbc-i1200.dtb: pmic (mediatek,mt6359): '#sound-dai-cells' does not match any of the regexes: '^pinctrl-[0-9]+$', '^vs(ys|[12])-ldo[1-9]-supply$', '^vsys-v[a-z]+[0-9]*-supply$'
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml
   arch/arm64/boot/dts/mediatek/mt8395-kontron-3-5-sbc-i1200.dtb: infra-iommu@10315000 (mediatek,mt8195-iommu-infra): interrupts: [[0, 795, 4, 0], [0, 796, 4, 0], [0, 797, 4, 0], [0, 798, 4, 0], [0, 799, 4, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/mediatek,iommu.yaml
   arch/arm64/boot/dts/mediatek/mt8395-kontron-3-5-sbc-i1200.dtb: jpeg-decoder@1a040000 (mediatek,mt8195-jpgdec): 'jpgdec@0,0', 'jpgdec@0,10000', 'jpgdec@1,0' do not match any of the regexes: '^jpgdec@[0-9a-f]+$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mt8195-jpegdec.yaml
   arch/arm64/boot/dts/mediatek/mt8395-kontron-3-5-sbc-i1200.dtb: jpeg-encoder@1a030000 (mediatek,mt8195-jpgenc): 'jpgenc@0,0', 'jpgenc@1,0' do not match any of the regexes: '^jpgenc@[0-9a-f]+$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mt8195-jpegenc.yaml
--
   arch/arm64/boot/dts/mediatek/mt8195.dtsi:3378.22-3390.5: Warning (avoid_unnecessary_addr_size): /soc/dsi@1c008000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l.dtb: pmic (mediatek,mt6359): '#sound-dai-cells' does not match any of the regexes: '^pinctrl-[0-9]+$', '^vs(ys|[12])-ldo[1-9]-supply$', '^vsys-v[a-z]+[0-9]*-supply$'
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml
   arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l.dtb: infra-iommu@10315000 (mediatek,mt8195-iommu-infra): interrupts: [[0, 795, 4, 0], [0, 796, 4, 0], [0, 797, 4, 0], [0, 798, 4, 0], [0, 799, 4, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/mediatek,iommu.yaml
   arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l.dtb: jpeg-decoder@1a040000 (mediatek,mt8195-jpgdec): 'jpgdec@0,0', 'jpgdec@0,10000', 'jpgdec@1,0' do not match any of the regexes: '^jpgdec@[0-9a-f]+$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mt8195-jpegdec.yaml
   arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l.dtb: jpeg-encoder@1a030000 (mediatek,mt8195-jpgenc): 'jpgenc@0,0', 'jpgenc@1,0' do not match any of the regexes: '^jpgenc@[0-9a-f]+$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mt8195-jpegenc.yaml
--
>> arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l-8-hd-panel.dtb: pmic (mediatek,mt6359): '#sound-dai-cells' does not match any of the regexes: '^pinctrl-[0-9]+$', '^vs(ys|[12])-ldo[1-9]-supply$', '^vsys-v[a-z]+[0-9]*-supply$'
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml
   arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l-8-hd-panel.dtb: infra-iommu@10315000 (mediatek,mt8195-iommu-infra): interrupts: [[0, 795, 4, 0], [0, 796, 4, 0], [0, 797, 4, 0], [0, 798, 4, 0], [0, 799, 4, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/mediatek,iommu.yaml
   arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l-8-hd-panel.dtb: jpeg-decoder@1a040000 (mediatek,mt8195-jpgdec): 'jpgdec@0,0', 'jpgdec@0,10000', 'jpgdec@1,0' do not match any of the regexes: '^jpgdec@[0-9a-f]+$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mt8195-jpegdec.yaml
   arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l-8-hd-panel.dtb: jpeg-encoder@1a030000 (mediatek,mt8195-jpgenc): 'jpgenc@0,0', 'jpgenc@1,0' do not match any of the regexes: '^jpgenc@[0-9a-f]+$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mt8195-jpegenc.yaml

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
