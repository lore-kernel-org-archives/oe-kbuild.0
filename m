Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2D7718F2D6
	for <oe-kbuild@lists.linux.dev>; Thu,  8 Aug 2024 15:40:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723131660; cv=none; b=R/QqvUt/gSBqCsd1yBwaN2qYhshahZwRJGpX3qq7d2Kfl6g4jwruF78aIcMboP3I09R669W5m19wCVBfFK34m9uDg0OxnS1Y4susY450bRU1+UmLtX8rBQY7bKG2ix00eAKQwbPbGitZzvEuL6QN8Eo3ugJ1J7Pd1577kGtRsR0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723131660; c=relaxed/simple;
	bh=g/yl9m0ZHrHO+5buL7kNBj52NFOOqIT67Vxmh3GHUTU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=MSeSk+O6d8kCHfbjZdPooFPwVoD9QaBhsiSoLtV0+s8otVGalOnuzawPJW8Wpf9o7MSdlqfvPF+ZfEgEy2CrTAHoynkjiVKk1JKPf+0mM6o+o0TmO2kU+EI0Eg6Z3s6HD6mO4Ilo+5QDgaq7hlaaBR7EumBg90+RoIur8u9RVrc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gR+uA6jd; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gR+uA6jd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723131659; x=1754667659;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=g/yl9m0ZHrHO+5buL7kNBj52NFOOqIT67Vxmh3GHUTU=;
  b=gR+uA6jdd1Vb8w3weBlRnYnPh4rb2HVR13Y1yoxAI22bOkW0Fbnz0wbq
   koHsfCbhVMpexBh8uBBUAHFhTUZY6BA3DMDndB9cvIBa9YZgMbSOX3e2u
   2CIRIvw1rKYRh/ervhnNiV0xnFFzyRuWux9y0/AsLwHwsONWqiHTY6nC9
   sdi9IwT5GmzGKD1rtL9AHDRXwqtF3CekJU4Mvdn5Biz3KGvXDgwAtv5+4
   kxHWPC/FWLFQ8V+vFmR4iGTpFWtEga/DcWMMID9ZigOdZFqRkQvG9k0rr
   K0eZZ3+Sk0VgJVwnDGWZppXJMzrO4AUTjjCh6Dju+zIdhKXnivJ7ERA1a
   Q==;
X-CSE-ConnectionGUID: 6UDD2g/pSLOM3xvBPhwIAw==
X-CSE-MsgGUID: GZg6rkcPTfuVJqY5Dj8KzQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11158"; a="21385287"
X-IronPort-AV: E=Sophos;i="6.09,273,1716274800"; 
   d="scan'208";a="21385287"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Aug 2024 08:40:57 -0700
X-CSE-ConnectionGUID: +zY/Q1HwQm+zwJ6vKh0xdg==
X-CSE-MsgGUID: btwq09+rRSOmjYDCkUTtow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,273,1716274800"; 
   d="scan'208";a="87913293"
Received: from unknown (HELO b6bf6c95bbab) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 08 Aug 2024 08:40:56 -0700
Received: from kbuild by b6bf6c95bbab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sc5Fx-0006HS-1U;
	Thu, 08 Aug 2024 15:40:50 +0000
Date: Thu, 8 Aug 2024 23:39:53 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [tobetter:odroid-6.6.y 28/78]
 arch/arm64/boot/dts/amlogic/meson64_odroidc2.dtb: ethernet@c9410000:
 amlogic,tx-delay-ns: [2] is not of type 'integer'
Message-ID: <202408082359.e4iIEmNp-lkp@intel.com>
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
commit: 4c378b4ec3bb24f4d0d8621604a6433d9afe04b1 [28/78] ODROID-C2: arm64/dts: add 'meson64_odroidc2.dts' for compability
:::::: branch date: 33 hours ago
:::::: commit date: 5 months ago
config: arm64-randconfig-051-20240808 (https://download.01.org/0day-ci/archive/20240808/202408082359.e4iIEmNp-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
dtschema version: 2024.6.dev8+gf13c181
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240808/202408082359.e4iIEmNp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202408082359.e4iIEmNp-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi:88.28-265.4: Warning (unit_address_vs_reg): /soc/bus@c8100000/pinctrl@14: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi:361.31-733.4: Warning (unit_address_vs_reg): /soc/bus@c8834000/pinctrl@4b0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi:88.28-265.4: Warning (simple_bus_reg): /soc/bus@c8100000/pinctrl@14: missing or empty reg/ranges property
   arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi:361.31-733.4: Warning (simple_bus_reg): /soc/bus@c8834000/pinctrl@4b0: missing or empty reg/ranges property
>> arch/arm64/boot/dts/amlogic/meson64_odroidc2.dtb: ethernet@c9410000: amlogic,tx-delay-ns: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/net/amlogic,meson-dwmac.yaml#
>> arch/arm64/boot/dts/amlogic/meson64_odroidc2.dtb: ethernet@c9410000: Unevaluated properties are not allowed ('amlogic,tx-delay-ns' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/amlogic,meson-dwmac.yaml#
>> arch/arm64/boot/dts/amlogic/meson64_odroidc2.dtb: usb@c9100000: '#address-cells', '#size-cells', 'hub@1' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/usb/dwc2.yaml#
>> arch/arm64/boot/dts/amlogic/meson64_odroidc2.dtb: hub@1: 'reset-gpio' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/usb/genesys,gl850g.yaml#
>> arch/arm64/boot/dts/amlogic/meson64_odroidc2.dtb: sound: Unevaluated properties are not allowed ('assigned-clock-parents', 'assigned-clock-rates', 'assigned-clocks' were unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/amlogic,gx-sound-card.yaml#
>> arch/arm64/boot/dts/amlogic/meson64_odroidc2.dtb: sound: 'anyOf' conditional failed, one must be fixed:
   	'clocks' is a required property
   	'#clock-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/clock.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
