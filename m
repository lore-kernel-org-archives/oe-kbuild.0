Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93C3527A906
	for <oe-kbuild@lists.linux.dev>; Mon, 22 Sep 2025 23:28:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758583686; cv=none; b=cMvn/1e2c91dasxPmELK/XX3GjRf5euUyEOK0+zAxr0eSzGQei9tjyG5rNuv5ikhnt5Eh4z06tvfgZyxnWsZPLF9AypX/R0dLHT7xZBnanTV3rUxxRZw4OzxZH+QRxzYs6hRH3k7GLXCFfbTY5VoHq04TAhPUzV8YHWRiRf+tYQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758583686; c=relaxed/simple;
	bh=Uhyr5Lbo3czaWOV6wlXJG6fS47pBRhmyDQkxj3awxBA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=C0Cvu4lPZ0r7yqnHFR0oeI10yyEdxl0+9owQcocA+V7X8h8pBcn7HkqR9ZesO1K3g2F+2FFco8G2u0Xf2jiKFbdBFMarhVZOwqx9DA0nIRu4LKCfumDU8CH9ebVpzOJowj/Tv8oFjfbJeyDo9HH34gPD7Cr/KPRj1J4jLoVHg7k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Dz+TJyPO; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Dz+TJyPO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758583684; x=1790119684;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Uhyr5Lbo3czaWOV6wlXJG6fS47pBRhmyDQkxj3awxBA=;
  b=Dz+TJyPO5yHItlHxWl5zMB8rcMq27NriexGggLZwBj9+i7jB8xQmCiVl
   KcOkwRWUFhK6tinYY2iQ+bYzjsMVdEegMBwzkOXMa7St5sioShCQwkTZ7
   EEqvI09jGELOOaEMyF1l+k8nZjH7cRBu1+T9E5FH0v5wuX1UQiBGRXpCq
   l0TLdkwscCeDNUv2+mFaCnn3MGoHobzeSl0rTwW8Jh5Tc2WurZyLVzFMF
   DMlYXQDXj92u8dEvWKR978aGLF1UrfbzAcg8eOc9i8M6ycbmMV3/C8YC3
   Gmw3ZUCHe+9RI8Dr5Z7GwZb1Pjf2O+cLhQG26xsKDQOmEQ+EFHRNnjYGE
   w==;
X-CSE-ConnectionGUID: SI8MsXv0RwCRSdevSwkt4g==
X-CSE-MsgGUID: uQoOYpIgRNmSiEDZkuIDZg==
X-IronPort-AV: E=McAfee;i="6800,10657,11561"; a="60555713"
X-IronPort-AV: E=Sophos;i="6.18,286,1751266800"; 
   d="scan'208";a="60555713"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2025 16:28:03 -0700
X-CSE-ConnectionGUID: 81rYI2ZDSE2d8hplVwl8CA==
X-CSE-MsgGUID: UpWowE99SbeheTrv+8N9lQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,286,1751266800"; 
   d="scan'208";a="176206766"
Received: from igk-lkp-server01.igk.intel.com (HELO 0e586ad5e7f7) ([10.91.175.65])
  by fmviesa007.fm.intel.com with ESMTP; 22 Sep 2025 16:28:01 -0700
Received: from kbuild by 0e586ad5e7f7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1v0pwt-000000003yf-1ZgJ;
	Mon, 22 Sep 2025 23:27:59 +0000
Date: Tue, 23 Sep 2025 01:27:43 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [asahilinux:bits/000-devicetree 26/140]
 arch/arm64/boot/dts/apple/t8103-j274.dtb: efuse@23d2bc000
 (apple,t8103-efuses): Unevaluated properties are not allowed
 ('efuse@430,26', 'efuse@430,29', 'efuse@430,31', 'efuse@434,15',
 'efuse@434,21', 'efuse@434,23', 'efuse@434,9', 'efuse@438,12', 'efuse@4...
Message-ID: <202509230117.PDGQCXAg-lkp@intel.com>
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
:::::: branch date: 35 hours ago
:::::: commit date: 2 weeks ago
config: arm64-randconfig-2051-20250919 (https://download.01.org/0day-ci/archive/20250923/202509230117.PDGQCXAg-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project ce5124856e019792783de9630d0c5a1f0aaf2d9d)
dtschema version: 2025.8
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250923/202509230117.PDGQCXAg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202509230117.PDGQCXAg-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   	from schema $id: http://devicetree.org/schemas/nvmem/apple,spmi-nvmem.yaml#
   arch/arm64/boot/dts/apple/t8103-j274.dtb: pmic@f (apple,sera-pmic): Unevaluated properties are not allowed ('nvmem-layout' was unexpected)
   	from schema $id: http://devicetree.org/schemas/nvmem/apple,spmi-nvmem.yaml#
   arch/arm64/boot/dts/apple/t8103-j274.dtb: nvmem-layout (fixed-layout): 'boot-error-count@9f02,0', 'panic-count@9f02,4', 'shutdown-flag@9f0f,3' do not match any of the regexes: '@[a-f0-9]+$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/nvmem/layouts/fixed-layout.yaml#
   arch/arm64/boot/dts/apple/t8103-j274.dtb: /soc/smc@23e400000: failed to match any schema with compatible: ['apple,t8103-smc', 'apple,smc']
   arch/arm64/boot/dts/apple/t8103-j274.dtb: /soc/smc@23e400000: failed to match any schema with compatible: ['apple,t8103-smc', 'apple,smc']
   arch/arm64/boot/dts/apple/t8103-j274.dtb: /soc/smc@23e400000/gpio: failed to match any schema with compatible: ['apple,smc-gpio']
   arch/arm64/boot/dts/apple/t8103-j274.dtb: /soc/smc@23e400000/rtc: failed to match any schema with compatible: ['apple,smc-rtc']
   arch/arm64/boot/dts/apple/t8103-j274.dtb: /soc/smc@23e400000/reboot: failed to match any schema with compatible: ['apple,smc-reboot']
>> arch/arm64/boot/dts/apple/t8103-j274.dtb: efuse@23d2bc000 (apple,t8103-efuses): Unevaluated properties are not allowed ('efuse@430,26', 'efuse@430,29', 'efuse@430,31', 'efuse@434,15', 'efuse@434,21', 'efuse@434,23', 'efuse@434,9', 'efuse@438,12', 'efuse@438,14', 'efuse@438,19', 'efuse@438,25', 'efuse@438,31', 'efuse@438,9' were unexpected)
   	from schema $id: http://devicetree.org/schemas/nvmem/apple,efuses.yaml#
   arch/arm64/boot/dts/apple/t8103-j274.dtb: usb@382280000 (apple,t8103-dwc3): iommus: [[110, 0], [111, 1]] is too long
   	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
   arch/arm64/boot/dts/apple/t8103-j274.dtb: usb@382280000 (apple,t8103-dwc3): Unevaluated properties are not allowed ('iommus' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
   arch/arm64/boot/dts/apple/t8103-j274.dtb: /soc/usb@382280000: failed to match any schema with compatible: ['apple,t8103-dwc3', 'apple,dwc3', 'snps,dwc3']
   arch/arm64/boot/dts/apple/t8103-j274.dtb: /soc/usb@382280000: failed to match any schema with compatible: ['apple,t8103-dwc3', 'apple,dwc3', 'snps,dwc3']
   arch/arm64/boot/dts/apple/t8103-j274.dtb: /soc/phy@383000000: failed to match any schema with compatible: ['apple,t8103-atcphy']
   arch/arm64/boot/dts/apple/t8103-j274.dtb: usb@502280000 (apple,t8103-dwc3): iommus: [[125, 0], [126, 1]] is too long
   	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
--
   	from schema $id: http://devicetree.org/schemas/nvmem/apple,spmi-nvmem.yaml#
   arch/arm64/boot/dts/apple/t8103-j456.dtb: pmic@f (apple,sera-pmic): Unevaluated properties are not allowed ('nvmem-layout' was unexpected)
   	from schema $id: http://devicetree.org/schemas/nvmem/apple,spmi-nvmem.yaml#
   arch/arm64/boot/dts/apple/t8103-j456.dtb: nvmem-layout (fixed-layout): 'boot-error-count@9f02,0', 'panic-count@9f02,4', 'shutdown-flag@9f0f,3' do not match any of the regexes: '@[a-f0-9]+$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/nvmem/layouts/fixed-layout.yaml#
   arch/arm64/boot/dts/apple/t8103-j456.dtb: /soc/smc@23e400000: failed to match any schema with compatible: ['apple,t8103-smc', 'apple,smc']
   arch/arm64/boot/dts/apple/t8103-j456.dtb: /soc/smc@23e400000: failed to match any schema with compatible: ['apple,t8103-smc', 'apple,smc']
   arch/arm64/boot/dts/apple/t8103-j456.dtb: /soc/smc@23e400000/gpio: failed to match any schema with compatible: ['apple,smc-gpio']
   arch/arm64/boot/dts/apple/t8103-j456.dtb: /soc/smc@23e400000/rtc: failed to match any schema with compatible: ['apple,smc-rtc']
   arch/arm64/boot/dts/apple/t8103-j456.dtb: /soc/smc@23e400000/reboot: failed to match any schema with compatible: ['apple,smc-reboot']
>> arch/arm64/boot/dts/apple/t8103-j456.dtb: efuse@23d2bc000 (apple,t8103-efuses): Unevaluated properties are not allowed ('efuse@430,26', 'efuse@430,29', 'efuse@430,31', 'efuse@434,15', 'efuse@434,21', 'efuse@434,23', 'efuse@434,9', 'efuse@438,12', 'efuse@438,14', 'efuse@438,19', 'efuse@438,25', 'efuse@438,31', 'efuse@438,9' were unexpected)
   	from schema $id: http://devicetree.org/schemas/nvmem/apple,efuses.yaml#
   arch/arm64/boot/dts/apple/t8103-j456.dtb: usb@382280000 (apple,t8103-dwc3): iommus: [[110, 0], [111, 1]] is too long
   	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
   arch/arm64/boot/dts/apple/t8103-j456.dtb: usb@382280000 (apple,t8103-dwc3): Unevaluated properties are not allowed ('iommus' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
   arch/arm64/boot/dts/apple/t8103-j456.dtb: /soc/usb@382280000: failed to match any schema with compatible: ['apple,t8103-dwc3', 'apple,dwc3', 'snps,dwc3']
   arch/arm64/boot/dts/apple/t8103-j456.dtb: /soc/usb@382280000: failed to match any schema with compatible: ['apple,t8103-dwc3', 'apple,dwc3', 'snps,dwc3']
   arch/arm64/boot/dts/apple/t8103-j456.dtb: /soc/phy@383000000: failed to match any schema with compatible: ['apple,t8103-atcphy']
   arch/arm64/boot/dts/apple/t8103-j456.dtb: usb@502280000 (apple,t8103-dwc3): iommus: [[125, 0], [126, 1]] is too long
   	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
--
   	from schema $id: http://devicetree.org/schemas/nvmem/apple,spmi-nvmem.yaml#
   arch/arm64/boot/dts/apple/t8103-j457.dtb: pmic@f (apple,sera-pmic): Unevaluated properties are not allowed ('nvmem-layout' was unexpected)
   	from schema $id: http://devicetree.org/schemas/nvmem/apple,spmi-nvmem.yaml#
   arch/arm64/boot/dts/apple/t8103-j457.dtb: nvmem-layout (fixed-layout): 'boot-error-count@9f02,0', 'panic-count@9f02,4', 'shutdown-flag@9f0f,3' do not match any of the regexes: '@[a-f0-9]+$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/nvmem/layouts/fixed-layout.yaml#
   arch/arm64/boot/dts/apple/t8103-j457.dtb: /soc/smc@23e400000: failed to match any schema with compatible: ['apple,t8103-smc', 'apple,smc']
   arch/arm64/boot/dts/apple/t8103-j457.dtb: /soc/smc@23e400000: failed to match any schema with compatible: ['apple,t8103-smc', 'apple,smc']
   arch/arm64/boot/dts/apple/t8103-j457.dtb: /soc/smc@23e400000/gpio: failed to match any schema with compatible: ['apple,smc-gpio']
   arch/arm64/boot/dts/apple/t8103-j457.dtb: /soc/smc@23e400000/rtc: failed to match any schema with compatible: ['apple,smc-rtc']
   arch/arm64/boot/dts/apple/t8103-j457.dtb: /soc/smc@23e400000/reboot: failed to match any schema with compatible: ['apple,smc-reboot']
>> arch/arm64/boot/dts/apple/t8103-j457.dtb: efuse@23d2bc000 (apple,t8103-efuses): Unevaluated properties are not allowed ('efuse@430,26', 'efuse@430,29', 'efuse@430,31', 'efuse@434,15', 'efuse@434,21', 'efuse@434,23', 'efuse@434,9', 'efuse@438,12', 'efuse@438,14', 'efuse@438,19', 'efuse@438,25', 'efuse@438,31', 'efuse@438,9' were unexpected)
   	from schema $id: http://devicetree.org/schemas/nvmem/apple,efuses.yaml#
   arch/arm64/boot/dts/apple/t8103-j457.dtb: usb@382280000 (apple,t8103-dwc3): iommus: [[110, 0], [111, 1]] is too long
   	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
   arch/arm64/boot/dts/apple/t8103-j457.dtb: usb@382280000 (apple,t8103-dwc3): Unevaluated properties are not allowed ('iommus' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
   arch/arm64/boot/dts/apple/t8103-j457.dtb: /soc/usb@382280000: failed to match any schema with compatible: ['apple,t8103-dwc3', 'apple,dwc3', 'snps,dwc3']
   arch/arm64/boot/dts/apple/t8103-j457.dtb: /soc/usb@382280000: failed to match any schema with compatible: ['apple,t8103-dwc3', 'apple,dwc3', 'snps,dwc3']
   arch/arm64/boot/dts/apple/t8103-j457.dtb: /soc/phy@383000000: failed to match any schema with compatible: ['apple,t8103-atcphy']
   arch/arm64/boot/dts/apple/t8103-j457.dtb: usb@502280000 (apple,t8103-dwc3): iommus: [[125, 0], [126, 1]] is too long
   	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
