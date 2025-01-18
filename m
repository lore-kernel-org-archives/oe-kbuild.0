Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFE5018B467
	for <oe-kbuild@lists.linux.dev>; Sat, 18 Jan 2025 21:58:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737237490; cv=none; b=Es/EdC+zBbJCsr/4FqfdreKSmDIoycvmX6DQ4mfpr6m3qpT9VS8Z/+flqiv3xBgP/w+2Ud9C3034pmeapw8EgjLwJ4WQV0hPQH0dolAxcEMse/kDCchOQnuFlhq4zS0yH72veUiRz0J9aJggxukcGX+6muKIhfmkoW3EcY4JWHA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737237490; c=relaxed/simple;
	bh=d7LefPovIAxoBAKnBpX8Ng7hwP41TquKIpFl7cN7l1w=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=JQfOZJAyJWbP4tLSuKhzBw2FYTSrEvCTmc75yYhk67Vkb05/SGRu3dE8QlnwS0rgaPp3F8DCVg5Z61aGgEScxvzA9qwltOzpsdc8QJx1/OB+Vu4/eL573/UCd7jTwN317fDTz9Fodr4arfR0Cfc7NEdg7z42Y0U5bDpVfXm4j/Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TWQExDC9; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TWQExDC9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737237489; x=1768773489;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=d7LefPovIAxoBAKnBpX8Ng7hwP41TquKIpFl7cN7l1w=;
  b=TWQExDC95bC4wi5jHSYXrJgvaSy67wGMvbByazIlXIoATdSNUWVw5exD
   3jGVygJtnBTGQLBTRsASDxDg1Iy/GgwMk7s4m3QALreClJCVZPNLGinLO
   YiEi9NaDWVVGUBHpE14t0aRRvHwUePS81pG1VLZOnknOwKaPxjM5RMgu+
   YkScwFvUpu+FBQh1g0e1AT1T8UNj8ZBI3X5kcab28M7HA3V15QWbjSDJX
   supgZcCmdPmUYN9YDGq7Nb/BJT76Ci1o3YTe9fHfNBHemLgJmBZEd3ezt
   rX/LQFxbmLYd5g7NmHf6I60wMYY6tb92xPzPWGf/Iox/1FaeQR17BHuUq
   Q==;
X-CSE-ConnectionGUID: cOlP9xvVR4u+BUE+iEgg6Q==
X-CSE-MsgGUID: 0xqZNix7TjOp41dCNX0uAw==
X-IronPort-AV: E=McAfee;i="6700,10204,11319"; a="55054696"
X-IronPort-AV: E=Sophos;i="6.13,216,1732608000"; 
   d="scan'208";a="55054696"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jan 2025 13:58:08 -0800
X-CSE-ConnectionGUID: TDjoqX60R4+8yMOlEvV2wA==
X-CSE-MsgGUID: QStn68TKQMaU3P4G1CK3+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,216,1732608000"; 
   d="scan'208";a="106674484"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 18 Jan 2025 13:58:07 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tZGpQ-000Uqb-2w;
	Sat, 18 Jan 2025 21:58:04 +0000
Date: Sun, 19 Jan 2025 05:57:13 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [wens:mtk-wip 28/48]
 arch/arm64/boot/dts/mediatek/mt8186-corsola-squirtle.dtb: connector@0:
 Unevaluated properties are not allowed ('ports' was unexpected)
Message-ID: <202501190501.bVqaM9fx-lkp@intel.com>
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
TO: "Chen-Yu Tsai" <wenst@chromium.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/wens/linux.git mtk-wip
head:   a2f8143f6e1e6b3d8dac24f675646fbfdfc03202
commit: f0a9b7aeae0433da6e9d81ea2da350390577d0f0 [28/48] DO NOT MERGE:  arm64: dts: mediatek: mt8186-corsola: Add Type-C Mux for DP output
:::::: branch date: 5 days ago
:::::: commit date: 5 days ago
config: arm64-randconfig-053-20250117 (https://download.01.org/0day-ci/archive/20250119/202501190501.bVqaM9fx-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
dtschema version: 2024.12.dev6+gc4da38d
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250119/202501190501.bVqaM9fx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202501190501.bVqaM9fx-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/mediatek/mt8186-corsola-squirtle.dtb: typec: connector@0:ports: 'port@0' is a required property
   	from schema $id: http://devicetree.org/schemas/chrome/google,cros-ec-typec.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-squirtle.dtb: typec: connector@0: Unevaluated properties are not allowed ('ports' was unexpected)
   	from schema $id: http://devicetree.org/schemas/chrome/google,cros-ec-typec.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-squirtle.dtb: typec: connector@1:ports: 'port@0' is a required property
   	from schema $id: http://devicetree.org/schemas/chrome/google,cros-ec-typec.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-squirtle.dtb: typec: connector@1: Unevaluated properties are not allowed ('ports' was unexpected)
   	from schema $id: http://devicetree.org/schemas/chrome/google,cros-ec-typec.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-squirtle.dtb: connector@0: ports: 'port@0' is a required property
   	from schema $id: http://devicetree.org/schemas/connector/usb-connector.yaml#
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-squirtle.dtb: connector@0: Unevaluated properties are not allowed ('ports' was unexpected)
   	from schema $id: http://devicetree.org/schemas/connector/usb-connector.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-squirtle.dtb: connector@1: ports: 'port@0' is a required property
   	from schema $id: http://devicetree.org/schemas/connector/usb-connector.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-squirtle.dtb: connector@1: Unevaluated properties are not allowed ('ports' was unexpected)
   	from schema $id: http://devicetree.org/schemas/connector/usb-connector.yaml#
--
   arch/arm64/boot/dts/mediatek/mt8186-corsola-starmie-sku0.dtb: ec@0: typec:connector@0:ports: 'port@0' is a required property
   	from schema $id: http://devicetree.org/schemas/mfd/google,cros-ec.yaml#
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-starmie-sku0.dtb: ec@0: typec:connector@0: Unevaluated properties are not allowed ('ports' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mfd/google,cros-ec.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-starmie-sku0.dtb: ec@0: typec:connector@1:ports: 'port@0' is a required property
   	from schema $id: http://devicetree.org/schemas/mfd/google,cros-ec.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-starmie-sku0.dtb: typec: connector@0:ports: 'port@0' is a required property
   	from schema $id: http://devicetree.org/schemas/chrome/google,cros-ec-typec.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-starmie-sku0.dtb: typec: connector@0: Unevaluated properties are not allowed ('ports' was unexpected)
   	from schema $id: http://devicetree.org/schemas/chrome/google,cros-ec-typec.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-starmie-sku0.dtb: typec: connector@1:ports: 'port@0' is a required property
   	from schema $id: http://devicetree.org/schemas/chrome/google,cros-ec-typec.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-starmie-sku0.dtb: connector@0: ports: 'port@0' is a required property
   	from schema $id: http://devicetree.org/schemas/connector/usb-connector.yaml#
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-starmie-sku0.dtb: connector@0: Unevaluated properties are not allowed ('ports' was unexpected)
   	from schema $id: http://devicetree.org/schemas/connector/usb-connector.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-starmie-sku0.dtb: sound: 'model' is a required property
   	from schema $id: http://devicetree.org/schemas/sound/mt8186-mt6366-rt1019-rt5682s.yaml#
--
   arch/arm64/boot/dts/mediatek/mt8186-corsola-voltorb.dtb: spmi@10015000: Unevaluated properties are not allowed ('interrupts' was unexpected)
   	from schema $id: http://devicetree.org/schemas/spmi/mtk,spmi-mtk-pmif.yaml#
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-voltorb.dtb: ec@0: typec:connector@0:ports: 'port@0' is a required property
   	from schema $id: http://devicetree.org/schemas/mfd/google,cros-ec.yaml#
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-voltorb.dtb: ec@0: typec:connector@0: Unevaluated properties are not allowed ('ports' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mfd/google,cros-ec.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-voltorb.dtb: ec@0: typec:connector@1:ports: 'port@0' is a required property
   	from schema $id: http://devicetree.org/schemas/mfd/google,cros-ec.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-voltorb.dtb: ec@0: typec:connector@1: Unevaluated properties are not allowed ('ports' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mfd/google,cros-ec.yaml#
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-voltorb.dtb: typec: connector@0:ports: 'port@0' is a required property
   	from schema $id: http://devicetree.org/schemas/chrome/google,cros-ec-typec.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-voltorb.dtb: typec: connector@0: Unevaluated properties are not allowed ('ports' was unexpected)
   	from schema $id: http://devicetree.org/schemas/chrome/google,cros-ec-typec.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-voltorb.dtb: typec: connector@1:ports: 'port@0' is a required property
   	from schema $id: http://devicetree.org/schemas/chrome/google,cros-ec-typec.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-voltorb.dtb: typec: connector@1: Unevaluated properties are not allowed ('ports' was unexpected)
   	from schema $id: http://devicetree.org/schemas/chrome/google,cros-ec-typec.yaml#
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-voltorb.dtb: connector@0: ports: 'port@0' is a required property
   	from schema $id: http://devicetree.org/schemas/connector/usb-connector.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-voltorb.dtb: connector@0: Unevaluated properties are not allowed ('ports' was unexpected)
   	from schema $id: http://devicetree.org/schemas/connector/usb-connector.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-voltorb.dtb: connector@1: ports: 'port@0' is a required property
   	from schema $id: http://devicetree.org/schemas/connector/usb-connector.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-voltorb.dtb: connector@1: Unevaluated properties are not allowed ('ports' was unexpected)
   	from schema $id: http://devicetree.org/schemas/connector/usb-connector.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-voltorb.dtb: sound: 'model' is a required property
   	from schema $id: http://devicetree.org/schemas/sound/mt8186-mt6366-rt1019-rt5682s.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
