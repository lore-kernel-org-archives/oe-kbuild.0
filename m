Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E06A1F94A
	for <oe-kbuild@lists.linux.dev>; Sat, 27 Sep 2025 18:06:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758996367; cv=none; b=pTtI3O93Xowz5rvQgL+ypTtHyurRrhH1iJz2dKptQrXCcCmSM0HiZzECv/0/jaSuvLrkysrxIRNe9FPnZtFL+qDhtg7/Ej6KJen/K8QaofnUOB658cE9I913NSN7iJJRrVZxXjX+rzzBLHvP5a5bSmWdvdVCuLIzJtfWT+rsoFo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758996367; c=relaxed/simple;
	bh=JmsXBwj+a0Qh3Euoy72Q2rUD4wVB8Xo3Be2SaDNNMdU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=lhwd4LqO+V+NDEnbedl9BRgi/DsnVaI6iGx44/Po0b/MwqS30eZapsVgsmNNgGDLHFP+w8qeu3v4ZakxD1zjQN1WhgXj6OVAr3m2EKO6oSaQoG7c67DNlDYbvRX2zvNWZ/+LKFfatUfCd64Oa5EZQxYZYu3YrP5V/A1D56r0jlI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hfitbbvl; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hfitbbvl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758996363; x=1790532363;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=JmsXBwj+a0Qh3Euoy72Q2rUD4wVB8Xo3Be2SaDNNMdU=;
  b=hfitbbvlpxcwsY9UKmMbxdwwXlasEf5FzEIUgPxombdWSJOYxVJ8KyHF
   o8Qb8E8tsVz3qbg7OJt9EbFFF6aaJOb3Fvbs4xXhwCkeTZFETgwu9R25s
   8Ab9SxagC61bqgH7YsO0fRzxHidV6nQ26S4QliWlRC3HRBtlVtEpHxEDp
   Gp8sQlidBYVeUbEtqQt0v2hSMi/SelIAedeznub+eWV9Oui9sV4y2hXVS
   U8TV+kWqooyHTGenafnUfkex3TlC5u9hGelzoPqfrYGwSgDiVLChETPU3
   v/Jr+qGR6iNobBg1gZB0HSwy4cgQ8XLC7GRrUxRS1rlXv7ne+//E/8/ie
   Q==;
X-CSE-ConnectionGUID: UG3K7C/RSIizDqbrXOHi+Q==
X-CSE-MsgGUID: E7uNOeZNTaakwdEuHKmkvw==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="61346768"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="61346768"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Sep 2025 11:06:02 -0700
X-CSE-ConnectionGUID: d9uJk+m6So+STpySwqnXbw==
X-CSE-MsgGUID: p/HJCgAUQAeXD4sCBVkMyQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,298,1751266800"; 
   d="scan'208";a="177803278"
Received: from igk-lkp-server01.igk.intel.com (HELO 0e586ad5e7f7) ([10.91.175.65])
  by fmviesa006.fm.intel.com with ESMTP; 27 Sep 2025 11:06:00 -0700
Received: from kbuild by 0e586ad5e7f7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1v2ZIz-000000005Xx-2fWR;
	Sat, 27 Sep 2025 18:05:57 +0000
Date: Sat, 27 Sep 2025 20:05:05 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [asahilinux:bits/000-devicetree 27/140]
 arch/arm64/boot/dts/apple/t6000-j314s.dtb: usb@702280000 (apple,t6000-dwc3):
 Unevaluated properties are not allowed ('iommus' was unexpected)
Message-ID: <202509272043.aUNGIoZE-lkp@intel.com>
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
TO: Janne Grunau <j@jannau.net>
CC: R <rqou@berkeley.edu>

tree:   https://github.com/AsahiLinux/linux bits/000-devicetree
head:   703a105e4188c8c9e084375a48f08853cf64cfca
commit: 8aa03ac27ecb2eb72cd3f1f8004fbb60be85d87a [27/140] arm64: dts: apple: t600x: Add Apple Type-C PHY and dwc3
:::::: branch date: 6 days ago
:::::: commit date: 3 weeks ago
config: arm64-randconfig-2051-20250919 (https://download.01.org/0day-ci/archive/20250927/202509272043.aUNGIoZE-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project ce5124856e019792783de9630d0c5a1f0aaf2d9d)
dtschema version: 2025.8
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250927/202509272043.aUNGIoZE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202509272043.aUNGIoZE-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   	'fixed-layout' is not one of ['u-boot,env', 'u-boot,env-redundant-bool', 'u-boot,env-redundant-count', 'brcm,env']
   	from schema $id: http://devicetree.org/schemas/nvmem/apple,spmi-nvmem.yaml#
   arch/arm64/boot/dts/apple/t6000-j314s.dtb: pmic@f (apple,maverick-pmic): nvmem-layout: Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'boot-error-count@6002,0', 'boot-error-stage@6003', 'boot-stage@6001', 'fault-shadow@867b', 'panic-count@6002,4', 'pm-setting@1405', 'rtc-offset@1411', 'shutdown-flag@600f,3', 'socd@8b00' were unexpected)
   	from schema $id: http://devicetree.org/schemas/nvmem/apple,spmi-nvmem.yaml#
   arch/arm64/boot/dts/apple/t6000-j314s.dtb: pmic@f (apple,maverick-pmic): Unevaluated properties are not allowed ('nvmem-layout' was unexpected)
   	from schema $id: http://devicetree.org/schemas/nvmem/apple,spmi-nvmem.yaml#
   arch/arm64/boot/dts/apple/t6000-j314s.dtb: nvmem-layout (fixed-layout): 'boot-error-count@6002,0', 'panic-count@6002,4', 'shutdown-flag@600f,3' do not match any of the regexes: '@[a-f0-9]+$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/nvmem/layouts/fixed-layout.yaml#
   arch/arm64/boot/dts/apple/t6000-j314s.dtb: usb@702280000 (apple,t6000-dwc3): iommus: [[141, 0], [142, 1]] is too long
   	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
>> arch/arm64/boot/dts/apple/t6000-j314s.dtb: usb@702280000 (apple,t6000-dwc3): Unevaluated properties are not allowed ('iommus' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
   arch/arm64/boot/dts/apple/t6000-j314s.dtb: /soc/usb@702280000: failed to match any schema with compatible: ['apple,t6000-dwc3', 'apple,t8103-dwc3', 'apple,dwc3', 'snps,dwc3']
   arch/arm64/boot/dts/apple/t6000-j314s.dtb: /soc/usb@702280000: failed to match any schema with compatible: ['apple,t6000-dwc3', 'apple,t8103-dwc3', 'apple,dwc3', 'snps,dwc3']
   arch/arm64/boot/dts/apple/t6000-j314s.dtb: /soc/usb@702280000: failed to match any schema with compatible: ['apple,t6000-dwc3', 'apple,t8103-dwc3', 'apple,dwc3', 'snps,dwc3']
>> arch/arm64/boot/dts/apple/t6000-j314s.dtb: /soc/phy@703000000: failed to match any schema with compatible: ['apple,t6000-atcphy', 'apple,t8103-atcphy']
>> arch/arm64/boot/dts/apple/t6000-j314s.dtb: /soc/phy@703000000: failed to match any schema with compatible: ['apple,t6000-atcphy', 'apple,t8103-atcphy']
   arch/arm64/boot/dts/apple/t6000-j314s.dtb: usb@b02280000 (apple,t6000-dwc3): iommus: [[147, 0], [148, 1]] is too long
   	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
>> arch/arm64/boot/dts/apple/t6000-j314s.dtb: usb@b02280000 (apple,t6000-dwc3): Unevaluated properties are not allowed ('iommus' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
   arch/arm64/boot/dts/apple/t6000-j314s.dtb: /soc/usb@b02280000: failed to match any schema with compatible: ['apple,t6000-dwc3', 'apple,t8103-dwc3', 'apple,dwc3', 'snps,dwc3']
   arch/arm64/boot/dts/apple/t6000-j314s.dtb: /soc/usb@b02280000: failed to match any schema with compatible: ['apple,t6000-dwc3', 'apple,t8103-dwc3', 'apple,dwc3', 'snps,dwc3']
   arch/arm64/boot/dts/apple/t6000-j314s.dtb: /soc/usb@b02280000: failed to match any schema with compatible: ['apple,t6000-dwc3', 'apple,t8103-dwc3', 'apple,dwc3', 'snps,dwc3']
>> arch/arm64/boot/dts/apple/t6000-j314s.dtb: /soc/phy@b03000000: failed to match any schema with compatible: ['apple,t6000-atcphy', 'apple,t8103-atcphy']
>> arch/arm64/boot/dts/apple/t6000-j314s.dtb: /soc/phy@b03000000: failed to match any schema with compatible: ['apple,t6000-atcphy', 'apple,t8103-atcphy']
   arch/arm64/boot/dts/apple/t6000-j314s.dtb: usb@f02280000 (apple,t6000-dwc3): iommus: [[153, 0], [154, 1]] is too long
   	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
>> arch/arm64/boot/dts/apple/t6000-j314s.dtb: usb@f02280000 (apple,t6000-dwc3): Unevaluated properties are not allowed ('iommus' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
   arch/arm64/boot/dts/apple/t6000-j314s.dtb: /soc/usb@f02280000: failed to match any schema with compatible: ['apple,t6000-dwc3', 'apple,t8103-dwc3', 'apple,dwc3', 'snps,dwc3']
   arch/arm64/boot/dts/apple/t6000-j314s.dtb: /soc/usb@f02280000: failed to match any schema with compatible: ['apple,t6000-dwc3', 'apple,t8103-dwc3', 'apple,dwc3', 'snps,dwc3']
   arch/arm64/boot/dts/apple/t6000-j314s.dtb: /soc/usb@f02280000: failed to match any schema with compatible: ['apple,t6000-dwc3', 'apple,t8103-dwc3', 'apple,dwc3', 'snps,dwc3']
>> arch/arm64/boot/dts/apple/t6000-j314s.dtb: /soc/phy@f03000000: failed to match any schema with compatible: ['apple,t6000-atcphy', 'apple,t8103-atcphy']
>> arch/arm64/boot/dts/apple/t6000-j314s.dtb: /soc/phy@f03000000: failed to match any schema with compatible: ['apple,t6000-atcphy', 'apple,t8103-atcphy']
   arch/arm64/boot/dts/apple/t6000-j314s.dtb: usb@1302280000 (apple,t6000-dwc3): iommus: [[159, 0], [160, 1]] is too long
   	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
   arch/arm64/boot/dts/apple/t6000-j314s.dtb: /soc/usb@1302280000: failed to match any schema with compatible: ['apple,t6000-dwc3', 'apple,t8103-dwc3', 'apple,dwc3', 'snps,dwc3']
   arch/arm64/boot/dts/apple/t6000-j314s.dtb: /soc/usb@1302280000: failed to match any schema with compatible: ['apple,t6000-dwc3', 'apple,t8103-dwc3', 'apple,dwc3', 'snps,dwc3']
   arch/arm64/boot/dts/apple/t6000-j314s.dtb: /soc/usb@1302280000: failed to match any schema with compatible: ['apple,t6000-dwc3', 'apple,t8103-dwc3', 'apple,dwc3', 'snps,dwc3']
   arch/arm64/boot/dts/apple/t6000-j314s.dtb: /soc/phy@1303000000: failed to match any schema with compatible: ['apple,t6000-atcphy', 'apple,t8103-atcphy']
   arch/arm64/boot/dts/apple/t6000-j314s.dtb: /soc/phy@1303000000: failed to match any schema with compatible: ['apple,t6000-atcphy', 'apple,t8103-atcphy']
--
   	'fixed-layout' is not one of ['u-boot,env', 'u-boot,env-redundant-bool', 'u-boot,env-redundant-count', 'brcm,env']
   	from schema $id: http://devicetree.org/schemas/nvmem/apple,spmi-nvmem.yaml#
   arch/arm64/boot/dts/apple/t6001-j314c.dtb: pmic@f (apple,maverick-pmic): nvmem-layout: Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'boot-error-count@6002,0', 'boot-error-stage@6003', 'boot-stage@6001', 'fault-shadow@867b', 'panic-count@6002,4', 'pm-setting@1405', 'rtc-offset@1411', 'shutdown-flag@600f,3', 'socd@8b00' were unexpected)
   	from schema $id: http://devicetree.org/schemas/nvmem/apple,spmi-nvmem.yaml#
   arch/arm64/boot/dts/apple/t6001-j314c.dtb: pmic@f (apple,maverick-pmic): Unevaluated properties are not allowed ('nvmem-layout' was unexpected)
   	from schema $id: http://devicetree.org/schemas/nvmem/apple,spmi-nvmem.yaml#
   arch/arm64/boot/dts/apple/t6001-j314c.dtb: nvmem-layout (fixed-layout): 'boot-error-count@6002,0', 'panic-count@6002,4', 'shutdown-flag@600f,3' do not match any of the regexes: '@[a-f0-9]+$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/nvmem/layouts/fixed-layout.yaml#
   arch/arm64/boot/dts/apple/t6001-j314c.dtb: usb@702280000 (apple,t6000-dwc3): iommus: [[155, 0], [156, 1]] is too long
   	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
>> arch/arm64/boot/dts/apple/t6001-j314c.dtb: usb@702280000 (apple,t6000-dwc3): Unevaluated properties are not allowed ('iommus' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
   arch/arm64/boot/dts/apple/t6001-j314c.dtb: /soc/usb@702280000: failed to match any schema with compatible: ['apple,t6000-dwc3', 'apple,t8103-dwc3', 'apple,dwc3', 'snps,dwc3']
   arch/arm64/boot/dts/apple/t6001-j314c.dtb: /soc/usb@702280000: failed to match any schema with compatible: ['apple,t6000-dwc3', 'apple,t8103-dwc3', 'apple,dwc3', 'snps,dwc3']
   arch/arm64/boot/dts/apple/t6001-j314c.dtb: /soc/usb@702280000: failed to match any schema with compatible: ['apple,t6000-dwc3', 'apple,t8103-dwc3', 'apple,dwc3', 'snps,dwc3']
>> arch/arm64/boot/dts/apple/t6001-j314c.dtb: /soc/phy@703000000: failed to match any schema with compatible: ['apple,t6000-atcphy', 'apple,t8103-atcphy']
>> arch/arm64/boot/dts/apple/t6001-j314c.dtb: /soc/phy@703000000: failed to match any schema with compatible: ['apple,t6000-atcphy', 'apple,t8103-atcphy']
   arch/arm64/boot/dts/apple/t6001-j314c.dtb: usb@b02280000 (apple,t6000-dwc3): iommus: [[161, 0], [162, 1]] is too long
   	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
>> arch/arm64/boot/dts/apple/t6001-j314c.dtb: usb@b02280000 (apple,t6000-dwc3): Unevaluated properties are not allowed ('iommus' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
   arch/arm64/boot/dts/apple/t6001-j314c.dtb: /soc/usb@b02280000: failed to match any schema with compatible: ['apple,t6000-dwc3', 'apple,t8103-dwc3', 'apple,dwc3', 'snps,dwc3']
   arch/arm64/boot/dts/apple/t6001-j314c.dtb: /soc/usb@b02280000: failed to match any schema with compatible: ['apple,t6000-dwc3', 'apple,t8103-dwc3', 'apple,dwc3', 'snps,dwc3']
   arch/arm64/boot/dts/apple/t6001-j314c.dtb: /soc/usb@b02280000: failed to match any schema with compatible: ['apple,t6000-dwc3', 'apple,t8103-dwc3', 'apple,dwc3', 'snps,dwc3']
   arch/arm64/boot/dts/apple/t6001-j314c.dtb: /soc/phy@b03000000: failed to match any schema with compatible: ['apple,t6000-atcphy', 'apple,t8103-atcphy']
   arch/arm64/boot/dts/apple/t6001-j314c.dtb: /soc/phy@b03000000: failed to match any schema with compatible: ['apple,t6000-atcphy', 'apple,t8103-atcphy']
   arch/arm64/boot/dts/apple/t6001-j314c.dtb: usb@f02280000 (apple,t6000-dwc3): iommus: [[167, 0], [168, 1]] is too long
   	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
   arch/arm64/boot/dts/apple/t6001-j314c.dtb: usb@f02280000 (apple,t6000-dwc3): Unevaluated properties are not allowed ('iommus' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
>> arch/arm64/boot/dts/apple/t6001-j314c.dtb: /soc/usb@f02280000: failed to match any schema with compatible: ['apple,t6000-dwc3', 'apple,t8103-dwc3', 'apple,dwc3', 'snps,dwc3']
>> arch/arm64/boot/dts/apple/t6001-j314c.dtb: /soc/usb@f02280000: failed to match any schema with compatible: ['apple,t6000-dwc3', 'apple,t8103-dwc3', 'apple,dwc3', 'snps,dwc3']
>> arch/arm64/boot/dts/apple/t6001-j314c.dtb: /soc/usb@f02280000: failed to match any schema with compatible: ['apple,t6000-dwc3', 'apple,t8103-dwc3', 'apple,dwc3', 'snps,dwc3']
   arch/arm64/boot/dts/apple/t6001-j314c.dtb: /soc/phy@f03000000: failed to match any schema with compatible: ['apple,t6000-atcphy', 'apple,t8103-atcphy']
   arch/arm64/boot/dts/apple/t6001-j314c.dtb: /soc/phy@f03000000: failed to match any schema with compatible: ['apple,t6000-atcphy', 'apple,t8103-atcphy']
   arch/arm64/boot/dts/apple/t6001-j314c.dtb: usb@1302280000 (apple,t6000-dwc3): iommus: [[173, 0], [174, 1]] is too long
   	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
   arch/arm64/boot/dts/apple/t6001-j314c.dtb: /soc/usb@1302280000: failed to match any schema with compatible: ['apple,t6000-dwc3', 'apple,t8103-dwc3', 'apple,dwc3', 'snps,dwc3']
   arch/arm64/boot/dts/apple/t6001-j314c.dtb: /soc/usb@1302280000: failed to match any schema with compatible: ['apple,t6000-dwc3', 'apple,t8103-dwc3', 'apple,dwc3', 'snps,dwc3']
   arch/arm64/boot/dts/apple/t6001-j314c.dtb: /soc/usb@1302280000: failed to match any schema with compatible: ['apple,t6000-dwc3', 'apple,t8103-dwc3', 'apple,dwc3', 'snps,dwc3']
   arch/arm64/boot/dts/apple/t6001-j314c.dtb: /soc/phy@1303000000: failed to match any schema with compatible: ['apple,t6000-atcphy', 'apple,t8103-atcphy']
   arch/arm64/boot/dts/apple/t6001-j314c.dtb: /soc/phy@1303000000: failed to match any schema with compatible: ['apple,t6000-atcphy', 'apple,t8103-atcphy']
--
   	'fixed-layout' is not one of ['u-boot,env', 'u-boot,env-redundant-bool', 'u-boot,env-redundant-count', 'brcm,env']
   	from schema $id: http://devicetree.org/schemas/nvmem/apple,spmi-nvmem.yaml#
   arch/arm64/boot/dts/apple/t6000-j316s.dtb: pmic@f (apple,maverick-pmic): nvmem-layout: Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'boot-error-count@6002,0', 'boot-error-stage@6003', 'boot-stage@6001', 'fault-shadow@867b', 'panic-count@6002,4', 'pm-setting@1405', 'rtc-offset@1411', 'shutdown-flag@600f,3', 'socd@8b00' were unexpected)
   	from schema $id: http://devicetree.org/schemas/nvmem/apple,spmi-nvmem.yaml#
   arch/arm64/boot/dts/apple/t6000-j316s.dtb: pmic@f (apple,maverick-pmic): Unevaluated properties are not allowed ('nvmem-layout' was unexpected)
   	from schema $id: http://devicetree.org/schemas/nvmem/apple,spmi-nvmem.yaml#
   arch/arm64/boot/dts/apple/t6000-j316s.dtb: nvmem-layout (fixed-layout): 'boot-error-count@6002,0', 'panic-count@6002,4', 'shutdown-flag@600f,3' do not match any of the regexes: '@[a-f0-9]+$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/nvmem/layouts/fixed-layout.yaml#
   arch/arm64/boot/dts/apple/t6000-j316s.dtb: usb@702280000 (apple,t6000-dwc3): iommus: [[141, 0], [142, 1]] is too long
   	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
>> arch/arm64/boot/dts/apple/t6000-j316s.dtb: usb@702280000 (apple,t6000-dwc3): Unevaluated properties are not allowed ('iommus' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
   arch/arm64/boot/dts/apple/t6000-j316s.dtb: /soc/usb@702280000: failed to match any schema with compatible: ['apple,t6000-dwc3', 'apple,t8103-dwc3', 'apple,dwc3', 'snps,dwc3']
   arch/arm64/boot/dts/apple/t6000-j316s.dtb: /soc/usb@702280000: failed to match any schema with compatible: ['apple,t6000-dwc3', 'apple,t8103-dwc3', 'apple,dwc3', 'snps,dwc3']
   arch/arm64/boot/dts/apple/t6000-j316s.dtb: /soc/usb@702280000: failed to match any schema with compatible: ['apple,t6000-dwc3', 'apple,t8103-dwc3', 'apple,dwc3', 'snps,dwc3']
   arch/arm64/boot/dts/apple/t6000-j316s.dtb: /soc/phy@703000000: failed to match any schema with compatible: ['apple,t6000-atcphy', 'apple,t8103-atcphy']
   arch/arm64/boot/dts/apple/t6000-j316s.dtb: /soc/phy@703000000: failed to match any schema with compatible: ['apple,t6000-atcphy', 'apple,t8103-atcphy']
>> arch/arm64/boot/dts/apple/t6000-j316s.dtb: usb@b02280000 (apple,t6000-dwc3): iommus: [[147, 0], [148, 1]] is too long
   	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
   arch/arm64/boot/dts/apple/t6000-j316s.dtb: usb@b02280000 (apple,t6000-dwc3): Unevaluated properties are not allowed ('iommus' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
>> arch/arm64/boot/dts/apple/t6000-j316s.dtb: /soc/usb@b02280000: failed to match any schema with compatible: ['apple,t6000-dwc3', 'apple,t8103-dwc3', 'apple,dwc3', 'snps,dwc3']
>> arch/arm64/boot/dts/apple/t6000-j316s.dtb: /soc/usb@b02280000: failed to match any schema with compatible: ['apple,t6000-dwc3', 'apple,t8103-dwc3', 'apple,dwc3', 'snps,dwc3']
>> arch/arm64/boot/dts/apple/t6000-j316s.dtb: /soc/usb@b02280000: failed to match any schema with compatible: ['apple,t6000-dwc3', 'apple,t8103-dwc3', 'apple,dwc3', 'snps,dwc3']
   arch/arm64/boot/dts/apple/t6000-j316s.dtb: /soc/phy@b03000000: failed to match any schema with compatible: ['apple,t6000-atcphy', 'apple,t8103-atcphy']
   arch/arm64/boot/dts/apple/t6000-j316s.dtb: /soc/phy@b03000000: failed to match any schema with compatible: ['apple,t6000-atcphy', 'apple,t8103-atcphy']
>> arch/arm64/boot/dts/apple/t6000-j316s.dtb: usb@f02280000 (apple,t6000-dwc3): iommus: [[153, 0], [154, 1]] is too long
   	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
   arch/arm64/boot/dts/apple/t6000-j316s.dtb: usb@f02280000 (apple,t6000-dwc3): Unevaluated properties are not allowed ('iommus' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
>> arch/arm64/boot/dts/apple/t6000-j316s.dtb: /soc/usb@f02280000: failed to match any schema with compatible: ['apple,t6000-dwc3', 'apple,t8103-dwc3', 'apple,dwc3', 'snps,dwc3']
>> arch/arm64/boot/dts/apple/t6000-j316s.dtb: /soc/usb@f02280000: failed to match any schema with compatible: ['apple,t6000-dwc3', 'apple,t8103-dwc3', 'apple,dwc3', 'snps,dwc3']
>> arch/arm64/boot/dts/apple/t6000-j316s.dtb: /soc/usb@f02280000: failed to match any schema with compatible: ['apple,t6000-dwc3', 'apple,t8103-dwc3', 'apple,dwc3', 'snps,dwc3']
   arch/arm64/boot/dts/apple/t6000-j316s.dtb: /soc/phy@f03000000: failed to match any schema with compatible: ['apple,t6000-atcphy', 'apple,t8103-atcphy']
   arch/arm64/boot/dts/apple/t6000-j316s.dtb: /soc/phy@f03000000: failed to match any schema with compatible: ['apple,t6000-atcphy', 'apple,t8103-atcphy']
   arch/arm64/boot/dts/apple/t6000-j316s.dtb: usb@1302280000 (apple,t6000-dwc3): iommus: [[159, 0], [160, 1]] is too long
   	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
   arch/arm64/boot/dts/apple/t6000-j316s.dtb: /soc/usb@1302280000: failed to match any schema with compatible: ['apple,t6000-dwc3', 'apple,t8103-dwc3', 'apple,dwc3', 'snps,dwc3']
   arch/arm64/boot/dts/apple/t6000-j316s.dtb: /soc/usb@1302280000: failed to match any schema with compatible: ['apple,t6000-dwc3', 'apple,t8103-dwc3', 'apple,dwc3', 'snps,dwc3']
   arch/arm64/boot/dts/apple/t6000-j316s.dtb: /soc/usb@1302280000: failed to match any schema with compatible: ['apple,t6000-dwc3', 'apple,t8103-dwc3', 'apple,dwc3', 'snps,dwc3']
   arch/arm64/boot/dts/apple/t6000-j316s.dtb: /soc/phy@1303000000: failed to match any schema with compatible: ['apple,t6000-atcphy', 'apple,t8103-atcphy']
   arch/arm64/boot/dts/apple/t6000-j316s.dtb: /soc/phy@1303000000: failed to match any schema with compatible: ['apple,t6000-atcphy', 'apple,t8103-atcphy']
--
   	'kontron,sl28-vpd' was expected
   	'onie,tlv-layout' was expected
   	'fixed-layout' is not one of ['u-boot,env', 'u-boot,env-redundant-bool', 'u-boot,env-redundant-count', 'brcm,env']
   	from schema $id: http://devicetree.org/schemas/nvmem/apple,spmi-nvmem.yaml#
   arch/arm64/boot/dts/apple/t6001-j316c.dtb: pmic@f (apple,maverick-pmic): nvmem-layout: Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'boot-error-count@6002,0', 'boot-error-stage@6003', 'boot-stage@6001', 'fault-shadow@867b', 'panic-count@6002,4', 'pm-setting@1405', 'rtc-offset@1411', 'shutdown-flag@600f,3', 'socd@8b00' were unexpected)
   	from schema $id: http://devicetree.org/schemas/nvmem/apple,spmi-nvmem.yaml#
   arch/arm64/boot/dts/apple/t6001-j316c.dtb: pmic@f (apple,maverick-pmic): Unevaluated properties are not allowed ('nvmem-layout' was unexpected)
   	from schema $id: http://devicetree.org/schemas/nvmem/apple,spmi-nvmem.yaml#
   arch/arm64/boot/dts/apple/t6001-j316c.dtb: nvmem-layout (fixed-layout): 'boot-error-count@6002,0', 'panic-count@6002,4', 'shutdown-flag@600f,3' do not match any of the regexes: '@[a-f0-9]+$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/nvmem/layouts/fixed-layout.yaml#
>> arch/arm64/boot/dts/apple/t6001-j316c.dtb: usb@702280000 (apple,t6000-dwc3): iommus: [[155, 0], [156, 1]] is too long
   	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
   arch/arm64/boot/dts/apple/t6001-j316c.dtb: usb@702280000 (apple,t6000-dwc3): Unevaluated properties are not allowed ('iommus' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
>> arch/arm64/boot/dts/apple/t6001-j316c.dtb: /soc/usb@702280000: failed to match any schema with compatible: ['apple,t6000-dwc3', 'apple,t8103-dwc3', 'apple,dwc3', 'snps,dwc3']
>> arch/arm64/boot/dts/apple/t6001-j316c.dtb: /soc/usb@702280000: failed to match any schema with compatible: ['apple,t6000-dwc3', 'apple,t8103-dwc3', 'apple,dwc3', 'snps,dwc3']
>> arch/arm64/boot/dts/apple/t6001-j316c.dtb: /soc/usb@702280000: failed to match any schema with compatible: ['apple,t6000-dwc3', 'apple,t8103-dwc3', 'apple,dwc3', 'snps,dwc3']
   arch/arm64/boot/dts/apple/t6001-j316c.dtb: /soc/phy@703000000: failed to match any schema with compatible: ['apple,t6000-atcphy', 'apple,t8103-atcphy']
   arch/arm64/boot/dts/apple/t6001-j316c.dtb: /soc/phy@703000000: failed to match any schema with compatible: ['apple,t6000-atcphy', 'apple,t8103-atcphy']
   arch/arm64/boot/dts/apple/t6001-j316c.dtb: usb@b02280000 (apple,t6000-dwc3): iommus: [[161, 0], [162, 1]] is too long
   	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
>> arch/arm64/boot/dts/apple/t6001-j316c.dtb: usb@b02280000 (apple,t6000-dwc3): Unevaluated properties are not allowed ('iommus' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
   arch/arm64/boot/dts/apple/t6001-j316c.dtb: /soc/usb@b02280000: failed to match any schema with compatible: ['apple,t6000-dwc3', 'apple,t8103-dwc3', 'apple,dwc3', 'snps,dwc3']
   arch/arm64/boot/dts/apple/t6001-j316c.dtb: /soc/usb@b02280000: failed to match any schema with compatible: ['apple,t6000-dwc3', 'apple,t8103-dwc3', 'apple,dwc3', 'snps,dwc3']
   arch/arm64/boot/dts/apple/t6001-j316c.dtb: /soc/usb@b02280000: failed to match any schema with compatible: ['apple,t6000-dwc3', 'apple,t8103-dwc3', 'apple,dwc3', 'snps,dwc3']
>> arch/arm64/boot/dts/apple/t6001-j316c.dtb: /soc/phy@b03000000: failed to match any schema with compatible: ['apple,t6000-atcphy', 'apple,t8103-atcphy']
>> arch/arm64/boot/dts/apple/t6001-j316c.dtb: /soc/phy@b03000000: failed to match any schema with compatible: ['apple,t6000-atcphy', 'apple,t8103-atcphy']
   arch/arm64/boot/dts/apple/t6001-j316c.dtb: usb@f02280000 (apple,t6000-dwc3): iommus: [[167, 0], [168, 1]] is too long
   	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
>> arch/arm64/boot/dts/apple/t6001-j316c.dtb: usb@f02280000 (apple,t6000-dwc3): Unevaluated properties are not allowed ('iommus' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
   arch/arm64/boot/dts/apple/t6001-j316c.dtb: /soc/usb@f02280000: failed to match any schema with compatible: ['apple,t6000-dwc3', 'apple,t8103-dwc3', 'apple,dwc3', 'snps,dwc3']
   arch/arm64/boot/dts/apple/t6001-j316c.dtb: /soc/usb@f02280000: failed to match any schema with compatible: ['apple,t6000-dwc3', 'apple,t8103-dwc3', 'apple,dwc3', 'snps,dwc3']
   arch/arm64/boot/dts/apple/t6001-j316c.dtb: /soc/usb@f02280000: failed to match any schema with compatible: ['apple,t6000-dwc3', 'apple,t8103-dwc3', 'apple,dwc3', 'snps,dwc3']
>> arch/arm64/boot/dts/apple/t6001-j316c.dtb: /soc/phy@f03000000: failed to match any schema with compatible: ['apple,t6000-atcphy', 'apple,t8103-atcphy']
>> arch/arm64/boot/dts/apple/t6001-j316c.dtb: /soc/phy@f03000000: failed to match any schema with compatible: ['apple,t6000-atcphy', 'apple,t8103-atcphy']
   arch/arm64/boot/dts/apple/t6001-j316c.dtb: usb@1302280000 (apple,t6000-dwc3): iommus: [[173, 0], [174, 1]] is too long
   	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
   arch/arm64/boot/dts/apple/t6001-j316c.dtb: /soc/usb@1302280000: failed to match any schema with compatible: ['apple,t6000-dwc3', 'apple,t8103-dwc3', 'apple,dwc3', 'snps,dwc3']
   arch/arm64/boot/dts/apple/t6001-j316c.dtb: /soc/usb@1302280000: failed to match any schema with compatible: ['apple,t6000-dwc3', 'apple,t8103-dwc3', 'apple,dwc3', 'snps,dwc3']
   arch/arm64/boot/dts/apple/t6001-j316c.dtb: /soc/usb@1302280000: failed to match any schema with compatible: ['apple,t6000-dwc3', 'apple,t8103-dwc3', 'apple,dwc3', 'snps,dwc3']
   arch/arm64/boot/dts/apple/t6001-j316c.dtb: /soc/phy@1303000000: failed to match any schema with compatible: ['apple,t6000-atcphy', 'apple,t8103-atcphy']
   arch/arm64/boot/dts/apple/t6001-j316c.dtb: /soc/phy@1303000000: failed to match any schema with compatible: ['apple,t6000-atcphy', 'apple,t8103-atcphy']
--
   	'kontron,sl28-vpd' was expected
   	'onie,tlv-layout' was expected
   	'fixed-layout' is not one of ['u-boot,env', 'u-boot,env-redundant-bool', 'u-boot,env-redundant-count', 'brcm,env']
   	from schema $id: http://devicetree.org/schemas/nvmem/apple,spmi-nvmem.yaml#
   arch/arm64/boot/dts/apple/t6001-j375c.dtb: pmic@f (apple,maverick-pmic): nvmem-layout: Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'boot-error-count@6002,0', 'boot-error-stage@6003', 'boot-stage@6001', 'fault-shadow@867b', 'panic-count@6002,4', 'pm-setting@1405', 'rtc-offset@1411', 'shutdown-flag@600f,3', 'socd@8b00' were unexpected)
   	from schema $id: http://devicetree.org/schemas/nvmem/apple,spmi-nvmem.yaml#
   arch/arm64/boot/dts/apple/t6001-j375c.dtb: pmic@f (apple,maverick-pmic): Unevaluated properties are not allowed ('nvmem-layout' was unexpected)
   	from schema $id: http://devicetree.org/schemas/nvmem/apple,spmi-nvmem.yaml#
   arch/arm64/boot/dts/apple/t6001-j375c.dtb: nvmem-layout (fixed-layout): 'boot-error-count@6002,0', 'panic-count@6002,4', 'shutdown-flag@600f,3' do not match any of the regexes: '@[a-f0-9]+$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/nvmem/layouts/fixed-layout.yaml#
>> arch/arm64/boot/dts/apple/t6001-j375c.dtb: usb@702280000 (apple,t6000-dwc3): iommus: [[157, 0], [158, 1]] is too long
   	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
   arch/arm64/boot/dts/apple/t6001-j375c.dtb: usb@702280000 (apple,t6000-dwc3): Unevaluated properties are not allowed ('iommus' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
>> arch/arm64/boot/dts/apple/t6001-j375c.dtb: /soc/usb@702280000: failed to match any schema with compatible: ['apple,t6000-dwc3', 'apple,t8103-dwc3', 'apple,dwc3', 'snps,dwc3']
>> arch/arm64/boot/dts/apple/t6001-j375c.dtb: /soc/usb@702280000: failed to match any schema with compatible: ['apple,t6000-dwc3', 'apple,t8103-dwc3', 'apple,dwc3', 'snps,dwc3']
>> arch/arm64/boot/dts/apple/t6001-j375c.dtb: /soc/usb@702280000: failed to match any schema with compatible: ['apple,t6000-dwc3', 'apple,t8103-dwc3', 'apple,dwc3', 'snps,dwc3']
   arch/arm64/boot/dts/apple/t6001-j375c.dtb: /soc/phy@703000000: failed to match any schema with compatible: ['apple,t6000-atcphy', 'apple,t8103-atcphy']
   arch/arm64/boot/dts/apple/t6001-j375c.dtb: /soc/phy@703000000: failed to match any schema with compatible: ['apple,t6000-atcphy', 'apple,t8103-atcphy']
>> arch/arm64/boot/dts/apple/t6001-j375c.dtb: usb@b02280000 (apple,t6000-dwc3): iommus: [[163, 0], [164, 1]] is too long
   	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
   arch/arm64/boot/dts/apple/t6001-j375c.dtb: usb@b02280000 (apple,t6000-dwc3): Unevaluated properties are not allowed ('iommus' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
>> arch/arm64/boot/dts/apple/t6001-j375c.dtb: /soc/usb@b02280000: failed to match any schema with compatible: ['apple,t6000-dwc3', 'apple,t8103-dwc3', 'apple,dwc3', 'snps,dwc3']
>> arch/arm64/boot/dts/apple/t6001-j375c.dtb: /soc/usb@b02280000: failed to match any schema with compatible: ['apple,t6000-dwc3', 'apple,t8103-dwc3', 'apple,dwc3', 'snps,dwc3']
>> arch/arm64/boot/dts/apple/t6001-j375c.dtb: /soc/usb@b02280000: failed to match any schema with compatible: ['apple,t6000-dwc3', 'apple,t8103-dwc3', 'apple,dwc3', 'snps,dwc3']
   arch/arm64/boot/dts/apple/t6001-j375c.dtb: /soc/phy@b03000000: failed to match any schema with compatible: ['apple,t6000-atcphy', 'apple,t8103-atcphy']
   arch/arm64/boot/dts/apple/t6001-j375c.dtb: /soc/phy@b03000000: failed to match any schema with compatible: ['apple,t6000-atcphy', 'apple,t8103-atcphy']
>> arch/arm64/boot/dts/apple/t6001-j375c.dtb: usb@f02280000 (apple,t6000-dwc3): iommus: [[169, 0], [170, 1]] is too long
   	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
>> arch/arm64/boot/dts/apple/t6001-j375c.dtb: usb@f02280000 (apple,t6000-dwc3): Unevaluated properties are not allowed ('iommus' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
   arch/arm64/boot/dts/apple/t6001-j375c.dtb: /soc/usb@f02280000: failed to match any schema with compatible: ['apple,t6000-dwc3', 'apple,t8103-dwc3', 'apple,dwc3', 'snps,dwc3']
   arch/arm64/boot/dts/apple/t6001-j375c.dtb: /soc/usb@f02280000: failed to match any schema with compatible: ['apple,t6000-dwc3', 'apple,t8103-dwc3', 'apple,dwc3', 'snps,dwc3']
   arch/arm64/boot/dts/apple/t6001-j375c.dtb: /soc/usb@f02280000: failed to match any schema with compatible: ['apple,t6000-dwc3', 'apple,t8103-dwc3', 'apple,dwc3', 'snps,dwc3']
>> arch/arm64/boot/dts/apple/t6001-j375c.dtb: /soc/phy@f03000000: failed to match any schema with compatible: ['apple,t6000-atcphy', 'apple,t8103-atcphy']
>> arch/arm64/boot/dts/apple/t6001-j375c.dtb: /soc/phy@f03000000: failed to match any schema with compatible: ['apple,t6000-atcphy', 'apple,t8103-atcphy']
   arch/arm64/boot/dts/apple/t6001-j375c.dtb: usb@1302280000 (apple,t6000-dwc3): iommus: [[175, 0], [176, 1]] is too long
   	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
   arch/arm64/boot/dts/apple/t6001-j375c.dtb: usb@1302280000 (apple,t6000-dwc3): Unevaluated properties are not allowed ('iommus' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
   arch/arm64/boot/dts/apple/t6001-j375c.dtb: /soc/usb@1302280000: failed to match any schema with compatible: ['apple,t6000-dwc3', 'apple,t8103-dwc3', 'apple,dwc3', 'snps,dwc3']
   arch/arm64/boot/dts/apple/t6001-j375c.dtb: /soc/usb@1302280000: failed to match any schema with compatible: ['apple,t6000-dwc3', 'apple,t8103-dwc3', 'apple,dwc3', 'snps,dwc3']
   arch/arm64/boot/dts/apple/t6001-j375c.dtb: /soc/usb@1302280000: failed to match any schema with compatible: ['apple,t6000-dwc3', 'apple,t8103-dwc3', 'apple,dwc3', 'snps,dwc3']
   arch/arm64/boot/dts/apple/t6001-j375c.dtb: /soc/phy@1303000000: failed to match any schema with compatible: ['apple,t6000-atcphy', 'apple,t8103-atcphy']
   arch/arm64/boot/dts/apple/t6001-j375c.dtb: /soc/phy@1303000000: failed to match any schema with compatible: ['apple,t6000-atcphy', 'apple,t8103-atcphy']
--
   	'fixed-layout' is not one of ['u-boot,env', 'u-boot,env-redundant-bool', 'u-boot,env-redundant-count', 'brcm,env']
   	from schema $id: http://devicetree.org/schemas/nvmem/apple,spmi-nvmem.yaml#
   arch/arm64/boot/dts/apple/t6002-j375d.dtb: pmic@f (apple,maverick-pmic): nvmem-layout: Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'boot-error-count@6002,0', 'boot-error-stage@6003', 'boot-stage@6001', 'fault-shadow@867b', 'panic-count@6002,4', 'pm-setting@1405', 'rtc-offset@1411', 'shutdown-flag@600f,3', 'socd@8b00' were unexpected)
   	from schema $id: http://devicetree.org/schemas/nvmem/apple,spmi-nvmem.yaml#
   arch/arm64/boot/dts/apple/t6002-j375d.dtb: pmic@f (apple,maverick-pmic): Unevaluated properties are not allowed ('nvmem-layout' was unexpected)
   	from schema $id: http://devicetree.org/schemas/nvmem/apple,spmi-nvmem.yaml#
   arch/arm64/boot/dts/apple/t6002-j375d.dtb: nvmem-layout (fixed-layout): 'boot-error-count@6002,0', 'panic-count@6002,4', 'shutdown-flag@600f,3' do not match any of the regexes: '@[a-f0-9]+$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/nvmem/layouts/fixed-layout.yaml#
   arch/arm64/boot/dts/apple/t6002-j375d.dtb: usb@702280000 (apple,t6000-dwc3): iommus: [[178, 0], [179, 1]] is too long
   	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
>> arch/arm64/boot/dts/apple/t6002-j375d.dtb: usb@702280000 (apple,t6000-dwc3): Unevaluated properties are not allowed ('iommus' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
   arch/arm64/boot/dts/apple/t6002-j375d.dtb: /soc@200000000/usb@702280000: failed to match any schema with compatible: ['apple,t6000-dwc3', 'apple,t8103-dwc3', 'apple,dwc3', 'snps,dwc3']
   arch/arm64/boot/dts/apple/t6002-j375d.dtb: /soc@200000000/usb@702280000: failed to match any schema with compatible: ['apple,t6000-dwc3', 'apple,t8103-dwc3', 'apple,dwc3', 'snps,dwc3']
   arch/arm64/boot/dts/apple/t6002-j375d.dtb: /soc@200000000/usb@702280000: failed to match any schema with compatible: ['apple,t6000-dwc3', 'apple,t8103-dwc3', 'apple,dwc3', 'snps,dwc3']
>> arch/arm64/boot/dts/apple/t6002-j375d.dtb: /soc@200000000/phy@703000000: failed to match any schema with compatible: ['apple,t6000-atcphy', 'apple,t8103-atcphy']
>> arch/arm64/boot/dts/apple/t6002-j375d.dtb: /soc@200000000/phy@703000000: failed to match any schema with compatible: ['apple,t6000-atcphy', 'apple,t8103-atcphy']
   arch/arm64/boot/dts/apple/t6002-j375d.dtb: usb@b02280000 (apple,t6000-dwc3): iommus: [[184, 0], [185, 1]] is too long
   	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
>> arch/arm64/boot/dts/apple/t6002-j375d.dtb: usb@b02280000 (apple,t6000-dwc3): Unevaluated properties are not allowed ('iommus' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
   arch/arm64/boot/dts/apple/t6002-j375d.dtb: /soc@200000000/usb@b02280000: failed to match any schema with compatible: ['apple,t6000-dwc3', 'apple,t8103-dwc3', 'apple,dwc3', 'snps,dwc3']
   arch/arm64/boot/dts/apple/t6002-j375d.dtb: /soc@200000000/usb@b02280000: failed to match any schema with compatible: ['apple,t6000-dwc3', 'apple,t8103-dwc3', 'apple,dwc3', 'snps,dwc3']
   arch/arm64/boot/dts/apple/t6002-j375d.dtb: /soc@200000000/usb@b02280000: failed to match any schema with compatible: ['apple,t6000-dwc3', 'apple,t8103-dwc3', 'apple,dwc3', 'snps,dwc3']
>> arch/arm64/boot/dts/apple/t6002-j375d.dtb: /soc@200000000/phy@b03000000: failed to match any schema with compatible: ['apple,t6000-atcphy', 'apple,t8103-atcphy']
>> arch/arm64/boot/dts/apple/t6002-j375d.dtb: /soc@200000000/phy@b03000000: failed to match any schema with compatible: ['apple,t6000-atcphy', 'apple,t8103-atcphy']
   arch/arm64/boot/dts/apple/t6002-j375d.dtb: usb@f02280000 (apple,t6000-dwc3): iommus: [[190, 0], [191, 1]] is too long
   	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
>> arch/arm64/boot/dts/apple/t6002-j375d.dtb: usb@f02280000 (apple,t6000-dwc3): Unevaluated properties are not allowed ('iommus' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
   arch/arm64/boot/dts/apple/t6002-j375d.dtb: /soc@200000000/usb@f02280000: failed to match any schema with compatible: ['apple,t6000-dwc3', 'apple,t8103-dwc3', 'apple,dwc3', 'snps,dwc3']
   arch/arm64/boot/dts/apple/t6002-j375d.dtb: /soc@200000000/usb@f02280000: failed to match any schema with compatible: ['apple,t6000-dwc3', 'apple,t8103-dwc3', 'apple,dwc3', 'snps,dwc3']
   arch/arm64/boot/dts/apple/t6002-j375d.dtb: /soc@200000000/usb@f02280000: failed to match any schema with compatible: ['apple,t6000-dwc3', 'apple,t8103-dwc3', 'apple,dwc3', 'snps,dwc3']
>> arch/arm64/boot/dts/apple/t6002-j375d.dtb: /soc@200000000/phy@f03000000: failed to match any schema with compatible: ['apple,t6000-atcphy', 'apple,t8103-atcphy']
>> arch/arm64/boot/dts/apple/t6002-j375d.dtb: /soc@200000000/phy@f03000000: failed to match any schema with compatible: ['apple,t6000-atcphy', 'apple,t8103-atcphy']
   arch/arm64/boot/dts/apple/t6002-j375d.dtb: usb@1302280000 (apple,t6000-dwc3): iommus: [[196, 0], [197, 1]] is too long
   	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
   arch/arm64/boot/dts/apple/t6002-j375d.dtb: usb@1302280000 (apple,t6000-dwc3): Unevaluated properties are not allowed ('iommus' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
   arch/arm64/boot/dts/apple/t6002-j375d.dtb: /soc@200000000/usb@1302280000: failed to match any schema with compatible: ['apple,t6000-dwc3', 'apple,t8103-dwc3', 'apple,dwc3', 'snps,dwc3']
   arch/arm64/boot/dts/apple/t6002-j375d.dtb: /soc@200000000/usb@1302280000: failed to match any schema with compatible: ['apple,t6000-dwc3', 'apple,t8103-dwc3', 'apple,dwc3', 'snps,dwc3']
   arch/arm64/boot/dts/apple/t6002-j375d.dtb: /soc@200000000/usb@1302280000: failed to match any schema with compatible: ['apple,t6000-dwc3', 'apple,t8103-dwc3', 'apple,dwc3', 'snps,dwc3']
   arch/arm64/boot/dts/apple/t6002-j375d.dtb: /soc@200000000/phy@1303000000: failed to match any schema with compatible: ['apple,t6000-atcphy', 'apple,t8103-atcphy']
   arch/arm64/boot/dts/apple/t6002-j375d.dtb: /soc@200000000/phy@1303000000: failed to match any schema with compatible: ['apple,t6000-atcphy', 'apple,t8103-atcphy']
   arch/arm64/boot/dts/apple/t6002-j375d.dtb: usb@702280000 (apple,t6000-dwc3): iommus: [[269, 0], [270, 1]] is too long
   	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
>> arch/arm64/boot/dts/apple/t6002-j375d.dtb: usb@702280000 (apple,t6000-dwc3): Unevaluated properties are not allowed ('iommus' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
   arch/arm64/boot/dts/apple/t6002-j375d.dtb: /soc@2200000000/usb@702280000: failed to match any schema with compatible: ['apple,t6000-dwc3', 'apple,t8103-dwc3', 'apple,dwc3', 'snps,dwc3']
   arch/arm64/boot/dts/apple/t6002-j375d.dtb: /soc@2200000000/usb@702280000: failed to match any schema with compatible: ['apple,t6000-dwc3', 'apple,t8103-dwc3', 'apple,dwc3', 'snps,dwc3']
   arch/arm64/boot/dts/apple/t6002-j375d.dtb: /soc@2200000000/usb@702280000: failed to match any schema with compatible: ['apple,t6000-dwc3', 'apple,t8103-dwc3', 'apple,dwc3', 'snps,dwc3']
   arch/arm64/boot/dts/apple/t6002-j375d.dtb: /soc@2200000000/phy@703000000: failed to match any schema with compatible: ['apple,t6000-atcphy', 'apple,t8103-atcphy']
   arch/arm64/boot/dts/apple/t6002-j375d.dtb: /soc@2200000000/phy@703000000: failed to match any schema with compatible: ['apple,t6000-atcphy', 'apple,t8103-atcphy']
   arch/arm64/boot/dts/apple/t6002-j375d.dtb: usb@b02280000 (apple,t6000-dwc3): iommus: [[275, 0], [276, 1]] is too long
   	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
>> arch/arm64/boot/dts/apple/t6002-j375d.dtb: usb@b02280000 (apple,t6000-dwc3): Unevaluated properties are not allowed ('iommus' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
   arch/arm64/boot/dts/apple/t6002-j375d.dtb: /soc@2200000000/usb@b02280000: failed to match any schema with compatible: ['apple,t6000-dwc3', 'apple,t8103-dwc3', 'apple,dwc3', 'snps,dwc3']
   arch/arm64/boot/dts/apple/t6002-j375d.dtb: /soc@2200000000/usb@b02280000: failed to match any schema with compatible: ['apple,t6000-dwc3', 'apple,t8103-dwc3', 'apple,dwc3', 'snps,dwc3']
   arch/arm64/boot/dts/apple/t6002-j375d.dtb: /soc@2200000000/usb@b02280000: failed to match any schema with compatible: ['apple,t6000-dwc3', 'apple,t8103-dwc3', 'apple,dwc3', 'snps,dwc3']
   arch/arm64/boot/dts/apple/t6002-j375d.dtb: /soc@2200000000/phy@b03000000: failed to match any schema with compatible: ['apple,t6000-atcphy', 'apple,t8103-atcphy']
   arch/arm64/boot/dts/apple/t6002-j375d.dtb: /soc@2200000000/phy@b03000000: failed to match any schema with compatible: ['apple,t6000-atcphy', 'apple,t8103-atcphy']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
