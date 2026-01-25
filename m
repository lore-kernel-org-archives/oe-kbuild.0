Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB1563009C3
	for <oe-kbuild@lists.linux.dev>; Sun, 25 Jan 2026 21:27:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769376437; cv=none; b=PIkEIS2uRf1oA+QCIUl9sULcfeYvpNgQWQjOscbKcX/ZAYJLBwkL68dqeTUi07gN29hiNCCDFVGCK+bTLRJyANhJjKQ2hXT096R9jJrEMS5z86XbpeCCxtJiyjIQYM7EBG7a4iqq/J9z4byN3ilBx3QO2sr9HoEFaNzmOjr2di8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769376437; c=relaxed/simple;
	bh=5wSHBINDvKgK3YyV9CnLGKwA6D4jDloJ6Spk/IMzZ0E=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ApMOuC5MthCkUilycjd4J66hCuO1jaXlDZZEOU4KL9FXyL/xKt/3HQeL4FT75eU+3Ir9ZjIGqV3uBvsDzTRZLo826Q46E5yR5L4QZm7gDKywm35yVocExxD98sVcmp6o78ACswo8TbiZw4vXViwJX5+DmnPKz5SmioCHoI2jtVs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fmDOzD3M; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fmDOzD3M"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769376435; x=1800912435;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=5wSHBINDvKgK3YyV9CnLGKwA6D4jDloJ6Spk/IMzZ0E=;
  b=fmDOzD3MFfUZ9f4gCf9Jiu4ikK4WQxRBq6qkgXfNb9HrGy1H+uof4fBy
   Cni5racSwmXhXIcWCgelrEhHMMYwUUrwWH4FZIBWqq87DRY6yQhQ62CtW
   vyGyP1ASsVA2z/BTjRIJPSknuOGeL6YOospCC/TAAgeJ7sC+VV2RzAWY0
   ftrNmJeZ8AQ4ig3WLuFBojxZI6mQgrkELgTvoOoQNWLl5rmgcho3laxJO
   DmSN3VW7AB8GZGbAdBOR6UXYUfcFASLplGQ4aWertS1NpDtuDKQ1pW8Pu
   /V5rRMISiuuodUSwDZWt0TBcdb7XJbFiJRKZvjJ3R4VMN2qvf3qbk4M1S
   w==;
X-CSE-ConnectionGUID: VpiEWIYGTBqhNdCnTWUrvA==
X-CSE-MsgGUID: WB/HEJ7KSoOhZrIGvT1L3w==
X-IronPort-AV: E=McAfee;i="6800,10657,11682"; a="81192541"
X-IronPort-AV: E=Sophos;i="6.21,253,1763452800"; 
   d="scan'208";a="81192541"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jan 2026 13:27:14 -0800
X-CSE-ConnectionGUID: tp/Vd0XGQ/KNdv3uGaAGKg==
X-CSE-MsgGUID: XoFjrHVbQzqqAbO8Uok6NQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,253,1763452800"; 
   d="scan'208";a="238777097"
Received: from igk-lkp-server01.igk.intel.com (HELO afc5bfd7f602) ([10.211.93.152])
  by fmviesa001.fm.intel.com with ESMTP; 25 Jan 2026 13:27:13 -0800
Received: from kbuild by afc5bfd7f602 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vk7dX-000000001Mj-0s31;
	Sun, 25 Jan 2026 21:27:11 +0000
Date: Sun, 25 Jan 2026 22:26:37 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v1 1/3] ARM: tegra: lg-x3: add panel and bridge nodes
Message-ID: <202601252201.o8SbopLc-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

:::::: 
:::::: Manual check reason: "dtcheck: binding changes may go via different trees"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20260122152713.8311-2-clamor95@gmail.com>
References: <20260122152713.8311-2-clamor95@gmail.com>
TO: Svyatoslav Ryhel <clamor95@gmail.com>
TO: Rob Herring <robh@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
TO: Thierry Reding <thierry.reding@gmail.com>
TO: Jonathan Hunter <jonathanh@nvidia.com>
TO: Svyatoslav Ryhel <clamor95@gmail.com>
TO: "Jonas Schwöbel" <jonasschwoebel@yahoo.de>
CC: devicetree@vger.kernel.org
CC: linux-tegra@vger.kernel.org
CC: linux-kernel@vger.kernel.org

Hi Svyatoslav,

kernel test robot noticed the following build warnings:

[auto build test WARNING on robh/for-next]
[also build test WARNING on krzk/for-next krzk-dt/for-next krzk-mem-ctrl/for-next linus/master v6.19-rc6 next-20260123]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Svyatoslav-Ryhel/ARM-tegra-lg-x3-add-panel-and-bridge-nodes/20260123-000951
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20260122152713.8311-2-clamor95%40gmail.com
patch subject: [PATCH v1 1/3] ARM: tegra: lg-x3: add panel and bridge nodes
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: arm-randconfig-2051-20260123 (https://download.01.org/0day-ci/archive/20260125/202601252201.o8SbopLc-lkp@intel.com/config)
compiler: clang version 16.0.6 (https://github.com/llvm/llvm-project 7cbf1a2591520c2491aa35339f227775f4d3adf6)
dtschema version: 2025.13.dev4+g85cec3155
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260125/202601252201.o8SbopLc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202601252201.o8SbopLc-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   	'nvidia,tegra132-vi' was expected
   	'nvidia,tegra210-vi' was expected
   	'nvidia,tegra186-vi' was expected
   	'nvidia,tegra194-vi' was expected
   	from schema $id: http://devicetree.org/schemas/display/tegra/nvidia,tegra20-vi.yaml
   arch/arm/boot/dts/nvidia/tegra30-lg-p880.dtb: /gmi@70009000: failed to match any schema with compatible: ['nvidia,tegra30-gmi']
   arch/arm/boot/dts/nvidia/tegra30-lg-p880.dtb: coil@c (dongwoon,dw9714): 'enable-gpios' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/media/i2c/dongwoon,dw9714.yaml
   arch/arm/boot/dts/nvidia/tegra30-lg-p880.dtb: /i2c@7000c500/camera-pmic@7d: failed to match any schema with compatible: ['ti,lp8720']
   arch/arm/boot/dts/nvidia/tegra30-lg-p880.dtb: /i2c@7000d000/max77663@1c: failed to match any schema with compatible: ['maxim,max77663']
>> arch/arm/boot/dts/nvidia/tegra30-lg-p880.dtb: dsi@2 (solomon,ssd2825): '#address-cells', '#size-cells', 'panel@1' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/display/bridge/solomon,ssd2825.yaml
>> arch/arm/boot/dts/nvidia/tegra30-lg-p880.dtb: dsi@2 (solomon,ssd2825): ports:port@0:endpoint: Unevaluated properties are not allowed ('data-lines' was unexpected)
   	from schema $id: http://devicetree.org/schemas/display/bridge/solomon,ssd2825.yaml
>> arch/arm/boot/dts/nvidia/tegra30-lg-p880.dtb: panel@1 (jdi,dx12d100vm0eaa): 'backlight' is a required property
   	from schema $id: http://devicetree.org/schemas/display/panel/renesas,r69328.yaml
   arch/arm/boot/dts/nvidia/tegra30-lg-p880.dtb: /kbc@7000e200: failed to match any schema with compatible: ['nvidia,tegra30-kbc', 'nvidia,tegra20-kbc']
   arch/arm/boot/dts/nvidia/tegra30-lg-p880.dtb: /kbc@7000e200: failed to match any schema with compatible: ['nvidia,tegra30-kbc', 'nvidia,tegra20-kbc']
   arch/arm/boot/dts/nvidia/tegra30-lg-p880.dtb: /ahub@70080000: failed to match any schema with compatible: ['nvidia,tegra30-ahub']
   arch/arm/boot/dts/nvidia/tegra30-lg-p880.dtb: sound (lg,tegra-audio-max98089-p880): nvidia,audio-routing:13: 'Mic Jack' is not one of ['Int Spk', 'Headphone Jack', 'Earpiece', 'Headset Mic', 'Internal Mic 1', 'Internal Mic 2', 'HPL', 'HPR', 'SPKL', 'SPKR', 'RECL', 'RECR', 'INA1', 'INA2', 'INB1', 'INB2', 'MIC1', 'MIC2', 'MICBIAS']
   	from schema $id: http://devicetree.org/schemas/sound/nvidia,tegra-audio-max9808x.yaml
--
   	'nvidia,tegra132-vi' was expected
   	'nvidia,tegra210-vi' was expected
   	'nvidia,tegra186-vi' was expected
   	'nvidia,tegra194-vi' was expected
   	from schema $id: http://devicetree.org/schemas/display/tegra/nvidia,tegra20-vi.yaml
   arch/arm/boot/dts/nvidia/tegra30-lg-p895.dtb: /gmi@70009000: failed to match any schema with compatible: ['nvidia,tegra30-gmi']
   arch/arm/boot/dts/nvidia/tegra30-lg-p895.dtb: coil@c (dongwoon,dw9714): 'enable-gpios' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/media/i2c/dongwoon,dw9714.yaml
   arch/arm/boot/dts/nvidia/tegra30-lg-p895.dtb: /i2c@7000c500/camera-pmic@7d: failed to match any schema with compatible: ['ti,lp8720']
   arch/arm/boot/dts/nvidia/tegra30-lg-p895.dtb: /i2c@7000d000/max77663@1c: failed to match any schema with compatible: ['maxim,max77663']
>> arch/arm/boot/dts/nvidia/tegra30-lg-p895.dtb: dsi@2 (solomon,ssd2825): '#address-cells', '#size-cells', 'panel@1' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/display/bridge/solomon,ssd2825.yaml
>> arch/arm/boot/dts/nvidia/tegra30-lg-p895.dtb: dsi@2 (solomon,ssd2825): ports:port@0:endpoint: Unevaluated properties are not allowed ('data-lines' was unexpected)
   	from schema $id: http://devicetree.org/schemas/display/bridge/solomon,ssd2825.yaml
>> arch/arm/boot/dts/nvidia/tegra30-lg-p895.dtb: panel@1 (koe,tx13d100vm0eaa): 'renesas,inversion' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/display/panel/renesas,r61307.yaml
>> arch/arm/boot/dts/nvidia/tegra30-lg-p895.dtb: panel@1 (koe,tx13d100vm0eaa): 'backlight' is a required property
   	from schema $id: http://devicetree.org/schemas/display/panel/renesas,r61307.yaml
   arch/arm/boot/dts/nvidia/tegra30-lg-p895.dtb: /kbc@7000e200: failed to match any schema with compatible: ['nvidia,tegra30-kbc', 'nvidia,tegra20-kbc']
   arch/arm/boot/dts/nvidia/tegra30-lg-p895.dtb: /kbc@7000e200: failed to match any schema with compatible: ['nvidia,tegra30-kbc', 'nvidia,tegra20-kbc']
   arch/arm/boot/dts/nvidia/tegra30-lg-p895.dtb: /ahub@70080000: failed to match any schema with compatible: ['nvidia,tegra30-ahub']
   arch/arm/boot/dts/nvidia/tegra30-lg-p895.dtb: gpio-leds (gpio-leds): led-power:linux,default-trigger: 'oneOf' conditional failed, one must be fixed:
   	'battery-charging' is not one of ['backlight', 'default-on', 'heartbeat', 'disk-activity', 'disk-read', 'disk-write', 'timer', 'pattern', 'audio-micmute', 'audio-mute', 'bluetooth-power', 'flash', 'kbd-capslock', 'mtd', 'nand-disk', 'netdev', 'none', 'rc-feedback', 'torch', 'usb-gadget', 'usb-host', 'usbport']
   	'battery-charging' does not match '^cpu[0-9]*$'
   	'battery-charging' does not match '^hci[0-9]+-power$'
   	'battery-charging' does not match '^mmc[0-9]+$'
   	'battery-charging' does not match '^phy[0-9]+tx$'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
