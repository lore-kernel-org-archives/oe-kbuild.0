Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA7691586CF
	for <oe-kbuild@lists.linux.dev>; Sat, 10 Aug 2024 14:39:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723300767; cv=none; b=Ao+5qlIrVjDqHTVpFNMbta6uapT6fe/bJObviR4Lre258Pl8CZgNEPRElsxHJelBoKHh/3PK+EAfyK+DIkFGGKwlB/CI6tnwXlhkN8/pdHMjh/aH9e/ERMNa13Y+CgWuruTZwOebUTLxFPIXGPdCGF1+7uTzfQoONU4c7Z3TJr8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723300767; c=relaxed/simple;
	bh=Ql8MVfCWP5B5AY7F9UuQmeH5uZZxbOte9vD3wJKj4Ds=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=pPw9GTHwnPWTfL20Eon/wWxGvUg1FtOEpNocB4oBoTGMCkAHYzpmuMCkDvpQuDj0YGci1K0lMd9puWxk1LJEyh5VxdDQhstwJ/AbFk70T7EmbEgztx7gMx0W5kGwgW3DrGQTP/sRed7r4yhVk4F2y2xEuA2hri3qGBmuk4XQA/c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kO5q1zvj; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kO5q1zvj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723300765; x=1754836765;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Ql8MVfCWP5B5AY7F9UuQmeH5uZZxbOte9vD3wJKj4Ds=;
  b=kO5q1zvjJdQVgLafkDPMtdgYe93qexEXg8hL+5VnJ5qC4D4r+fAUTUnh
   xxi9U4tdnnS3GBUTJ0NVE3J5MKX8mbL3M52tBPKW7J3SVK+jqkZIX/WiT
   dYFkqesuf56fMli+BhpD13hqzjF5YitDlNm+TdoWf5lgeMKETgL93Rxe1
   FQ1SAh00pLCYz8Eau+q9bZtB9eM+to9ihz6KaDA+5fpqTC4dDDER2jJ1r
   5QWo8ymRYzUqRgBVCNkw38t/QZyS8FBDH7159pWYq4iPZmELzO78yrmPx
   Y3GwAtHD6iAixQXW4nZhB+YIp10MHatVQKz22DHjX//hCHxmcEOmUjKXM
   A==;
X-CSE-ConnectionGUID: oh6hFKZxTzeNpLFqI1btzw==
X-CSE-MsgGUID: myTS5UQDRx2p3rsNJ2Sgfw==
X-IronPort-AV: E=McAfee;i="6700,10204,11160"; a="38913059"
X-IronPort-AV: E=Sophos;i="6.09,279,1716274800"; 
   d="scan'208";a="38913059"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Aug 2024 07:39:24 -0700
X-CSE-ConnectionGUID: VTquTqQkTeK2phnntBkdVw==
X-CSE-MsgGUID: D3XYI7HnSOiunaj08FWunA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,279,1716274800"; 
   d="scan'208";a="88476571"
Received: from unknown (HELO b6bf6c95bbab) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 10 Aug 2024 07:39:24 -0700
Received: from kbuild by b6bf6c95bbab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1scnFZ-000A13-1S;
	Sat, 10 Aug 2024 14:39:21 +0000
Date: Sat, 10 Aug 2024 22:38:23 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [tobetter:odroid-6.6.y 36/78]
 arch/arm64/boot/dts/amlogic/meson-sm1-odroid-c4.dtb: pinctrl@40: Unevaluated
 properties are not valid under the given schema ('gpio-line-names',
 'gpio-line-names' were unevaluated and invalid)
Message-ID: <202408102207.S5HOcEOs-lkp@intel.com>
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
:::::: Manual check reason: "low confidence static check first_new_problem: arch/arm64/boot/dts/amlogic/meson-sm1-odroid-c4.dtb: pinctrl@40: Unevaluated properties are not valid under the given schema ('gpio-line-names', 'gpio-line-names' were unevaluated and invalid)"
:::::: Manual check reason: "dtcheck: binding changes may go via different trees"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Deokgyu Yang <secugyu@gmail.com>
CC: Dongjin Kim <tobetter@gmail.com>

tree:   https://github.com/tobetter/linux odroid-6.6.y
head:   db2e15a776d1205387db09cc4cd4b3d97c5de1d3
commit: b6b6e7739a7868dff875287ab942fa58a38b1b40 [36/78] ODROID-C4: arm64/dts: Move gpio-line-names into the periphs_pinctrl node
:::::: branch date: 3 days ago
:::::: commit date: 5 months ago
config: arm64-randconfig-051-20240808 (https://download.01.org/0day-ci/archive/20240810/202408102207.S5HOcEOs-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
dtschema version: 2024.6.dev8+gf13c181
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240810/202408102207.S5HOcEOs-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202408102207.S5HOcEOs-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:266.33-1540.7: Warning (unit_address_vs_reg): /soc/bus@ff600000/bus@34400/pinctrl@40: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:266.33-1540.7: Warning (simple_bus_reg): /soc/bus@ff600000/bus@34400/pinctrl@40: missing or empty reg/ranges property
   arch/arm64/boot/dts/amlogic/meson-sm1-odroid-c4.dtb: ethernet@ff3f0000: amlogic,tx-delay-ns: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/net/amlogic,meson-dwmac.yaml#
   arch/arm64/boot/dts/amlogic/meson-sm1-odroid-c4.dtb: ethernet@ff3f0000: Unevaluated properties are not allowed ('amlogic,tx-delay-ns' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/amlogic,meson-dwmac.yaml#
>> arch/arm64/boot/dts/amlogic/meson-sm1-odroid-c4.dtb: pinctrl@40: Unevaluated properties are not valid under the given schema ('gpio-line-names', 'gpio-line-names' were unevaluated and invalid)
   	from schema $id: http://devicetree.org/schemas/pinctrl/amlogic,meson-pinctrl-g12a-periphs.yaml#
>> arch/arm64/boot/dts/amlogic/meson-sm1-odroid-c4.dtb: pinctrl@40: '#gpio-cells' is a dependency of 'gpio-line-names'
   	from schema $id: http://devicetree.org/schemas/gpio/gpio.yaml#
   arch/arm64/boot/dts/amlogic/meson-sm1-odroid-c4.dtb: /soc/bus@ff600000/bus@60000/clock-controller@0: failed to match any schema with compatible: ['amlogic,sm1-audio-clkc']
   arch/arm64/boot/dts/amlogic/meson-sm1-odroid-c4.dtb: audio-controller@300: compatible: ['amlogic,sm1-tdmin', 'amlogic,axg-tdmin'] is too long
   	from schema $id: http://devicetree.org/schemas/sound/amlogic,axg-tdm-formatters.yaml#
   arch/arm64/boot/dts/amlogic/meson-sm1-odroid-c4.dtb: audio-controller@340: compatible: ['amlogic,sm1-tdmin', 'amlogic,axg-tdmin'] is too long
   	from schema $id: http://devicetree.org/schemas/sound/amlogic,axg-tdm-formatters.yaml#
   arch/arm64/boot/dts/amlogic/meson-sm1-odroid-c4.dtb: audio-controller@380: compatible: ['amlogic,sm1-tdmin', 'amlogic,axg-tdmin'] is too long
   	from schema $id: http://devicetree.org/schemas/sound/amlogic,axg-tdm-formatters.yaml#
   arch/arm64/boot/dts/amlogic/meson-sm1-odroid-c4.dtb: audio-controller@3c0: compatible: ['amlogic,sm1-tdmin', 'amlogic,axg-tdmin'] is too long
   	from schema $id: http://devicetree.org/schemas/sound/amlogic,axg-tdm-formatters.yaml#
--
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:266.33-1540.7: Warning (unit_address_vs_reg): /soc/bus@ff600000/bus@34400/pinctrl@40: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:266.33-1540.7: Warning (simple_bus_reg): /soc/bus@ff600000/bus@34400/pinctrl@40: missing or empty reg/ranges property
   arch/arm64/boot/dts/amlogic/meson64_odroidc4.dtb: ethernet@ff3f0000: amlogic,tx-delay-ns: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/net/amlogic,meson-dwmac.yaml#
   arch/arm64/boot/dts/amlogic/meson64_odroidc4.dtb: ethernet@ff3f0000: Unevaluated properties are not allowed ('amlogic,tx-delay-ns' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/amlogic,meson-dwmac.yaml#
>> arch/arm64/boot/dts/amlogic/meson64_odroidc4.dtb: pinctrl@40: Unevaluated properties are not valid under the given schema ('gpio-line-names', 'gpio-line-names' were unevaluated and invalid)
   	from schema $id: http://devicetree.org/schemas/pinctrl/amlogic,meson-pinctrl-g12a-periphs.yaml#
>> arch/arm64/boot/dts/amlogic/meson64_odroidc4.dtb: pinctrl@40: '#gpio-cells' is a dependency of 'gpio-line-names'
   	from schema $id: http://devicetree.org/schemas/gpio/gpio.yaml#
   arch/arm64/boot/dts/amlogic/meson64_odroidc4.dtb: /soc/bus@ff600000/bus@60000/clock-controller@0: failed to match any schema with compatible: ['amlogic,sm1-audio-clkc']
   arch/arm64/boot/dts/amlogic/meson64_odroidc4.dtb: audio-controller@300: compatible: ['amlogic,sm1-tdmin', 'amlogic,axg-tdmin'] is too long
   	from schema $id: http://devicetree.org/schemas/sound/amlogic,axg-tdm-formatters.yaml#
   arch/arm64/boot/dts/amlogic/meson64_odroidc4.dtb: audio-controller@340: compatible: ['amlogic,sm1-tdmin', 'amlogic,axg-tdmin'] is too long
   	from schema $id: http://devicetree.org/schemas/sound/amlogic,axg-tdm-formatters.yaml#
   arch/arm64/boot/dts/amlogic/meson64_odroidc4.dtb: audio-controller@380: compatible: ['amlogic,sm1-tdmin', 'amlogic,axg-tdmin'] is too long
   	from schema $id: http://devicetree.org/schemas/sound/amlogic,axg-tdm-formatters.yaml#
   arch/arm64/boot/dts/amlogic/meson64_odroidc4.dtb: audio-controller@3c0: compatible: ['amlogic,sm1-tdmin', 'amlogic,axg-tdmin'] is too long
   	from schema $id: http://devicetree.org/schemas/sound/amlogic,axg-tdm-formatters.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
