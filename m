Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A91713B5305
	for <oe-kbuild@lists.linux.dev>; Thu,  2 Apr 2026 12:39:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775133575; cv=none; b=FGiY8/0frFJagiwV0kFvV+FRml/LT0T7qtIELJTJ1JLV276H8KPEOYzV0mpE2UhsP2FnONuPR9B9ct9ug8HmULOhs1+ALOtESkMc8VkjJnGhgRmCvsH0BYSzKIhYj11TWhG33IPhL/yBwUX/W5jCnrGe1ciDT5aKEobbU2Auow4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775133575; c=relaxed/simple;
	bh=RvvG8Feta8C9/JyJ6SJ3vEZixT2FWjW/Li8AjuuL1VU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=mPkp8kqmDNxdV4Pm7AmRvjmgOouhX5Ze7jN3S+rIJ2B0Ru/NpW+zdhDeenD8/t8CYhY2fsabClS5esGtDuNydDpT0vn5DZvjOz5fadiwZ/LpLX1dFv+E++RIParl4frL+gBmQzBR67sZAhjPDBniKLAc5QGM5AgGakPxOeMFZL4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=U/Rq62TW; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="U/Rq62TW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775133563; x=1806669563;
  h=date:from:to:cc:subject:message-id;
  bh=RvvG8Feta8C9/JyJ6SJ3vEZixT2FWjW/Li8AjuuL1VU=;
  b=U/Rq62TWN9Zpci9jMPTvgHtTV2bGHsiB1syK30m5tIG1RknoQmPf3Eve
   cO9bk2CwGjA9YB3opB3uKsJQ12RgXFAPGS8r1nS5AeiYaETwog7VemUA2
   ryTLJXFwGV6tQZc8YCBzg8934SYucRbe97q+8s3HF7+c+6DHrop++8duR
   +3nSFyeEoSLcckIvKXfEHXay0iGtY+iEtg05tmyh91TtBvlKC8BWoju7B
   IsxCgezrIo6It1yQGj2qZMh3RkN3DyUIPcZJzQOvwVD1SJcMoOA4exQsS
   oEac01LtE3x2kC1dyjwuPp0uoBZYMXGdJj3NSGiOJMKlHaU9FG5Rzm876
   Q==;
X-CSE-ConnectionGUID: TPiO/hqcRM2LCCnP+A5sww==
X-CSE-MsgGUID: VgBlGQiXQYa9T7lyWV8iRA==
X-IronPort-AV: E=McAfee;i="6800,10657,11746"; a="80051021"
X-IronPort-AV: E=Sophos;i="6.23,155,1770624000"; 
   d="scan'208";a="80051021"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2026 05:39:21 -0700
X-CSE-ConnectionGUID: jbwrYiCvR7yCSDr18CImaw==
X-CSE-MsgGUID: T/6GuRFgTEWO2YTvC3j6HA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,155,1770624000"; 
   d="scan'208";a="227232085"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by orviesa007.jf.intel.com with ESMTP; 02 Apr 2026 05:39:20 -0700
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w8HKQ-0000000093F-0skA;
	Thu, 02 Apr 2026 12:39:18 +0000
Date: Thu, 02 Apr 2026 14:39:18 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [soc:hisilicon/dts 1/1]
 arch/arm64/boot/dts/hisilicon/hi3660-hikey960.dtb: /soc/mmc@ff37f000: failed
 to match any schema with compatible: ['hisilicon,hi3660-dw-mshc']
Message-ID: <202604021408.RxQmTTBB-lkp@intel.com>
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
CC: linux-arm-kernel@lists.infradead.org
CC: arm@kernel.org
TO: Bhargav Joshi <rougueprince47@gmail.com>
CC: Wei Xu <xuwei5@hisilicon.com>
CC: Krzysztof Kozlowski <krzk@kernel.org>

Hi Bhargav,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git hisilicon/dts
head:   f17d7a0f8ff6f9864d8f82e99c46cee1088e945b
commit: f17d7a0f8ff6f9864d8f82e99c46cee1088e945b [1/1] arm64: dts: hisilicon: Rename dwmmc nodes to mmc
:::::: branch date: 6 days ago
:::::: commit date: 6 days ago
config: arm64-randconfig-2052-20260402 (https://download.01.org/0day-ci/archive/20260402/202604021408.RxQmTTBB-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 10.5.0
dtschema: 2025.13.dev11+ged7697fd8
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260402/202604021408.RxQmTTBB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202604021408.RxQmTTBB-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/hisilicon/hi3660-hikey960.dtb: adv7533@39 (adi,adv7533): 'a2vdd-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/display/bridge/adi,adv7533.yaml
   arch/arm64/boot/dts/hisilicon/hi3660-hikey960.dtb: adv7533@39 (adi,adv7533): 'v3p3-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/display/bridge/adi,adv7533.yaml
   arch/arm64/boot/dts/hisilicon/hi3660-hikey960.dtb: /soc/dma@fdf30000: failed to match any schema with compatible: ['hisilicon,k3-dma-1.0']
   arch/arm64/boot/dts/hisilicon/hi3660-hikey960.dtb: /soc/dma-controller@e804b000: failed to match any schema with compatible: ['hisilicon,hisi-pcm-asp-dma-1.0']
   arch/arm64/boot/dts/hisilicon/hi3660-hikey960.dtb: spi@ffd68000 (arm,pl022): Unevaluated properties are not allowed ('label' was unexpected)
   	from schema $id: http://devicetree.org/schemas/spi/spi-pl022.yaml
   arch/arm64/boot/dts/hisilicon/hi3660-hikey960.dtb: spi@ff3b3000 (arm,pl022): Unevaluated properties are not allowed ('label' was unexpected)
   	from schema $id: http://devicetree.org/schemas/spi/spi-pl022.yaml
>> arch/arm64/boot/dts/hisilicon/hi3660-hikey960.dtb: /soc/mmc@ff37f000: failed to match any schema with compatible: ['hisilicon,hi3660-dw-mshc']
>> arch/arm64/boot/dts/hisilicon/hi3660-hikey960.dtb: /soc/mmc@ff3ff000: failed to match any schema with compatible: ['hisilicon,hi3660-dw-mshc']
   arch/arm64/boot/dts/hisilicon/hi3660-hikey960.dtb: usb@ff100000 (snps,dwc3): resets: [[31, 144, 8], [31, 144, 7], [31, 144, 6], [31, 144, 5]] is too long
   	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml
   arch/arm64/boot/dts/hisilicon/hi3660-hikey960.dtb: funnel (arm,coresight-static-funnel): 'clock-names', 'clocks' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/arm/arm,coresight-static-funnel.yaml
   arch/arm64/boot/dts/hisilicon/hi3660-hikey960.dtb: reboot-mode-syscon@32100000 (syscon): compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml
   arch/arm64/boot/dts/hisilicon/hi3660-hikey960.dtb: /pmic@fff34000: failed to match any schema with compatible: ['hisilicon,hi6421v530-pmic']
--
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm64/boot/dts/hisilicon/hi3670-hikey970.dtb: soc (simple-bus): gpio-range: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm64/boot/dts/hisilicon/hi3670-hikey970.dtb: /soc/crg_ctrl@fff35000: failed to match any schema with compatible: ['hisilicon,hi3670-crgctrl', 'syscon']
   arch/arm64/boot/dts/hisilicon/hi3670-hikey970.dtb: /soc/pctrl@e8a09000: failed to match any schema with compatible: ['hisilicon,hi3670-pctrl', 'syscon']
   arch/arm64/boot/dts/hisilicon/hi3670-hikey970.dtb: /soc/crg_ctrl@fff34000: failed to match any schema with compatible: ['hisilicon,hi3670-pmuctrl', 'syscon']
   arch/arm64/boot/dts/hisilicon/hi3670-hikey970.dtb: /soc/sctrl@fff0a000: failed to match any schema with compatible: ['hisilicon,hi3670-sctrl', 'syscon']
   arch/arm64/boot/dts/hisilicon/hi3670-hikey970.dtb: /soc/iomcu@ffd7e000: failed to match any schema with compatible: ['hisilicon,hi3670-iomcu', 'syscon']
   arch/arm64/boot/dts/hisilicon/hi3670-hikey970.dtb: /soc/media1_crgctrl@e87ff000: failed to match any schema with compatible: ['hisilicon,hi3670-media1-crg', 'syscon']
   arch/arm64/boot/dts/hisilicon/hi3670-hikey970.dtb: /soc/media2_crgctrl@e8900000: failed to match any schema with compatible: ['hisilicon,hi3670-media2-crg', 'syscon']
>> arch/arm64/boot/dts/hisilicon/hi3670-hikey970.dtb: /soc/mmc@ff37f000: failed to match any schema with compatible: ['hisilicon,hi3670-dw-mshc', 'hisilicon,hi3660-dw-mshc']
>> arch/arm64/boot/dts/hisilicon/hi3670-hikey970.dtb: /soc/mmc@ff37f000: failed to match any schema with compatible: ['hisilicon,hi3670-dw-mshc', 'hisilicon,hi3660-dw-mshc']
>> arch/arm64/boot/dts/hisilicon/hi3670-hikey970.dtb: /soc/mmc@fc183000: failed to match any schema with compatible: ['hisilicon,hi3670-dw-mshc', 'hisilicon,hi3660-dw-mshc']
>> arch/arm64/boot/dts/hisilicon/hi3670-hikey970.dtb: /soc/mmc@fc183000: failed to match any schema with compatible: ['hisilicon,hi3670-dw-mshc', 'hisilicon,hi3660-dw-mshc']
   arch/arm64/boot/dts/hisilicon/hi3670-hikey970.dtb: /spmi@fff24000/pmic@0: failed to match any schema with compatible: ['hisilicon,hi6421-spmi']
--
   	from schema $id: http://devicetree.org/schemas/display/bridge/adi,adv7533.yaml
   arch/arm64/boot/dts/hisilicon/hi6220-hikey.dtb: adv7533@39 (adi,adv7533): 'dvdd-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/display/bridge/adi,adv7533.yaml
   arch/arm64/boot/dts/hisilicon/hi6220-hikey.dtb: adv7533@39 (adi,adv7533): 'pvdd-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/display/bridge/adi,adv7533.yaml
   arch/arm64/boot/dts/hisilicon/hi6220-hikey.dtb: adv7533@39 (adi,adv7533): 'a2vdd-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/display/bridge/adi,adv7533.yaml
   arch/arm64/boot/dts/hisilicon/hi6220-hikey.dtb: adv7533@39 (adi,adv7533): 'v3p3-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/display/bridge/adi,adv7533.yaml
   arch/arm64/boot/dts/hisilicon/hi6220-hikey.dtb: /soc/mailbox@f7510000: failed to match any schema with compatible: ['hisilicon,hi6220-mbox']
>> arch/arm64/boot/dts/hisilicon/hi6220-hikey.dtb: /soc/mmc@f723d000: failed to match any schema with compatible: ['hisilicon,hi6220-dw-mshc']
>> arch/arm64/boot/dts/hisilicon/hi6220-hikey.dtb: /soc/mmc@f723e000: failed to match any schema with compatible: ['hisilicon,hi6220-dw-mshc']
>> arch/arm64/boot/dts/hisilicon/hi6220-hikey.dtb: /soc/mmc@f723f000: failed to match any schema with compatible: ['hisilicon,hi6220-dw-mshc']
   arch/arm64/boot/dts/hisilicon/hi6220-hikey.dtb: /soc/i2s@f7118000: failed to match any schema with compatible: ['hisilicon,hi6210-i2s']
   arch/arm64/boot/dts/hisilicon/hi6220-hikey.dtb: /soc/ade@f4100000: failed to match any schema with compatible: ['hisilicon,hi6220-ade']
   arch/arm64/boot/dts/hisilicon/hi6220-hikey.dtb: /soc/dsi@f4107800: failed to match any schema with compatible: ['hisilicon,hi6220-dsi']
   arch/arm64/boot/dts/hisilicon/hi6220-hikey.dtb: gpu@f4080000 (hisilicon,hi6220-mali): 'reset-names' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/gpu/arm,mali-utgard.yaml
   arch/arm64/boot/dts/hisilicon/hi6220-hikey.dtb: gpu@f4080000 (hisilicon,hi6220-mali): resets: [[18, 1], [84, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/gpu/arm,mali-utgard.yaml
   arch/arm64/boot/dts/hisilicon/hi6220-hikey.dtb: reboot-mode-syscon@5f01000 (syscon): compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml
   arch/arm64/boot/dts/hisilicon/hi6220-hikey.dtb: /pmic@f8000000: failed to match any schema with compatible: ['hisilicon,hi655x-pmic']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
