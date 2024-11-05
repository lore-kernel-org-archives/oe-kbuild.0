Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B44151D5176
	for <oe-kbuild@lists.linux.dev>; Tue,  5 Nov 2024 13:22:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730812953; cv=none; b=ZlFQpEmXes3m0uVv2kjxutEM47VA5RDUbx7Bik+yOl3GgW8Yz3uVA1y1ecT7tIy043yCmUoxrkYtEc/HbY9GJHhP2WjMWW+SqsZY8L4BgUlk1nu5+WrNJilykYP3riaAx2XlwRwYd7mKEcVeTPRDGoZofKGD4Tho+elgLQo3XWo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730812953; c=relaxed/simple;
	bh=vckYsVDmL6gdWg55h1RqGB4LaDaijWM6fIELRijMUwA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Ye6jgKhb8HqbvSX6xBAUy6POUQSuJlq3lD+NWLWgXB/TsiWtUPFqPE0HoDOVc2rJRs8KlduFzWrqhs8e7Mlxe9L3CozJQrKrVQj85V1ZisP5/eRtY9yXiMS8ni9y5EiFm+NnCsqyZ1NaAN8niAfmaHqvcJEF+aGTMicmr5pZRh8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LD7HKlZx; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LD7HKlZx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730812952; x=1762348952;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=vckYsVDmL6gdWg55h1RqGB4LaDaijWM6fIELRijMUwA=;
  b=LD7HKlZxoaY/u30aLJiNmYu0VB9kS87c5I5lcqCAYxWB4D/UBy4Hk7Yh
   MNAYMb+kwh5cZyQPB/B6pAosefS98kY50jqH/Saub86oQ/Fp7o8PrPDb5
   zg0uewmks4SB5vm8SzcK3bf4pLMvFgJnkRmhdMQspRgNi8MyJ65DREWVe
   LDXUK0osZF4NNFYQ/iBBlv82UnDYoaNf91hu800GhfdzFAXQnc9AW+uWb
   uoWTKogsPPcfe7aWvQ3mOsoey8frutIbhwcjaRjZGmN+JlNSCGHFL3E9o
   K92cdwi+SkYNt4RBeDmBYWUMAeHS0u4dWiQpz9qR/vjjQ3QOeDhUx9+Yr
   g==;
X-CSE-ConnectionGUID: 5LpwdWVaTDSNo50Jjmc15Q==
X-CSE-MsgGUID: aO1bz3wPSVCcAney6/4ikg==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="30332586"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="30332586"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2024 05:22:32 -0800
X-CSE-ConnectionGUID: dbuGcs6ESG6cHpj7H5qWZQ==
X-CSE-MsgGUID: JPXLCwwHQcGLBJo0RC3EXw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,260,1725346800"; 
   d="scan'208";a="84350980"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 05 Nov 2024 05:22:30 -0800
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t8JVr-000m5F-2z;
	Tue, 05 Nov 2024 13:22:27 +0000
Date: Tue, 5 Nov 2024 21:21:38 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [android-common:android15-6.6-desktop 1/1]
 arch/arm64/boot/dts/mediatek/mt8186-corsola-steelix-sku131072.dtb:
 gpu@13040000: 'power_model@0', 'power_model@1', 'supply-names',
 'volt-bin-mapping' do not match any of the regexes: 'pinctrl-[0-9]+'
Message-ID: <202411052146.JGAUzF0E-lkp@intel.com>
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
commit: be652afcb2616a85686517a492bf7fd49ecf9007 [1/1] CHROMIUM: arm64: dts: mt8186: Add corsola-steelix and rusty board
:::::: branch date: 27 hours ago
:::::: commit date: 6 months ago
config: arm64-randconfig-051-20241030 (https://download.01.org/0day-ci/archive/20241105/202411052146.JGAUzF0E-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
dtschema version: 2024.10.dev6+g12c3cd5
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241105/202411052146.JGAUzF0E-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202411052146.JGAUzF0E-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/mediatek/mt8186-corsola-steelix-sku131072.dtb: usb@11280000: #address-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/usb/mediatek,mtk-xhci.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-steelix-sku131072.dtb: usb@11280000: #size-cells: 0 was expected
   	from schema $id: http://devicetree.org/schemas/usb/mediatek,mtk-xhci.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-steelix-sku131072.dtb: usb@11280000: #address-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/usb/mediatek,mtk-xhci.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-steelix-sku131072.dtb: usb@11280000: #size-cells: 0 was expected
   	from schema $id: http://devicetree.org/schemas/usb/mediatek,mtk-xhci.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-steelix-sku131072.dtb: efuse@11cb0000: Unevaluated properties are not allowed ('calib', 'data1', 'data1-1' were unexpected)
   	from schema $id: http://devicetree.org/schemas/nvmem/mediatek,efuse.yaml#
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-steelix-sku131072.dtb: gpu@13040000: 'power_model@0', 'power_model@1', 'supply-names', 'volt-bin-mapping' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/gpu/arm,mali-bifrost.yaml#
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-steelix-sku131072.dtb: gpu@13040000: sram-supply: False schema does not allow [[127]]
   	from schema $id: http://devicetree.org/schemas/gpu/arm,mali-bifrost.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-steelix-sku131072.dtb: /soc/gpu@13040000/power_model@0: failed to match any schema with compatible: ['arm,mali-simple-power-model']
   arch/arm64/boot/dts/mediatek/mt8186-corsola-steelix-sku131072.dtb: /soc/gpu@13040000/power_model@1: failed to match any schema with compatible: ['arm,mali-g52_r1-power-model']
   arch/arm64/boot/dts/mediatek/mt8186-corsola-steelix-sku131072.dtb: dpi@1400a000: pinctrl-names:0: 'default' was expected
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,dpi.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-steelix-sku131072.dtb: dpi@1400a000: pinctrl-names:1: 'sleep' was expected
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,dpi.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-steelix-sku131072.dtb: dpi@1400a000: Additional properties are not allowed ('power-domains' was unexpected)
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,dpi.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-steelix-sku131072.dtb: clock-controller@15020000: 'mediatek,gce-client-reg' does not match any of the regexes: 'pinctrl-[0-9]+'
--
   arch/arm64/boot/dts/mediatek/mt8186-corsola-steelix-sku131073.dtb: usb@11280000: #address-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/usb/mediatek,mtk-xhci.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-steelix-sku131073.dtb: usb@11280000: #size-cells: 0 was expected
   	from schema $id: http://devicetree.org/schemas/usb/mediatek,mtk-xhci.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-steelix-sku131073.dtb: usb@11280000: #address-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/usb/mediatek,mtk-xhci.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-steelix-sku131073.dtb: usb@11280000: #size-cells: 0 was expected
   	from schema $id: http://devicetree.org/schemas/usb/mediatek,mtk-xhci.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-steelix-sku131073.dtb: efuse@11cb0000: Unevaluated properties are not allowed ('calib', 'data1', 'data1-1' were unexpected)
   	from schema $id: http://devicetree.org/schemas/nvmem/mediatek,efuse.yaml#
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-steelix-sku131073.dtb: gpu@13040000: 'power_model@0', 'power_model@1', 'supply-names', 'volt-bin-mapping' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/gpu/arm,mali-bifrost.yaml#
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-steelix-sku131073.dtb: gpu@13040000: sram-supply: False schema does not allow [[127]]
   	from schema $id: http://devicetree.org/schemas/gpu/arm,mali-bifrost.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-steelix-sku131073.dtb: /soc/gpu@13040000/power_model@0: failed to match any schema with compatible: ['arm,mali-simple-power-model']
   arch/arm64/boot/dts/mediatek/mt8186-corsola-steelix-sku131073.dtb: /soc/gpu@13040000/power_model@1: failed to match any schema with compatible: ['arm,mali-g52_r1-power-model']
   arch/arm64/boot/dts/mediatek/mt8186-corsola-steelix-sku131073.dtb: dpi@1400a000: pinctrl-names:0: 'default' was expected
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,dpi.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-steelix-sku131073.dtb: dpi@1400a000: pinctrl-names:1: 'sleep' was expected
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,dpi.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-steelix-sku131073.dtb: dpi@1400a000: Additional properties are not allowed ('power-domains' was unexpected)
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,dpi.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-steelix-sku131073.dtb: clock-controller@15020000: 'mediatek,gce-client-reg' does not match any of the regexes: 'pinctrl-[0-9]+'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
