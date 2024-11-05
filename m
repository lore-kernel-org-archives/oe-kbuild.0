Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58BDC21643C
	for <oe-kbuild@lists.linux.dev>; Tue,  5 Nov 2024 23:36:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730849816; cv=none; b=L6MfVDO6+kAXxNIhMf0faXfgAcunvRsgdAGvJwdzNlmunT9ubshOdwgW/QbOEAiYq8kI3CvratV1LX6pXG+cYWE4jnJlUDe0C2hoPGbi03RBmeRYjh2O2hDXsfwsIBr48eAZHCGomnBJBX4Vs1+yEaNvm8aBjKJbpiUr1lrdvFc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730849816; c=relaxed/simple;
	bh=zIIzjQp9X1l0VuWjuR4hq20/voUPaeQX9tkSwGByR+k=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HRCqn9bDQsP64vXggl4O3PK+ewBcZYHJYNX0kuSD9GOqqu+Cblg1mQLrtpqq7ZYY6UT+xEBDR+whU8JLII2tsAu5qUSOOFPicDAnKCRZ3zcly1wAyCzX58i+9bNcIBP8pis+C+STfj/tDlH/eY/48OWgs1kqeikqK6WorWIKuUo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=I/bwU+T0; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="I/bwU+T0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730849814; x=1762385814;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=zIIzjQp9X1l0VuWjuR4hq20/voUPaeQX9tkSwGByR+k=;
  b=I/bwU+T01kwtO16EFacs6uYt4EJqxCEvJa1dDqVKCtPYJRn1db/406Fg
   1g9HM72Zs18IEAPpiy9UhxApAHsAwsPZAdRu2Sib47s3TM03ClGdyy2G4
   nnVkTf6qtU081ENUAA0Ybdz7n46lv2HQcSiC3dnA7VqlsIVazBM1nI1rl
   1aLO1hF9osEMToGFuOsavUs2b23BZONGZyPJrjlQLYqGXoPMoPC4hjy+9
   cFkGxfTo2UoRzGKgvY8IUtKsAuTqu0VnVBznvFwzdhk30v58A6rF4gqxp
   8kjm1VhJeVACNSV8Zms/tQ1+rZRLajlbh6rxWmScr9MaRuS+EBqLVAv5C
   g==;
X-CSE-ConnectionGUID: q+BhvLKHTZ2sko+qwEKABA==
X-CSE-MsgGUID: HOI/tXQWR9OBTZ60NdEVcg==
X-IronPort-AV: E=McAfee;i="6700,10204,11247"; a="30036123"
X-IronPort-AV: E=Sophos;i="6.11,261,1725346800"; 
   d="scan'208";a="30036123"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2024 15:36:53 -0800
X-CSE-ConnectionGUID: vyc/XNoUQ1mRq4hPlzd4sA==
X-CSE-MsgGUID: ZnZ+ajGgSMKixO9NbFumrQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,261,1725346800"; 
   d="scan'208";a="84345820"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 05 Nov 2024 15:36:53 -0800
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t8T6Q-000mbp-2B;
	Tue, 05 Nov 2024 23:36:50 +0000
Date: Wed, 6 Nov 2024 07:35:52 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [android-common:android15-6.6-desktop 1/1]
 arch/arm64/boot/dts/mediatek/mt8186-corsola-magneton-sku393216.dtb:
 gpu@13040000: 'power_model@0', 'power_model@1', 'supply-names',
 'volt-bin-mapping' do not match any of the regexes: 'pinctrl-[0-9]+'
Message-ID: <202411060702.BLTeo5v7-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "dtcheck: too old problem, older than 3 months"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: cros-kernel-buildreports@googlegroups.com

tree:   https://android.googlesource.com/kernel/common android15-6.6-desktop
head:   cefa8bf9f032171eb1be08266aec68726ab8e8e5
commit: cf0657f4c63837090d22ee50cec185af40c6cfa8 [1/1] CHROMIUM: arm64: dts: mt8186: Add corsola-magneton board
:::::: branch date: 2 days ago
:::::: commit date: 6 months ago
config: arm64-randconfig-051-20241030 (https://download.01.org/0day-ci/archive/20241106/202411060702.BLTeo5v7-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
dtschema version: 2024.10.dev6+g12c3cd5
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241106/202411060702.BLTeo5v7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202411060702.BLTeo5v7-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/mediatek/mt8186-corsola-magneton-sku393216.dtb: usb@11280000: #address-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/usb/mediatek,mtk-xhci.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-magneton-sku393216.dtb: usb@11280000: #size-cells: 0 was expected
   	from schema $id: http://devicetree.org/schemas/usb/mediatek,mtk-xhci.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-magneton-sku393216.dtb: usb@11280000: #address-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/usb/mediatek,mtk-xhci.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-magneton-sku393216.dtb: usb@11280000: #size-cells: 0 was expected
   	from schema $id: http://devicetree.org/schemas/usb/mediatek,mtk-xhci.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-magneton-sku393216.dtb: efuse@11cb0000: Unevaluated properties are not allowed ('calib', 'data1', 'data1-1' were unexpected)
   	from schema $id: http://devicetree.org/schemas/nvmem/mediatek,efuse.yaml#
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-magneton-sku393216.dtb: gpu@13040000: 'power_model@0', 'power_model@1', 'supply-names', 'volt-bin-mapping' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/gpu/arm,mali-bifrost.yaml#
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-magneton-sku393216.dtb: gpu@13040000: sram-supply: False schema does not allow [[127]]
   	from schema $id: http://devicetree.org/schemas/gpu/arm,mali-bifrost.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-magneton-sku393216.dtb: /soc/gpu@13040000/power_model@0: failed to match any schema with compatible: ['arm,mali-simple-power-model']
   arch/arm64/boot/dts/mediatek/mt8186-corsola-magneton-sku393216.dtb: /soc/gpu@13040000/power_model@1: failed to match any schema with compatible: ['arm,mali-g52_r1-power-model']
   arch/arm64/boot/dts/mediatek/mt8186-corsola-magneton-sku393216.dtb: dpi@1400a000: pinctrl-names:0: 'default' was expected
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,dpi.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-magneton-sku393216.dtb: dpi@1400a000: pinctrl-names:1: 'sleep' was expected
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,dpi.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-magneton-sku393216.dtb: dpi@1400a000: Additional properties are not allowed ('power-domains' was unexpected)
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,dpi.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-magneton-sku393216.dtb: clock-controller@15020000: 'mediatek,gce-client-reg' does not match any of the regexes: 'pinctrl-[0-9]+'
--
   arch/arm64/boot/dts/mediatek/mt8186-corsola-magneton-sku393217.dtb: usb@11280000: #address-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/usb/mediatek,mtk-xhci.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-magneton-sku393217.dtb: usb@11280000: #size-cells: 0 was expected
   	from schema $id: http://devicetree.org/schemas/usb/mediatek,mtk-xhci.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-magneton-sku393217.dtb: usb@11280000: #address-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/usb/mediatek,mtk-xhci.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-magneton-sku393217.dtb: usb@11280000: #size-cells: 0 was expected
   	from schema $id: http://devicetree.org/schemas/usb/mediatek,mtk-xhci.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-magneton-sku393217.dtb: efuse@11cb0000: Unevaluated properties are not allowed ('calib', 'data1', 'data1-1' were unexpected)
   	from schema $id: http://devicetree.org/schemas/nvmem/mediatek,efuse.yaml#
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-magneton-sku393217.dtb: gpu@13040000: 'power_model@0', 'power_model@1', 'supply-names', 'volt-bin-mapping' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/gpu/arm,mali-bifrost.yaml#
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-magneton-sku393217.dtb: gpu@13040000: sram-supply: False schema does not allow [[127]]
   	from schema $id: http://devicetree.org/schemas/gpu/arm,mali-bifrost.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-magneton-sku393217.dtb: /soc/gpu@13040000/power_model@0: failed to match any schema with compatible: ['arm,mali-simple-power-model']
   arch/arm64/boot/dts/mediatek/mt8186-corsola-magneton-sku393217.dtb: /soc/gpu@13040000/power_model@1: failed to match any schema with compatible: ['arm,mali-g52_r1-power-model']
   arch/arm64/boot/dts/mediatek/mt8186-corsola-magneton-sku393217.dtb: dpi@1400a000: pinctrl-names:0: 'default' was expected
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,dpi.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-magneton-sku393217.dtb: dpi@1400a000: pinctrl-names:1: 'sleep' was expected
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,dpi.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-magneton-sku393217.dtb: dpi@1400a000: Additional properties are not allowed ('power-domains' was unexpected)
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,dpi.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-magneton-sku393217.dtb: clock-controller@15020000: 'mediatek,gce-client-reg' does not match any of the regexes: 'pinctrl-[0-9]+'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
