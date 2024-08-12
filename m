Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2F8513BC02
	for <oe-kbuild@lists.linux.dev>; Mon, 12 Aug 2024 19:23:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723490589; cv=none; b=KfbkCc88tukD6bVtDD3vdDGsgS+fzQqyK4kJYVNJvEREuj464IKHZPbW9v+nxsKCiRxZ+03kAp31IbITQ7zDe7wwbPMySetfyBGQ7tYaIko918e69mj/bsVPXDvgim6E7xHUAc787D3tYao7Eij1p1Jyt1CPzU52wz98N6fef8w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723490589; c=relaxed/simple;
	bh=4JM0xy9fNvEPKF8p6IYIfFH3vw62ZPUGw6HmHAhr/IQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=uZ9gs6v+27L1fHL/AJuesV8/XASUmmxiObD+Wao6WkDO1yF5IFjbNS/DDgS6c06IJ+NgdCFjb8V9HA6OXgi3m6C7TTrj+0gAaPRKcANE10kCqptncm8vJmCe8a2u8bVxfSAS/WU0wCdjr4WOA4gIxfGBWHTHzrNf0cO/qUI05Co=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XQ8Y4AK0; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XQ8Y4AK0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723490587; x=1755026587;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=4JM0xy9fNvEPKF8p6IYIfFH3vw62ZPUGw6HmHAhr/IQ=;
  b=XQ8Y4AK0HGW7JG5uQqpG5ZE/064BCBLKG2jSUgiofYcyGfKG4Svpm5s9
   fdWCz3/sGCPJ++Id4xeAiIuPw6TNKlatvTj4JoelIHoFnEStXXDJiPE4q
   fh3+jmFWm2LTOVok5CiUg+PZKOnNwVhnbK1YO7yvyKn6un7oge4dUzgRw
   7JOf/UIbQO+3L3fHtsDZ5X8oYz0oWsqPR1nEc2vTE0wBv0vMqIlh+3L5T
   TntNwAYsGLLFbepmq9Y4BRhRa+OOs8f3QdmyjruaQy/HjB8mMk32ONJS0
   j2uspO3O+TvyOn2smCiHqMdHFkpQI+ztvULIhVfShZtUUYF45NpqJOcXI
   g==;
X-CSE-ConnectionGUID: TUwoj6R6Sy213v8aSbXrNg==
X-CSE-MsgGUID: UXc3Cd7ESaCs/y/aw0madQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11162"; a="32242370"
X-IronPort-AV: E=Sophos;i="6.09,283,1716274800"; 
   d="scan'208";a="32242370"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Aug 2024 12:23:06 -0700
X-CSE-ConnectionGUID: XXaFeDy6TRyLbbY+MnRLvg==
X-CSE-MsgGUID: pqSokH8eQ1KodSgeGF9+qw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,283,1716274800"; 
   d="scan'208";a="58918611"
Received: from unknown (HELO b6bf6c95bbab) ([10.239.97.151])
  by orviesa007.jf.intel.com with ESMTP; 12 Aug 2024 12:23:05 -0700
Received: from kbuild by b6bf6c95bbab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sdacv-000C6w-1h;
	Mon, 12 Aug 2024 19:22:50 +0000
Date: Tue, 13 Aug 2024 03:22:16 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [tobetter:odroid-6.6.y 36/79]
 arch/arm64/boot/dts/amlogic/meson-sm1-odroid-c4.dtb: pinctrl@40: Unevaluated
 properties are not valid under the given schema ('gpio-line-names',
 'gpio-line-names' were unevaluated and invalid)
Message-ID: <202408130345.b06jJll7-lkp@intel.com>
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
head:   3ad420f3e23c17d1cf883549675112ee8dd308e4
commit: b6b6e7739a7868dff875287ab942fa58a38b1b40 [36/79] ODROID-C4: arm64/dts: Move gpio-line-names into the periphs_pinctrl node
:::::: branch date: 13 hours ago
:::::: commit date: 5 months ago
config: arm64-randconfig-051-20240808 (https://download.01.org/0day-ci/archive/20240813/202408130345.b06jJll7-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
dtschema version: 2024.6.dev10+ge5d88ac
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240813/202408130345.b06jJll7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202408130345.b06jJll7-lkp@intel.com/

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
