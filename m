Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 790F6A31
	for <oe-kbuild@lists.linux.dev>; Sun, 11 Aug 2024 06:52:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723359145; cv=none; b=QOrBax0OiPlw7dpwcVD/ZCkvnOVukLk+TPqVHz4np4DN9yX/Qnxorw4J88g7uQvHskaqBF1gQvd638mNCiY/+fDP6DI0cFKv4OH56dFxaKUpLRy039N6HdwRbC3q+YPXUjMmkVUruOIKGyYzUN+bVexmdT0e63nJVBhqx0jaDpM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723359145; c=relaxed/simple;
	bh=YPU4K0ypyHkx0oER7s1M9Ra0X9ESr0ZexM6Dg88jT3w=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=WmLR7L+nTAKhd0urkupt9oLIDWyWrCsBX8rDCaTlk9SVPYVNFHF/gyFqzJKizC9Gb02mbtDeikwvfBbjgTszgaWNvvFBr0vMgkgs8sxmzWc9jYvrdBkj83ziRIM/TPGwHpiJoJaLvsjMUgotcR6IzcKbXfFAcXai+tizUj6jbQE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=J/w7ZWr1; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="J/w7ZWr1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723359144; x=1754895144;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=YPU4K0ypyHkx0oER7s1M9Ra0X9ESr0ZexM6Dg88jT3w=;
  b=J/w7ZWr1Iof4Z/WpDlVxt0Fq79JP9G8o6KyHC8S4ZzroVtQkV1aWoGNL
   72yzKj3SqtgKaDywA6gI6qdYn+Oje4Asfw2r/qbreb7+oOjWg3c9jFAC9
   XKmaAXZmzqdR72wV+2SiqPEjvjYSw+xwVxg+FH5cLvWUwrvl/OEBP3A8X
   on9XwbSch9t/PfwBVgY3kdYii9itS14U2rxMIzWa/Os8bHQc3tgZ3X/+0
   O9Y8IrVfB4Eo+gr6dlqnmVUotqx4GDqQtYcQLvqW9sGVeyUpgCD66oLkv
   waj9z9JZ9cPxjWKAZVHTADu08VGIOiNLkZOZsIPRmahMGXsA57SCPMpE/
   g==;
X-CSE-ConnectionGUID: 35Q59GBbTYWQGJJ8oI2Odg==
X-CSE-MsgGUID: Cy+qHoTMQ7u1ERrOW110xQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11160"; a="21298381"
X-IronPort-AV: E=Sophos;i="6.09,280,1716274800"; 
   d="scan'208";a="21298381"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Aug 2024 23:52:23 -0700
X-CSE-ConnectionGUID: gkH/qgMOQlyxh6AtlUPdkg==
X-CSE-MsgGUID: GKc3q7ESQxu1Kn9rDaunUQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,280,1716274800"; 
   d="scan'208";a="62792689"
Received: from unknown (HELO b6bf6c95bbab) ([10.239.97.151])
  by orviesa005.jf.intel.com with ESMTP; 10 Aug 2024 23:52:22 -0700
Received: from kbuild by b6bf6c95bbab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sd2R9-000Aep-1S;
	Sun, 11 Aug 2024 06:52:19 +0000
Date: Sun, 11 Aug 2024 14:51:28 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [tobetter:odroid-6.6.y 29/78]
 arch/arm64/boot/dts/amlogic/meson64_odroidn2.dtb: ethernet@ff3f0000:
 amlogic,tx-delay-ns: [2] is not of type 'integer'
Message-ID: <202408111453.KXPkeIh7-lkp@intel.com>
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
commit: c3d8c1ec682c52028a7764474f78b754fd7a07af [29/78] ODROID-N2: arm64/dts: add 'meson64_odroidn2.dts' for compability
:::::: branch date: 4 days ago
:::::: commit date: 5 months ago
config: arm64-randconfig-051-20240808 (https://download.01.org/0day-ci/archive/20240811/202408111453.KXPkeIh7-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
dtschema version: 2024.6.dev10+ge5d88ac
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240811/202408111453.KXPkeIh7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202408111453.KXPkeIh7-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:266.33-1540.7: Warning (unit_address_vs_reg): /soc/bus@ff600000/bus@34400/pinctrl@40: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/amlogic/meson64_odroidn2.dtsi:154.23-158.5: Warning (unit_address_vs_reg): /thermal-zones/cpu-thermal/trips/trip-point@0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/amlogic/meson64_odroidn2.dtsi:159.23-163.5: Warning (unit_address_vs_reg): /thermal-zones/cpu-thermal/trips/trip-point@1: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:266.33-1540.7: Warning (simple_bus_reg): /soc/bus@ff600000/bus@34400/pinctrl@40: missing or empty reg/ranges property
>> arch/arm64/boot/dts/amlogic/meson64_odroidn2.dtb: ethernet@ff3f0000: amlogic,tx-delay-ns: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/net/amlogic,meson-dwmac.yaml#
>> arch/arm64/boot/dts/amlogic/meson64_odroidn2.dtb: ethernet@ff3f0000: Unevaluated properties are not allowed ('amlogic,tx-delay-ns' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/amlogic,meson-dwmac.yaml#
>> arch/arm64/boot/dts/amlogic/meson64_odroidn2.dtb: /soc/bus@ff600000/bus@42000/clock-controller@0: failed to match any schema with compatible: ['amlogic,g12a-audio-clkc']
>> arch/arm64/boot/dts/amlogic/meson64_odroidn2.dtb: audio-controller@300: compatible: ['amlogic,g12a-tdmin', 'amlogic,axg-tdmin'] is too long
   	from schema $id: http://devicetree.org/schemas/sound/amlogic,axg-tdm-formatters.yaml#
   arch/arm64/boot/dts/amlogic/meson64_odroidn2.dtb: audio-controller@340: compatible: ['amlogic,g12a-tdmin', 'amlogic,axg-tdmin'] is too long
   	from schema $id: http://devicetree.org/schemas/sound/amlogic,axg-tdm-formatters.yaml#
   arch/arm64/boot/dts/amlogic/meson64_odroidn2.dtb: audio-controller@380: compatible: ['amlogic,g12a-tdmin', 'amlogic,axg-tdmin'] is too long
   	from schema $id: http://devicetree.org/schemas/sound/amlogic,axg-tdm-formatters.yaml#
>> arch/arm64/boot/dts/amlogic/meson64_odroidn2.dtb: audio-controller@3c0: compatible: ['amlogic,g12a-tdmin', 'amlogic,axg-tdmin'] is too long
   	from schema $id: http://devicetree.org/schemas/sound/amlogic,axg-tdm-formatters.yaml#
>> arch/arm64/boot/dts/amlogic/meson64_odroidn2.dtb: /soc/bus@ff600000/bus@42000/audio-controller@744: failed to match any schema with compatible: ['amlogic,g12a-tohdmitx']
>> arch/arm64/boot/dts/amlogic/meson64_odroidn2.dtb: sys-ctrl@0: '#address-cells', '#size-cells', 'ranges' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/soc/amlogic/amlogic,meson-gx-hhi-sysctrl.yaml#
>> arch/arm64/boot/dts/amlogic/meson64_odroidn2.dtb: thermal-zones: cpu-thermal:trips: 'trip-point@0', 'trip-point@1' do not match any of the regexes: '^[a-zA-Z][a-zA-Z0-9\\-_]{0,63}$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/amlogic/meson64_odroidn2.dtb: thermal-zones: cpu-thermal:cooling-maps: 'fan_cooling_map0', 'fan_cooling_map1' do not match any of the regexes: '^map[-a-zA-Z0-9]*$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/amlogic/meson64_odroidn2.dtb: audio-controller-0: clock-names:0: 'sclk' was expected
   	from schema $id: http://devicetree.org/schemas/sound/amlogic,axg-tdm-iface.yaml#
>> arch/arm64/boot/dts/amlogic/meson64_odroidn2.dtb: audio-controller-0: clock-names:1: 'lrclk' was expected
   	from schema $id: http://devicetree.org/schemas/sound/amlogic,axg-tdm-iface.yaml#
>> arch/arm64/boot/dts/amlogic/meson64_odroidn2.dtb: audio-controller-0: clock-names:2: 'mclk' was expected
   	from schema $id: http://devicetree.org/schemas/sound/amlogic,axg-tdm-iface.yaml#
   arch/arm64/boot/dts/amlogic/meson64_odroidn2.dtb: audio-controller-1: clock-names:0: 'sclk' was expected
   	from schema $id: http://devicetree.org/schemas/sound/amlogic,axg-tdm-iface.yaml#
   arch/arm64/boot/dts/amlogic/meson64_odroidn2.dtb: audio-controller-1: clock-names:1: 'lrclk' was expected
   	from schema $id: http://devicetree.org/schemas/sound/amlogic,axg-tdm-iface.yaml#
   arch/arm64/boot/dts/amlogic/meson64_odroidn2.dtb: audio-controller-1: clock-names:2: 'mclk' was expected
   	from schema $id: http://devicetree.org/schemas/sound/amlogic,axg-tdm-iface.yaml#
>> arch/arm64/boot/dts/amlogic/meson64_odroidn2.dtb: audio-controller-1: Unevaluated properties are not allowed ('clock-names' was unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/amlogic,axg-tdm-iface.yaml#
   arch/arm64/boot/dts/amlogic/meson64_odroidn2.dtb: audio-controller-2: clock-names:0: 'sclk' was expected
   	from schema $id: http://devicetree.org/schemas/sound/amlogic,axg-tdm-iface.yaml#
   arch/arm64/boot/dts/amlogic/meson64_odroidn2.dtb: audio-controller-2: clock-names:1: 'lrclk' was expected
   	from schema $id: http://devicetree.org/schemas/sound/amlogic,axg-tdm-iface.yaml#
   arch/arm64/boot/dts/amlogic/meson64_odroidn2.dtb: audio-controller-2: clock-names:2: 'mclk' was expected
   	from schema $id: http://devicetree.org/schemas/sound/amlogic,axg-tdm-iface.yaml#
   arch/arm64/boot/dts/amlogic/meson64_odroidn2.dtb: audio-controller-2: Unevaluated properties are not allowed ('clock-names' was unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/amlogic,axg-tdm-iface.yaml#
>> arch/arm64/boot/dts/amlogic/meson64_odroidn2.dtb: /gpio-fan: failed to match any schema with compatible: ['gpio-fan']
>> arch/arm64/boot/dts/amlogic/meson64_odroidn2.dtb: sound: Unevaluated properties are not allowed ('assigned-clock-parents', 'assigned-clock-rates', 'assigned-clocks' were unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/amlogic,axg-sound-card.yaml#
>> arch/arm64/boot/dts/amlogic/meson64_odroidn2.dtb: sound: 'anyOf' conditional failed, one must be fixed:
   	'clocks' is a required property
   	'#clock-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/clock.yaml#
>> arch/arm64/boot/dts/amlogic/meson64_odroidn2.dtb: /odroid-reboot: failed to match any schema with compatible: ['odroid,reboot']
>> arch/arm64/boot/dts/amlogic/meson64_odroidn2.dtb: /pwmgpio: failed to match any schema with compatible: ['pwm-gpio']
>> arch/arm64/boot/dts/amlogic/meson64_odroidn2.dtb: pwm-fan: 'cooling-max-state', 'cooling-min-state' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/hwmon/pwm-fan.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
