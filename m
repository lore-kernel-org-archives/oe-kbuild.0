Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D48023491E1
	for <oe-kbuild@lists.linux.dev>; Wed, 13 May 2026 16:30:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778689849; cv=none; b=VQRA3hw/HyGXOmYmK+RsX9PHhdEHatrSraMnyKJW9hZpJSH79ACsl1wPW/VYYMhPFUV7+jiHzWkm2EaUFXh5WHORAIa+gH+af2KP5eUIAkmmxTrF7rbU7QnhB1Rm1C9T2Hsxl+xlD7Lvu1C3O574n6K4+rSF2r0XSHw/QUvIF1k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778689849; c=relaxed/simple;
	bh=IHyeN7nTXd1lHVRE1VzGHrDJcBRU4GD+8JOKs+vhzRY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=aSP94T+LPVDAkvogWIBxrG3BxVGHPNShjb4BshBfAb1FJ4psFmRYCn/uhxyp7OQ/hlSq/vlQ8AWstbDdrbf/1ibm8JP/tOcm/dUcBtCGIfZ1ClqlKqTF7G3Y82NzVwHAx+TIPBQl9puyT7skvEEvaacvdFy69idzp9h6pV9HYwg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Kqla2myF; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Kqla2myF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778689847; x=1810225847;
  h=date:from:to:cc:subject:message-id;
  bh=IHyeN7nTXd1lHVRE1VzGHrDJcBRU4GD+8JOKs+vhzRY=;
  b=Kqla2myFVSDZBemAZIakTJHhu+sm0lBZfZyMTQZnsAnq76zT528Eb9Yu
   In2AnItZK4z4G4grIr5bG2G7FeuWnGym3tuo82GBpSDUSLh2TXGBgpk2d
   koOR7VckK1IoklbnNov585BOYY0IcxEHx8b5/DD1iq27N7bV226l1cisz
   QWN5S4Jon3KdQqgffy9A6mhkzKPhz2qxIatT1BiDq2IOoL6Ymta4koYcu
   KoiOw5XVQMIKn/jy6WbZ2N4XkLVymOExMmGorAHdWkhIZoiAJggO3CT/G
   2GpYp6mCa8EQ6t0mTZyTKnN5UKM1TFH1iE/OSWVEQDxgK955BrDu3ze69
   Q==;
X-CSE-ConnectionGUID: dwHar2mdRyyG+0Gp/+CnZA==
X-CSE-MsgGUID: z6BZSbYkSE+/0BgUjXHknA==
X-IronPort-AV: E=McAfee;i="6800,10657,11785"; a="83474837"
X-IronPort-AV: E=Sophos;i="6.23,233,1770624000"; 
   d="scan'208";a="83474837"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2026 09:30:46 -0700
X-CSE-ConnectionGUID: KbnhlswSSpyDeP+rcWJM6g==
X-CSE-MsgGUID: rrQdZ6ZiTeSbXmDsz+6EeQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,233,1770624000"; 
   d="scan'208";a="237274791"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by orviesa010.jf.intel.com with ESMTP; 13 May 2026 09:30:45 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wNCTq-000000008ah-3Ba6;
	Wed, 13 May 2026 16:30:42 +0000
Date: Wed, 13 May 2026 18:30:32 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [mediatek:v7.1-next/dts64 2/32]
 arch/arm64/boot/dts/mediatek/mt8370-genio-510-evk.dtb: pmic
 (mediatek,mt6365): '#sound-dai-cells' does not match any of the regexes:
 '^pinctrl-[0-9]+$'
Message-ID: <202605131817.ERRabvJf-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "dtcheck: binding changes may go via different trees"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: "Louis-Alexis Eyraud" <louisalexis.eyraud@collabora.com>
CC: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mediatek/linux.git v7.1-next/dts64
head:   7264d37c63139f2ce8c073ead1ed4409fbba12d6
commit: 0ca0b18071dbdd19ea2aab042572ac261c7f0cfb [2/32] arm64: dts: mediatek: mt8390-genio-common: use MT6365 PMIC definitions
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: arm64-randconfig-2055-20260512 (https://download.01.org/0day-ci/archive/20260513/202605131817.ERRabvJf-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.3.0
dtschema: 2026.5.dev9+gdf9ad30c5
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260513/202605131817.ERRabvJf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202605131817.ERRabvJf-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/mediatek/mt8370-genio-510-evk.dtb: pmic (mediatek,mt6365): '#sound-dai-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml
>> arch/arm64/boot/dts/mediatek/mt8370-genio-510-evk.dtb: pmic (mediatek,mt6365): adc:compatible:0: 'mediatek,mt6365-auxadc' is not one of ['mediatek,mt6357-auxadc', 'mediatek,mt6358-auxadc', 'mediatek,mt6359-auxadc', 'mediatek,mt6363-auxadc', 'mediatek,mt6373-auxadc']
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml
>> arch/arm64/boot/dts/mediatek/mt8370-genio-510-evk.dtb: pmic (mediatek,mt6365): adc:compatible: ['mediatek,mt6365-auxadc', 'mediatek,mt6359-auxadc'] is too long
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml
>> arch/arm64/boot/dts/mediatek/mt8370-genio-510-evk.dtb: pmic (mediatek,mt6365): audio-codec:compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt6365-codec', 'mediatek,mt6359-codec'] is too long
   	'mediatek,mt6365-codec' is not one of ['mediatek,mt6358-sound', 'mediatek,mt6359-codec', 'mediatek,mt6397-codec']
   	'mediatek,mt6365-codec' is not one of ['mediatek,mt6366-sound']
   	'mediatek,mt6358-sound' was expected
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml
>> arch/arm64/boot/dts/mediatek/mt8370-genio-510-evk.dtb: pmic (mediatek,mt6365): compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt6365', 'mediatek,mt6359'] is too long
   	'mediatek,mt6365' is not one of ['mediatek,mt6323', 'mediatek,mt6331', 'mediatek,mt6328', 'mediatek,mt6358', 'mediatek,mt6359', 'mediatek,mt6397']
   	'mediatek,mt6365' is not one of ['mediatek,mt6366']
   	'mediatek,mt6358' was expected
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml
>> arch/arm64/boot/dts/mediatek/mt8370-genio-510-evk.dtb: pmic (mediatek,mt6365): keys:compatible:0: 'mediatek,mt6365-keys' is not one of ['mediatek,mt6323-keys', 'mediatek,mt6328-keys', 'mediatek,mt6331-keys', 'mediatek,mt6357-keys', 'mediatek,mt6358-keys', 'mediatek,mt6359-keys', 'mediatek,mt6397-keys']
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml
>> arch/arm64/boot/dts/mediatek/mt8370-genio-510-evk.dtb: pmic (mediatek,mt6365): keys:compatible: ['mediatek,mt6365-keys', 'mediatek,mt6359-keys'] is too long
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml
>> arch/arm64/boot/dts/mediatek/mt8370-genio-510-evk.dtb: pmic (mediatek,mt6365): regulators:compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt6365-regulator', 'mediatek,mt6359-regulator'] is too long
   	'mediatek,mt6365-regulator' is not one of ['mediatek,mt6323-regulator', 'mediatek,mt6328-regulator', 'mediatek,mt6331-regulator', 'mediatek,mt6358-regulator', 'mediatek,mt6359-regulator', 'mediatek,mt6397-regulator']
   	'mediatek,mt6365-regulator' is not one of ['mediatek,mt6366-regulator']
   	'mediatek,mt6358-regulator' was expected
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml
>> arch/arm64/boot/dts/mediatek/mt8370-genio-510-evk.dtb: pmic (mediatek,mt6365): rtc:compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt6365-rtc', 'mediatek,mt6358-rtc'] is too long
   	'mediatek,mt6365-rtc' is not one of ['mediatek,mt6323-rtc', 'mediatek,mt6331-rtc', 'mediatek,mt6358-rtc', 'mediatek,mt6397-rtc']
   	'mediatek,mt6365-rtc' is not one of ['mediatek,mt6366-rtc']
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml
>> arch/arm64/boot/dts/mediatek/mt8370-genio-510-evk.dtb: /soc/pwrap@10024000/pmic: failed to match any schema with compatible: ['mediatek,mt6365', 'mediatek,mt6359']
>> arch/arm64/boot/dts/mediatek/mt8370-genio-510-evk.dtb: adc (mediatek,mt6365-auxadc): compatible:0: 'mediatek,mt6365-auxadc' is not one of ['mediatek,mt6357-auxadc', 'mediatek,mt6358-auxadc', 'mediatek,mt6359-auxadc', 'mediatek,mt6363-auxadc', 'mediatek,mt6373-auxadc']
   	from schema $id: http://devicetree.org/schemas/iio/adc/mediatek,mt6359-auxadc.yaml
>> arch/arm64/boot/dts/mediatek/mt8370-genio-510-evk.dtb: adc (mediatek,mt6365-auxadc): compatible: ['mediatek,mt6365-auxadc', 'mediatek,mt6359-auxadc'] is too long
   	from schema $id: http://devicetree.org/schemas/iio/adc/mediatek,mt6359-auxadc.yaml
>> arch/arm64/boot/dts/mediatek/mt8370-genio-510-evk.dtb: /soc/pwrap@10024000/pmic/adc: failed to match any schema with compatible: ['mediatek,mt6365-auxadc', 'mediatek,mt6359-auxadc']
>> arch/arm64/boot/dts/mediatek/mt8370-genio-510-evk.dtb: /soc/pwrap@10024000/pmic/audio-codec: failed to match any schema with compatible: ['mediatek,mt6365-codec', 'mediatek,mt6359-codec']
>> arch/arm64/boot/dts/mediatek/mt8370-genio-510-evk.dtb: /soc/pwrap@10024000/pmic/regulators: failed to match any schema with compatible: ['mediatek,mt6365-regulator', 'mediatek,mt6359-regulator']
>> arch/arm64/boot/dts/mediatek/mt8370-genio-510-evk.dtb: /soc/pwrap@10024000/pmic/rtc: failed to match any schema with compatible: ['mediatek,mt6365-rtc', 'mediatek,mt6358-rtc']
>> arch/arm64/boot/dts/mediatek/mt8370-genio-510-evk.dtb: keys (mediatek,mt6365-keys): compatible:0: 'mediatek,mt6365-keys' is not one of ['mediatek,mt6323-keys', 'mediatek,mt6328-keys', 'mediatek,mt6331-keys', 'mediatek,mt6357-keys', 'mediatek,mt6358-keys', 'mediatek,mt6359-keys', 'mediatek,mt6397-keys']
   	from schema $id: http://devicetree.org/schemas/input/mediatek,pmic-keys.yaml
>> arch/arm64/boot/dts/mediatek/mt8370-genio-510-evk.dtb: keys (mediatek,mt6365-keys): compatible: ['mediatek,mt6365-keys', 'mediatek,mt6359-keys'] is too long
   	from schema $id: http://devicetree.org/schemas/input/mediatek,pmic-keys.yaml
>> arch/arm64/boot/dts/mediatek/mt8370-genio-510-evk.dtb: /soc/pwrap@10024000/pmic/keys: failed to match any schema with compatible: ['mediatek,mt6365-keys', 'mediatek,mt6359-keys']
   arch/arm64/boot/dts/mediatek/mt8370-genio-510-evk.dtb: scp@10720000 (mediatek,mt8188-scp-dual): reg-names: ['cfg'] is too short
   	from schema $id: http://devicetree.org/schemas/remoteproc/mtk,scp.yaml
   arch/arm64/boot/dts/mediatek/mt8370-genio-510-evk.dtb: scp@10720000 (mediatek,mt8188-scp-dual): reg: [[0, 275906560, 0, 917504]] is too short
   	from schema $id: http://devicetree.org/schemas/remoteproc/mtk,scp.yaml
   arch/arm64/boot/dts/mediatek/mt8370-genio-510-evk.dtb: scp@10720000 (mediatek,mt8188-scp-dual): reg-names: ['cfg'] is too short
   	from schema $id: http://devicetree.org/schemas/remoteproc/mtk,scp.yaml
--
>> arch/arm64/boot/dts/mediatek/mt8390-genio-700-evk.dtb: pmic (mediatek,mt6365): '#sound-dai-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml
>> arch/arm64/boot/dts/mediatek/mt8390-genio-700-evk.dtb: pmic (mediatek,mt6365): adc:compatible:0: 'mediatek,mt6365-auxadc' is not one of ['mediatek,mt6357-auxadc', 'mediatek,mt6358-auxadc', 'mediatek,mt6359-auxadc', 'mediatek,mt6363-auxadc', 'mediatek,mt6373-auxadc']
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml
>> arch/arm64/boot/dts/mediatek/mt8390-genio-700-evk.dtb: pmic (mediatek,mt6365): adc:compatible: ['mediatek,mt6365-auxadc', 'mediatek,mt6359-auxadc'] is too long
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml
>> arch/arm64/boot/dts/mediatek/mt8390-genio-700-evk.dtb: pmic (mediatek,mt6365): audio-codec:compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt6365-codec', 'mediatek,mt6359-codec'] is too long
   	'mediatek,mt6365-codec' is not one of ['mediatek,mt6358-sound', 'mediatek,mt6359-codec', 'mediatek,mt6397-codec']
   	'mediatek,mt6365-codec' is not one of ['mediatek,mt6366-sound']
   	'mediatek,mt6358-sound' was expected
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml
>> arch/arm64/boot/dts/mediatek/mt8390-genio-700-evk.dtb: pmic (mediatek,mt6365): compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt6365', 'mediatek,mt6359'] is too long
   	'mediatek,mt6365' is not one of ['mediatek,mt6323', 'mediatek,mt6331', 'mediatek,mt6328', 'mediatek,mt6358', 'mediatek,mt6359', 'mediatek,mt6397']
   	'mediatek,mt6365' is not one of ['mediatek,mt6366']
   	'mediatek,mt6358' was expected
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml
>> arch/arm64/boot/dts/mediatek/mt8390-genio-700-evk.dtb: pmic (mediatek,mt6365): keys:compatible:0: 'mediatek,mt6365-keys' is not one of ['mediatek,mt6323-keys', 'mediatek,mt6328-keys', 'mediatek,mt6331-keys', 'mediatek,mt6357-keys', 'mediatek,mt6358-keys', 'mediatek,mt6359-keys', 'mediatek,mt6397-keys']
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml
>> arch/arm64/boot/dts/mediatek/mt8390-genio-700-evk.dtb: pmic (mediatek,mt6365): keys:compatible: ['mediatek,mt6365-keys', 'mediatek,mt6359-keys'] is too long
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml
>> arch/arm64/boot/dts/mediatek/mt8390-genio-700-evk.dtb: pmic (mediatek,mt6365): regulators:compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt6365-regulator', 'mediatek,mt6359-regulator'] is too long
   	'mediatek,mt6365-regulator' is not one of ['mediatek,mt6323-regulator', 'mediatek,mt6328-regulator', 'mediatek,mt6331-regulator', 'mediatek,mt6358-regulator', 'mediatek,mt6359-regulator', 'mediatek,mt6397-regulator']
   	'mediatek,mt6365-regulator' is not one of ['mediatek,mt6366-regulator']
   	'mediatek,mt6358-regulator' was expected
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml
>> arch/arm64/boot/dts/mediatek/mt8390-genio-700-evk.dtb: pmic (mediatek,mt6365): rtc:compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt6365-rtc', 'mediatek,mt6358-rtc'] is too long
   	'mediatek,mt6365-rtc' is not one of ['mediatek,mt6323-rtc', 'mediatek,mt6331-rtc', 'mediatek,mt6358-rtc', 'mediatek,mt6397-rtc']
   	'mediatek,mt6365-rtc' is not one of ['mediatek,mt6366-rtc']
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml
>> arch/arm64/boot/dts/mediatek/mt8390-genio-700-evk.dtb: /soc/pwrap@10024000/pmic: failed to match any schema with compatible: ['mediatek,mt6365', 'mediatek,mt6359']
>> arch/arm64/boot/dts/mediatek/mt8390-genio-700-evk.dtb: adc (mediatek,mt6365-auxadc): compatible:0: 'mediatek,mt6365-auxadc' is not one of ['mediatek,mt6357-auxadc', 'mediatek,mt6358-auxadc', 'mediatek,mt6359-auxadc', 'mediatek,mt6363-auxadc', 'mediatek,mt6373-auxadc']
   	from schema $id: http://devicetree.org/schemas/iio/adc/mediatek,mt6359-auxadc.yaml
>> arch/arm64/boot/dts/mediatek/mt8390-genio-700-evk.dtb: adc (mediatek,mt6365-auxadc): compatible: ['mediatek,mt6365-auxadc', 'mediatek,mt6359-auxadc'] is too long
   	from schema $id: http://devicetree.org/schemas/iio/adc/mediatek,mt6359-auxadc.yaml
>> arch/arm64/boot/dts/mediatek/mt8390-genio-700-evk.dtb: /soc/pwrap@10024000/pmic/adc: failed to match any schema with compatible: ['mediatek,mt6365-auxadc', 'mediatek,mt6359-auxadc']
>> arch/arm64/boot/dts/mediatek/mt8390-genio-700-evk.dtb: /soc/pwrap@10024000/pmic/audio-codec: failed to match any schema with compatible: ['mediatek,mt6365-codec', 'mediatek,mt6359-codec']
>> arch/arm64/boot/dts/mediatek/mt8390-genio-700-evk.dtb: /soc/pwrap@10024000/pmic/regulators: failed to match any schema with compatible: ['mediatek,mt6365-regulator', 'mediatek,mt6359-regulator']
>> arch/arm64/boot/dts/mediatek/mt8390-genio-700-evk.dtb: /soc/pwrap@10024000/pmic/rtc: failed to match any schema with compatible: ['mediatek,mt6365-rtc', 'mediatek,mt6358-rtc']
>> arch/arm64/boot/dts/mediatek/mt8390-genio-700-evk.dtb: keys (mediatek,mt6365-keys): compatible:0: 'mediatek,mt6365-keys' is not one of ['mediatek,mt6323-keys', 'mediatek,mt6328-keys', 'mediatek,mt6331-keys', 'mediatek,mt6357-keys', 'mediatek,mt6358-keys', 'mediatek,mt6359-keys', 'mediatek,mt6397-keys']
   	from schema $id: http://devicetree.org/schemas/input/mediatek,pmic-keys.yaml
>> arch/arm64/boot/dts/mediatek/mt8390-genio-700-evk.dtb: keys (mediatek,mt6365-keys): compatible: ['mediatek,mt6365-keys', 'mediatek,mt6359-keys'] is too long
   	from schema $id: http://devicetree.org/schemas/input/mediatek,pmic-keys.yaml
>> arch/arm64/boot/dts/mediatek/mt8390-genio-700-evk.dtb: /soc/pwrap@10024000/pmic/keys: failed to match any schema with compatible: ['mediatek,mt6365-keys', 'mediatek,mt6359-keys']
   arch/arm64/boot/dts/mediatek/mt8390-genio-700-evk.dtb: scp@10720000 (mediatek,mt8188-scp-dual): reg-names: ['cfg'] is too short
   	from schema $id: http://devicetree.org/schemas/remoteproc/mtk,scp.yaml
   arch/arm64/boot/dts/mediatek/mt8390-genio-700-evk.dtb: scp@10720000 (mediatek,mt8188-scp-dual): reg: [[0, 275906560, 0, 917504]] is too short
   	from schema $id: http://devicetree.org/schemas/remoteproc/mtk,scp.yaml
   arch/arm64/boot/dts/mediatek/mt8390-genio-700-evk.dtb: scp@10720000 (mediatek,mt8188-scp-dual): reg-names: ['cfg'] is too short
   	from schema $id: http://devicetree.org/schemas/remoteproc/mtk,scp.yaml

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
