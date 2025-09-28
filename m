Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D8708F54
	for <oe-kbuild@lists.linux.dev>; Sun, 28 Sep 2025 01:52:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759024327; cv=none; b=kcnEmy6q9P1nHwB0C3jM8CMpzP3hFcf5uGKq7hMMH8I8upao8nkTKKxSgBk0GPWmchciDC+Y1CWEJYFMejZgGTvFSL3d8gXsjGXyLqUmGiAf1j1US9WUF/qaZ4UdbQXxuFFe9OscEQuv+t5hDe+2mOd7b9SARNir93tfRJG1Li8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759024327; c=relaxed/simple;
	bh=bXEgCW2OCXXp/VNqA80SGBQTX1pS9FflUousrIQg0Sw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=JlBO/5JBwJ1Dw6m+W6mOXduVoJIakwbe6CSfcovcNoOmAQUSzQT6ctD96sg7j33LkNaIIVaGJzpL27xd8awQPCBCwH9RRyY0NPFjyNKBje5ogcwOFyLlrUORaFfdGcjg/0I1D5nXB1DhfquXkmSCek6J4au3Z6NT5DDmwaivzOQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=E+sE5xU6; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="E+sE5xU6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1759024325; x=1790560325;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=bXEgCW2OCXXp/VNqA80SGBQTX1pS9FflUousrIQg0Sw=;
  b=E+sE5xU69hSJopOCzeqthVGarTDeat51pN+NY9p22oA7vRL1SBcM52yD
   Wkxqxf365RPo1vPp1VuNmOQvQASwXR4GvbmDf+2XsAIV4f8VUyk+E9ME/
   1LI9hhGJtTugIWy4asdgEPQF18+IAgnPzGDMuy34x6jeIBxNHpRmyMDkn
   QGbOuXtbu6tvnZ0c9Ker8aW+Q2+lnuxcv41S3am/6JdNRr4ajkyfsUKIv
   ngbZINRJPsOEMP1iRONHtesywK2a6a8CMtYl7dWvh8IFHWcb+yjmg8NuS
   sC9oJoUTpykXeeVLVJj5VuCi3L5tcbkS5DOpL8LZFASFTigYIBXuHGbwq
   g==;
X-CSE-ConnectionGUID: cXUMUu8gSX+o2iy3w3ztWA==
X-CSE-MsgGUID: 3BRvc92vScWy/mV6xO9wFQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11566"; a="71921473"
X-IronPort-AV: E=Sophos;i="6.18,298,1751266800"; 
   d="scan'208";a="71921473"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Sep 2025 18:52:04 -0700
X-CSE-ConnectionGUID: 3C96sEQ+ShKmCz5drfD8zg==
X-CSE-MsgGUID: dPM/QSm2TYaahg+qwrnvkw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,298,1751266800"; 
   d="scan'208";a="183096061"
Received: from igk-lkp-server01.igk.intel.com (HELO 0e586ad5e7f7) ([10.91.175.65])
  by orviesa005.jf.intel.com with ESMTP; 27 Sep 2025 18:52:02 -0700
Received: from kbuild by 0e586ad5e7f7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1v2ga0-000000005bB-0AGa;
	Sun, 28 Sep 2025 01:52:00 +0000
Date: Sun, 28 Sep 2025 03:51:41 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [asahilinux:bits/000-devicetree 29/140]
 arch/arm64/boot/dts/apple/t8112-j413.dtb: usb@382280000 (apple,t8112-dwc3):
 Unevaluated properties are not allowed ('iommus' was unexpected)
Message-ID: <202509280320.siW2fPYk-lkp@intel.com>
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
CC: Hector Martin <marcan@marcan.st>

tree:   https://github.com/AsahiLinux/linux bits/000-devicetree
head:   703a105e4188c8c9e084375a48f08853cf64cfca
commit: b58144469f643c211476e918a701b850e345e750 [29/140] arm64: dts: apple: t8112: Add Apple Type-C PHY and dwc3
:::::: branch date: 7 days ago
:::::: commit date: 3 weeks ago
config: arm64-randconfig-2051-20250919 (https://download.01.org/0day-ci/archive/20250928/202509280320.siW2fPYk-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project ce5124856e019792783de9630d0c5a1f0aaf2d9d)
dtschema version: 2025.8
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250928/202509280320.siW2fPYk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202509280320.siW2fPYk-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   	from schema $id: http://devicetree.org/schemas/nvmem/apple,spmi-nvmem.yaml#
   arch/arm64/boot/dts/apple/t8112-j413.dtb: nvmem-layout (fixed-layout): 'boot-error-count@f702,0', 'panic-count@f702,4', 'shutdown-flag@f70f,3' do not match any of the regexes: '@[a-f0-9]+$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/nvmem/layouts/fixed-layout.yaml#
   arch/arm64/boot/dts/apple/t8112-j413.dtb: /soc/smc@23e400000: failed to match any schema with compatible: ['apple,t8112-smc', 'apple,smc']
   arch/arm64/boot/dts/apple/t8112-j413.dtb: /soc/smc@23e400000: failed to match any schema with compatible: ['apple,t8112-smc', 'apple,smc']
   arch/arm64/boot/dts/apple/t8112-j413.dtb: /soc/smc@23e400000/gpio: failed to match any schema with compatible: ['apple,smc-gpio']
   arch/arm64/boot/dts/apple/t8112-j413.dtb: /soc/smc@23e400000/rtc: failed to match any schema with compatible: ['apple,smc-rtc']
   arch/arm64/boot/dts/apple/t8112-j413.dtb: /soc/smc@23e400000/reboot: failed to match any schema with compatible: ['apple,smc-reboot']
   arch/arm64/boot/dts/apple/t8112-j413.dtb: usb@382280000 (apple,t8112-dwc3): iommus: [[110, 0], [111, 1]] is too long
   	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
>> arch/arm64/boot/dts/apple/t8112-j413.dtb: usb@382280000 (apple,t8112-dwc3): Unevaluated properties are not allowed ('iommus' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
   arch/arm64/boot/dts/apple/t8112-j413.dtb: /soc/usb@382280000: failed to match any schema with compatible: ['apple,t8112-dwc3', 'apple,t8103-dwc3', 'apple,dwc3', 'snps,dwc3']
   arch/arm64/boot/dts/apple/t8112-j413.dtb: /soc/usb@382280000: failed to match any schema with compatible: ['apple,t8112-dwc3', 'apple,t8103-dwc3', 'apple,dwc3', 'snps,dwc3']
   arch/arm64/boot/dts/apple/t8112-j413.dtb: /soc/usb@382280000: failed to match any schema with compatible: ['apple,t8112-dwc3', 'apple,t8103-dwc3', 'apple,dwc3', 'snps,dwc3']
   arch/arm64/boot/dts/apple/t8112-j413.dtb: iommu@382f00000 (apple,t8112-dart): compatible:0: 'apple,t8112-dart' is not one of ['apple,t8103-dart', 'apple,t8103-usb4-dart', 'apple,t8110-dart', 'apple,t6000-dart']
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
>> arch/arm64/boot/dts/apple/t8112-j413.dtb: iommu@382f00000 (apple,t8112-dart): compatible: ['apple,t8112-dart', 'apple,t8110-dart'] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t8112-j413.dtb: /soc/iommu@382f00000: failed to match any schema with compatible: ['apple,t8112-dart', 'apple,t8110-dart']
>> arch/arm64/boot/dts/apple/t8112-j413.dtb: iommu@382f80000 (apple,t8112-dart): compatible:0: 'apple,t8112-dart' is not one of ['apple,t8103-dart', 'apple,t8103-usb4-dart', 'apple,t8110-dart', 'apple,t6000-dart']
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t8112-j413.dtb: iommu@382f80000 (apple,t8112-dart): compatible: ['apple,t8112-dart', 'apple,t8110-dart'] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
>> arch/arm64/boot/dts/apple/t8112-j413.dtb: /soc/iommu@382f80000: failed to match any schema with compatible: ['apple,t8112-dart', 'apple,t8110-dart']
   arch/arm64/boot/dts/apple/t8112-j413.dtb: /soc/phy@383000000: failed to match any schema with compatible: ['apple,t8112-atcphy', 'apple,t8103-atcphy']
   arch/arm64/boot/dts/apple/t8112-j413.dtb: /soc/phy@383000000: failed to match any schema with compatible: ['apple,t8112-atcphy', 'apple,t8103-atcphy']
   arch/arm64/boot/dts/apple/t8112-j413.dtb: usb@502280000 (apple,t8112-dwc3): iommus: [[116, 0], [117, 1]] is too long
   	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
   arch/arm64/boot/dts/apple/t8112-j413.dtb: usb@502280000 (apple,t8112-dwc3): Unevaluated properties are not allowed ('iommus' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
   arch/arm64/boot/dts/apple/t8112-j413.dtb: /soc/usb@502280000: failed to match any schema with compatible: ['apple,t8112-dwc3', 'apple,t8103-dwc3', 'apple,dwc3', 'snps,dwc3']
   arch/arm64/boot/dts/apple/t8112-j413.dtb: /soc/usb@502280000: failed to match any schema with compatible: ['apple,t8112-dwc3', 'apple,t8103-dwc3', 'apple,dwc3', 'snps,dwc3']
   arch/arm64/boot/dts/apple/t8112-j413.dtb: /soc/usb@502280000: failed to match any schema with compatible: ['apple,t8112-dwc3', 'apple,t8103-dwc3', 'apple,dwc3', 'snps,dwc3']
>> arch/arm64/boot/dts/apple/t8112-j413.dtb: iommu@502f00000 (apple,t8112-dart): compatible:0: 'apple,t8112-dart' is not one of ['apple,t8103-dart', 'apple,t8103-usb4-dart', 'apple,t8110-dart', 'apple,t6000-dart']
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t8112-j413.dtb: iommu@502f00000 (apple,t8112-dart): compatible: ['apple,t8112-dart', 'apple,t8110-dart'] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
>> arch/arm64/boot/dts/apple/t8112-j413.dtb: /soc/iommu@502f00000: failed to match any schema with compatible: ['apple,t8112-dart', 'apple,t8110-dart']
   arch/arm64/boot/dts/apple/t8112-j413.dtb: iommu@502f80000 (apple,t8112-dart): compatible:0: 'apple,t8112-dart' is not one of ['apple,t8103-dart', 'apple,t8103-usb4-dart', 'apple,t8110-dart', 'apple,t6000-dart']
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
>> arch/arm64/boot/dts/apple/t8112-j413.dtb: iommu@502f80000 (apple,t8112-dart): compatible: ['apple,t8112-dart', 'apple,t8110-dart'] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t8112-j413.dtb: /soc/iommu@502f80000: failed to match any schema with compatible: ['apple,t8112-dart', 'apple,t8110-dart']
   arch/arm64/boot/dts/apple/t8112-j413.dtb: /soc/phy@503000000: failed to match any schema with compatible: ['apple,t8112-atcphy', 'apple,t8103-atcphy']
   arch/arm64/boot/dts/apple/t8112-j413.dtb: /soc/phy@503000000: failed to match any schema with compatible: ['apple,t8112-atcphy', 'apple,t8103-atcphy']
--
   	from schema $id: http://devicetree.org/schemas/nvmem/apple,spmi-nvmem.yaml#
   arch/arm64/boot/dts/apple/t8112-j415.dtb: nvmem-layout (fixed-layout): 'boot-error-count@f702,0', 'panic-count@f702,4', 'shutdown-flag@f70f,3' do not match any of the regexes: '@[a-f0-9]+$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/nvmem/layouts/fixed-layout.yaml#
   arch/arm64/boot/dts/apple/t8112-j415.dtb: /soc/smc@23e400000: failed to match any schema with compatible: ['apple,t8112-smc', 'apple,smc']
   arch/arm64/boot/dts/apple/t8112-j415.dtb: /soc/smc@23e400000: failed to match any schema with compatible: ['apple,t8112-smc', 'apple,smc']
   arch/arm64/boot/dts/apple/t8112-j415.dtb: /soc/smc@23e400000/gpio: failed to match any schema with compatible: ['apple,smc-gpio']
   arch/arm64/boot/dts/apple/t8112-j415.dtb: /soc/smc@23e400000/rtc: failed to match any schema with compatible: ['apple,smc-rtc']
   arch/arm64/boot/dts/apple/t8112-j415.dtb: /soc/smc@23e400000/reboot: failed to match any schema with compatible: ['apple,smc-reboot']
   arch/arm64/boot/dts/apple/t8112-j415.dtb: usb@382280000 (apple,t8112-dwc3): iommus: [[110, 0], [111, 1]] is too long
   	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
>> arch/arm64/boot/dts/apple/t8112-j415.dtb: usb@382280000 (apple,t8112-dwc3): Unevaluated properties are not allowed ('iommus' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
>> arch/arm64/boot/dts/apple/t8112-j415.dtb: /soc/usb@382280000: failed to match any schema with compatible: ['apple,t8112-dwc3', 'apple,t8103-dwc3', 'apple,dwc3', 'snps,dwc3']
>> arch/arm64/boot/dts/apple/t8112-j415.dtb: /soc/usb@382280000: failed to match any schema with compatible: ['apple,t8112-dwc3', 'apple,t8103-dwc3', 'apple,dwc3', 'snps,dwc3']
>> arch/arm64/boot/dts/apple/t8112-j415.dtb: /soc/usb@382280000: failed to match any schema with compatible: ['apple,t8112-dwc3', 'apple,t8103-dwc3', 'apple,dwc3', 'snps,dwc3']
   arch/arm64/boot/dts/apple/t8112-j415.dtb: iommu@382f00000 (apple,t8112-dart): compatible:0: 'apple,t8112-dart' is not one of ['apple,t8103-dart', 'apple,t8103-usb4-dart', 'apple,t8110-dart', 'apple,t6000-dart']
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t8112-j415.dtb: iommu@382f00000 (apple,t8112-dart): compatible: ['apple,t8112-dart', 'apple,t8110-dart'] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
>> arch/arm64/boot/dts/apple/t8112-j415.dtb: /soc/iommu@382f00000: failed to match any schema with compatible: ['apple,t8112-dart', 'apple,t8110-dart']
   arch/arm64/boot/dts/apple/t8112-j415.dtb: iommu@382f80000 (apple,t8112-dart): compatible:0: 'apple,t8112-dart' is not one of ['apple,t8103-dart', 'apple,t8103-usb4-dart', 'apple,t8110-dart', 'apple,t6000-dart']
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
>> arch/arm64/boot/dts/apple/t8112-j415.dtb: iommu@382f80000 (apple,t8112-dart): compatible: ['apple,t8112-dart', 'apple,t8110-dart'] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t8112-j415.dtb: /soc/iommu@382f80000: failed to match any schema with compatible: ['apple,t8112-dart', 'apple,t8110-dart']
>> arch/arm64/boot/dts/apple/t8112-j415.dtb: /soc/phy@383000000: failed to match any schema with compatible: ['apple,t8112-atcphy', 'apple,t8103-atcphy']
>> arch/arm64/boot/dts/apple/t8112-j415.dtb: /soc/phy@383000000: failed to match any schema with compatible: ['apple,t8112-atcphy', 'apple,t8103-atcphy']
   arch/arm64/boot/dts/apple/t8112-j415.dtb: usb@502280000 (apple,t8112-dwc3): iommus: [[116, 0], [117, 1]] is too long
   	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
   arch/arm64/boot/dts/apple/t8112-j415.dtb: usb@502280000 (apple,t8112-dwc3): Unevaluated properties are not allowed ('iommus' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
   arch/arm64/boot/dts/apple/t8112-j415.dtb: /soc/usb@502280000: failed to match any schema with compatible: ['apple,t8112-dwc3', 'apple,t8103-dwc3', 'apple,dwc3', 'snps,dwc3']
   arch/arm64/boot/dts/apple/t8112-j415.dtb: /soc/usb@502280000: failed to match any schema with compatible: ['apple,t8112-dwc3', 'apple,t8103-dwc3', 'apple,dwc3', 'snps,dwc3']
   arch/arm64/boot/dts/apple/t8112-j415.dtb: /soc/usb@502280000: failed to match any schema with compatible: ['apple,t8112-dwc3', 'apple,t8103-dwc3', 'apple,dwc3', 'snps,dwc3']
   arch/arm64/boot/dts/apple/t8112-j415.dtb: iommu@502f00000 (apple,t8112-dart): compatible:0: 'apple,t8112-dart' is not one of ['apple,t8103-dart', 'apple,t8103-usb4-dart', 'apple,t8110-dart', 'apple,t6000-dart']
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
>> arch/arm64/boot/dts/apple/t8112-j415.dtb: iommu@502f00000 (apple,t8112-dart): compatible: ['apple,t8112-dart', 'apple,t8110-dart'] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t8112-j415.dtb: /soc/iommu@502f00000: failed to match any schema with compatible: ['apple,t8112-dart', 'apple,t8110-dart']
>> arch/arm64/boot/dts/apple/t8112-j415.dtb: iommu@502f80000 (apple,t8112-dart): compatible:0: 'apple,t8112-dart' is not one of ['apple,t8103-dart', 'apple,t8103-usb4-dart', 'apple,t8110-dart', 'apple,t6000-dart']
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
>> arch/arm64/boot/dts/apple/t8112-j415.dtb: iommu@502f80000 (apple,t8112-dart): compatible: ['apple,t8112-dart', 'apple,t8110-dart'] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t8112-j415.dtb: /soc/iommu@502f80000: failed to match any schema with compatible: ['apple,t8112-dart', 'apple,t8110-dart']
   arch/arm64/boot/dts/apple/t8112-j415.dtb: /soc/phy@503000000: failed to match any schema with compatible: ['apple,t8112-atcphy', 'apple,t8103-atcphy']
   arch/arm64/boot/dts/apple/t8112-j415.dtb: /soc/phy@503000000: failed to match any schema with compatible: ['apple,t8112-atcphy', 'apple,t8103-atcphy']
--
   	from schema $id: http://devicetree.org/schemas/nvmem/apple,spmi-nvmem.yaml#
   arch/arm64/boot/dts/apple/t8112-j473.dtb: nvmem-layout (fixed-layout): 'boot-error-count@f702,0', 'panic-count@f702,4', 'shutdown-flag@f70f,3' do not match any of the regexes: '@[a-f0-9]+$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/nvmem/layouts/fixed-layout.yaml#
   arch/arm64/boot/dts/apple/t8112-j473.dtb: /soc/smc@23e400000: failed to match any schema with compatible: ['apple,t8112-smc', 'apple,smc']
   arch/arm64/boot/dts/apple/t8112-j473.dtb: /soc/smc@23e400000: failed to match any schema with compatible: ['apple,t8112-smc', 'apple,smc']
   arch/arm64/boot/dts/apple/t8112-j473.dtb: /soc/smc@23e400000/gpio: failed to match any schema with compatible: ['apple,smc-gpio']
   arch/arm64/boot/dts/apple/t8112-j473.dtb: /soc/smc@23e400000/rtc: failed to match any schema with compatible: ['apple,smc-rtc']
   arch/arm64/boot/dts/apple/t8112-j473.dtb: /soc/smc@23e400000/reboot: failed to match any schema with compatible: ['apple,smc-reboot']
   arch/arm64/boot/dts/apple/t8112-j473.dtb: usb@382280000 (apple,t8112-dwc3): iommus: [[110, 0], [111, 1]] is too long
   	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
>> arch/arm64/boot/dts/apple/t8112-j473.dtb: usb@382280000 (apple,t8112-dwc3): Unevaluated properties are not allowed ('iommus' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
   arch/arm64/boot/dts/apple/t8112-j473.dtb: /soc/usb@382280000: failed to match any schema with compatible: ['apple,t8112-dwc3', 'apple,t8103-dwc3', 'apple,dwc3', 'snps,dwc3']
   arch/arm64/boot/dts/apple/t8112-j473.dtb: /soc/usb@382280000: failed to match any schema with compatible: ['apple,t8112-dwc3', 'apple,t8103-dwc3', 'apple,dwc3', 'snps,dwc3']
   arch/arm64/boot/dts/apple/t8112-j473.dtb: /soc/usb@382280000: failed to match any schema with compatible: ['apple,t8112-dwc3', 'apple,t8103-dwc3', 'apple,dwc3', 'snps,dwc3']
>> arch/arm64/boot/dts/apple/t8112-j473.dtb: iommu@382f00000 (apple,t8112-dart): compatible:0: 'apple,t8112-dart' is not one of ['apple,t8103-dart', 'apple,t8103-usb4-dart', 'apple,t8110-dart', 'apple,t6000-dart']
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t8112-j473.dtb: iommu@382f00000 (apple,t8112-dart): compatible: ['apple,t8112-dart', 'apple,t8110-dart'] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
>> arch/arm64/boot/dts/apple/t8112-j473.dtb: /soc/iommu@382f00000: failed to match any schema with compatible: ['apple,t8112-dart', 'apple,t8110-dart']
   arch/arm64/boot/dts/apple/t8112-j473.dtb: iommu@382f80000 (apple,t8112-dart): compatible:0: 'apple,t8112-dart' is not one of ['apple,t8103-dart', 'apple,t8103-usb4-dart', 'apple,t8110-dart', 'apple,t6000-dart']
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t8112-j473.dtb: iommu@382f80000 (apple,t8112-dart): compatible: ['apple,t8112-dart', 'apple,t8110-dart'] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
>> arch/arm64/boot/dts/apple/t8112-j473.dtb: /soc/iommu@382f80000: failed to match any schema with compatible: ['apple,t8112-dart', 'apple,t8110-dart']
   arch/arm64/boot/dts/apple/t8112-j473.dtb: /soc/phy@383000000: failed to match any schema with compatible: ['apple,t8112-atcphy', 'apple,t8103-atcphy']
   arch/arm64/boot/dts/apple/t8112-j473.dtb: /soc/phy@383000000: failed to match any schema with compatible: ['apple,t8112-atcphy', 'apple,t8103-atcphy']
   arch/arm64/boot/dts/apple/t8112-j473.dtb: usb@502280000 (apple,t8112-dwc3): iommus: [[116, 0], [117, 1]] is too long
   	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
   arch/arm64/boot/dts/apple/t8112-j473.dtb: usb@502280000 (apple,t8112-dwc3): Unevaluated properties are not allowed ('iommus' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
   arch/arm64/boot/dts/apple/t8112-j473.dtb: /soc/usb@502280000: failed to match any schema with compatible: ['apple,t8112-dwc3', 'apple,t8103-dwc3', 'apple,dwc3', 'snps,dwc3']
   arch/arm64/boot/dts/apple/t8112-j473.dtb: /soc/usb@502280000: failed to match any schema with compatible: ['apple,t8112-dwc3', 'apple,t8103-dwc3', 'apple,dwc3', 'snps,dwc3']
   arch/arm64/boot/dts/apple/t8112-j473.dtb: /soc/usb@502280000: failed to match any schema with compatible: ['apple,t8112-dwc3', 'apple,t8103-dwc3', 'apple,dwc3', 'snps,dwc3']
>> arch/arm64/boot/dts/apple/t8112-j473.dtb: iommu@502f00000 (apple,t8112-dart): compatible:0: 'apple,t8112-dart' is not one of ['apple,t8103-dart', 'apple,t8103-usb4-dart', 'apple,t8110-dart', 'apple,t6000-dart']
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t8112-j473.dtb: iommu@502f00000 (apple,t8112-dart): compatible: ['apple,t8112-dart', 'apple,t8110-dart'] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
>> arch/arm64/boot/dts/apple/t8112-j473.dtb: /soc/iommu@502f00000: failed to match any schema with compatible: ['apple,t8112-dart', 'apple,t8110-dart']
   arch/arm64/boot/dts/apple/t8112-j473.dtb: iommu@502f80000 (apple,t8112-dart): compatible:0: 'apple,t8112-dart' is not one of ['apple,t8103-dart', 'apple,t8103-usb4-dart', 'apple,t8110-dart', 'apple,t6000-dart']
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
>> arch/arm64/boot/dts/apple/t8112-j473.dtb: iommu@502f80000 (apple,t8112-dart): compatible: ['apple,t8112-dart', 'apple,t8110-dart'] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t8112-j473.dtb: /soc/iommu@502f80000: failed to match any schema with compatible: ['apple,t8112-dart', 'apple,t8110-dart']
   arch/arm64/boot/dts/apple/t8112-j473.dtb: /soc/phy@503000000: failed to match any schema with compatible: ['apple,t8112-atcphy', 'apple,t8103-atcphy']
   arch/arm64/boot/dts/apple/t8112-j473.dtb: /soc/phy@503000000: failed to match any schema with compatible: ['apple,t8112-atcphy', 'apple,t8103-atcphy']
--
   	from schema $id: http://devicetree.org/schemas/nvmem/apple,spmi-nvmem.yaml#
   arch/arm64/boot/dts/apple/t8112-j493.dtb: pmic@e (apple,stowe-pmic): Unevaluated properties are not allowed ('nvmem-layout' was unexpected)
   	from schema $id: http://devicetree.org/schemas/nvmem/apple,spmi-nvmem.yaml#
   arch/arm64/boot/dts/apple/t8112-j493.dtb: nvmem-layout (fixed-layout): 'boot-error-count@f702,0', 'panic-count@f702,4', 'shutdown-flag@f70f,3' do not match any of the regexes: '@[a-f0-9]+$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/nvmem/layouts/fixed-layout.yaml#
   arch/arm64/boot/dts/apple/t8112-j493.dtb: /soc/smc@23e400000: failed to match any schema with compatible: ['apple,t8112-smc', 'apple,smc']
   arch/arm64/boot/dts/apple/t8112-j493.dtb: /soc/smc@23e400000: failed to match any schema with compatible: ['apple,t8112-smc', 'apple,smc']
   arch/arm64/boot/dts/apple/t8112-j493.dtb: /soc/smc@23e400000/gpio: failed to match any schema with compatible: ['apple,smc-gpio']
   arch/arm64/boot/dts/apple/t8112-j493.dtb: /soc/smc@23e400000/rtc: failed to match any schema with compatible: ['apple,smc-rtc']
   arch/arm64/boot/dts/apple/t8112-j493.dtb: /soc/smc@23e400000/reboot: failed to match any schema with compatible: ['apple,smc-reboot']
>> arch/arm64/boot/dts/apple/t8112-j493.dtb: usb@382280000 (apple,t8112-dwc3): iommus: [[112, 0], [113, 1]] is too long
   	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
   arch/arm64/boot/dts/apple/t8112-j493.dtb: usb@382280000 (apple,t8112-dwc3): Unevaluated properties are not allowed ('iommus' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
>> arch/arm64/boot/dts/apple/t8112-j493.dtb: /soc/usb@382280000: failed to match any schema with compatible: ['apple,t8112-dwc3', 'apple,t8103-dwc3', 'apple,dwc3', 'snps,dwc3']
>> arch/arm64/boot/dts/apple/t8112-j493.dtb: /soc/usb@382280000: failed to match any schema with compatible: ['apple,t8112-dwc3', 'apple,t8103-dwc3', 'apple,dwc3', 'snps,dwc3']
>> arch/arm64/boot/dts/apple/t8112-j493.dtb: /soc/usb@382280000: failed to match any schema with compatible: ['apple,t8112-dwc3', 'apple,t8103-dwc3', 'apple,dwc3', 'snps,dwc3']
   arch/arm64/boot/dts/apple/t8112-j493.dtb: iommu@382f00000 (apple,t8112-dart): compatible:0: 'apple,t8112-dart' is not one of ['apple,t8103-dart', 'apple,t8103-usb4-dart', 'apple,t8110-dart', 'apple,t6000-dart']
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
>> arch/arm64/boot/dts/apple/t8112-j493.dtb: iommu@382f00000 (apple,t8112-dart): compatible: ['apple,t8112-dart', 'apple,t8110-dart'] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t8112-j493.dtb: /soc/iommu@382f00000: failed to match any schema with compatible: ['apple,t8112-dart', 'apple,t8110-dart']
   arch/arm64/boot/dts/apple/t8112-j493.dtb: iommu@382f80000 (apple,t8112-dart): compatible:0: 'apple,t8112-dart' is not one of ['apple,t8103-dart', 'apple,t8103-usb4-dart', 'apple,t8110-dart', 'apple,t6000-dart']
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
>> arch/arm64/boot/dts/apple/t8112-j493.dtb: iommu@382f80000 (apple,t8112-dart): compatible: ['apple,t8112-dart', 'apple,t8110-dart'] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t8112-j493.dtb: /soc/iommu@382f80000: failed to match any schema with compatible: ['apple,t8112-dart', 'apple,t8110-dart']
>> arch/arm64/boot/dts/apple/t8112-j493.dtb: /soc/phy@383000000: failed to match any schema with compatible: ['apple,t8112-atcphy', 'apple,t8103-atcphy']
>> arch/arm64/boot/dts/apple/t8112-j493.dtb: /soc/phy@383000000: failed to match any schema with compatible: ['apple,t8112-atcphy', 'apple,t8103-atcphy']
   arch/arm64/boot/dts/apple/t8112-j493.dtb: usb@502280000 (apple,t8112-dwc3): iommus: [[118, 0], [119, 1]] is too long
   	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
   arch/arm64/boot/dts/apple/t8112-j493.dtb: usb@502280000 (apple,t8112-dwc3): Unevaluated properties are not allowed ('iommus' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
   arch/arm64/boot/dts/apple/t8112-j493.dtb: /soc/usb@502280000: failed to match any schema with compatible: ['apple,t8112-dwc3', 'apple,t8103-dwc3', 'apple,dwc3', 'snps,dwc3']
   arch/arm64/boot/dts/apple/t8112-j493.dtb: /soc/usb@502280000: failed to match any schema with compatible: ['apple,t8112-dwc3', 'apple,t8103-dwc3', 'apple,dwc3', 'snps,dwc3']
   arch/arm64/boot/dts/apple/t8112-j493.dtb: /soc/usb@502280000: failed to match any schema with compatible: ['apple,t8112-dwc3', 'apple,t8103-dwc3', 'apple,dwc3', 'snps,dwc3']
   arch/arm64/boot/dts/apple/t8112-j493.dtb: iommu@502f00000 (apple,t8112-dart): compatible:0: 'apple,t8112-dart' is not one of ['apple,t8103-dart', 'apple,t8103-usb4-dart', 'apple,t8110-dart', 'apple,t6000-dart']
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
>> arch/arm64/boot/dts/apple/t8112-j493.dtb: iommu@502f00000 (apple,t8112-dart): compatible: ['apple,t8112-dart', 'apple,t8110-dart'] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t8112-j493.dtb: /soc/iommu@502f00000: failed to match any schema with compatible: ['apple,t8112-dart', 'apple,t8110-dart']
>> arch/arm64/boot/dts/apple/t8112-j493.dtb: iommu@502f80000 (apple,t8112-dart): compatible:0: 'apple,t8112-dart' is not one of ['apple,t8103-dart', 'apple,t8103-usb4-dart', 'apple,t8110-dart', 'apple,t6000-dart']
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t8112-j493.dtb: iommu@502f80000 (apple,t8112-dart): compatible: ['apple,t8112-dart', 'apple,t8110-dart'] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t8112-j493.dtb: /soc/iommu@502f80000: failed to match any schema with compatible: ['apple,t8112-dart', 'apple,t8110-dart']
   arch/arm64/boot/dts/apple/t8112-j493.dtb: /soc/phy@503000000: failed to match any schema with compatible: ['apple,t8112-atcphy', 'apple,t8103-atcphy']
   arch/arm64/boot/dts/apple/t8112-j493.dtb: /soc/phy@503000000: failed to match any schema with compatible: ['apple,t8112-atcphy', 'apple,t8103-atcphy']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
