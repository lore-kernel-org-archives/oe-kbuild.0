Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6849130496
	for <oe-kbuild@lists.linux.dev>; Fri, 12 Jul 2024 23:30:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720827056; cv=none; b=cGqekwPMAr2aViCvS0beHRADByMesbx1AVHI4ogyNezJf+u0F1F6wBiD9tCUdBIDgJwuSY72tFlJ4RnvctY32Bt4LpQBO1HeWcm5aHn+XVxDgZm4hwwKje6VDLEt6EP2+M8dsIMUTylyzcbJmjllEP1+VXEi2PjCSpnb3hySK7w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720827056; c=relaxed/simple;
	bh=x0deeqjC/mfrQFv5d8d7m/06gDU5VzbuKZDLixRNSTg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=n0NdJt3zawCwg2C/Myzl0xM/JL5ayrLs5Gu5z7w085rZz3HWX6HNZ2o2K6zobGoqr9E86SFc/BhVvSEXZjXH9Ti4obkw7AnQQkRBxK76ySMx5Bs4Y5VqlunHeFAEa6UG3aH+OkDTZZvm7N7BPic/szy8g3b4+Ks2gcUfIjA8NQ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dIzHNEf1; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dIzHNEf1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720827054; x=1752363054;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=x0deeqjC/mfrQFv5d8d7m/06gDU5VzbuKZDLixRNSTg=;
  b=dIzHNEf1S2d7VsztwKdtDOsj/TCVQAkC7h28MPlxM518m5mqJf5jZVrF
   h2ShUh453bTeXrxVEv975uSTv/7QkTNuAQpHukUcYVCGlzHLnF8+PBOXR
   Ih3ddkIR6LKHt93iJlALywO3R+9lo+5SGDi6cjsJcQkGT9jbIs/RL5gqi
   rxnW/cjCmdc9YBxSbiQGF2hDo4KqOnbO+31m1NacnA0Kzn0i1o16IxdRT
   +/MFn45FnDlgI3rNdUbuCUaLpyUoX9gUfi+0L8O1H/7AND+OETUgvzWYN
   3pzYVCpBhYubrnWIPvoEeznG/+eLm1+gOerv9zFxb6iF683RkoFEELjM0
   w==;
X-CSE-ConnectionGUID: +D3J1VWzTxGqxzxL/cCxCQ==
X-CSE-MsgGUID: JUE5YyfqR/6X7QpU/5D+dA==
X-IronPort-AV: E=McAfee;i="6700,10204,11131"; a="17998790"
X-IronPort-AV: E=Sophos;i="6.09,204,1716274800"; 
   d="scan'208";a="17998790"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jul 2024 16:30:54 -0700
X-CSE-ConnectionGUID: 0EcGKKYBSvydL4WWGr2m2A==
X-CSE-MsgGUID: pC3gFqT5T2Si0GVsBn4+2g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,204,1716274800"; 
   d="scan'208";a="79754403"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 12 Jul 2024 16:30:52 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sSPj0-000bR8-0h;
	Fri, 12 Jul 2024 23:30:50 +0000
Date: Sat, 13 Jul 2024 07:29:57 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: arch/arm64/boot/dts/amlogic/meson-g12b-a311d-libretech-cc.dtb:
 ethernet@ff3f0000: amlogic,tx-delay-ns: [2] is not of type 'integer'
Message-ID: <202407130749.1OUMNSqB-lkp@intel.com>
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
CC: linux-kernel@vger.kernel.org
TO: Jerome Brunet <jbrunet@baylibre.com>
CC: Neil Armstrong <neil.armstrong@linaro.org>
CC: Da Xue <da.xue@libretech.co>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   975f3b6da18020f1c8a7667ccb08fa542928ec03
commit: a702d4f016788f83ed02666930992d792e9a80cc arm64: dts: amlogic: add libretech cottonwood support
date:   9 months ago
:::::: branch date: 4 hours ago
:::::: commit date: 9 months ago
config: arm64-randconfig-051-20240713 (https://download.01.org/0day-ci/archive/20240713/202407130749.1OUMNSqB-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
dtschema version: 2024.6.dev4+g23441a4
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240713/202407130749.1OUMNSqB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202407130749.1OUMNSqB-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:266.33-1540.7: Warning (unit_address_vs_reg): /soc/bus@ff600000/bus@34400/pinctrl@40: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:266.33-1540.7: Warning (simple_bus_reg): /soc/bus@ff600000/bus@34400/pinctrl@40: missing or empty reg/ranges property
>> arch/arm64/boot/dts/amlogic/meson-g12b-a311d-libretech-cc.dtb: ethernet@ff3f0000: amlogic,tx-delay-ns: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/net/amlogic,meson-dwmac.yaml#
>> arch/arm64/boot/dts/amlogic/meson-g12b-a311d-libretech-cc.dtb: ethernet@ff3f0000: Unevaluated properties are not allowed ('amlogic,tx-delay-ns' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/amlogic,meson-dwmac.yaml#
   arch/arm64/boot/dts/amlogic/meson-g12b-a311d-libretech-cc.dtb: /soc/bus@ff600000/bus@42000/clock-controller@0: failed to match any schema with compatible: ['amlogic,g12a-audio-clkc']
   arch/arm64/boot/dts/amlogic/meson-g12b-a311d-libretech-cc.dtb: /soc/bus@ff600000/bus@42000/audio-controller@744: failed to match any schema with compatible: ['amlogic,g12a-tohdmitx']
   arch/arm64/boot/dts/amlogic/meson-g12b-a311d-libretech-cc.dtb: sys-ctrl@0: '#address-cells', '#size-cells', 'ranges' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/soc/amlogic/amlogic,meson-gx-hhi-sysctrl.yaml#
   arch/arm64/boot/dts/amlogic/meson-g12b-a311d-libretech-cc.dtb: sound: Unevaluated properties are not allowed ('assigned-clock-parents', 'assigned-clock-rates', 'assigned-clocks' were unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/amlogic,axg-sound-card.yaml#
   arch/arm64/boot/dts/amlogic/meson-g12b-a311d-libretech-cc.dtb: sound: 'anyOf' conditional failed, one must be fixed:
   	'clocks' is a required property
   	'#clock-cells' is a required property
--
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:266.33-1540.7: Warning (unit_address_vs_reg): /soc/bus@ff600000/bus@34400/pinctrl@40: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:266.33-1540.7: Warning (simple_bus_reg): /soc/bus@ff600000/bus@34400/pinctrl@40: missing or empty reg/ranges property
>> arch/arm64/boot/dts/amlogic/meson-sm1-s905d3-libretech-cc.dtb: ethernet@ff3f0000: amlogic,tx-delay-ns: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/net/amlogic,meson-dwmac.yaml#
>> arch/arm64/boot/dts/amlogic/meson-sm1-s905d3-libretech-cc.dtb: ethernet@ff3f0000: Unevaluated properties are not allowed ('amlogic,tx-delay-ns' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/amlogic,meson-dwmac.yaml#
   arch/arm64/boot/dts/amlogic/meson-sm1-s905d3-libretech-cc.dtb: /soc/bus@ff600000/bus@60000/clock-controller@0: failed to match any schema with compatible: ['amlogic,sm1-audio-clkc']
   arch/arm64/boot/dts/amlogic/meson-sm1-s905d3-libretech-cc.dtb: audio-controller@300: compatible: ['amlogic,sm1-tdmin', 'amlogic,axg-tdmin'] is too long
   	from schema $id: http://devicetree.org/schemas/sound/amlogic,axg-tdm-formatters.yaml#
   arch/arm64/boot/dts/amlogic/meson-sm1-s905d3-libretech-cc.dtb: audio-controller@340: compatible: ['amlogic,sm1-tdmin', 'amlogic,axg-tdmin'] is too long
   	from schema $id: http://devicetree.org/schemas/sound/amlogic,axg-tdm-formatters.yaml#
   arch/arm64/boot/dts/amlogic/meson-sm1-s905d3-libretech-cc.dtb: audio-controller@380: compatible: ['amlogic,sm1-tdmin', 'amlogic,axg-tdmin'] is too long
   	from schema $id: http://devicetree.org/schemas/sound/amlogic,axg-tdm-formatters.yaml#
   arch/arm64/boot/dts/amlogic/meson-sm1-s905d3-libretech-cc.dtb: audio-controller@3c0: compatible: ['amlogic,sm1-tdmin', 'amlogic,axg-tdmin'] is too long
   	from schema $id: http://devicetree.org/schemas/sound/amlogic,axg-tdm-formatters.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
