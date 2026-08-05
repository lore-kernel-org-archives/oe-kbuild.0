Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43464432BCA
	for <oe-kbuild@lists.linux.dev>; Wed,  5 Aug 2026 11:16:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785928622; cv=none; b=Ze1rM2SuMK/PmuHb+dO3acxMnL3a12jNvG0IRJ+hcwjjgZ/0T0hKxCduygQATpAsGvQPXsppuzqM0zMO8i8OTwBbSs1SeEM0FH7s+aCuKptc/TBfI7k9luHh4WEI47XvZNj7gh/e+4hVJSupGDe2RToGEs2FU+/N5M4Biz18cX4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785928622; c=relaxed/simple;
	bh=IlU21mp/y0JbTsh3eQNGBijDg1ACSVxTQgXpVdg+HWI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=UwAAHq0bb7ZWXrqBDN1CvhhlmLH/SL1oKO6ed211fOEKdCJfvj3qItuRMF0w7sq3HnwG/poFg968GwfljvlXSoYWfMQVJti4B5dPOTUhUEyH6/gfGr4eoyOka6wIQVue4eCxdId60cQtc0hFIbhsqvTQaLXCz1siDLqum6H+3pc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=a8iAaQiz; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="a8iAaQiz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785928618; x=1817464618;
  h=date:from:to:cc:subject:message-id;
  bh=IlU21mp/y0JbTsh3eQNGBijDg1ACSVxTQgXpVdg+HWI=;
  b=a8iAaQizpdodof+J/WPs7L+LXh30Hxx7fj4xfczwADqlB/59xdaIfdWJ
   kQ+pmSFUqHFeFbJG8GCZ5pV8npYE1xLS6MhKC5MsuboFFKi+Q0ltnwvpy
   t/5fb8yt4y6+dcmcAPsgoJV+kL053UZOSOZ++Xrpnx51wLs7OHs1D/l7R
   Jf4grG0IlbswbvUKtYIiaHzX77Ri/ZsyITKaqbbMGAimYqvPDrHyJiKX8
   zsDirnIScjBffif5+fhYRQPpd6s0hAX7xQWG2FPBt6dnO1JdRKfY9bcHN
   ds6vKIoV9M07OYXfP63842CLwvd6vPWsMG/GIrHR6Wxbt2Mbe1IYcB4VF
   g==;
X-CSE-ConnectionGUID: OaginUOKSs+0ttCcGRyImQ==
X-CSE-MsgGUID: kykyVSahSmaJCEaynb00nw==
X-IronPort-AV: E=McAfee;i="6800,10657,11865"; a="86439193"
X-IronPort-AV: E=Sophos;i="6.25,206,1779174000"; 
   d="scan'208";a="86439193"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Aug 2026 04:16:57 -0700
X-CSE-ConnectionGUID: 123FEWJlROGCLleUg52/7w==
X-CSE-MsgGUID: DA74/IfSSNa5QrIBE6nmYA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,206,1779174000"; 
   d="scan'208";a="260020912"
Received: from igk-lkp-server01.igk.intel.com (HELO 3cba2a188a06) ([10.211.93.152])
  by orviesa006.jf.intel.com with ESMTP; 05 Aug 2026 04:16:56 -0700
Received: from kbuild by 3cba2a188a06 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wrZcE-000000004OA-1SiP;
	Wed, 05 Aug 2026 11:16:54 +0000
Date: Wed, 05 Aug 2026 13:16:05 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [qcom:arm64-for-7.3 312/360]
 arch/arm64/boot/dts/qcom/sc7180-acer-aspire1.dtb: scm (qcom,scm-sc7180):
 'sram' does not match any of the regexes: '^pinctrl-[0-9]+$'
Message-ID: <202608051351.UFYJ8jQ7-lkp@intel.com>
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
TO: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
CC: Bjorn Andersson <andersson@kernel.org>
CC: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux arm64-for-7.3
head:   b426fedcef8c277574bd7beed0ae9d482c03605a
commit: 9d2f33d8ceacde93631319f06243bfc5ed41e2d7 [312/360] arm64: dts: qcom: sc7180: Add minidump SRAM config to SCM node
:::::: branch date: 8 hours ago
:::::: commit date: 2 days ago
config: arm64-randconfig-2054-20260803 (https://download.01.org/0day-ci/archive/20260805/202608051351.UFYJ8jQ7-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project ade128740327db281859708ddcb3b072903b3414)
dtschema: 2026.7.dev1+g2203c1720
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260805/202608051351.UFYJ8jQ7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202608051351.UFYJ8jQ7-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/qcom/sc7180.dtsi:3323.27-3398.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/arm64/boot/dts/qcom/sc7180-acer-aspire1.dtb: scm (qcom,scm-sc7180): 'sram' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/firmware/qcom,scm.yaml
>> arch/arm64/boot/dts/qcom/sc7180-acer-aspire1.dtb: sram@14680000 (qcom,sc7180-imem): 'minidump-sram@1c' does not match any of the regexes: '^modem-tables@[0-9a-f]+$', '^pil-reloc@[0-9a-f]+$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/sram/qcom,imem.yaml
--
   arch/arm64/boot/dts/qcom/sc7180.dtsi:3323.27-3398.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/arm64/boot/dts/qcom/sc7180-ecs-liva-qc710.dtb: scm (qcom,scm-sc7180): 'sram' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/firmware/qcom,scm.yaml
>> arch/arm64/boot/dts/qcom/sc7180-ecs-liva-qc710.dtb: sram@14680000 (qcom,sc7180-imem): 'minidump-sram@1c' does not match any of the regexes: '^modem-tables@[0-9a-f]+$', '^pil-reloc@[0-9a-f]+$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/sram/qcom,imem.yaml
--
>> arch/arm64/boot/dts/qcom/sc7180-idp.dtb: scm (qcom,scm-sc7180): 'sram' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/firmware/qcom,scm.yaml
>> arch/arm64/boot/dts/qcom/sc7180-idp.dtb: sram@14680000 (qcom,sc7180-imem): 'minidump-sram@1c' does not match any of the regexes: '^modem-tables@[0-9a-f]+$', '^pil-reloc@[0-9a-f]+$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/sram/qcom,imem.yaml
--
   arch/arm64/boot/dts/qcom/sc7180.dtsi:385.11-390.4: Warning (avoid_unnecessary_addr_size): /firmware: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/sc7180.dtsi:3323.27-3398.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/pm6150.dtsi:135.30-143.5: Warning (avoid_unnecessary_addr_size): /soc@0/spmi@c440000/pmic@0/adc-tm@3500: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r1.dtb: scm (qcom,scm-sc7180): 'sram' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/firmware/qcom,scm.yaml
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r1.dtb: sram@14680000 (qcom,sc7180-imem): 'minidump-sram@1c' does not match any of the regexes: '^modem-tables@[0-9a-f]+$', '^pil-reloc@[0-9a-f]+$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/sram/qcom,imem.yaml
--
   arch/arm64/boot/dts/qcom/sc7180.dtsi:385.11-390.4: Warning (avoid_unnecessary_addr_size): /firmware: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/sc7180.dtsi:3323.27-3398.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/pm6150.dtsi:135.30-143.5: Warning (avoid_unnecessary_addr_size): /soc@0/spmi@c440000/pmic@0/adc-tm@3500: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r1-lte.dtb: scm (qcom,scm-sc7180): 'sram' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/firmware/qcom,scm.yaml
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r1-lte.dtb: sram@14680000 (qcom,sc7180-imem): 'minidump-sram@1c' does not match any of the regexes: '^modem-tables@[0-9a-f]+$', '^pil-reloc@[0-9a-f]+$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/sram/qcom,imem.yaml
--
   arch/arm64/boot/dts/qcom/sc7180.dtsi:385.11-390.4: Warning (avoid_unnecessary_addr_size): /firmware: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/sc7180.dtsi:3323.27-3398.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r3.dtb: scm (qcom,scm-sc7180): 'sram' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/firmware/qcom,scm.yaml
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r3.dtb: sram@14680000 (qcom,sc7180-imem): 'minidump-sram@1c' does not match any of the regexes: '^modem-tables@[0-9a-f]+$', '^pil-reloc@[0-9a-f]+$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/sram/qcom,imem.yaml
--
   arch/arm64/boot/dts/qcom/sc7180.dtsi:385.11-390.4: Warning (avoid_unnecessary_addr_size): /firmware: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/sc7180.dtsi:3323.27-3398.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r3-lte.dtb: scm (qcom,scm-sc7180): 'sram' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/firmware/qcom,scm.yaml
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r3-lte.dtb: sram@14680000 (qcom,sc7180-imem): 'minidump-sram@1c' does not match any of the regexes: '^modem-tables@[0-9a-f]+$', '^pil-reloc@[0-9a-f]+$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/sram/qcom,imem.yaml
--
   arch/arm64/boot/dts/qcom/sc7180.dtsi:385.11-390.4: Warning (avoid_unnecessary_addr_size): /firmware: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/sc7180.dtsi:3323.27-3398.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-homestar-r2.dtb: scm (qcom,scm-sc7180): 'sram' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/firmware/qcom,scm.yaml
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-homestar-r2.dtb: sram@14680000 (qcom,sc7180-imem): 'minidump-sram@1c' does not match any of the regexes: '^modem-tables@[0-9a-f]+$', '^pil-reloc@[0-9a-f]+$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/sram/qcom,imem.yaml
--
   arch/arm64/boot/dts/qcom/sc7180.dtsi:385.11-390.4: Warning (avoid_unnecessary_addr_size): /firmware: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/sc7180.dtsi:3323.27-3398.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-homestar-r3.dtb: scm (qcom,scm-sc7180): 'sram' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/firmware/qcom,scm.yaml
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-homestar-r3.dtb: sram@14680000 (qcom,sc7180-imem): 'minidump-sram@1c' does not match any of the regexes: '^modem-tables@[0-9a-f]+$', '^pil-reloc@[0-9a-f]+$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/sram/qcom,imem.yaml
--
   arch/arm64/boot/dts/qcom/sc7180.dtsi:385.11-390.4: Warning (avoid_unnecessary_addr_size): /firmware: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/sc7180.dtsi:3323.27-3398.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-homestar-r4.dtb: scm (qcom,scm-sc7180): 'sram' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/firmware/qcom,scm.yaml
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-homestar-r4.dtb: sram@14680000 (qcom,sc7180-imem): 'minidump-sram@1c' does not match any of the regexes: '^modem-tables@[0-9a-f]+$', '^pil-reloc@[0-9a-f]+$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/sram/qcom,imem.yaml
--
   arch/arm64/boot/dts/qcom/sc7180.dtsi:385.11-390.4: Warning (avoid_unnecessary_addr_size): /firmware: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/sc7180.dtsi:3323.27-3398.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-kingoftown.dtb: scm (qcom,scm-sc7180): 'sram' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/firmware/qcom,scm.yaml
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-kingoftown.dtb: sram@14680000 (qcom,sc7180-imem): 'minidump-sram@1c' does not match any of the regexes: '^modem-tables@[0-9a-f]+$', '^pil-reloc@[0-9a-f]+$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/sram/qcom,imem.yaml
--
   arch/arm64/boot/dts/qcom/sc7180.dtsi:385.11-390.4: Warning (avoid_unnecessary_addr_size): /firmware: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/sc7180.dtsi:3323.27-3398.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/pm6150.dtsi:135.30-143.5: Warning (avoid_unnecessary_addr_size): /soc@0/spmi@c440000/pmic@0/adc-tm@3500: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r1.dtb: scm (qcom,scm-sc7180): 'sram' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/firmware/qcom,scm.yaml
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r1.dtb: sram@14680000 (qcom,sc7180-imem): 'minidump-sram@1c' does not match any of the regexes: '^modem-tables@[0-9a-f]+$', '^pil-reloc@[0-9a-f]+$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/sram/qcom,imem.yaml
--
   arch/arm64/boot/dts/qcom/sc7180.dtsi:385.11-390.4: Warning (avoid_unnecessary_addr_size): /firmware: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/sc7180.dtsi:3323.27-3398.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/pm6150.dtsi:135.30-143.5: Warning (avoid_unnecessary_addr_size): /soc@0/spmi@c440000/pmic@0/adc-tm@3500: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r1-kb.dtb: scm (qcom,scm-sc7180): 'sram' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/firmware/qcom,scm.yaml
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r1-kb.dtb: sram@14680000 (qcom,sc7180-imem): 'minidump-sram@1c' does not match any of the regexes: '^modem-tables@[0-9a-f]+$', '^pil-reloc@[0-9a-f]+$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/sram/qcom,imem.yaml
--
   arch/arm64/boot/dts/qcom/sc7180.dtsi:385.11-390.4: Warning (avoid_unnecessary_addr_size): /firmware: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/sc7180.dtsi:3323.27-3398.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/pm6150.dtsi:135.30-143.5: Warning (avoid_unnecessary_addr_size): /soc@0/spmi@c440000/pmic@0/adc-tm@3500: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r1-lte.dtb: scm (qcom,scm-sc7180): 'sram' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/firmware/qcom,scm.yaml
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r1-lte.dtb: sram@14680000 (qcom,sc7180-imem): 'minidump-sram@1c' does not match any of the regexes: '^modem-tables@[0-9a-f]+$', '^pil-reloc@[0-9a-f]+$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/sram/qcom,imem.yaml
--
   arch/arm64/boot/dts/qcom/sc7180.dtsi:385.11-390.4: Warning (avoid_unnecessary_addr_size): /firmware: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/sc7180.dtsi:3323.27-3398.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/pm6150.dtsi:135.30-143.5: Warning (avoid_unnecessary_addr_size): /soc@0/spmi@c440000/pmic@0/adc-tm@3500: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r3.dtb: scm (qcom,scm-sc7180): 'sram' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/firmware/qcom,scm.yaml
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r3.dtb: sram@14680000 (qcom,sc7180-imem): 'minidump-sram@1c' does not match any of the regexes: '^modem-tables@[0-9a-f]+$', '^pil-reloc@[0-9a-f]+$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/sram/qcom,imem.yaml
--
   arch/arm64/boot/dts/qcom/sc7180.dtsi:385.11-390.4: Warning (avoid_unnecessary_addr_size): /firmware: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/sc7180.dtsi:3323.27-3398.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/pm6150.dtsi:135.30-143.5: Warning (avoid_unnecessary_addr_size): /soc@0/spmi@c440000/pmic@0/adc-tm@3500: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r3-kb.dtb: scm (qcom,scm-sc7180): 'sram' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/firmware/qcom,scm.yaml
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r3-kb.dtb: sram@14680000 (qcom,sc7180-imem): 'minidump-sram@1c' does not match any of the regexes: '^modem-tables@[0-9a-f]+$', '^pil-reloc@[0-9a-f]+$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/sram/qcom,imem.yaml
--
   arch/arm64/boot/dts/qcom/sc7180.dtsi:385.11-390.4: Warning (avoid_unnecessary_addr_size): /firmware: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/sc7180.dtsi:3323.27-3398.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/pm6150.dtsi:135.30-143.5: Warning (avoid_unnecessary_addr_size): /soc@0/spmi@c440000/pmic@0/adc-tm@3500: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r3-lte.dtb: scm (qcom,scm-sc7180): 'sram' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/firmware/qcom,scm.yaml
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r3-lte.dtb: sram@14680000 (qcom,sc7180-imem): 'minidump-sram@1c' does not match any of the regexes: '^modem-tables@[0-9a-f]+$', '^pil-reloc@[0-9a-f]+$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/sram/qcom,imem.yaml
--
   arch/arm64/boot/dts/qcom/sc7180.dtsi:385.11-390.4: Warning (avoid_unnecessary_addr_size): /firmware: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/sc7180.dtsi:3323.27-3398.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/pm6150.dtsi:135.30-143.5: Warning (avoid_unnecessary_addr_size): /soc@0/spmi@c440000/pmic@0/adc-tm@3500: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r9.dtb: scm (qcom,scm-sc7180): 'sram' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/firmware/qcom,scm.yaml
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r9.dtb: sram@14680000 (qcom,sc7180-imem): 'minidump-sram@1c' does not match any of the regexes: '^modem-tables@[0-9a-f]+$', '^pil-reloc@[0-9a-f]+$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/sram/qcom,imem.yaml
--
   arch/arm64/boot/dts/qcom/sc7180.dtsi:385.11-390.4: Warning (avoid_unnecessary_addr_size): /firmware: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/sc7180.dtsi:3323.27-3398.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/pm6150.dtsi:135.30-143.5: Warning (avoid_unnecessary_addr_size): /soc@0/spmi@c440000/pmic@0/adc-tm@3500: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r9-kb.dtb: scm (qcom,scm-sc7180): 'sram' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/firmware/qcom,scm.yaml
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r9-kb.dtb: sram@14680000 (qcom,sc7180-imem): 'minidump-sram@1c' does not match any of the regexes: '^modem-tables@[0-9a-f]+$', '^pil-reloc@[0-9a-f]+$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/sram/qcom,imem.yaml
--
   arch/arm64/boot/dts/qcom/sc7180.dtsi:385.11-390.4: Warning (avoid_unnecessary_addr_size): /firmware: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/sc7180.dtsi:3323.27-3398.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/pm6150.dtsi:135.30-143.5: Warning (avoid_unnecessary_addr_size): /soc@0/spmi@c440000/pmic@0/adc-tm@3500: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r9-lte.dtb: scm (qcom,scm-sc7180): 'sram' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/firmware/qcom,scm.yaml
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r9-lte.dtb: sram@14680000 (qcom,sc7180-imem): 'minidump-sram@1c' does not match any of the regexes: '^modem-tables@[0-9a-f]+$', '^pil-reloc@[0-9a-f]+$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/sram/qcom,imem.yaml
--
   arch/arm64/boot/dts/qcom/sc7180.dtsi:385.11-390.4: Warning (avoid_unnecessary_addr_size): /firmware: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/sc7180.dtsi:3323.27-3398.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/pm6150.dtsi:135.30-143.5: Warning (avoid_unnecessary_addr_size): /soc@0/spmi@c440000/pmic@0/adc-tm@3500: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r10.dtb: scm (qcom,scm-sc7180): 'sram' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/firmware/qcom,scm.yaml
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r10.dtb: sram@14680000 (qcom,sc7180-imem): 'minidump-sram@1c' does not match any of the regexes: '^modem-tables@[0-9a-f]+$', '^pil-reloc@[0-9a-f]+$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/sram/qcom,imem.yaml
--
   arch/arm64/boot/dts/qcom/sc7180.dtsi:385.11-390.4: Warning (avoid_unnecessary_addr_size): /firmware: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/sc7180.dtsi:3323.27-3398.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/pm6150.dtsi:135.30-143.5: Warning (avoid_unnecessary_addr_size): /soc@0/spmi@c440000/pmic@0/adc-tm@3500: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r10-kb.dtb: scm (qcom,scm-sc7180): 'sram' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/firmware/qcom,scm.yaml
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r10-kb.dtb: sram@14680000 (qcom,sc7180-imem): 'minidump-sram@1c' does not match any of the regexes: '^modem-tables@[0-9a-f]+$', '^pil-reloc@[0-9a-f]+$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/sram/qcom,imem.yaml
--
   arch/arm64/boot/dts/qcom/sc7180.dtsi:385.11-390.4: Warning (avoid_unnecessary_addr_size): /firmware: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/sc7180.dtsi:3323.27-3398.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/pm6150.dtsi:135.30-143.5: Warning (avoid_unnecessary_addr_size): /soc@0/spmi@c440000/pmic@0/adc-tm@3500: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r10-lte.dtb: scm (qcom,scm-sc7180): 'sram' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/firmware/qcom,scm.yaml
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r10-lte.dtb: sram@14680000 (qcom,sc7180-imem): 'minidump-sram@1c' does not match any of the regexes: '^modem-tables@[0-9a-f]+$', '^pil-reloc@[0-9a-f]+$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/sram/qcom,imem.yaml
--
   arch/arm64/boot/dts/qcom/sc7180.dtsi:385.11-390.4: Warning (avoid_unnecessary_addr_size): /firmware: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/sc7180.dtsi:3323.27-3398.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/pm6150.dtsi:135.30-143.5: Warning (avoid_unnecessary_addr_size): /soc@0/spmi@c440000/pmic@0/adc-tm@3500: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-r4.dtb: scm (qcom,scm-sc7180): 'sram' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/firmware/qcom,scm.yaml
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-r4.dtb: sram@14680000 (qcom,sc7180-imem): 'minidump-sram@1c' does not match any of the regexes: '^modem-tables@[0-9a-f]+$', '^pil-reloc@[0-9a-f]+$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/sram/qcom,imem.yaml
--
   arch/arm64/boot/dts/qcom/sc7180.dtsi:385.11-390.4: Warning (avoid_unnecessary_addr_size): /firmware: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/sc7180.dtsi:3323.27-3398.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/pm6150.dtsi:135.30-143.5: Warning (avoid_unnecessary_addr_size): /soc@0/spmi@c440000/pmic@0/adc-tm@3500: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-r9.dtb: scm (qcom,scm-sc7180): 'sram' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/firmware/qcom,scm.yaml
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-r9.dtb: sram@14680000 (qcom,sc7180-imem): 'minidump-sram@1c' does not match any of the regexes: '^modem-tables@[0-9a-f]+$', '^pil-reloc@[0-9a-f]+$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/sram/qcom,imem.yaml
--
   arch/arm64/boot/dts/qcom/sc7180.dtsi:385.11-390.4: Warning (avoid_unnecessary_addr_size): /firmware: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/sc7180.dtsi:3323.27-3398.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/pm6150.dtsi:135.30-143.5: Warning (avoid_unnecessary_addr_size): /soc@0/spmi@c440000/pmic@0/adc-tm@3500: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-r10.dtb: scm (qcom,scm-sc7180): 'sram' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/firmware/qcom,scm.yaml
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-r10.dtb: sram@14680000 (qcom,sc7180-imem): 'minidump-sram@1c' does not match any of the regexes: '^modem-tables@[0-9a-f]+$', '^pil-reloc@[0-9a-f]+$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/sram/qcom,imem.yaml
--
   arch/arm64/boot/dts/qcom/sc7180.dtsi:385.11-390.4: Warning (avoid_unnecessary_addr_size): /firmware: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/sc7180.dtsi:1086.21-1104.6: Warning (avoid_unnecessary_addr_size): /soc@0/geniqup@8c0000/i2c@890000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/sc7180.dtsi:3323.27-3398.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/pm6150.dtsi:135.30-143.5: Warning (avoid_unnecessary_addr_size): /soc@0/spmi@c440000/pmic@0/adc-tm@3500: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-nots-r4.dtb: scm (qcom,scm-sc7180): 'sram' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/firmware/qcom,scm.yaml
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-nots-r4.dtb: sram@14680000 (qcom,sc7180-imem): 'minidump-sram@1c' does not match any of the regexes: '^modem-tables@[0-9a-f]+$', '^pil-reloc@[0-9a-f]+$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/sram/qcom,imem.yaml
--
   arch/arm64/boot/dts/qcom/sc7180.dtsi:385.11-390.4: Warning (avoid_unnecessary_addr_size): /firmware: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/sc7180.dtsi:1086.21-1104.6: Warning (avoid_unnecessary_addr_size): /soc@0/geniqup@8c0000/i2c@890000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/sc7180.dtsi:3323.27-3398.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/pm6150.dtsi:135.30-143.5: Warning (avoid_unnecessary_addr_size): /soc@0/spmi@c440000/pmic@0/adc-tm@3500: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-nots-r5.dtb: scm (qcom,scm-sc7180): 'sram' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/firmware/qcom,scm.yaml
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-nots-r5.dtb: sram@14680000 (qcom,sc7180-imem): 'minidump-sram@1c' does not match any of the regexes: '^modem-tables@[0-9a-f]+$', '^pil-reloc@[0-9a-f]+$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/sram/qcom,imem.yaml
--
   arch/arm64/boot/dts/qcom/sc7180.dtsi:385.11-390.4: Warning (avoid_unnecessary_addr_size): /firmware: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/sc7180.dtsi:1086.21-1104.6: Warning (avoid_unnecessary_addr_size): /soc@0/geniqup@8c0000/i2c@890000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/sc7180.dtsi:3323.27-3398.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/pm6150.dtsi:135.30-143.5: Warning (avoid_unnecessary_addr_size): /soc@0/spmi@c440000/pmic@0/adc-tm@3500: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-nots-r9.dtb: scm (qcom,scm-sc7180): 'sram' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/firmware/qcom,scm.yaml
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-nots-r9.dtb: sram@14680000 (qcom,sc7180-imem): 'minidump-sram@1c' does not match any of the regexes: '^modem-tables@[0-9a-f]+$', '^pil-reloc@[0-9a-f]+$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/sram/qcom,imem.yaml
--
   arch/arm64/boot/dts/qcom/sc7180.dtsi:385.11-390.4: Warning (avoid_unnecessary_addr_size): /firmware: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/sc7180.dtsi:1086.21-1104.6: Warning (avoid_unnecessary_addr_size): /soc@0/geniqup@8c0000/i2c@890000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/sc7180.dtsi:3323.27-3398.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/pm6150.dtsi:135.30-143.5: Warning (avoid_unnecessary_addr_size): /soc@0/spmi@c440000/pmic@0/adc-tm@3500: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-nots-r10.dtb: scm (qcom,scm-sc7180): 'sram' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/firmware/qcom,scm.yaml
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-nots-r10.dtb: sram@14680000 (qcom,sc7180-imem): 'minidump-sram@1c' does not match any of the regexes: '^modem-tables@[0-9a-f]+$', '^pil-reloc@[0-9a-f]+$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/sram/qcom,imem.yaml
--
   arch/arm64/boot/dts/qcom/sc7180.dtsi:385.11-390.4: Warning (avoid_unnecessary_addr_size): /firmware: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/sc7180.dtsi:3323.27-3398.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel-lte-parade.dtb: scm (qcom,scm-sc7180): 'sram' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/firmware/qcom,scm.yaml
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel-lte-parade.dtb: sram@14680000 (qcom,sc7180-imem): 'minidump-sram@1c' does not match any of the regexes: '^modem-tables@[0-9a-f]+$', '^pil-reloc@[0-9a-f]+$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/sram/qcom,imem.yaml
--
   arch/arm64/boot/dts/qcom/sc7180.dtsi:385.11-390.4: Warning (avoid_unnecessary_addr_size): /firmware: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/sc7180.dtsi:3323.27-3398.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel-lte-ti.dtb: scm (qcom,scm-sc7180): 'sram' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/firmware/qcom,scm.yaml
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel-lte-ti.dtb: sram@14680000 (qcom,sc7180-imem): 'minidump-sram@1c' does not match any of the regexes: '^modem-tables@[0-9a-f]+$', '^pil-reloc@[0-9a-f]+$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/sram/qcom,imem.yaml
--
   arch/arm64/boot/dts/qcom/sc7180.dtsi:385.11-390.4: Warning (avoid_unnecessary_addr_size): /firmware: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/sc7180.dtsi:3323.27-3398.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel-parade.dtb: scm (qcom,scm-sc7180): 'sram' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/firmware/qcom,scm.yaml
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel-parade.dtb: sram@14680000 (qcom,sc7180-imem): 'minidump-sram@1c' does not match any of the regexes: '^modem-tables@[0-9a-f]+$', '^pil-reloc@[0-9a-f]+$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/sram/qcom,imem.yaml
--
   arch/arm64/boot/dts/qcom/sc7180.dtsi:385.11-390.4: Warning (avoid_unnecessary_addr_size): /firmware: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/sc7180.dtsi:3323.27-3398.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel-ti.dtb: scm (qcom,scm-sc7180): 'sram' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/firmware/qcom,scm.yaml
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel-ti.dtb: sram@14680000 (qcom,sc7180-imem): 'minidump-sram@1c' does not match any of the regexes: '^modem-tables@[0-9a-f]+$', '^pil-reloc@[0-9a-f]+$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/sram/qcom,imem.yaml
--
   arch/arm64/boot/dts/qcom/sc7180.dtsi:385.11-390.4: Warning (avoid_unnecessary_addr_size): /firmware: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/sc7180.dtsi:3323.27-3398.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel360-lte.dtb: scm (qcom,scm-sc7180): 'sram' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/firmware/qcom,scm.yaml
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel360-lte.dtb: sram@14680000 (qcom,sc7180-imem): 'minidump-sram@1c' does not match any of the regexes: '^modem-tables@[0-9a-f]+$', '^pil-reloc@[0-9a-f]+$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/sram/qcom,imem.yaml
--
   arch/arm64/boot/dts/qcom/sc7180.dtsi:385.11-390.4: Warning (avoid_unnecessary_addr_size): /firmware: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/sc7180.dtsi:3323.27-3398.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel360-wifi.dtb: scm (qcom,scm-sc7180): 'sram' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/firmware/qcom,scm.yaml
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel360-wifi.dtb: sram@14680000 (qcom,sc7180-imem): 'minidump-sram@1c' does not match any of the regexes: '^modem-tables@[0-9a-f]+$', '^pil-reloc@[0-9a-f]+$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/sram/qcom,imem.yaml
--
   arch/arm64/boot/dts/qcom/sc7180.dtsi:385.11-390.4: Warning (avoid_unnecessary_addr_size): /firmware: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/sc7180.dtsi:3323.27-3398.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r1.dtb: scm (qcom,scm-sc7180): 'sram' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/firmware/qcom,scm.yaml
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r1.dtb: sram@14680000 (qcom,sc7180-imem): 'minidump-sram@1c' does not match any of the regexes: '^modem-tables@[0-9a-f]+$', '^pil-reloc@[0-9a-f]+$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/sram/qcom,imem.yaml
--
   arch/arm64/boot/dts/qcom/sc7180.dtsi:385.11-390.4: Warning (avoid_unnecessary_addr_size): /firmware: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/sc7180.dtsi:3323.27-3398.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r1-lte.dtb: scm (qcom,scm-sc7180): 'sram' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/firmware/qcom,scm.yaml
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r1-lte.dtb: sram@14680000 (qcom,sc7180-imem): 'minidump-sram@1c' does not match any of the regexes: '^modem-tables@[0-9a-f]+$', '^pil-reloc@[0-9a-f]+$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/sram/qcom,imem.yaml
--
   arch/arm64/boot/dts/qcom/sc7180.dtsi:385.11-390.4: Warning (avoid_unnecessary_addr_size): /firmware: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/sc7180.dtsi:3323.27-3398.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r2.dtb: scm (qcom,scm-sc7180): 'sram' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/firmware/qcom,scm.yaml
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r2.dtb: sram@14680000 (qcom,sc7180-imem): 'minidump-sram@1c' does not match any of the regexes: '^modem-tables@[0-9a-f]+$', '^pil-reloc@[0-9a-f]+$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/sram/qcom,imem.yaml
--
   arch/arm64/boot/dts/qcom/sc7180.dtsi:385.11-390.4: Warning (avoid_unnecessary_addr_size): /firmware: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/sc7180.dtsi:3323.27-3398.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r2-lte.dtb: scm (qcom,scm-sc7180): 'sram' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/firmware/qcom,scm.yaml
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r2-lte.dtb: sram@14680000 (qcom,sc7180-imem): 'minidump-sram@1c' does not match any of the regexes: '^modem-tables@[0-9a-f]+$', '^pil-reloc@[0-9a-f]+$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/sram/qcom,imem.yaml
--
   arch/arm64/boot/dts/qcom/sc7180.dtsi:385.11-390.4: Warning (avoid_unnecessary_addr_size): /firmware: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/sc7180.dtsi:3323.27-3398.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r3.dtb: scm (qcom,scm-sc7180): 'sram' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/firmware/qcom,scm.yaml
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r3.dtb: sram@14680000 (qcom,sc7180-imem): 'minidump-sram@1c' does not match any of the regexes: '^modem-tables@[0-9a-f]+$', '^pil-reloc@[0-9a-f]+$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/sram/qcom,imem.yaml
--
   arch/arm64/boot/dts/qcom/sc7180.dtsi:385.11-390.4: Warning (avoid_unnecessary_addr_size): /firmware: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/sc7180.dtsi:3323.27-3398.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r3-lte.dtb: scm (qcom,scm-sc7180): 'sram' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/firmware/qcom,scm.yaml
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r3-lte.dtb: sram@14680000 (qcom,sc7180-imem): 'minidump-sram@1c' does not match any of the regexes: '^modem-tables@[0-9a-f]+$', '^pil-reloc@[0-9a-f]+$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/sram/qcom,imem.yaml
--
   arch/arm64/boot/dts/qcom/sc7180.dtsi:385.11-390.4: Warning (avoid_unnecessary_addr_size): /firmware: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-quackingstick-r0.dtb: scm (qcom,scm-sc7180): 'sram' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/firmware/qcom,scm.yaml
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-quackingstick-r0.dtb: sram@14680000 (qcom,sc7180-imem): 'minidump-sram@1c' does not match any of the regexes: '^modem-tables@[0-9a-f]+$', '^pil-reloc@[0-9a-f]+$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/sram/qcom,imem.yaml
--
   arch/arm64/boot/dts/qcom/sc7180.dtsi:385.11-390.4: Warning (avoid_unnecessary_addr_size): /firmware: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-quackingstick-r0-lte.dtb: scm (qcom,scm-sc7180): 'sram' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/firmware/qcom,scm.yaml
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-quackingstick-r0-lte.dtb: sram@14680000 (qcom,sc7180-imem): 'minidump-sram@1c' does not match any of the regexes: '^modem-tables@[0-9a-f]+$', '^pil-reloc@[0-9a-f]+$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/sram/qcom,imem.yaml
--
   arch/arm64/boot/dts/qcom/sc7180.dtsi:385.11-390.4: Warning (avoid_unnecessary_addr_size): /firmware: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-boe.dtb: scm (qcom,scm-sc7180): 'sram' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/firmware/qcom,scm.yaml
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-boe.dtb: sram@14680000 (qcom,sc7180-imem): 'minidump-sram@1c' does not match any of the regexes: '^modem-tables@[0-9a-f]+$', '^pil-reloc@[0-9a-f]+$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/sram/qcom,imem.yaml
--
   arch/arm64/boot/dts/qcom/sc7180.dtsi:385.11-390.4: Warning (avoid_unnecessary_addr_size): /firmware: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-inx.dtb: scm (qcom,scm-sc7180): 'sram' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/firmware/qcom,scm.yaml
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-inx.dtb: sram@14680000 (qcom,sc7180-imem): 'minidump-sram@1c' does not match any of the regexes: '^modem-tables@[0-9a-f]+$', '^pil-reloc@[0-9a-f]+$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/sram/qcom,imem.yaml
--
   arch/arm64/boot/dts/qcom/sc7180.dtsi:385.11-390.4: Warning (avoid_unnecessary_addr_size): /firmware: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-inx-rt5682s.dtb: scm (qcom,scm-sc7180): 'sram' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/firmware/qcom,scm.yaml
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-inx-rt5682s.dtb: sram@14680000 (qcom,sc7180-imem): 'minidump-sram@1c' does not match any of the regexes: '^modem-tables@[0-9a-f]+$', '^pil-reloc@[0-9a-f]+$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/sram/qcom,imem.yaml
--
   arch/arm64/boot/dts/qcom/sc7180.dtsi:385.11-390.4: Warning (avoid_unnecessary_addr_size): /firmware: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-boe-rt5682s.dtb: scm (qcom,scm-sc7180): 'sram' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/firmware/qcom,scm.yaml
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-boe-rt5682s.dtb: sram@14680000 (qcom,sc7180-imem): 'minidump-sram@1c' does not match any of the regexes: '^modem-tables@[0-9a-f]+$', '^pil-reloc@[0-9a-f]+$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/sram/qcom,imem.yaml
--
   arch/arm64/boot/dts/qcom/sc7180.dtsi:385.11-390.4: Warning (avoid_unnecessary_addr_size): /firmware: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/sc7180.dtsi:3323.27-3398.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-r1.dtb: scm (qcom,scm-sc7180): 'sram' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/firmware/qcom,scm.yaml
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-r1.dtb: sram@14680000 (qcom,sc7180-imem): 'minidump-sram@1c' does not match any of the regexes: '^modem-tables@[0-9a-f]+$', '^pil-reloc@[0-9a-f]+$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/sram/qcom,imem.yaml
--
   arch/arm64/boot/dts/qcom/sc7180.dtsi:385.11-390.4: Warning (avoid_unnecessary_addr_size): /firmware: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/sc7180.dtsi:3323.27-3398.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-r1-lte.dtb: scm (qcom,scm-sc7180): 'sram' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/firmware/qcom,scm.yaml
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-r1-lte.dtb: sram@14680000 (qcom,sc7180-imem): 'minidump-sram@1c' does not match any of the regexes: '^modem-tables@[0-9a-f]+$', '^pil-reloc@[0-9a-f]+$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/sram/qcom,imem.yaml
--
   arch/arm64/boot/dts/qcom/sc7180.dtsi:3323.27-3398.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/arm64/boot/dts/qcom/sm7125-xiaomi-curtana.dtb: scm (qcom,scm-sc7180): 'sram' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/firmware/qcom,scm.yaml
>> arch/arm64/boot/dts/qcom/sm7125-xiaomi-curtana.dtb: sram@14680000 (qcom,sc7180-imem): 'minidump-sram@1c' does not match any of the regexes: '^modem-tables@[0-9a-f]+$', '^pil-reloc@[0-9a-f]+$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/sram/qcom,imem.yaml
--
   arch/arm64/boot/dts/qcom/sc7180.dtsi:3323.27-3398.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/arm64/boot/dts/qcom/sm7125-xiaomi-joyeuse.dtb: scm (qcom,scm-sc7180): 'sram' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/firmware/qcom,scm.yaml
>> arch/arm64/boot/dts/qcom/sm7125-xiaomi-joyeuse.dtb: sram@14680000 (qcom,sc7180-imem): 'minidump-sram@1c' does not match any of the regexes: '^modem-tables@[0-9a-f]+$', '^pil-reloc@[0-9a-f]+$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/sram/qcom,imem.yaml
--
>> arch/arm64/boot/dts/qcom/sc7180-ecs-liva-qc710-el2.dtb: scm (qcom,scm-sc7180): 'sram' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/firmware/qcom,scm.yaml
>> arch/arm64/boot/dts/qcom/sc7180-ecs-liva-qc710-el2.dtb: sram@14680000 (qcom,sc7180-imem): 'minidump-sram@1c' does not match any of the regexes: '^modem-tables@[0-9a-f]+$', '^pil-reloc@[0-9a-f]+$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/sram/qcom,imem.yaml
--
>> arch/arm64/boot/dts/qcom/sc7180-acer-aspire1-el2.dtb: scm (qcom,scm-sc7180): 'sram' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/firmware/qcom,scm.yaml
>> arch/arm64/boot/dts/qcom/sc7180-acer-aspire1-el2.dtb: sram@14680000 (qcom,sc7180-imem): 'minidump-sram@1c' does not match any of the regexes: '^modem-tables@[0-9a-f]+$', '^pil-reloc@[0-9a-f]+$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/sram/qcom,imem.yaml

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
