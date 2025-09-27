Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB6C71EF38C
	for <oe-kbuild@lists.linux.dev>; Sat, 27 Sep 2025 07:07:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758956880; cv=none; b=W+tV35aON+imjAtnZYKdj4HHqiOxHP8M2g/DBVPZV7TdPA2obrHMqRZkTshNWpAgs7rD1Q7JQPBTo4aBsZrLF1Vn3qtTOwsihpSXm3bqEndNCIknaoO2mhQGHE2KT3aWh5H8/sOWuFrHE+Iq94jjl3MiGtPMeAlgeJrMzHC7lms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758956880; c=relaxed/simple;
	bh=I1ypim3t4qkqq6UhNKrNGMQVOes6eeeLMMJZs7eaoDU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=oZzCZGdZkj8sx1kVxgfasP2EMyfvUI6H2yniqelqGK2IK/2/mDBZPYOl4kxilBkaTcqUl+NKZ3Ko+iUqLPWNT5HZ74EnuExapJGlU7BjpK4obAPXvrhPfIbT5dv74Z7RHdFaQWhJdmkzN+10yLOxJzJjXjuuv4TPUSPvk4U4L/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GXqB/Udq; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GXqB/Udq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758956878; x=1790492878;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=I1ypim3t4qkqq6UhNKrNGMQVOes6eeeLMMJZs7eaoDU=;
  b=GXqB/Udq+M8nc42zlQLZJ+G7UZBrKaor0VTa5M89yUP1oAhmflF+djrc
   ARRTmfDtmkC8jFhzK/nB/tz8v5ukyyuv8r13Un8+8ihXTZSzCvQsg2MYr
   gnM5ddBrnnN1r4EPz5W/LmMJqZVXu9BaiCbJFWx+mjQKpIJ8Q3pHwOQ0f
   RY/PTk4QdgPnGWZBTlRXd7X+sYpW1CZVHSns7tYGPQGibcZ9hGu7P+1D6
   SEHgeTiv0sU934P6MTbhPTHzVTgCdckZvYoPGUAmhQ3htp3xzeEPzPNUz
   HNdlqYlwKBKakV/reVNXwKmmcKta4PADhPpFAYImE8q6PiukHB8qL74KS
   A==;
X-CSE-ConnectionGUID: r9h4F7dnSiuCVc0TjA/Rig==
X-CSE-MsgGUID: yShlUicfTw+XJzIU9RGl2A==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="61237209"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="61237209"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Sep 2025 00:07:57 -0700
X-CSE-ConnectionGUID: TIFjSYx6Rg2fs85UDlYTvA==
X-CSE-MsgGUID: b1btH8URS/marL5DnOGcvw==
X-ExtLoop1: 1
Received: from igk-lkp-server01.igk.intel.com (HELO 0e586ad5e7f7) ([10.91.175.65])
  by fmviesa003.fm.intel.com with ESMTP; 27 Sep 2025 00:07:56 -0700
Received: from kbuild by 0e586ad5e7f7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1v2P29-000000005Rd-3hNL;
	Sat, 27 Sep 2025 07:07:53 +0000
Date: Sat, 27 Sep 2025 09:07:53 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [asahilinux:bits/000-devicetree 25/140]
 arch/arm64/boot/dts/apple/t8103-j274.dtb: usb@382280000 (apple,t8103-dwc3):
 Unevaluated properties are not allowed ('iommus' was unexpected)
Message-ID: <202509270934.dpwDqG0F-lkp@intel.com>
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
TO: Hector Martin <marcan@marcan.st>
CC: Janne Grunau <j@jannau.net>
CC: Sven Peter <sven@kernel.org>

tree:   https://github.com/AsahiLinux/linux bits/000-devicetree
head:   703a105e4188c8c9e084375a48f08853cf64cfca
commit: dac599e53186312cd153da7b345e2fcdd289375e [25/140] arm64: dts: apple: t8103: Add Apple Type-C PHY and dwc3
:::::: branch date: 6 days ago
:::::: commit date: 3 weeks ago
config: arm64-randconfig-2051-20250919 (https://download.01.org/0day-ci/archive/20250927/202509270934.dpwDqG0F-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project ce5124856e019792783de9630d0c5a1f0aaf2d9d)
dtschema version: 2025.8
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250927/202509270934.dpwDqG0F-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202509270934.dpwDqG0F-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   	from schema $id: http://devicetree.org/schemas/nvmem/apple,spmi-nvmem.yaml#
   arch/arm64/boot/dts/apple/t8103-j274.dtb: nvmem-layout (fixed-layout): 'boot-error-count@9f02,0', 'panic-count@9f02,4', 'shutdown-flag@9f0f,3' do not match any of the regexes: '@[a-f0-9]+$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/nvmem/layouts/fixed-layout.yaml#
   arch/arm64/boot/dts/apple/t8103-j274.dtb: /soc/smc@23e400000: failed to match any schema with compatible: ['apple,t8103-smc', 'apple,smc']
   arch/arm64/boot/dts/apple/t8103-j274.dtb: /soc/smc@23e400000: failed to match any schema with compatible: ['apple,t8103-smc', 'apple,smc']
   arch/arm64/boot/dts/apple/t8103-j274.dtb: /soc/smc@23e400000/gpio: failed to match any schema with compatible: ['apple,smc-gpio']
   arch/arm64/boot/dts/apple/t8103-j274.dtb: /soc/smc@23e400000/rtc: failed to match any schema with compatible: ['apple,smc-rtc']
   arch/arm64/boot/dts/apple/t8103-j274.dtb: /soc/smc@23e400000/reboot: failed to match any schema with compatible: ['apple,smc-reboot']
   arch/arm64/boot/dts/apple/t8103-j274.dtb: usb@382280000 (apple,t8103-dwc3): iommus: [[110, 0], [111, 1]] is too long
   	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
>> arch/arm64/boot/dts/apple/t8103-j274.dtb: usb@382280000 (apple,t8103-dwc3): Unevaluated properties are not allowed ('iommus' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
   arch/arm64/boot/dts/apple/t8103-j274.dtb: /soc/usb@382280000: failed to match any schema with compatible: ['apple,t8103-dwc3', 'apple,dwc3', 'snps,dwc3']
   arch/arm64/boot/dts/apple/t8103-j274.dtb: /soc/usb@382280000: failed to match any schema with compatible: ['apple,t8103-dwc3', 'apple,dwc3', 'snps,dwc3']
>> arch/arm64/boot/dts/apple/t8103-j274.dtb: /soc/phy@383000000: failed to match any schema with compatible: ['apple,t8103-atcphy']
   arch/arm64/boot/dts/apple/t8103-j274.dtb: usb@502280000 (apple,t8103-dwc3): iommus: [[116, 0], [117, 1]] is too long
   	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
   arch/arm64/boot/dts/apple/t8103-j274.dtb: usb@502280000 (apple,t8103-dwc3): Unevaluated properties are not allowed ('iommus' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
   arch/arm64/boot/dts/apple/t8103-j274.dtb: /soc/usb@502280000: failed to match any schema with compatible: ['apple,t8103-dwc3', 'apple,dwc3', 'snps,dwc3']
   arch/arm64/boot/dts/apple/t8103-j274.dtb: /soc/usb@502280000: failed to match any schema with compatible: ['apple,t8103-dwc3', 'apple,dwc3', 'snps,dwc3']
   arch/arm64/boot/dts/apple/t8103-j274.dtb: /soc/phy@503000000: failed to match any schema with compatible: ['apple,t8103-atcphy']
--
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
>> arch/arm64/boot/dts/apple/t8103-j293.dtb: usb@382280000 (apple,t8103-dwc3): iommus: [[112, 0], [113, 1]] is too long
   	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
>> arch/arm64/boot/dts/apple/t8103-j293.dtb: usb@382280000 (apple,t8103-dwc3): Unevaluated properties are not allowed ('iommus' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
   arch/arm64/boot/dts/apple/t8103-j293.dtb: /soc/usb@382280000: failed to match any schema with compatible: ['apple,t8103-dwc3', 'apple,dwc3', 'snps,dwc3']
   arch/arm64/boot/dts/apple/t8103-j293.dtb: /soc/usb@382280000: failed to match any schema with compatible: ['apple,t8103-dwc3', 'apple,dwc3', 'snps,dwc3']
>> arch/arm64/boot/dts/apple/t8103-j293.dtb: /soc/phy@383000000: failed to match any schema with compatible: ['apple,t8103-atcphy']
   arch/arm64/boot/dts/apple/t8103-j293.dtb: usb@502280000 (apple,t8103-dwc3): iommus: [[118, 0], [119, 1]] is too long
   	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
   arch/arm64/boot/dts/apple/t8103-j293.dtb: usb@502280000 (apple,t8103-dwc3): Unevaluated properties are not allowed ('iommus' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
   arch/arm64/boot/dts/apple/t8103-j293.dtb: /soc/usb@502280000: failed to match any schema with compatible: ['apple,t8103-dwc3', 'apple,dwc3', 'snps,dwc3']
   arch/arm64/boot/dts/apple/t8103-j293.dtb: /soc/usb@502280000: failed to match any schema with compatible: ['apple,t8103-dwc3', 'apple,dwc3', 'snps,dwc3']
   arch/arm64/boot/dts/apple/t8103-j293.dtb: /soc/phy@503000000: failed to match any schema with compatible: ['apple,t8103-atcphy']
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
>> arch/arm64/boot/dts/apple/t8103-j313.dtb: usb@382280000 (apple,t8103-dwc3): iommus: [[110, 0], [111, 1]] is too long
   	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
   arch/arm64/boot/dts/apple/t8103-j313.dtb: usb@382280000 (apple,t8103-dwc3): Unevaluated properties are not allowed ('iommus' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
>> arch/arm64/boot/dts/apple/t8103-j313.dtb: /soc/usb@382280000: failed to match any schema with compatible: ['apple,t8103-dwc3', 'apple,dwc3', 'snps,dwc3']
>> arch/arm64/boot/dts/apple/t8103-j313.dtb: /soc/usb@382280000: failed to match any schema with compatible: ['apple,t8103-dwc3', 'apple,dwc3', 'snps,dwc3']
   arch/arm64/boot/dts/apple/t8103-j313.dtb: /soc/phy@383000000: failed to match any schema with compatible: ['apple,t8103-atcphy']
   arch/arm64/boot/dts/apple/t8103-j313.dtb: usb@502280000 (apple,t8103-dwc3): iommus: [[116, 0], [117, 1]] is too long
   	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
   arch/arm64/boot/dts/apple/t8103-j313.dtb: usb@502280000 (apple,t8103-dwc3): Unevaluated properties are not allowed ('iommus' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
   arch/arm64/boot/dts/apple/t8103-j313.dtb: /soc/usb@502280000: failed to match any schema with compatible: ['apple,t8103-dwc3', 'apple,dwc3', 'snps,dwc3']
   arch/arm64/boot/dts/apple/t8103-j313.dtb: /soc/usb@502280000: failed to match any schema with compatible: ['apple,t8103-dwc3', 'apple,dwc3', 'snps,dwc3']
   arch/arm64/boot/dts/apple/t8103-j313.dtb: /soc/phy@503000000: failed to match any schema with compatible: ['apple,t8103-atcphy']
--
   	from schema $id: http://devicetree.org/schemas/nvmem/layouts/fixed-layout.yaml#
   arch/arm64/boot/dts/apple/t8103-j456.dtb: /soc/smc@23e400000: failed to match any schema with compatible: ['apple,t8103-smc', 'apple,smc']
   arch/arm64/boot/dts/apple/t8103-j456.dtb: /soc/smc@23e400000: failed to match any schema with compatible: ['apple,t8103-smc', 'apple,smc']
   arch/arm64/boot/dts/apple/t8103-j456.dtb: /soc/smc@23e400000/gpio: failed to match any schema with compatible: ['apple,smc-gpio']
   arch/arm64/boot/dts/apple/t8103-j456.dtb: /soc/smc@23e400000/rtc: failed to match any schema with compatible: ['apple,smc-rtc']
   arch/arm64/boot/dts/apple/t8103-j456.dtb: /soc/smc@23e400000/reboot: failed to match any schema with compatible: ['apple,smc-reboot']
   arch/arm64/boot/dts/apple/t8103-j456.dtb: usb@382280000 (apple,t8103-dwc3): iommus: [[110, 0], [111, 1]] is too long
   	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
   arch/arm64/boot/dts/apple/t8103-j456.dtb: usb@382280000 (apple,t8103-dwc3): Unevaluated properties are not allowed ('iommus' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
>> arch/arm64/boot/dts/apple/t8103-j456.dtb: /soc/usb@382280000: failed to match any schema with compatible: ['apple,t8103-dwc3', 'apple,dwc3', 'snps,dwc3']
>> arch/arm64/boot/dts/apple/t8103-j456.dtb: /soc/usb@382280000: failed to match any schema with compatible: ['apple,t8103-dwc3', 'apple,dwc3', 'snps,dwc3']
   arch/arm64/boot/dts/apple/t8103-j456.dtb: /soc/phy@383000000: failed to match any schema with compatible: ['apple,t8103-atcphy']
   arch/arm64/boot/dts/apple/t8103-j456.dtb: usb@502280000 (apple,t8103-dwc3): iommus: [[116, 0], [117, 1]] is too long
   	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
   arch/arm64/boot/dts/apple/t8103-j456.dtb: usb@502280000 (apple,t8103-dwc3): Unevaluated properties are not allowed ('iommus' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
   arch/arm64/boot/dts/apple/t8103-j456.dtb: /soc/usb@502280000: failed to match any schema with compatible: ['apple,t8103-dwc3', 'apple,dwc3', 'snps,dwc3']
   arch/arm64/boot/dts/apple/t8103-j456.dtb: /soc/usb@502280000: failed to match any schema with compatible: ['apple,t8103-dwc3', 'apple,dwc3', 'snps,dwc3']
   arch/arm64/boot/dts/apple/t8103-j456.dtb: /soc/phy@503000000: failed to match any schema with compatible: ['apple,t8103-atcphy']
--
   	from schema $id: http://devicetree.org/schemas/nvmem/apple,spmi-nvmem.yaml#
   arch/arm64/boot/dts/apple/t8103-j457.dtb: nvmem-layout (fixed-layout): 'boot-error-count@9f02,0', 'panic-count@9f02,4', 'shutdown-flag@9f0f,3' do not match any of the regexes: '@[a-f0-9]+$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/nvmem/layouts/fixed-layout.yaml#
   arch/arm64/boot/dts/apple/t8103-j457.dtb: /soc/smc@23e400000: failed to match any schema with compatible: ['apple,t8103-smc', 'apple,smc']
   arch/arm64/boot/dts/apple/t8103-j457.dtb: /soc/smc@23e400000: failed to match any schema with compatible: ['apple,t8103-smc', 'apple,smc']
   arch/arm64/boot/dts/apple/t8103-j457.dtb: /soc/smc@23e400000/gpio: failed to match any schema with compatible: ['apple,smc-gpio']
   arch/arm64/boot/dts/apple/t8103-j457.dtb: /soc/smc@23e400000/rtc: failed to match any schema with compatible: ['apple,smc-rtc']
   arch/arm64/boot/dts/apple/t8103-j457.dtb: /soc/smc@23e400000/reboot: failed to match any schema with compatible: ['apple,smc-reboot']
   arch/arm64/boot/dts/apple/t8103-j457.dtb: usb@382280000 (apple,t8103-dwc3): iommus: [[110, 0], [111, 1]] is too long
   	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
>> arch/arm64/boot/dts/apple/t8103-j457.dtb: usb@382280000 (apple,t8103-dwc3): Unevaluated properties are not allowed ('iommus' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
   arch/arm64/boot/dts/apple/t8103-j457.dtb: /soc/usb@382280000: failed to match any schema with compatible: ['apple,t8103-dwc3', 'apple,dwc3', 'snps,dwc3']
   arch/arm64/boot/dts/apple/t8103-j457.dtb: /soc/usb@382280000: failed to match any schema with compatible: ['apple,t8103-dwc3', 'apple,dwc3', 'snps,dwc3']
   arch/arm64/boot/dts/apple/t8103-j457.dtb: /soc/phy@383000000: failed to match any schema with compatible: ['apple,t8103-atcphy']
   arch/arm64/boot/dts/apple/t8103-j457.dtb: usb@502280000 (apple,t8103-dwc3): iommus: [[116, 0], [117, 1]] is too long
   	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
   arch/arm64/boot/dts/apple/t8103-j457.dtb: usb@502280000 (apple,t8103-dwc3): Unevaluated properties are not allowed ('iommus' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
   arch/arm64/boot/dts/apple/t8103-j457.dtb: /soc/usb@502280000: failed to match any schema with compatible: ['apple,t8103-dwc3', 'apple,dwc3', 'snps,dwc3']
   arch/arm64/boot/dts/apple/t8103-j457.dtb: /soc/usb@502280000: failed to match any schema with compatible: ['apple,t8103-dwc3', 'apple,dwc3', 'snps,dwc3']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
