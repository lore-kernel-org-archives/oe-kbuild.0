Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06FA930DEA9
	for <oe-kbuild@lists.linux.dev>; Thu, 14 May 2026 01:27:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778722077; cv=none; b=Ly8RiOFmomtTFoNex0mCCoPHOCHzu7gtq1hIDpljCVVYcrtRuYwsBl/hhghD8+dRAo/QRMpcDgJ47+f2/nilPsTyi5+sVrMyW8OJhkecN8Hc4zpyHCHb17jFzgW7/bAVOSoPBGnAXoYkJC9WF9FTblukVkC65IOj8PJ3Z7R39Dk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778722077; c=relaxed/simple;
	bh=LzTUdxpadmVhMJG8KLli5Ipi6lFIpr6ZN4tk40veX+8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=cSaYpiv8jfBwqaTAjVhfgWeL3jwyplPiGF0QEegRML9EKwMwUS7j7FWf9LhOSQOIDJqeffAR0x7eQ0hyYY2+JVrxuPyTnakG90LqYXedZW5WkmW0Yq5m7YFEi5jxSqvpn29AgX5c0kO83wrH7DTbp6KgqWtnMJspXf/UKMo4sUE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Smid4FMT; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Smid4FMT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778722074; x=1810258074;
  h=date:from:to:cc:subject:message-id;
  bh=LzTUdxpadmVhMJG8KLli5Ipi6lFIpr6ZN4tk40veX+8=;
  b=Smid4FMTMq272OWeXh6H/sdP093ulPLqDI1hK2KFpjUSRVjD6k6AC80P
   Kwi9iJP6dqfNcQi6j5Gaqh9yC6G5YZAxBHuqN7FHo0TDRCQCovDYR0WIX
   lEvkbbPWZanubqGU6OBMYVmIHuN57Gdb6rCs2cD344mz28Uob/gTxtuKz
   u6aLuUAIhEGUSSMhFcqMS+PSrkMlwf2S7u+eotT73aBakS0zh11i8cCuh
   QC1LgecasBnBTu1F890EhPU6KSvUn403iibzMwtrLPXYxMPF5UJIOWIaX
   xQDNco1qsYp/Onk4NnmWwusfn7rEZwIADo6umrIrHqHeBrFteH7vB4cnI
   A==;
X-CSE-ConnectionGUID: RV58uE3HRimU6lbg9i0Oag==
X-CSE-MsgGUID: AqjCZ0lWRVyBJ2jpUBlUBw==
X-IronPort-AV: E=McAfee;i="6800,10657,11785"; a="82227129"
X-IronPort-AV: E=Sophos;i="6.23,233,1770624000"; 
   d="scan'208";a="82227129"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2026 18:27:53 -0700
X-CSE-ConnectionGUID: s8psKfP4Q72Ku9dw6aQTrA==
X-CSE-MsgGUID: gHbMa3l2QciqR/PuK5gX/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,233,1770624000"; 
   d="scan'208";a="238485761"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by orviesa007.jf.intel.com with ESMTP; 13 May 2026 18:27:51 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wNKrd-000000008iP-20SK;
	Thu, 14 May 2026 01:27:49 +0000
Date: Thu, 14 May 2026 03:27:34 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [mediatek:v7.1-next/dts64 4/32]
 arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l.dtb: pmic
 (mediatek,mt6365): '#sound-dai-cells' does not match any of the regexes:
 '^pinctrl-[0-9]+$'
Message-ID: <202605140324.txndqMWR-lkp@intel.com>
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
commit: f5ba6b257d934d02b7b56aeff7c65131f05f6a39 [4/32] arm64: dts: mediatek: mt8395-radxa-nio-12l: use MT6365 PMIC definitions
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: arm64-randconfig-2055-20260512 (https://download.01.org/0day-ci/archive/20260514/202605140324.txndqMWR-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.3.0
dtschema: 2026.5.dev9+gdf9ad30c5
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260514/202605140324.txndqMWR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202605140324.txndqMWR-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/mediatek/mt8195.dtsi:3378.22-3390.5: Warning (avoid_unnecessary_addr_size): /soc/dsi@1c008000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l.dtb: pmic (mediatek,mt6365): '#sound-dai-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml
>> arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l.dtb: pmic (mediatek,mt6365): adc:compatible:0: 'mediatek,mt6365-auxadc' is not one of ['mediatek,mt6357-auxadc', 'mediatek,mt6358-auxadc', 'mediatek,mt6359-auxadc', 'mediatek,mt6363-auxadc', 'mediatek,mt6373-auxadc']
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml
>> arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l.dtb: pmic (mediatek,mt6365): adc:compatible: ['mediatek,mt6365-auxadc', 'mediatek,mt6359-auxadc'] is too long
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml
>> arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l.dtb: pmic (mediatek,mt6365): audio-codec:compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt6365-codec', 'mediatek,mt6359-codec'] is too long
   	'mediatek,mt6365-codec' is not one of ['mediatek,mt6358-sound', 'mediatek,mt6359-codec', 'mediatek,mt6397-codec']
   	'mediatek,mt6365-codec' is not one of ['mediatek,mt6366-sound']
   	'mediatek,mt6358-sound' was expected
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml
>> arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l.dtb: pmic (mediatek,mt6365): compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt6365', 'mediatek,mt6359'] is too long
   	'mediatek,mt6365' is not one of ['mediatek,mt6323', 'mediatek,mt6331', 'mediatek,mt6328', 'mediatek,mt6358', 'mediatek,mt6359', 'mediatek,mt6397']
   	'mediatek,mt6365' is not one of ['mediatek,mt6366']
   	'mediatek,mt6358' was expected
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml
>> arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l.dtb: pmic (mediatek,mt6365): keys:compatible:0: 'mediatek,mt6365-keys' is not one of ['mediatek,mt6323-keys', 'mediatek,mt6328-keys', 'mediatek,mt6331-keys', 'mediatek,mt6357-keys', 'mediatek,mt6358-keys', 'mediatek,mt6359-keys', 'mediatek,mt6397-keys']
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml
>> arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l.dtb: pmic (mediatek,mt6365): keys:compatible: ['mediatek,mt6365-keys', 'mediatek,mt6359-keys'] is too long
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml
>> arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l.dtb: pmic (mediatek,mt6365): regulators:compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt6365-regulator', 'mediatek,mt6359-regulator'] is too long
   	'mediatek,mt6365-regulator' is not one of ['mediatek,mt6323-regulator', 'mediatek,mt6328-regulator', 'mediatek,mt6331-regulator', 'mediatek,mt6358-regulator', 'mediatek,mt6359-regulator', 'mediatek,mt6397-regulator']
   	'mediatek,mt6365-regulator' is not one of ['mediatek,mt6366-regulator']
   	'mediatek,mt6358-regulator' was expected
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml
>> arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l.dtb: pmic (mediatek,mt6365): rtc:compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt6365-rtc', 'mediatek,mt6358-rtc'] is too long
   	'mediatek,mt6365-rtc' is not one of ['mediatek,mt6323-rtc', 'mediatek,mt6331-rtc', 'mediatek,mt6358-rtc', 'mediatek,mt6397-rtc']
   	'mediatek,mt6365-rtc' is not one of ['mediatek,mt6366-rtc']
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml
>> arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l.dtb: /soc/pwrap@10024000/pmic: failed to match any schema with compatible: ['mediatek,mt6365', 'mediatek,mt6359']
>> arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l.dtb: adc (mediatek,mt6365-auxadc): compatible:0: 'mediatek,mt6365-auxadc' is not one of ['mediatek,mt6357-auxadc', 'mediatek,mt6358-auxadc', 'mediatek,mt6359-auxadc', 'mediatek,mt6363-auxadc', 'mediatek,mt6373-auxadc']
   	from schema $id: http://devicetree.org/schemas/iio/adc/mediatek,mt6359-auxadc.yaml
>> arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l.dtb: adc (mediatek,mt6365-auxadc): compatible: ['mediatek,mt6365-auxadc', 'mediatek,mt6359-auxadc'] is too long
   	from schema $id: http://devicetree.org/schemas/iio/adc/mediatek,mt6359-auxadc.yaml
>> arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l.dtb: /soc/pwrap@10024000/pmic/adc: failed to match any schema with compatible: ['mediatek,mt6365-auxadc', 'mediatek,mt6359-auxadc']
>> arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l.dtb: /soc/pwrap@10024000/pmic/audio-codec: failed to match any schema with compatible: ['mediatek,mt6365-codec', 'mediatek,mt6359-codec']
>> arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l.dtb: /soc/pwrap@10024000/pmic/regulators: failed to match any schema with compatible: ['mediatek,mt6365-regulator', 'mediatek,mt6359-regulator']
>> arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l.dtb: /soc/pwrap@10024000/pmic/rtc: failed to match any schema with compatible: ['mediatek,mt6365-rtc', 'mediatek,mt6358-rtc']
>> arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l.dtb: keys (mediatek,mt6365-keys): compatible:0: 'mediatek,mt6365-keys' is not one of ['mediatek,mt6323-keys', 'mediatek,mt6328-keys', 'mediatek,mt6331-keys', 'mediatek,mt6357-keys', 'mediatek,mt6358-keys', 'mediatek,mt6359-keys', 'mediatek,mt6397-keys']
   	from schema $id: http://devicetree.org/schemas/input/mediatek,pmic-keys.yaml
>> arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l.dtb: keys (mediatek,mt6365-keys): compatible: ['mediatek,mt6365-keys', 'mediatek,mt6359-keys'] is too long
   	from schema $id: http://devicetree.org/schemas/input/mediatek,pmic-keys.yaml
>> arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l.dtb: /soc/pwrap@10024000/pmic/keys: failed to match any schema with compatible: ['mediatek,mt6365-keys', 'mediatek,mt6359-keys']
   arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l.dtb: infra-iommu@10315000 (mediatek,mt8195-iommu-infra): interrupts: [[0, 795, 4, 0], [0, 796, 4, 0], [0, 797, 4, 0], [0, 798, 4, 0], [0, 799, 4, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/mediatek,iommu.yaml
   arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l.dtb: jpeg-decoder@1a040000 (mediatek,mt8195-jpgdec): 'jpgdec@0,0', 'jpgdec@0,10000', 'jpgdec@1,0' do not match any of the regexes: '^jpgdec@[0-9a-f]+$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mt8195-jpegdec.yaml
   arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l.dtb: jpeg-encoder@1a030000 (mediatek,mt8195-jpgenc): 'jpgenc@0,0', 'jpgenc@1,0' do not match any of the regexes: '^jpgenc@[0-9a-f]+$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mt8195-jpegenc.yaml
--
>> arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l-8-hd-panel.dtb: pmic (mediatek,mt6365): '#sound-dai-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml
>> arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l-8-hd-panel.dtb: pmic (mediatek,mt6365): adc:compatible:0: 'mediatek,mt6365-auxadc' is not one of ['mediatek,mt6357-auxadc', 'mediatek,mt6358-auxadc', 'mediatek,mt6359-auxadc', 'mediatek,mt6363-auxadc', 'mediatek,mt6373-auxadc']
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml
>> arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l-8-hd-panel.dtb: pmic (mediatek,mt6365): adc:compatible: ['mediatek,mt6365-auxadc', 'mediatek,mt6359-auxadc'] is too long
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml
>> arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l-8-hd-panel.dtb: pmic (mediatek,mt6365): audio-codec:compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt6365-codec', 'mediatek,mt6359-codec'] is too long
   	'mediatek,mt6365-codec' is not one of ['mediatek,mt6358-sound', 'mediatek,mt6359-codec', 'mediatek,mt6397-codec']
   	'mediatek,mt6365-codec' is not one of ['mediatek,mt6366-sound']
   	'mediatek,mt6358-sound' was expected
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml
>> arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l-8-hd-panel.dtb: pmic (mediatek,mt6365): compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt6365', 'mediatek,mt6359'] is too long
   	'mediatek,mt6365' is not one of ['mediatek,mt6323', 'mediatek,mt6331', 'mediatek,mt6328', 'mediatek,mt6358', 'mediatek,mt6359', 'mediatek,mt6397']
   	'mediatek,mt6365' is not one of ['mediatek,mt6366']
   	'mediatek,mt6358' was expected
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml
>> arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l-8-hd-panel.dtb: pmic (mediatek,mt6365): keys:compatible:0: 'mediatek,mt6365-keys' is not one of ['mediatek,mt6323-keys', 'mediatek,mt6328-keys', 'mediatek,mt6331-keys', 'mediatek,mt6357-keys', 'mediatek,mt6358-keys', 'mediatek,mt6359-keys', 'mediatek,mt6397-keys']
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml
>> arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l-8-hd-panel.dtb: pmic (mediatek,mt6365): keys:compatible: ['mediatek,mt6365-keys', 'mediatek,mt6359-keys'] is too long
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml
>> arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l-8-hd-panel.dtb: pmic (mediatek,mt6365): regulators:compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt6365-regulator', 'mediatek,mt6359-regulator'] is too long
   	'mediatek,mt6365-regulator' is not one of ['mediatek,mt6323-regulator', 'mediatek,mt6328-regulator', 'mediatek,mt6331-regulator', 'mediatek,mt6358-regulator', 'mediatek,mt6359-regulator', 'mediatek,mt6397-regulator']
   	'mediatek,mt6365-regulator' is not one of ['mediatek,mt6366-regulator']
   	'mediatek,mt6358-regulator' was expected
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml
>> arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l-8-hd-panel.dtb: pmic (mediatek,mt6365): rtc:compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt6365-rtc', 'mediatek,mt6358-rtc'] is too long
   	'mediatek,mt6365-rtc' is not one of ['mediatek,mt6323-rtc', 'mediatek,mt6331-rtc', 'mediatek,mt6358-rtc', 'mediatek,mt6397-rtc']
   	'mediatek,mt6365-rtc' is not one of ['mediatek,mt6366-rtc']
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml
>> arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l-8-hd-panel.dtb: /soc/pwrap@10024000/pmic: failed to match any schema with compatible: ['mediatek,mt6365', 'mediatek,mt6359']
>> arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l-8-hd-panel.dtb: adc (mediatek,mt6365-auxadc): compatible:0: 'mediatek,mt6365-auxadc' is not one of ['mediatek,mt6357-auxadc', 'mediatek,mt6358-auxadc', 'mediatek,mt6359-auxadc', 'mediatek,mt6363-auxadc', 'mediatek,mt6373-auxadc']
   	from schema $id: http://devicetree.org/schemas/iio/adc/mediatek,mt6359-auxadc.yaml
>> arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l-8-hd-panel.dtb: adc (mediatek,mt6365-auxadc): compatible: ['mediatek,mt6365-auxadc', 'mediatek,mt6359-auxadc'] is too long
   	from schema $id: http://devicetree.org/schemas/iio/adc/mediatek,mt6359-auxadc.yaml
>> arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l-8-hd-panel.dtb: /soc/pwrap@10024000/pmic/adc: failed to match any schema with compatible: ['mediatek,mt6365-auxadc', 'mediatek,mt6359-auxadc']
>> arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l-8-hd-panel.dtb: /soc/pwrap@10024000/pmic/audio-codec: failed to match any schema with compatible: ['mediatek,mt6365-codec', 'mediatek,mt6359-codec']
>> arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l-8-hd-panel.dtb: /soc/pwrap@10024000/pmic/regulators: failed to match any schema with compatible: ['mediatek,mt6365-regulator', 'mediatek,mt6359-regulator']
>> arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l-8-hd-panel.dtb: /soc/pwrap@10024000/pmic/rtc: failed to match any schema with compatible: ['mediatek,mt6365-rtc', 'mediatek,mt6358-rtc']
>> arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l-8-hd-panel.dtb: keys (mediatek,mt6365-keys): compatible:0: 'mediatek,mt6365-keys' is not one of ['mediatek,mt6323-keys', 'mediatek,mt6328-keys', 'mediatek,mt6331-keys', 'mediatek,mt6357-keys', 'mediatek,mt6358-keys', 'mediatek,mt6359-keys', 'mediatek,mt6397-keys']
   	from schema $id: http://devicetree.org/schemas/input/mediatek,pmic-keys.yaml
>> arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l-8-hd-panel.dtb: keys (mediatek,mt6365-keys): compatible: ['mediatek,mt6365-keys', 'mediatek,mt6359-keys'] is too long
   	from schema $id: http://devicetree.org/schemas/input/mediatek,pmic-keys.yaml
>> arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l-8-hd-panel.dtb: /soc/pwrap@10024000/pmic/keys: failed to match any schema with compatible: ['mediatek,mt6365-keys', 'mediatek,mt6359-keys']
   arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l-8-hd-panel.dtb: infra-iommu@10315000 (mediatek,mt8195-iommu-infra): interrupts: [[0, 795, 4, 0], [0, 796, 4, 0], [0, 797, 4, 0], [0, 798, 4, 0], [0, 799, 4, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/mediatek,iommu.yaml
   arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l-8-hd-panel.dtb: jpeg-decoder@1a040000 (mediatek,mt8195-jpgdec): 'jpgdec@0,0', 'jpgdec@0,10000', 'jpgdec@1,0' do not match any of the regexes: '^jpgdec@[0-9a-f]+$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mt8195-jpegdec.yaml
   arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l-8-hd-panel.dtb: jpeg-encoder@1a030000 (mediatek,mt8195-jpgenc): 'jpgenc@0,0', 'jpgenc@1,0' do not match any of the regexes: '^jpgenc@[0-9a-f]+$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mt8195-jpegenc.yaml

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
