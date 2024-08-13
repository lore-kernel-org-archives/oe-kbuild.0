Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C422C368
	for <oe-kbuild@lists.linux.dev>; Tue, 13 Aug 2024 04:57:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723525032; cv=none; b=hR4oN22ROUNWBH8U3Ii4BTZ59taJhDnnkgf7pEfRUGPfNEIshCRG/3ui9MPf9j8OigI4SvNY+xRdHaIpZdBChrdEuZsZeJgC9U8D6Su+nqoFI/IkOGooAbRLIhP+mzhrrGixi/SfWkXYr7p1XYXo8p1nP+HSm8bsM1XiKHM6Plk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723525032; c=relaxed/simple;
	bh=O3qS/nVk0mH1L+hO8podS5xoGDKL0dW8hY4DSoRJBAw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=OXeZSCLtpNftnxwW2hXSS9aHzfqqwtNGA6QvawRhLNKi5ACLDI9dVtHSSsios3dBkkWdclgXOmYxi+7RsxuVTZCkx0o3bsQwOUevVxBPvSF0Z/igmUMAf/9pWino1DBnw/uD7xsSLNHYomGO66jOKHOKdfachKFqEJU426TYArE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TEgCdz4A; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TEgCdz4A"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723525031; x=1755061031;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=O3qS/nVk0mH1L+hO8podS5xoGDKL0dW8hY4DSoRJBAw=;
  b=TEgCdz4AsXBFuCVG+oS2/06PXeQKuvVNL5wrYcKDHwmVvzdtOvg6Zs4d
   5NT96+Gs9LMwNzKVPm0x45qNV37SIJuYELCsytX8Gz4fpzvS9NIinpqTD
   79LtKIZo5zZ0UQ0YoO3scIaUa0N3E6R0A1lotMe3z7UvHqoo5HxmgYnsD
   d6tBUS7fL5EGGSHUMl6tai8Qu3dQKYw7svjF5lqweQzTfNwjWu9cLY6s1
   msDJ4+2VQz+lHjg4YfKWxe3aiY59GBn2geHojQFZM85TecdhlWRfkDaRJ
   yAJ36Fq8nLKQWjAJINWRBOQtivoHMZwtdBxAFgNONQxqDSEaMSQL9sdBQ
   Q==;
X-CSE-ConnectionGUID: Bsw15a9fTFK5wjmrWg6Stw==
X-CSE-MsgGUID: Ebdab/RqTfWstmx7L+iZ6g==
X-IronPort-AV: E=McAfee;i="6700,10204,11162"; a="39114164"
X-IronPort-AV: E=Sophos;i="6.09,285,1716274800"; 
   d="scan'208";a="39114164"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Aug 2024 21:57:09 -0700
X-CSE-ConnectionGUID: roPMaFx8Q1uI9u94CuWZYQ==
X-CSE-MsgGUID: ZNYeG82KTi2j2J1wjLrtgA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,285,1716274800"; 
   d="scan'208";a="62693547"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 12 Aug 2024 21:57:08 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sdjak-0000BM-0z;
	Tue, 13 Aug 2024 04:57:06 +0000
Date: Tue, 13 Aug 2024 12:56:10 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [tobetter:odroid-6.6.y 41/79]
 arch/arm64/boot/dts/amlogic/meson64_odroidc4.dtb: gpiomem: compatible:0:
 'amlogic, gpiomem' does not match '^[a-zA-Z0-9][a-zA-Z0-9,+\\-._/]+$'
Message-ID: <202408131226.LOrVwgrB-lkp@intel.com>
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
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Steve Jeong <how2soft@gmail.com>
CC: Dongjin Kim <tobetter@gmail.com>

tree:   https://github.com/tobetter/linux odroid-6.6.y
head:   3ad420f3e23c17d1cf883549675112ee8dd308e4
commit: 5e7a0fcf547e3b4f54e37972019abef8e78192a7 [41/79] ODROID-N2/C4: char: Add /dev/gpiomem device
:::::: branch date: 22 hours ago
:::::: commit date: 5 months ago
config: arm64-randconfig-051-20240808 (https://download.01.org/0day-ci/archive/20240813/202408131226.LOrVwgrB-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
dtschema version: 2024.6.dev10+ge5d88ac
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240813/202408131226.LOrVwgrB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202408131226.LOrVwgrB-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/amlogic/meson64_odroidc4.dtb: audio-controller-2: clock-names:1: 'lrclk' was expected
   	from schema $id: http://devicetree.org/schemas/sound/amlogic,axg-tdm-iface.yaml#
   arch/arm64/boot/dts/amlogic/meson64_odroidc4.dtb: audio-controller-2: clock-names:2: 'mclk' was expected
   	from schema $id: http://devicetree.org/schemas/sound/amlogic,axg-tdm-iface.yaml#
   arch/arm64/boot/dts/amlogic/meson64_odroidc4.dtb: sound: Unevaluated properties are not allowed ('assigned-clock-parents', 'assigned-clock-rates', 'assigned-clocks' were unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/amlogic,axg-sound-card.yaml#
   arch/arm64/boot/dts/amlogic/meson64_odroidc4.dtb: sound: 'anyOf' conditional failed, one must be fixed:
   	'clocks' is a required property
   	'#clock-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/clock.yaml#
>> arch/arm64/boot/dts/amlogic/meson64_odroidc4.dtb: gpiomem: compatible:0: 'amlogic, gpiomem' does not match '^[a-zA-Z0-9][a-zA-Z0-9,+\\-._/]+$'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/amlogic/meson64_odroidc4.dtb: /gpiomem: failed to match any schema with compatible: ['amlogic, gpiomem']
   arch/arm64/boot/dts/amlogic/meson64_odroidc4.dtb: /odroid-reboot: failed to match any schema with compatible: ['odroid,reboot']
--
   	from schema $id: http://devicetree.org/schemas/sound/amlogic,axg-tdm-iface.yaml#
   arch/arm64/boot/dts/amlogic/meson64_odroidn2.dtb: audio-controller-2: Unevaluated properties are not allowed ('clock-names' was unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/amlogic,axg-tdm-iface.yaml#
   arch/arm64/boot/dts/amlogic/meson64_odroidn2.dtb: /gpio-fan: failed to match any schema with compatible: ['gpio-fan']
   arch/arm64/boot/dts/amlogic/meson64_odroidn2.dtb: sound: Unevaluated properties are not allowed ('assigned-clock-parents', 'assigned-clock-rates', 'assigned-clocks' were unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/amlogic,axg-sound-card.yaml#
   arch/arm64/boot/dts/amlogic/meson64_odroidn2.dtb: sound: 'anyOf' conditional failed, one must be fixed:
   	'clocks' is a required property
   	'#clock-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/clock.yaml#
>> arch/arm64/boot/dts/amlogic/meson64_odroidn2.dtb: gpiomem: compatible:0: 'amlogic, gpiomem' does not match '^[a-zA-Z0-9][a-zA-Z0-9,+\\-._/]+$'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/amlogic/meson64_odroidn2.dtb: /gpiomem: failed to match any schema with compatible: ['amlogic, gpiomem']
   arch/arm64/boot/dts/amlogic/meson64_odroidn2.dtb: /odroid-reboot: failed to match any schema with compatible: ['odroid,reboot']
   arch/arm64/boot/dts/amlogic/meson64_odroidn2.dtb: /pwmgpio: failed to match any schema with compatible: ['pwm-gpio']
   arch/arm64/boot/dts/amlogic/meson64_odroidn2.dtb: pwm-fan: 'cooling-max-state', 'cooling-min-state' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/hwmon/pwm-fan.yaml#
--
   	from schema $id: http://devicetree.org/schemas/sound/amlogic,axg-tdm-iface.yaml#
   arch/arm64/boot/dts/amlogic/meson64_odroidn2_plus.dtb: audio-controller-2: Unevaluated properties are not allowed ('clock-names' was unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/amlogic,axg-tdm-iface.yaml#
   arch/arm64/boot/dts/amlogic/meson64_odroidn2_plus.dtb: /gpio-fan: failed to match any schema with compatible: ['gpio-fan']
   arch/arm64/boot/dts/amlogic/meson64_odroidn2_plus.dtb: sound: Unevaluated properties are not allowed ('assigned-clock-parents', 'assigned-clock-rates', 'assigned-clocks' were unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/amlogic,axg-sound-card.yaml#
   arch/arm64/boot/dts/amlogic/meson64_odroidn2_plus.dtb: sound: 'anyOf' conditional failed, one must be fixed:
   	'clocks' is a required property
   	'#clock-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/clock.yaml#
>> arch/arm64/boot/dts/amlogic/meson64_odroidn2_plus.dtb: gpiomem: compatible:0: 'amlogic, gpiomem' does not match '^[a-zA-Z0-9][a-zA-Z0-9,+\\-._/]+$'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/amlogic/meson64_odroidn2_plus.dtb: /gpiomem: failed to match any schema with compatible: ['amlogic, gpiomem']
   arch/arm64/boot/dts/amlogic/meson64_odroidn2_plus.dtb: /odroid-reboot: failed to match any schema with compatible: ['odroid,reboot']
   arch/arm64/boot/dts/amlogic/meson64_odroidn2_plus.dtb: /pwmgpio: failed to match any schema with compatible: ['pwm-gpio']
   arch/arm64/boot/dts/amlogic/meson64_odroidn2_plus.dtb: pwm-fan: 'cooling-max-state', 'cooling-min-state' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/hwmon/pwm-fan.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
