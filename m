Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 203361D5CE0
	for <oe-kbuild@lists.linux.dev>; Mon, 19 May 2025 02:32:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747621972; cv=none; b=KSLkZcLQd98fhw+t1tsIw+lNeFd47qU5ZUf1PoaYIF8DLHZiZ8WPzSo4TTpllxWyoJCIxl2I4SCLB/Rlc9Z1Rt5AGsKdCAlKtLJPKlTNP5hXVfYzyHhvL1OPaTU6zA2kHWZxD/zLnbM2uuu9iVElNXq2UYsp/+8YNivhmuJVVR8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747621972; c=relaxed/simple;
	bh=EgejRmSbgRxh/vbwIpPdRrRTXGTDTp3jte+OFwFql28=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ukJ1O11WetQrHElyaC1JZHci+ITRAoS4qnc1kuSk/MjOcQ3m2XIbPYpeOSVEReA49hs7v5MHBnswSvI8Ku+6E9oRCIuGN7LPgzy0crsUVweNM0K3JyWuhJBng5RfgTfaKAYlCaoT72+iGQybq5TUQbKVl2adMNHwU/z/V0YAiwY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Fwq97Qzn; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Fwq97Qzn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747621970; x=1779157970;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=EgejRmSbgRxh/vbwIpPdRrRTXGTDTp3jte+OFwFql28=;
  b=Fwq97QznbhdwtmdlzEX5RoxnubsxxPYiZ96pP21cRNnNwGwuvhjBsYmP
   qvGlWnVbblNk9ncFXW2VFEbw6AtS7+deX74FJ9Qdk0hInDt2kAI9V5gTv
   FfD9wxlQvFtLvjiVqOSwY6xqAFfvcuhXGQ/zBi2Fg4pacUM5leRI3AtYM
   PODbXjQ0jRlWoHCpNE5/Mbh7OaqVUdktacFPM6oImzNP3zAAg0zrkySxr
   qtkDrUTOJWwEtXvANX5ELfyTNy6bbC7PwMjpoNX3LyKp4yOzNAaIAKIaJ
   39AhQUEJi+hdiHyAJ4evWQMt+GOUs+gmtXbwxtxC05hSx9i11xUeXOlzg
   w==;
X-CSE-ConnectionGUID: I+PPdNlJRiOR8Bn6Kyy9hA==
X-CSE-MsgGUID: 4ceZcB0TQvitrm9sGH7cDw==
X-IronPort-AV: E=McAfee;i="6700,10204,11437"; a="66923287"
X-IronPort-AV: E=Sophos;i="6.15,299,1739865600"; 
   d="scan'208";a="66923287"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 May 2025 19:32:50 -0700
X-CSE-ConnectionGUID: BQWEqLSQQqmR22ogvDBNgA==
X-CSE-MsgGUID: 8KhujYQuTsSZ8LqD7XFZbg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,299,1739865600"; 
   d="scan'208";a="170154194"
Received: from igk-lkp-server01.igk.intel.com (HELO a1decbf9c5f9) ([10.211.3.150])
  by orviesa002.jf.intel.com with ESMTP; 18 May 2025 19:32:49 -0700
Received: from kbuild by a1decbf9c5f9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uGqJ4-0000mF-0y;
	Mon, 19 May 2025 02:32:46 +0000
Date: Mon, 19 May 2025 10:32:42 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [krzk-github:pending/dt-bindings-qcom-new-and-fixes-for-warnings-linux-next
 3541/4329] arch/arm64/boot/dts/mediatek/mt8188-evb.dtb: dsc@1c009000
 (mediatek,mt8188-disp-dsc): compatible: 'oneOf' conditional failed, one must
 be fixed:
Message-ID: <202505191007.R5U3nzTL-lkp@intel.com>
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
TO: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

tree:   https://github.com/krzk/linux pending/dt-bindings-qcom-new-and-fixes-for-warnings-linux-next
head:   9d5f0863e401cb64a69c27af17034edd01e989b3
commit: eb84b4bd1d091f42877f093f6e3a7fbdb0ee94bf [3541/4329] arm64: dts: mediatek: mt8188: Add VDO0's DSC and MERGE block nodes
:::::: branch date: 2 weeks ago
:::::: commit date: 3 months ago
config: arm64-randconfig-2051-20250516 (https://download.01.org/0day-ci/archive/20250519/202505191007.R5U3nzTL-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
dtschema version: 2025.3.dev27+g32749b3
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250519/202505191007.R5U3nzTL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202505191007.R5U3nzTL-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/mediatek/mt8188-evb.dtb: pmic (mediatek,mt6359): '#sound-dai-cells', 'mt6359codec', 'mt6359rtc' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-evb.dtb: pmic (mediatek,mt6359): regulators: 'compatible' is a required property
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-evb.dtb: mailbox@10320000 (mediatek,mt8188-gce): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/mailbox/mediatek,gce-mailbox.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-evb.dtb: mailbox@10330000 (mediatek,mt8188-gce): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/mailbox/mediatek,gce-mailbox.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-evb.dtb: jpeg-decoder@1a040000 (mediatek,mt8188-jpgdec): iommus: [[102, 685], [102, 686], [102, 690], [102, 691], [102, 692], [102, 693]] is too long
   	from schema $id: http://devicetree.org/schemas/media/mediatek-jpeg-decoder.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-evb.dtb: dsc@1c009000 (mediatek,mt8188-disp-dsc): compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt8188-disp-dsc', 'mediatek,mt8195-disp-dsc'] is too long
   	'mediatek,mt8188-disp-dsc' is not one of ['mediatek,mt8195-disp-dsc']
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,dsc.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-evb.dtb: /soc/dsc@1c009000: failed to match any schema with compatible: ['mediatek,mt8188-disp-dsc', 'mediatek,mt8195-disp-dsc']
--
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku0.dtb: pmic (mediatek,mt6359): '#sound-dai-cells', 'mt6359codec', 'mt6359rtc' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku0.dtb: pmic (mediatek,mt6359): regulators: 'compatible' is a required property
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku0.dtb: mailbox@10320000 (mediatek,mt8188-gce): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/mailbox/mediatek,gce-mailbox.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku0.dtb: mailbox@10330000 (mediatek,mt8188-gce): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/mailbox/mediatek,gce-mailbox.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku0.dtb: jpeg-decoder@1a040000 (mediatek,mt8188-jpgdec): iommus: [[131, 685], [131, 686], [131, 690], [131, 691], [131, 692], [131, 693]] is too long
   	from schema $id: http://devicetree.org/schemas/media/mediatek-jpeg-decoder.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku0.dtb: dsc@1c009000 (mediatek,mt8188-disp-dsc): compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt8188-disp-dsc', 'mediatek,mt8195-disp-dsc'] is too long
   	'mediatek,mt8188-disp-dsc' is not one of ['mediatek,mt8195-disp-dsc']
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,dsc.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku0.dtb: /soc/dsc@1c009000: failed to match any schema with compatible: ['mediatek,mt8188-disp-dsc', 'mediatek,mt8195-disp-dsc']
--
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku1.dtb: pmic (mediatek,mt6359): '#sound-dai-cells', 'mt6359codec', 'mt6359rtc' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku1.dtb: pmic (mediatek,mt6359): regulators: 'compatible' is a required property
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku1.dtb: mailbox@10320000 (mediatek,mt8188-gce): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/mailbox/mediatek,gce-mailbox.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku1.dtb: mailbox@10330000 (mediatek,mt8188-gce): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/mailbox/mediatek,gce-mailbox.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku1.dtb: jpeg-decoder@1a040000 (mediatek,mt8188-jpgdec): iommus: [[130, 685], [130, 686], [130, 690], [130, 691], [130, 692], [130, 693]] is too long
   	from schema $id: http://devicetree.org/schemas/media/mediatek-jpeg-decoder.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku1.dtb: dsc@1c009000 (mediatek,mt8188-disp-dsc): compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt8188-disp-dsc', 'mediatek,mt8195-disp-dsc'] is too long
   	'mediatek,mt8188-disp-dsc' is not one of ['mediatek,mt8195-disp-dsc']
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,dsc.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku1.dtb: /soc/dsc@1c009000: failed to match any schema with compatible: ['mediatek,mt8188-disp-dsc', 'mediatek,mt8195-disp-dsc']
--
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku2.dtb: pmic (mediatek,mt6359): '#sound-dai-cells', 'mt6359codec', 'mt6359rtc' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku2.dtb: pmic (mediatek,mt6359): regulators: 'compatible' is a required property
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku2.dtb: mailbox@10320000 (mediatek,mt8188-gce): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/mailbox/mediatek,gce-mailbox.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku2.dtb: mailbox@10330000 (mediatek,mt8188-gce): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/mailbox/mediatek,gce-mailbox.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku2.dtb: jpeg-decoder@1a040000 (mediatek,mt8188-jpgdec): iommus: [[130, 685], [130, 686], [130, 690], [130, 691], [130, 692], [130, 693]] is too long
   	from schema $id: http://devicetree.org/schemas/media/mediatek-jpeg-decoder.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku2.dtb: dsc@1c009000 (mediatek,mt8188-disp-dsc): compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt8188-disp-dsc', 'mediatek,mt8195-disp-dsc'] is too long
   	'mediatek,mt8188-disp-dsc' is not one of ['mediatek,mt8195-disp-dsc']
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,dsc.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku2.dtb: /soc/dsc@1c009000: failed to match any schema with compatible: ['mediatek,mt8188-disp-dsc', 'mediatek,mt8195-disp-dsc']
--
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku3.dtb: pmic (mediatek,mt6359): '#sound-dai-cells', 'mt6359codec', 'mt6359rtc' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku3.dtb: pmic (mediatek,mt6359): regulators: 'compatible' is a required property
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku3.dtb: mailbox@10320000 (mediatek,mt8188-gce): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/mailbox/mediatek,gce-mailbox.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku3.dtb: mailbox@10330000 (mediatek,mt8188-gce): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/mailbox/mediatek,gce-mailbox.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku3.dtb: jpeg-decoder@1a040000 (mediatek,mt8188-jpgdec): iommus: [[131, 685], [131, 686], [131, 690], [131, 691], [131, 692], [131, 693]] is too long
   	from schema $id: http://devicetree.org/schemas/media/mediatek-jpeg-decoder.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku3.dtb: dsc@1c009000 (mediatek,mt8188-disp-dsc): compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt8188-disp-dsc', 'mediatek,mt8195-disp-dsc'] is too long
   	'mediatek,mt8188-disp-dsc' is not one of ['mediatek,mt8195-disp-dsc']
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,dsc.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku3.dtb: /soc/dsc@1c009000: failed to match any schema with compatible: ['mediatek,mt8188-disp-dsc', 'mediatek,mt8195-disp-dsc']
--
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku4.dtb: pmic (mediatek,mt6359): regulators: 'compatible' is a required property
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku4.dtb: mailbox@10320000 (mediatek,mt8188-gce): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/mailbox/mediatek,gce-mailbox.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku4.dtb: mailbox@10330000 (mediatek,mt8188-gce): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/mailbox/mediatek,gce-mailbox.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku4.dtb: amplifier@4f (ti,tas2563): reg:0:0: 79 is greater than the maximum of 63
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas2781.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku4.dtb: jpeg-decoder@1a040000 (mediatek,mt8188-jpgdec): iommus: [[129, 685], [129, 686], [129, 690], [129, 691], [129, 692], [129, 693]] is too long
   	from schema $id: http://devicetree.org/schemas/media/mediatek-jpeg-decoder.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku4.dtb: dsc@1c009000 (mediatek,mt8188-disp-dsc): compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt8188-disp-dsc', 'mediatek,mt8195-disp-dsc'] is too long
   	'mediatek,mt8188-disp-dsc' is not one of ['mediatek,mt8195-disp-dsc']
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,dsc.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku4.dtb: /soc/dsc@1c009000: failed to match any schema with compatible: ['mediatek,mt8188-disp-dsc', 'mediatek,mt8195-disp-dsc']
--
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku5.dtb: pmic (mediatek,mt6359): regulators: 'compatible' is a required property
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku5.dtb: mailbox@10320000 (mediatek,mt8188-gce): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/mailbox/mediatek,gce-mailbox.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku5.dtb: mailbox@10330000 (mediatek,mt8188-gce): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/mailbox/mediatek,gce-mailbox.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku5.dtb: amplifier@4f (ti,tas2563): reg:0:0: 79 is greater than the maximum of 63
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas2781.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku5.dtb: jpeg-decoder@1a040000 (mediatek,mt8188-jpgdec): iommus: [[128, 685], [128, 686], [128, 690], [128, 691], [128, 692], [128, 693]] is too long
   	from schema $id: http://devicetree.org/schemas/media/mediatek-jpeg-decoder.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku5.dtb: dsc@1c009000 (mediatek,mt8188-disp-dsc): compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt8188-disp-dsc', 'mediatek,mt8195-disp-dsc'] is too long
   	'mediatek,mt8188-disp-dsc' is not one of ['mediatek,mt8195-disp-dsc']
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,dsc.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku5.dtb: /soc/dsc@1c009000: failed to match any schema with compatible: ['mediatek,mt8188-disp-dsc', 'mediatek,mt8195-disp-dsc']
--
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku6.dtb: pmic (mediatek,mt6359): regulators: 'compatible' is a required property
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku6.dtb: mailbox@10320000 (mediatek,mt8188-gce): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/mailbox/mediatek,gce-mailbox.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku6.dtb: mailbox@10330000 (mediatek,mt8188-gce): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/mailbox/mediatek,gce-mailbox.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku6.dtb: amplifier@4f (ti,tas2563): reg:0:0: 79 is greater than the maximum of 63
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas2781.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku6.dtb: jpeg-decoder@1a040000 (mediatek,mt8188-jpgdec): iommus: [[128, 685], [128, 686], [128, 690], [128, 691], [128, 692], [128, 693]] is too long
   	from schema $id: http://devicetree.org/schemas/media/mediatek-jpeg-decoder.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku6.dtb: dsc@1c009000 (mediatek,mt8188-disp-dsc): compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt8188-disp-dsc', 'mediatek,mt8195-disp-dsc'] is too long
   	'mediatek,mt8188-disp-dsc' is not one of ['mediatek,mt8195-disp-dsc']
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,dsc.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku6.dtb: /soc/dsc@1c009000: failed to match any schema with compatible: ['mediatek,mt8188-disp-dsc', 'mediatek,mt8195-disp-dsc']
--
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku7.dtb: pmic (mediatek,mt6359): regulators: 'compatible' is a required property
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku7.dtb: mailbox@10320000 (mediatek,mt8188-gce): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/mailbox/mediatek,gce-mailbox.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku7.dtb: mailbox@10330000 (mediatek,mt8188-gce): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/mailbox/mediatek,gce-mailbox.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku7.dtb: amplifier@4f (ti,tas2563): reg:0:0: 79 is greater than the maximum of 63
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas2781.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku7.dtb: jpeg-decoder@1a040000 (mediatek,mt8188-jpgdec): iommus: [[129, 685], [129, 686], [129, 690], [129, 691], [129, 692], [129, 693]] is too long
   	from schema $id: http://devicetree.org/schemas/media/mediatek-jpeg-decoder.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku7.dtb: dsc@1c009000 (mediatek,mt8188-disp-dsc): compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt8188-disp-dsc', 'mediatek,mt8195-disp-dsc'] is too long
   	'mediatek,mt8188-disp-dsc' is not one of ['mediatek,mt8195-disp-dsc']
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,dsc.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku7.dtb: /soc/dsc@1c009000: failed to match any schema with compatible: ['mediatek,mt8188-disp-dsc', 'mediatek,mt8195-disp-dsc']
--
   arch/arm64/boot/dts/mediatek/mt8370-genio-510-evk.dtb: pmic (mediatek,mt6359): '#sound-dai-cells', 'mt6359codec', 'mt6359rtc' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml#
   arch/arm64/boot/dts/mediatek/mt8370-genio-510-evk.dtb: pmic (mediatek,mt6359): regulators: 'compatible' is a required property
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml#
   arch/arm64/boot/dts/mediatek/mt8370-genio-510-evk.dtb: mailbox@10320000 (mediatek,mt8188-gce): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/mailbox/mediatek,gce-mailbox.yaml#
   arch/arm64/boot/dts/mediatek/mt8370-genio-510-evk.dtb: mailbox@10330000 (mediatek,mt8188-gce): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/mailbox/mediatek,gce-mailbox.yaml#
   arch/arm64/boot/dts/mediatek/mt8370-genio-510-evk.dtb: jpeg-decoder@1a040000 (mediatek,mt8188-jpgdec): iommus: [[123, 685], [123, 686], [123, 690], [123, 691], [123, 692], [123, 693]] is too long
   	from schema $id: http://devicetree.org/schemas/media/mediatek-jpeg-decoder.yaml#
>> arch/arm64/boot/dts/mediatek/mt8370-genio-510-evk.dtb: dsc@1c009000 (mediatek,mt8188-disp-dsc): compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt8188-disp-dsc', 'mediatek,mt8195-disp-dsc'] is too long
   	'mediatek,mt8188-disp-dsc' is not one of ['mediatek,mt8195-disp-dsc']
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,dsc.yaml#
>> arch/arm64/boot/dts/mediatek/mt8370-genio-510-evk.dtb: /soc/dsc@1c009000: failed to match any schema with compatible: ['mediatek,mt8188-disp-dsc', 'mediatek,mt8195-disp-dsc']
--
   arch/arm64/boot/dts/mediatek/mt8390-genio-700-evk.dtb: pmic (mediatek,mt6359): '#sound-dai-cells', 'mt6359codec', 'mt6359rtc' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml#
   arch/arm64/boot/dts/mediatek/mt8390-genio-700-evk.dtb: pmic (mediatek,mt6359): regulators: 'compatible' is a required property
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml#
   arch/arm64/boot/dts/mediatek/mt8390-genio-700-evk.dtb: mailbox@10320000 (mediatek,mt8188-gce): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/mailbox/mediatek,gce-mailbox.yaml#
   arch/arm64/boot/dts/mediatek/mt8390-genio-700-evk.dtb: mailbox@10330000 (mediatek,mt8188-gce): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/mailbox/mediatek,gce-mailbox.yaml#
   arch/arm64/boot/dts/mediatek/mt8390-genio-700-evk.dtb: jpeg-decoder@1a040000 (mediatek,mt8188-jpgdec): iommus: [[125, 685], [125, 686], [125, 690], [125, 691], [125, 692], [125, 693]] is too long
   	from schema $id: http://devicetree.org/schemas/media/mediatek-jpeg-decoder.yaml#
>> arch/arm64/boot/dts/mediatek/mt8390-genio-700-evk.dtb: dsc@1c009000 (mediatek,mt8188-disp-dsc): compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt8188-disp-dsc', 'mediatek,mt8195-disp-dsc'] is too long
   	'mediatek,mt8188-disp-dsc' is not one of ['mediatek,mt8195-disp-dsc']
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,dsc.yaml#
>> arch/arm64/boot/dts/mediatek/mt8390-genio-700-evk.dtb: /soc/dsc@1c009000: failed to match any schema with compatible: ['mediatek,mt8188-disp-dsc', 'mediatek,mt8195-disp-dsc']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
