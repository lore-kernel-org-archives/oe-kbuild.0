Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8A832874F5
	for <oe-kbuild@lists.linux.dev>; Tue, 23 Sep 2025 11:49:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758628151; cv=none; b=getPU4xCXXTGDRCf9XkEhy3VhcE6sr5sfEbx3YWUlwz4DGc5jh1PssnlIw5k6Xh+rqedjv/Q3Gme6RdF98qW85eI+jTph0zkIKtvb4kcNsTVVvOimPYzg1lvDrn2Bu8HG2yH597A0xm1mY19EJrMwKJbG2S2K8u1vs2XdPq9M1Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758628151; c=relaxed/simple;
	bh=ov2V0JxL4iJcTtW/V2OMSuSc5AW7P80XZHey1pwhcck=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=dArOqqP12NZjol6kBAh6yZTiThiITkOwZMlRLG/RfTgB4qtk5BvSmICrJr9O1xI1CndwJT66RHKj4117XZIKA/ENOmQdBHFcEub9+J2QIwaPadnMPYH1lQ2i5Fc9/TlbznYVt9/deUnyAopkuHEz3PHWJxcerxyWdj0fsaNM9kI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BBByvcKZ; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BBByvcKZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758628151; x=1790164151;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ov2V0JxL4iJcTtW/V2OMSuSc5AW7P80XZHey1pwhcck=;
  b=BBByvcKZR6Ek1r2tkpmAV7z5hxSUOOlOOQoxWNMgbTRqTWkX4xPTVviA
   SczHEsBu65qzTQgu9GvgbgM+FQ6rcJS3YTooWxyaO0XZ/Pm+2hhXi0VRK
   4OLAlKkhgXJHZH/sNvRnGv48LFtmRU8ygTCnE5q2VwtNsUd8tsGa9d/rs
   g9Jyg+uPtgg26jA1NwkBXQb+pmP8qSTlJnDwDRBPO7k5yiUmPgiAOE2s1
   4PRfvGPpAGNdRgSEEvgNXI+i1dUvJc3DS3XtgOwXAH1emjTUTEdLpplKD
   ijyS7EdXXfpXhIdQk68EdyEcm3QtdwxUEBtFKdIa4cyOx3xi+YMiqKtgF
   A==;
X-CSE-ConnectionGUID: mnLaoSW9SMWk0sRgsfpYow==
X-CSE-MsgGUID: fAiJAV/3R4a7pPXWX0Qd2Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="60956533"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="60956533"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2025 04:49:10 -0700
X-CSE-ConnectionGUID: e69pE1vFQvuCSCpnFSx8Cg==
X-CSE-MsgGUID: 2O9al0rqQHydvcPkOEOfRg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,287,1751266800"; 
   d="scan'208";a="213891054"
Received: from igk-lkp-server01.igk.intel.com (HELO 0e586ad5e7f7) ([10.91.175.65])
  by orviesa001.jf.intel.com with ESMTP; 23 Sep 2025 04:49:08 -0700
Received: from kbuild by 0e586ad5e7f7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1v11W6-0000000049y-0iB8;
	Tue, 23 Sep 2025 11:49:06 +0000
Date: Tue, 23 Sep 2025 13:48:32 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [asahilinux:bits/000-devicetree 26/140]
 arch/arm64/boot/dts/apple/t8103-j293.dtb: efuse@23d2bc000
 (apple,t8103-efuses): Unevaluated properties are not allowed
 ('efuse@430,26', 'efuse@430,29', 'efuse@430,31', 'efuse@434,15',
 'efuse@434,21', 'efuse@434,23', 'efuse@434,9', 'efuse@438,12', 'efuse@4...
Message-ID: <202509231311.fkQ5RYJn-lkp@intel.com>
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
TO: Sven Peter <sven@svenpeter.dev>
CC: Janne Grunau <j@jannau.net>

tree:   https://github.com/AsahiLinux/linux bits/000-devicetree
head:   703a105e4188c8c9e084375a48f08853cf64cfca
commit: 6c0b2152ae2916492ae80f95097886f0c7659cad [26/140] arm64: dts: apple: t8103: Add eFuses node and ATC phy fuses
:::::: branch date: 2 days ago
:::::: commit date: 2 weeks ago
config: arm64-randconfig-2052-20250919 (https://download.01.org/0day-ci/archive/20250923/202509231311.fkQ5RYJn-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
dtschema version: 2025.8
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250923/202509231311.fkQ5RYJn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202509231311.fkQ5RYJn-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   	from schema $id: http://devicetree.org/schemas/nvmem/apple,spmi-nvmem.yaml#
   arch/arm64/boot/dts/apple/t8103-j293.dtb: pmic@f (apple,sera-pmic): Unevaluated properties are not allowed ('nvmem-layout' was unexpected)
   	from schema $id: http://devicetree.org/schemas/nvmem/apple,spmi-nvmem.yaml#
   arch/arm64/boot/dts/apple/t8103-j293.dtb: nvmem-layout (fixed-layout): 'boot-error-count@9f02,0', 'panic-count@9f02,4', 'shutdown-flag@9f0f,3' do not match any of the regexes: '@[a-f0-9]+$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/nvmem/layouts/fixed-layout.yaml#
   arch/arm64/boot/dts/apple/t8103-j293.dtb: /soc/smc@23e400000: failed to match any schema with compatible: ['apple,t8103-smc', 'apple,smc']
   arch/arm64/boot/dts/apple/t8103-j293.dtb: /soc/smc@23e400000: failed to match any schema with compatible: ['apple,t8103-smc', 'apple,smc']
   arch/arm64/boot/dts/apple/t8103-j293.dtb: /soc/smc@23e400000/gpio: failed to match any schema with compatible: ['apple,smc-gpio']
   arch/arm64/boot/dts/apple/t8103-j293.dtb: /soc/smc@23e400000/rtc: failed to match any schema with compatible: ['apple,smc-rtc']
   arch/arm64/boot/dts/apple/t8103-j293.dtb: /soc/smc@23e400000/reboot: failed to match any schema with compatible: ['apple,smc-reboot']
>> arch/arm64/boot/dts/apple/t8103-j293.dtb: efuse@23d2bc000 (apple,t8103-efuses): Unevaluated properties are not allowed ('efuse@430,26', 'efuse@430,29', 'efuse@430,31', 'efuse@434,15', 'efuse@434,21', 'efuse@434,23', 'efuse@434,9', 'efuse@438,12', 'efuse@438,14', 'efuse@438,19', 'efuse@438,25', 'efuse@438,31', 'efuse@438,9' were unexpected)
   	from schema $id: http://devicetree.org/schemas/nvmem/apple,efuses.yaml#
   arch/arm64/boot/dts/apple/t8103-j293.dtb: usb@382280000 (apple,t8103-dwc3): iommus: [[112, 0], [113, 1]] is too long
   	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
   arch/arm64/boot/dts/apple/t8103-j293.dtb: usb@382280000 (apple,t8103-dwc3): Unevaluated properties are not allowed ('iommus' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
   arch/arm64/boot/dts/apple/t8103-j293.dtb: /soc/usb@382280000: failed to match any schema with compatible: ['apple,t8103-dwc3', 'apple,dwc3', 'snps,dwc3']
   arch/arm64/boot/dts/apple/t8103-j293.dtb: /soc/usb@382280000: failed to match any schema with compatible: ['apple,t8103-dwc3', 'apple,dwc3', 'snps,dwc3']
   arch/arm64/boot/dts/apple/t8103-j293.dtb: /soc/phy@383000000: failed to match any schema with compatible: ['apple,t8103-atcphy']
   arch/arm64/boot/dts/apple/t8103-j293.dtb: usb@502280000 (apple,t8103-dwc3): iommus: [[127, 0], [128, 1]] is too long
   	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
--
   	from schema $id: http://devicetree.org/schemas/nvmem/apple,spmi-nvmem.yaml#
   arch/arm64/boot/dts/apple/t8103-j313.dtb: pmic@f (apple,sera-pmic): Unevaluated properties are not allowed ('nvmem-layout' was unexpected)
   	from schema $id: http://devicetree.org/schemas/nvmem/apple,spmi-nvmem.yaml#
   arch/arm64/boot/dts/apple/t8103-j313.dtb: nvmem-layout (fixed-layout): 'boot-error-count@9f02,0', 'panic-count@9f02,4', 'shutdown-flag@9f0f,3' do not match any of the regexes: '@[a-f0-9]+$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/nvmem/layouts/fixed-layout.yaml#
   arch/arm64/boot/dts/apple/t8103-j313.dtb: /soc/smc@23e400000: failed to match any schema with compatible: ['apple,t8103-smc', 'apple,smc']
   arch/arm64/boot/dts/apple/t8103-j313.dtb: /soc/smc@23e400000: failed to match any schema with compatible: ['apple,t8103-smc', 'apple,smc']
   arch/arm64/boot/dts/apple/t8103-j313.dtb: /soc/smc@23e400000/gpio: failed to match any schema with compatible: ['apple,smc-gpio']
   arch/arm64/boot/dts/apple/t8103-j313.dtb: /soc/smc@23e400000/rtc: failed to match any schema with compatible: ['apple,smc-rtc']
   arch/arm64/boot/dts/apple/t8103-j313.dtb: /soc/smc@23e400000/reboot: failed to match any schema with compatible: ['apple,smc-reboot']
>> arch/arm64/boot/dts/apple/t8103-j313.dtb: efuse@23d2bc000 (apple,t8103-efuses): Unevaluated properties are not allowed ('efuse@430,26', 'efuse@430,29', 'efuse@430,31', 'efuse@434,15', 'efuse@434,21', 'efuse@434,23', 'efuse@434,9', 'efuse@438,12', 'efuse@438,14', 'efuse@438,19', 'efuse@438,25', 'efuse@438,31', 'efuse@438,9' were unexpected)
   	from schema $id: http://devicetree.org/schemas/nvmem/apple,efuses.yaml#
   arch/arm64/boot/dts/apple/t8103-j313.dtb: usb@382280000 (apple,t8103-dwc3): iommus: [[110, 0], [111, 1]] is too long
   	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
   arch/arm64/boot/dts/apple/t8103-j313.dtb: usb@382280000 (apple,t8103-dwc3): Unevaluated properties are not allowed ('iommus' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
   arch/arm64/boot/dts/apple/t8103-j313.dtb: /soc/usb@382280000: failed to match any schema with compatible: ['apple,t8103-dwc3', 'apple,dwc3', 'snps,dwc3']
   arch/arm64/boot/dts/apple/t8103-j313.dtb: /soc/usb@382280000: failed to match any schema with compatible: ['apple,t8103-dwc3', 'apple,dwc3', 'snps,dwc3']
   arch/arm64/boot/dts/apple/t8103-j313.dtb: /soc/phy@383000000: failed to match any schema with compatible: ['apple,t8103-atcphy']
   arch/arm64/boot/dts/apple/t8103-j313.dtb: usb@502280000 (apple,t8103-dwc3): iommus: [[125, 0], [126, 1]] is too long
   	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
