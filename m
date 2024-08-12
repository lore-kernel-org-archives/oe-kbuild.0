Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4041E17C23D
	for <oe-kbuild@lists.linux.dev>; Mon, 12 Aug 2024 13:43:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723470230; cv=none; b=XSI/S48HSuKe35r2Ry65Mm4elV0uF4MkWdQZBkxn+BB9z2w8S4bhe9L314xNaDtYIMChc1FaVjEZIgGjSL4miTo7uIps3JHV067NeP9XqYUtb8h07eC3cINqT4m06/LQKtQKpCXuUbEoMqKUqRh4uBmh51BE5yOyh93/Rnh4cH0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723470230; c=relaxed/simple;
	bh=xe1zZa8x0WlUL05eOo9AYHuqH/Rpq1uCloZwFSZR2cY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=cqYm2BcjX18lpM4oUltPDaThy+goGGQsveLsl5bDgpPs0l3pUln846s5pKcZvW/WuqkJUSPlOffX95EfG8al4BnJgKkL6YG8d3ppSXUcjN9QQkD/m8R9eTxi1YmYBDODGD25E8vEyYp+3OlanVOJuIAeUZLse9CY7ClB6fwPtXc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=l3+jrAnO; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="l3+jrAnO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723470229; x=1755006229;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xe1zZa8x0WlUL05eOo9AYHuqH/Rpq1uCloZwFSZR2cY=;
  b=l3+jrAnOmcC0O/D3NjX2hdi9udi8qgXcD7F4d/7ezmC1MsiY6gntrD9q
   WvZc/J/JWkeXA1AW5Pr7QnLUneJIPOVCXc/OBWszZuG1Yq3TnSQqDqm/4
   kCdM8Je7YiDR1jMWxfwRhXDyJJbt5W0GETxnZGpvClUJjVNdOHU3eJWDF
   CaKDf2mzyYeqAj9iXrp1nffojBBEzWJ5FawcIoEdsRadsN+j2/4ZgTRIF
   tVpMX2VFE7qLXMr0SmOUiDPTX3pWHL7O6pPB7fEH7nHdGRd3MyvpJaS23
   BsRgJqvTl6Aul+Arsk1L6P4F0tSeZYnI3Xc6UVXBvG/I6XZqrvWGDJccb
   w==;
X-CSE-ConnectionGUID: dleka5RQQLeihD7L1kN/tA==
X-CSE-MsgGUID: FAxjz4oqTLCpMOBo4Vc4vw==
X-IronPort-AV: E=McAfee;i="6700,10204,11162"; a="32730411"
X-IronPort-AV: E=Sophos;i="6.09,283,1716274800"; 
   d="scan'208";a="32730411"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Aug 2024 06:43:48 -0700
X-CSE-ConnectionGUID: Ylh4IxKbTeWXUqY+MOb2Ng==
X-CSE-MsgGUID: WbbRgZUzQU604JgbXTTcNA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,283,1716274800"; 
   d="scan'208";a="58846327"
Received: from unknown (HELO b6bf6c95bbab) ([10.239.97.151])
  by orviesa007.jf.intel.com with ESMTP; 12 Aug 2024 06:43:46 -0700
Received: from kbuild by b6bf6c95bbab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sdVKq-000BqE-1d;
	Mon, 12 Aug 2024 13:43:44 +0000
Date: Mon, 12 Aug 2024 21:43:41 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [tobetter:odroid-6.6.y 32/78]
 arch/arm64/boot/dts/amlogic/meson64_odroidhc4.dtb: ethernet@ff3f0000:
 amlogic,tx-delay-ns: [2] is not of type 'integer'
Message-ID: <202408122132.5ONgvITU-lkp@intel.com>
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
:::::: Manual check reason: "dtcheck: binding changes may go via different trees"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Dongjin Kim <tobetter@gmail.com>

tree:   https://github.com/tobetter/linux odroid-6.6.y
head:   db2e15a776d1205387db09cc4cd4b3d97c5de1d3
commit: 7ac7a6e2dac16d26212911a91515a49a08a10371 [32/78] ODROID-HC4: arm64/dts: add 'meson64_odroidhc4.dts' for compability
:::::: branch date: 5 days ago
:::::: commit date: 5 months ago
config: arm64-randconfig-051-20240808 (https://download.01.org/0day-ci/archive/20240812/202408122132.5ONgvITU-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
dtschema version: 2024.6.dev10+ge5d88ac
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240812/202408122132.5ONgvITU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202408122132.5ONgvITU-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:266.33-1540.7: Warning (unit_address_vs_reg): /soc/bus@ff600000/bus@34400/pinctrl@40: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:266.33-1540.7: Warning (simple_bus_reg): /soc/bus@ff600000/bus@34400/pinctrl@40: missing or empty reg/ranges property
>> arch/arm64/boot/dts/amlogic/meson64_odroidhc4.dtb: ethernet@ff3f0000: amlogic,tx-delay-ns: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/net/amlogic,meson-dwmac.yaml#
>> arch/arm64/boot/dts/amlogic/meson64_odroidhc4.dtb: ethernet@ff3f0000: Unevaluated properties are not allowed ('amlogic,tx-delay-ns' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/amlogic,meson-dwmac.yaml#
>> arch/arm64/boot/dts/amlogic/meson64_odroidhc4.dtb: /soc/bus@ff600000/bus@60000/clock-controller@0: failed to match any schema with compatible: ['amlogic,sm1-audio-clkc']
>> arch/arm64/boot/dts/amlogic/meson64_odroidhc4.dtb: audio-controller@300: compatible: ['amlogic,sm1-tdmin', 'amlogic,axg-tdmin'] is too long
   	from schema $id: http://devicetree.org/schemas/sound/amlogic,axg-tdm-formatters.yaml#
   arch/arm64/boot/dts/amlogic/meson64_odroidhc4.dtb: audio-controller@340: compatible: ['amlogic,sm1-tdmin', 'amlogic,axg-tdmin'] is too long
   	from schema $id: http://devicetree.org/schemas/sound/amlogic,axg-tdm-formatters.yaml#
   arch/arm64/boot/dts/amlogic/meson64_odroidhc4.dtb: audio-controller@380: compatible: ['amlogic,sm1-tdmin', 'amlogic,axg-tdmin'] is too long
   	from schema $id: http://devicetree.org/schemas/sound/amlogic,axg-tdm-formatters.yaml#
>> arch/arm64/boot/dts/amlogic/meson64_odroidhc4.dtb: audio-controller@3c0: compatible: ['amlogic,sm1-tdmin', 'amlogic,axg-tdmin'] is too long
   	from schema $id: http://devicetree.org/schemas/sound/amlogic,axg-tdm-formatters.yaml#
>> arch/arm64/boot/dts/amlogic/meson64_odroidhc4.dtb: /soc/bus@ff600000/bus@60000/audio-controller@744: failed to match any schema with compatible: ['amlogic,sm1-tohdmitx', 'amlogic,g12a-tohdmitx']
>> arch/arm64/boot/dts/amlogic/meson64_odroidhc4.dtb: /soc/bus@ff600000/bus@60000/audio-controller@744: failed to match any schema with compatible: ['amlogic,sm1-tohdmitx', 'amlogic,g12a-tohdmitx']
>> arch/arm64/boot/dts/amlogic/meson64_odroidhc4.dtb: sys-ctrl@0: '#address-cells', '#size-cells', 'ranges' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/soc/amlogic/amlogic,meson-gx-hhi-sysctrl.yaml#
>> arch/arm64/boot/dts/amlogic/meson64_odroidhc4.dtb: audio-controller-0: clock-names:0: 'sclk' was expected
   	from schema $id: http://devicetree.org/schemas/sound/amlogic,axg-tdm-iface.yaml#
>> arch/arm64/boot/dts/amlogic/meson64_odroidhc4.dtb: audio-controller-0: clock-names:1: 'lrclk' was expected
   	from schema $id: http://devicetree.org/schemas/sound/amlogic,axg-tdm-iface.yaml#
>> arch/arm64/boot/dts/amlogic/meson64_odroidhc4.dtb: audio-controller-0: clock-names:2: 'mclk' was expected
   	from schema $id: http://devicetree.org/schemas/sound/amlogic,axg-tdm-iface.yaml#
   arch/arm64/boot/dts/amlogic/meson64_odroidhc4.dtb: audio-controller-1: clock-names:0: 'sclk' was expected
   	from schema $id: http://devicetree.org/schemas/sound/amlogic,axg-tdm-iface.yaml#
   arch/arm64/boot/dts/amlogic/meson64_odroidhc4.dtb: audio-controller-1: clock-names:1: 'lrclk' was expected
   	from schema $id: http://devicetree.org/schemas/sound/amlogic,axg-tdm-iface.yaml#
   arch/arm64/boot/dts/amlogic/meson64_odroidhc4.dtb: audio-controller-1: clock-names:2: 'mclk' was expected
   	from schema $id: http://devicetree.org/schemas/sound/amlogic,axg-tdm-iface.yaml#
>> arch/arm64/boot/dts/amlogic/meson64_odroidhc4.dtb: audio-controller-1: Unevaluated properties are not allowed ('clock-names' was unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/amlogic,axg-tdm-iface.yaml#
   arch/arm64/boot/dts/amlogic/meson64_odroidhc4.dtb: audio-controller-2: clock-names:0: 'sclk' was expected
   	from schema $id: http://devicetree.org/schemas/sound/amlogic,axg-tdm-iface.yaml#
   arch/arm64/boot/dts/amlogic/meson64_odroidhc4.dtb: audio-controller-2: clock-names:1: 'lrclk' was expected
   	from schema $id: http://devicetree.org/schemas/sound/amlogic,axg-tdm-iface.yaml#
   arch/arm64/boot/dts/amlogic/meson64_odroidhc4.dtb: audio-controller-2: clock-names:2: 'mclk' was expected
   	from schema $id: http://devicetree.org/schemas/sound/amlogic,axg-tdm-iface.yaml#
>> arch/arm64/boot/dts/amlogic/meson64_odroidhc4.dtb: sound: Unevaluated properties are not allowed ('assigned-clock-parents', 'assigned-clock-rates', 'assigned-clocks' were unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/amlogic,axg-sound-card.yaml#
>> arch/arm64/boot/dts/amlogic/meson64_odroidhc4.dtb: sound: 'anyOf' conditional failed, one must be fixed:
   	'clocks' is a required property
   	'#clock-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/clock.yaml#
>> arch/arm64/boot/dts/amlogic/meson64_odroidhc4.dtb: pwm-fan: 'pulses-per-revolutions' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/hwmon/pwm-fan.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
