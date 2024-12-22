Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 733BC846F
	for <oe-kbuild@lists.linux.dev>; Sun, 22 Dec 2024 09:23:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734859430; cv=none; b=cOx8jhXApVpTpUBUyZrYjU9T1x0jimy8O/AYyvzTde7QyN/p2Ebvs9RellTrnREcMzdFl3lVYp+GOPdGgxHXZz1g9iLl2JyBic+7IPgWn27OlouY8V0K4qcmI7efRY93OaQrd7XZdOGrTQpe1+bTHPYqNlzfeKdoSHrPmfHyOpc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734859430; c=relaxed/simple;
	bh=H1tVkrhgGcll5mhzUykq4Qp58gTox7FZPyaqIC85RSk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Wfe/EBzH0EMDYIf7KCgzhVtwKPXM0P5klL4i5M6P80yvdTax8VHULGDHtRdhJZWA90jq4jjceHHtLU2JMer0Za3o9DEVcqLbt+OmC3y3CD0GtxEnbwXS3of0dyV6OICG9uSTOGY8mtPvddG7dmTBWVTlhUHw7PhcTrae8+O998w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ABizCysm; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ABizCysm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734859427; x=1766395427;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=H1tVkrhgGcll5mhzUykq4Qp58gTox7FZPyaqIC85RSk=;
  b=ABizCysmyuJYhfpgqo97I4xCjEztYL6WtURC1KDb4FnIeu7zLsZ0RIFL
   1gB4kd57OnMiv8rJNPwXPca6rOVwqUn1u5xRkycvWc8qW8/3EoNzVDya2
   ZDJEVfgRbzdvW9Tsz4uZcazHOUs2MuJqiJMDkzpnMfFh6N/7w/ew1Hbl0
   /00yY0+2ZGD+gePMDZsUV35+uKunoWzb5haHaotCcGhWH/481u+t1Kcl8
   FQLFYrSZzsg42cku35NSx3P8Q4lq3pEmxByTxzwUis936V5IkGcoraxqK
   wJDLAp0MiCXcyRbGxXmMgXRLOcBoeuU9083G+sCvY+eP0shg4P7bMfy/F
   w==;
X-CSE-ConnectionGUID: Q2ZixbHiQaSgzBNQgeH6ZQ==
X-CSE-MsgGUID: t/FxHvAURG62GPePUwyu8w==
X-IronPort-AV: E=McAfee;i="6700,10204,11293"; a="45844097"
X-IronPort-AV: E=Sophos;i="6.12,254,1728975600"; 
   d="scan'208";a="45844097"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Dec 2024 01:23:46 -0800
X-CSE-ConnectionGUID: Ph5vac1BQZqWbs74Rz9syA==
X-CSE-MsgGUID: JLyvcHaRRFWEzZt9oP/F0g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="99787671"
Received: from lkp-server01.sh.intel.com (HELO a46f226878e0) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 22 Dec 2024 01:23:45 -0800
Received: from kbuild by a46f226878e0 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tPIBZ-0002ox-33;
	Sun, 22 Dec 2024 09:23:41 +0000
Date: Sun, 22 Dec 2024 17:22:42 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: arch/arm64/boot/dts/amlogic/meson-axg.dtsi:217.33-1097.6: Warning
 (unit_address_vs_reg): /soc/bus@ff634000/pinctrl@480: node has a unit name,
 but no reg or ranges property
Message-ID: <202412221702.xLu9Vt4p-lkp@intel.com>
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
TO: Rob Herring <robh@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   48f506ad0b683d3e7e794efa60c5785c4fdc86fa
commit: d047cd8a2760f58d17b8ade21d2f15b818575abc scripts/dtc: Update to upstream version v1.6.0-2-g87a656ae5ff9
date:   4 years, 9 months ago
:::::: branch date: 10 hours ago
:::::: commit date: 4 years, 9 months ago
config: arm64-randconfig-003-20241212 (https://download.01.org/0day-ci/archive/20241222/202412221702.xLu9Vt4p-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241222/202412221702.xLu9Vt4p-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202412221702.xLu9Vt4p-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/amlogic/meson-axg.dtsi:217.33-1097.6: Warning (unit_address_vs_reg): /soc/bus@ff634000/pinctrl@480: node has a unit name, but no reg or ranges property
>> arch/arm64/boot/dts/amlogic/meson-axg.dtsi:1385.30-1492.6: Warning (unit_address_vs_reg): /soc/bus@ff800000/pinctrl@14: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/amlogic/meson-axg-s400.dts:316.12-318.6: Warning (unit_address_vs_reg): /sound/dai-link-6/codec@0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/amlogic/meson-axg-s400.dts:320.12-322.6: Warning (unit_address_vs_reg): /sound/dai-link-6/codec@1: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/amlogic/meson-axg-s400.dts:324.12-326.6: Warning (unit_address_vs_reg): /sound/dai-link-6/codec@2: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/amlogic/meson-axg.dtsi:217.33-1097.6: Warning (simple_bus_reg): /soc/bus@ff634000/pinctrl@480: missing or empty reg/ranges property
   arch/arm64/boot/dts/amlogic/meson-axg.dtsi:1385.30-1492.6: Warning (simple_bus_reg): /soc/bus@ff800000/pinctrl@14: missing or empty reg/ranges property
--
>> arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:260.33-1436.7: Warning (unit_address_vs_reg): /soc/bus@ff600000/bus@34400/pinctrl@40: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:1628.28-1873.7: Warning (unit_address_vs_reg): /soc/bus@ff800000/sys-ctrl@0/pinctrl@14: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/amlogic/meson-g12a-sei510.dts:272.12-274.6: Warning (unit_address_vs_reg): /sound/dai-link-7/codec@0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:123.17-176.5: Warning (simple_bus_reg): /soc/thermal-zones: missing or empty reg/ranges property
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:260.33-1436.7: Warning (simple_bus_reg): /soc/bus@ff600000/bus@34400/pinctrl@40: missing or empty reg/ranges property
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:1876.18-1879.6: Warning (simple_bus_reg): /soc/bus@ff800000/rtc@0a8: simple-bus unit address format error, expected "a8"
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:66.35-69.5: Warning (unique_unit_address): /reserved-memory/secmon@5000000: duplicate unit-address (also used in node /reserved-memory/bl32@5000000)
--
>> arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:260.33-1436.7: Warning (unit_address_vs_reg): /soc/bus@ff600000/bus@34400/pinctrl@40: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:1628.28-1873.7: Warning (unit_address_vs_reg): /soc/bus@ff800000/sys-ctrl@0/pinctrl@14: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:123.17-176.5: Warning (simple_bus_reg): /soc/thermal-zones: missing or empty reg/ranges property
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:260.33-1436.7: Warning (simple_bus_reg): /soc/bus@ff600000/bus@34400/pinctrl@40: missing or empty reg/ranges property
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:1876.18-1879.6: Warning (simple_bus_reg): /soc/bus@ff800000/rtc@0a8: simple-bus unit address format error, expected "a8"
--
>> arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:260.33-1436.7: Warning (unit_address_vs_reg): /soc/bus@ff600000/bus@34400/pinctrl@40: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:1628.28-1873.7: Warning (unit_address_vs_reg): /soc/bus@ff800000/sys-ctrl@0/pinctrl@14: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:123.17-176.5: Warning (simple_bus_reg): /soc/thermal-zones: missing or empty reg/ranges property
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:260.33-1436.7: Warning (simple_bus_reg): /soc/bus@ff600000/bus@34400/pinctrl@40: missing or empty reg/ranges property
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:1876.18-1879.6: Warning (simple_bus_reg): /soc/bus@ff800000/rtc@0a8: simple-bus unit address format error, expected "a8"
--
   arch/arm64/boot/dts/amlogic/meson-gx.dtsi:187.29-192.6: Warning (unit_address_vs_reg): /scpi/clocks/scpi_clocks@0: node has a unit name, but no reg or ranges property
>> arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi:64.28-241.4: Warning (unit_address_vs_reg): /soc/bus@c8100000/pinctrl@14: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/amlogic/meson-gx.dtsi:463.15-466.6: Warning (unit_address_vs_reg): /soc/bus@c8834000/rng: node has a reg or ranges property, but no unit name
>> arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi:366.31-724.4: Warning (unit_address_vs_reg): /soc/bus@c8834000/pinctrl@4b0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi:64.28-241.4: Warning (simple_bus_reg): /soc/bus@c8100000/pinctrl@14: missing or empty reg/ranges property
   arch/arm64/boot/dts/amlogic/meson-gx.dtsi:463.15-466.6: Warning (simple_bus_reg): /soc/bus@c8834000/rng: simple-bus unit address format error, expected "0"
   arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi:366.31-724.4: Warning (simple_bus_reg): /soc/bus@c8834000/pinctrl@4b0: missing or empty reg/ranges property
   arch/arm64/boot/dts/amlogic/meson-gxbb-kii-pro.dts:27.19-38.4: Warning (avoid_unnecessary_addr_size): /gpio-keys-polled: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
--
   arch/arm64/boot/dts/amlogic/meson-gx.dtsi:187.29-192.6: Warning (unit_address_vs_reg): /scpi/clocks/scpi_clocks@0: node has a unit name, but no reg or ranges property
>> arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi:64.28-241.4: Warning (unit_address_vs_reg): /soc/bus@c8100000/pinctrl@14: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/amlogic/meson-gx.dtsi:463.15-466.6: Warning (unit_address_vs_reg): /soc/bus@c8834000/rng: node has a reg or ranges property, but no unit name
>> arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi:366.31-724.4: Warning (unit_address_vs_reg): /soc/bus@c8834000/pinctrl@4b0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi:64.28-241.4: Warning (simple_bus_reg): /soc/bus@c8100000/pinctrl@14: missing or empty reg/ranges property
   arch/arm64/boot/dts/amlogic/meson-gx.dtsi:463.15-466.6: Warning (simple_bus_reg): /soc/bus@c8834000/rng: simple-bus unit address format error, expected "0"
   arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi:366.31-724.4: Warning (simple_bus_reg): /soc/bus@c8834000/pinctrl@4b0: missing or empty reg/ranges property
--
   arch/arm64/boot/dts/amlogic/meson-gx.dtsi:187.29-192.6: Warning (unit_address_vs_reg): /scpi/clocks/scpi_clocks@0: node has a unit name, but no reg or ranges property
>> arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi:64.28-241.4: Warning (unit_address_vs_reg): /soc/bus@c8100000/pinctrl@14: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/amlogic/meson-gx.dtsi:463.15-466.6: Warning (unit_address_vs_reg): /soc/bus@c8834000/rng: node has a reg or ranges property, but no unit name
>> arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi:366.31-724.4: Warning (unit_address_vs_reg): /soc/bus@c8834000/pinctrl@4b0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/amlogic/meson-gxbb-nexbox-a95x.dts:48.12-52.5: Warning (unit_address_vs_reg): /gpio-keys-polled/button@0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi:64.28-241.4: Warning (simple_bus_reg): /soc/bus@c8100000/pinctrl@14: missing or empty reg/ranges property
   arch/arm64/boot/dts/amlogic/meson-gx.dtsi:463.15-466.6: Warning (simple_bus_reg): /soc/bus@c8834000/rng: simple-bus unit address format error, expected "0"
   arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi:366.31-724.4: Warning (simple_bus_reg): /soc/bus@c8834000/pinctrl@4b0: missing or empty reg/ranges property
   arch/arm64/boot/dts/amlogic/meson-gxbb-nexbox-a95x.dts:42.19-53.4: Warning (avoid_unnecessary_addr_size): /gpio-keys-polled: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
--
   arch/arm64/boot/dts/amlogic/meson-gx.dtsi:187.29-192.6: Warning (unit_address_vs_reg): /scpi/clocks/scpi_clocks@0: node has a unit name, but no reg or ranges property
>> arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi:64.28-241.4: Warning (unit_address_vs_reg): /soc/bus@c8100000/pinctrl@14: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/amlogic/meson-gx.dtsi:463.15-466.6: Warning (unit_address_vs_reg): /soc/bus@c8834000/rng: node has a reg or ranges property, but no unit name
>> arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi:366.31-724.4: Warning (unit_address_vs_reg): /soc/bus@c8834000/pinctrl@4b0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/amlogic/meson-gxbb-wetek-play2.dts:36.12-40.5: Warning (unit_address_vs_reg): /gpio-keys-polled/button@0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi:64.28-241.4: Warning (simple_bus_reg): /soc/bus@c8100000/pinctrl@14: missing or empty reg/ranges property
   arch/arm64/boot/dts/amlogic/meson-gx.dtsi:463.15-466.6: Warning (simple_bus_reg): /soc/bus@c8834000/rng: simple-bus unit address format error, expected "0"
   arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi:366.31-724.4: Warning (simple_bus_reg): /soc/bus@c8834000/pinctrl@4b0: missing or empty reg/ranges property
   arch/arm64/boot/dts/amlogic/meson-gxbb-wetek-play2.dts:30.19-41.4: Warning (avoid_unnecessary_addr_size): /gpio-keys-polled: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
--
   arch/arm64/boot/dts/amlogic/meson-gx.dtsi:187.29-192.6: Warning (unit_address_vs_reg): /scpi/clocks/scpi_clocks@0: node has a unit name, but no reg or ranges property
>> arch/arm64/boot/dts/amlogic/meson-gxl.dtsi:106.28-260.4: Warning (unit_address_vs_reg): /soc/bus@c8100000/pinctrl@14: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/amlogic/meson-gx.dtsi:463.15-466.6: Warning (unit_address_vs_reg): /soc/bus@c8834000/rng: node has a reg or ranges property, but no unit name
>> arch/arm64/boot/dts/amlogic/meson-gxl.dtsi:318.31-715.4: Warning (unit_address_vs_reg): /soc/bus@c8834000/pinctrl@4b0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/amlogic/meson-gxl.dtsi:717.14-743.4: Warning (unit_address_vs_reg): /soc/bus@c8834000/eth-phy-mux: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/amlogic/meson-gxl.dtsi:17.22-38.5: Warning (unit_address_vs_reg): /soc/usb@c9000000: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/amlogic/meson-gxl.dtsi:106.28-260.4: Warning (simple_bus_reg): /soc/bus@c8100000/pinctrl@14: missing or empty reg/ranges property
   arch/arm64/boot/dts/amlogic/meson-gx.dtsi:463.15-466.6: Warning (simple_bus_reg): /soc/bus@c8834000/rng: simple-bus unit address format error, expected "0"
   arch/arm64/boot/dts/amlogic/meson-gxl.dtsi:318.31-715.4: Warning (simple_bus_reg): /soc/bus@c8834000/pinctrl@4b0: missing or empty reg/ranges property
   arch/arm64/boot/dts/amlogic/meson-gxl.dtsi:717.14-743.4: Warning (simple_bus_reg): /soc/bus@c8834000/eth-phy-mux: simple-bus unit address format error, expected "55c"
   arch/arm64/boot/dts/amlogic/meson-gxl.dtsi:17.22-38.5: Warning (simple_bus_reg): /soc/usb@c9000000: missing or empty reg/ranges property
--
   arch/arm64/boot/dts/amlogic/meson-gx.dtsi:187.29-192.6: Warning (unit_address_vs_reg): /scpi/clocks/scpi_clocks@0: node has a unit name, but no reg or ranges property
>> arch/arm64/boot/dts/amlogic/meson-gxl.dtsi:106.28-260.4: Warning (unit_address_vs_reg): /soc/bus@c8100000/pinctrl@14: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/amlogic/meson-gx.dtsi:463.15-466.6: Warning (unit_address_vs_reg): /soc/bus@c8834000/rng: node has a reg or ranges property, but no unit name
>> arch/arm64/boot/dts/amlogic/meson-gxl.dtsi:318.31-715.4: Warning (unit_address_vs_reg): /soc/bus@c8834000/pinctrl@4b0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/amlogic/meson-gxl.dtsi:717.14-743.4: Warning (unit_address_vs_reg): /soc/bus@c8834000/eth-phy-mux: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/amlogic/meson-gxl.dtsi:17.22-38.5: Warning (unit_address_vs_reg): /soc/usb@c9000000: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/amlogic/meson-gxl.dtsi:106.28-260.4: Warning (simple_bus_reg): /soc/bus@c8100000/pinctrl@14: missing or empty reg/ranges property
   arch/arm64/boot/dts/amlogic/meson-gx.dtsi:463.15-466.6: Warning (simple_bus_reg): /soc/bus@c8834000/rng: simple-bus unit address format error, expected "0"
   arch/arm64/boot/dts/amlogic/meson-gxl.dtsi:318.31-715.4: Warning (simple_bus_reg): /soc/bus@c8834000/pinctrl@4b0: missing or empty reg/ranges property
   arch/arm64/boot/dts/amlogic/meson-gxl.dtsi:717.14-743.4: Warning (simple_bus_reg): /soc/bus@c8834000/eth-phy-mux: simple-bus unit address format error, expected "55c"
   arch/arm64/boot/dts/amlogic/meson-gxl.dtsi:17.22-38.5: Warning (simple_bus_reg): /soc/usb@c9000000: missing or empty reg/ranges property
--
   arch/arm64/boot/dts/amlogic/meson-gx.dtsi:187.29-192.6: Warning (unit_address_vs_reg): /scpi/clocks/scpi_clocks@0: node has a unit name, but no reg or ranges property
>> arch/arm64/boot/dts/amlogic/meson-gxl.dtsi:106.28-260.4: Warning (unit_address_vs_reg): /soc/bus@c8100000/pinctrl@14: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/amlogic/meson-gx.dtsi:463.15-466.6: Warning (unit_address_vs_reg): /soc/bus@c8834000/rng: node has a reg or ranges property, but no unit name
>> arch/arm64/boot/dts/amlogic/meson-gxl.dtsi:318.31-715.4: Warning (unit_address_vs_reg): /soc/bus@c8834000/pinctrl@4b0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/amlogic/meson-gxl.dtsi:717.14-743.4: Warning (unit_address_vs_reg): /soc/bus@c8834000/eth-phy-mux: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/amlogic/meson-gxl.dtsi:17.22-38.5: Warning (unit_address_vs_reg): /soc/usb@c9000000: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/amlogic/meson-gxl.dtsi:106.28-260.4: Warning (simple_bus_reg): /soc/bus@c8100000/pinctrl@14: missing or empty reg/ranges property
   arch/arm64/boot/dts/amlogic/meson-gx.dtsi:463.15-466.6: Warning (simple_bus_reg): /soc/bus@c8834000/rng: simple-bus unit address format error, expected "0"
   arch/arm64/boot/dts/amlogic/meson-gxl.dtsi:318.31-715.4: Warning (simple_bus_reg): /soc/bus@c8834000/pinctrl@4b0: missing or empty reg/ranges property
   arch/arm64/boot/dts/amlogic/meson-gxl.dtsi:717.14-743.4: Warning (simple_bus_reg): /soc/bus@c8834000/eth-phy-mux: simple-bus unit address format error, expected "55c"
   arch/arm64/boot/dts/amlogic/meson-gxl.dtsi:17.22-38.5: Warning (simple_bus_reg): /soc/usb@c9000000: missing or empty reg/ranges property
--
   arch/arm64/boot/dts/amlogic/meson-gx.dtsi:187.29-192.6: Warning (unit_address_vs_reg): /scpi/clocks/scpi_clocks@0: node has a unit name, but no reg or ranges property
>> arch/arm64/boot/dts/amlogic/meson-gxl.dtsi:106.28-260.4: Warning (unit_address_vs_reg): /soc/bus@c8100000/pinctrl@14: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/amlogic/meson-gx.dtsi:463.15-466.6: Warning (unit_address_vs_reg): /soc/bus@c8834000/rng: node has a reg or ranges property, but no unit name
>> arch/arm64/boot/dts/amlogic/meson-gxl.dtsi:318.31-715.4: Warning (unit_address_vs_reg): /soc/bus@c8834000/pinctrl@4b0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/amlogic/meson-gxl.dtsi:717.14-743.4: Warning (unit_address_vs_reg): /soc/bus@c8834000/eth-phy-mux: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/amlogic/meson-gxl.dtsi:17.22-38.5: Warning (unit_address_vs_reg): /soc/usb@c9000000: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/amlogic/meson-gxl.dtsi:106.28-260.4: Warning (simple_bus_reg): /soc/bus@c8100000/pinctrl@14: missing or empty reg/ranges property
   arch/arm64/boot/dts/amlogic/meson-gx.dtsi:463.15-466.6: Warning (simple_bus_reg): /soc/bus@c8834000/rng: simple-bus unit address format error, expected "0"
   arch/arm64/boot/dts/amlogic/meson-gxl.dtsi:318.31-715.4: Warning (simple_bus_reg): /soc/bus@c8834000/pinctrl@4b0: missing or empty reg/ranges property
   arch/arm64/boot/dts/amlogic/meson-gxl.dtsi:717.14-743.4: Warning (simple_bus_reg): /soc/bus@c8834000/eth-phy-mux: simple-bus unit address format error, expected "55c"
   arch/arm64/boot/dts/amlogic/meson-gxl.dtsi:17.22-38.5: Warning (simple_bus_reg): /soc/usb@c9000000: missing or empty reg/ranges property
--
   arch/arm64/boot/dts/amlogic/meson-gx.dtsi:187.29-192.6: Warning (unit_address_vs_reg): /scpi/clocks/scpi_clocks@0: node has a unit name, but no reg or ranges property
>> arch/arm64/boot/dts/amlogic/meson-gxl.dtsi:106.28-260.4: Warning (unit_address_vs_reg): /soc/bus@c8100000/pinctrl@14: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/amlogic/meson-gx.dtsi:463.15-466.6: Warning (unit_address_vs_reg): /soc/bus@c8834000/rng: node has a reg or ranges property, but no unit name
>> arch/arm64/boot/dts/amlogic/meson-gxl.dtsi:318.31-715.4: Warning (unit_address_vs_reg): /soc/bus@c8834000/pinctrl@4b0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/amlogic/meson-gxl.dtsi:717.14-743.4: Warning (unit_address_vs_reg): /soc/bus@c8834000/eth-phy-mux: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/amlogic/meson-gxl.dtsi:17.22-38.5: Warning (unit_address_vs_reg): /soc/usb@c9000000: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/amlogic/meson-gxl.dtsi:106.28-260.4: Warning (simple_bus_reg): /soc/bus@c8100000/pinctrl@14: missing or empty reg/ranges property
   arch/arm64/boot/dts/amlogic/meson-gx.dtsi:463.15-466.6: Warning (simple_bus_reg): /soc/bus@c8834000/rng: simple-bus unit address format error, expected "0"
   arch/arm64/boot/dts/amlogic/meson-gxl.dtsi:318.31-715.4: Warning (simple_bus_reg): /soc/bus@c8834000/pinctrl@4b0: missing or empty reg/ranges property
   arch/arm64/boot/dts/amlogic/meson-gxl.dtsi:717.14-743.4: Warning (simple_bus_reg): /soc/bus@c8834000/eth-phy-mux: simple-bus unit address format error, expected "55c"
   arch/arm64/boot/dts/amlogic/meson-gxl.dtsi:17.22-38.5: Warning (simple_bus_reg): /soc/usb@c9000000: missing or empty reg/ranges property
--
   arch/arm64/boot/dts/amlogic/meson-gx.dtsi:187.29-192.6: Warning (unit_address_vs_reg): /scpi/clocks/scpi_clocks@0: node has a unit name, but no reg or ranges property
>> arch/arm64/boot/dts/amlogic/meson-gxl.dtsi:106.28-260.4: Warning (unit_address_vs_reg): /soc/bus@c8100000/pinctrl@14: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/amlogic/meson-gx.dtsi:463.15-466.6: Warning (unit_address_vs_reg): /soc/bus@c8834000/rng: node has a reg or ranges property, but no unit name
>> arch/arm64/boot/dts/amlogic/meson-gxl.dtsi:318.31-715.4: Warning (unit_address_vs_reg): /soc/bus@c8834000/pinctrl@4b0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/amlogic/meson-gxl.dtsi:717.14-743.4: Warning (unit_address_vs_reg): /soc/bus@c8834000/eth-phy-mux: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/amlogic/meson-gxl.dtsi:17.22-38.5: Warning (unit_address_vs_reg): /soc/usb@c9000000: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/amlogic/meson-gxl-s905d-p230.dts:37.12-41.5: Warning (unit_address_vs_reg): /gpio-keys-polled/button@0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/amlogic/meson-gxl.dtsi:106.28-260.4: Warning (simple_bus_reg): /soc/bus@c8100000/pinctrl@14: missing or empty reg/ranges property
   arch/arm64/boot/dts/amlogic/meson-gx.dtsi:463.15-466.6: Warning (simple_bus_reg): /soc/bus@c8834000/rng: simple-bus unit address format error, expected "0"
   arch/arm64/boot/dts/amlogic/meson-gxl.dtsi:318.31-715.4: Warning (simple_bus_reg): /soc/bus@c8834000/pinctrl@4b0: missing or empty reg/ranges property
   arch/arm64/boot/dts/amlogic/meson-gxl.dtsi:717.14-743.4: Warning (simple_bus_reg): /soc/bus@c8834000/eth-phy-mux: simple-bus unit address format error, expected "55c"
   arch/arm64/boot/dts/amlogic/meson-gxl.dtsi:17.22-38.5: Warning (simple_bus_reg): /soc/usb@c9000000: missing or empty reg/ranges property
--
   arch/arm64/boot/dts/amlogic/meson-gx.dtsi:187.29-192.6: Warning (unit_address_vs_reg): /scpi/clocks/scpi_clocks@0: node has a unit name, but no reg or ranges property
>> arch/arm64/boot/dts/amlogic/meson-gxl.dtsi:106.28-260.4: Warning (unit_address_vs_reg): /soc/bus@c8100000/pinctrl@14: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/amlogic/meson-gx.dtsi:463.15-466.6: Warning (unit_address_vs_reg): /soc/bus@c8834000/rng: node has a reg or ranges property, but no unit name
>> arch/arm64/boot/dts/amlogic/meson-gxl.dtsi:318.31-715.4: Warning (unit_address_vs_reg): /soc/bus@c8834000/pinctrl@4b0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/amlogic/meson-gxl.dtsi:717.14-743.4: Warning (unit_address_vs_reg): /soc/bus@c8834000/eth-phy-mux: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/amlogic/meson-gxl.dtsi:17.22-38.5: Warning (unit_address_vs_reg): /soc/usb@c9000000: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/amlogic/meson-gxl.dtsi:106.28-260.4: Warning (simple_bus_reg): /soc/bus@c8100000/pinctrl@14: missing or empty reg/ranges property
   arch/arm64/boot/dts/amlogic/meson-gx.dtsi:463.15-466.6: Warning (simple_bus_reg): /soc/bus@c8834000/rng: simple-bus unit address format error, expected "0"
   arch/arm64/boot/dts/amlogic/meson-gxl.dtsi:318.31-715.4: Warning (simple_bus_reg): /soc/bus@c8834000/pinctrl@4b0: missing or empty reg/ranges property
   arch/arm64/boot/dts/amlogic/meson-gxl.dtsi:717.14-743.4: Warning (simple_bus_reg): /soc/bus@c8834000/eth-phy-mux: simple-bus unit address format error, expected "55c"
   arch/arm64/boot/dts/amlogic/meson-gxl.dtsi:17.22-38.5: Warning (simple_bus_reg): /soc/usb@c9000000: missing or empty reg/ranges property
--
   arch/arm64/boot/dts/amlogic/meson-gx.dtsi:187.29-192.6: Warning (unit_address_vs_reg): /scpi/clocks/scpi_clocks@0: node has a unit name, but no reg or ranges property
>> arch/arm64/boot/dts/amlogic/meson-gxl.dtsi:106.28-260.4: Warning (unit_address_vs_reg): /soc/bus@c8100000/pinctrl@14: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/amlogic/meson-gx.dtsi:463.15-466.6: Warning (unit_address_vs_reg): /soc/bus@c8834000/rng: node has a reg or ranges property, but no unit name
>> arch/arm64/boot/dts/amlogic/meson-gxl.dtsi:318.31-715.4: Warning (unit_address_vs_reg): /soc/bus@c8834000/pinctrl@4b0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/amlogic/meson-gxl.dtsi:717.14-743.4: Warning (unit_address_vs_reg): /soc/bus@c8834000/eth-phy-mux: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/amlogic/meson-gxl.dtsi:17.22-38.5: Warning (unit_address_vs_reg): /soc/usb@c9000000: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/amlogic/meson-gxl.dtsi:106.28-260.4: Warning (simple_bus_reg): /soc/bus@c8100000/pinctrl@14: missing or empty reg/ranges property
   arch/arm64/boot/dts/amlogic/meson-gx.dtsi:463.15-466.6: Warning (simple_bus_reg): /soc/bus@c8834000/rng: simple-bus unit address format error, expected "0"
   arch/arm64/boot/dts/amlogic/meson-gxl.dtsi:318.31-715.4: Warning (simple_bus_reg): /soc/bus@c8834000/pinctrl@4b0: missing or empty reg/ranges property
   arch/arm64/boot/dts/amlogic/meson-gxl.dtsi:717.14-743.4: Warning (simple_bus_reg): /soc/bus@c8834000/eth-phy-mux: simple-bus unit address format error, expected "55c"
   arch/arm64/boot/dts/amlogic/meson-gxl.dtsi:17.22-38.5: Warning (simple_bus_reg): /soc/usb@c9000000: missing or empty reg/ranges property
--
   arch/arm64/boot/dts/amlogic/meson-gx.dtsi:187.29-192.6: Warning (unit_address_vs_reg): /scpi/clocks/scpi_clocks@0: node has a unit name, but no reg or ranges property
>> arch/arm64/boot/dts/amlogic/meson-gxl.dtsi:106.28-260.4: Warning (unit_address_vs_reg): /soc/bus@c8100000/pinctrl@14: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/amlogic/meson-gx.dtsi:463.15-466.6: Warning (unit_address_vs_reg): /soc/bus@c8834000/rng: node has a reg or ranges property, but no unit name
>> arch/arm64/boot/dts/amlogic/meson-gxl.dtsi:318.31-715.4: Warning (unit_address_vs_reg): /soc/bus@c8834000/pinctrl@4b0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/amlogic/meson-gxl.dtsi:717.14-743.4: Warning (unit_address_vs_reg): /soc/bus@c8834000/eth-phy-mux: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/amlogic/meson-gxl.dtsi:17.22-38.5: Warning (unit_address_vs_reg): /soc/usb@c9000000: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/amlogic/meson-gxl.dtsi:106.28-260.4: Warning (simple_bus_reg): /soc/bus@c8100000/pinctrl@14: missing or empty reg/ranges property
   arch/arm64/boot/dts/amlogic/meson-gx.dtsi:463.15-466.6: Warning (simple_bus_reg): /soc/bus@c8834000/rng: simple-bus unit address format error, expected "0"
   arch/arm64/boot/dts/amlogic/meson-gxl.dtsi:318.31-715.4: Warning (simple_bus_reg): /soc/bus@c8834000/pinctrl@4b0: missing or empty reg/ranges property
   arch/arm64/boot/dts/amlogic/meson-gxl.dtsi:717.14-743.4: Warning (simple_bus_reg): /soc/bus@c8834000/eth-phy-mux: simple-bus unit address format error, expected "55c"
   arch/arm64/boot/dts/amlogic/meson-gxl.dtsi:17.22-38.5: Warning (simple_bus_reg): /soc/usb@c9000000: missing or empty reg/ranges property
--
   arch/arm64/boot/dts/amlogic/meson-gx.dtsi:187.29-192.6: Warning (unit_address_vs_reg): /scpi/clocks/scpi_clocks@0: node has a unit name, but no reg or ranges property
>> arch/arm64/boot/dts/amlogic/meson-gxl.dtsi:106.28-260.4: Warning (unit_address_vs_reg): /soc/bus@c8100000/pinctrl@14: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/amlogic/meson-gx.dtsi:463.15-466.6: Warning (unit_address_vs_reg): /soc/bus@c8834000/rng: node has a reg or ranges property, but no unit name
>> arch/arm64/boot/dts/amlogic/meson-gxl.dtsi:318.31-715.4: Warning (unit_address_vs_reg): /soc/bus@c8834000/pinctrl@4b0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/amlogic/meson-gxl.dtsi:717.14-743.4: Warning (unit_address_vs_reg): /soc/bus@c8834000/eth-phy-mux: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/amlogic/meson-gxl.dtsi:17.22-38.5: Warning (unit_address_vs_reg): /soc/usb@c9000000: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/amlogic/meson-gxl.dtsi:106.28-260.4: Warning (simple_bus_reg): /soc/bus@c8100000/pinctrl@14: missing or empty reg/ranges property
   arch/arm64/boot/dts/amlogic/meson-gx.dtsi:463.15-466.6: Warning (simple_bus_reg): /soc/bus@c8834000/rng: simple-bus unit address format error, expected "0"
   arch/arm64/boot/dts/amlogic/meson-gxl.dtsi:318.31-715.4: Warning (simple_bus_reg): /soc/bus@c8834000/pinctrl@4b0: missing or empty reg/ranges property
   arch/arm64/boot/dts/amlogic/meson-gxl.dtsi:717.14-743.4: Warning (simple_bus_reg): /soc/bus@c8834000/eth-phy-mux: simple-bus unit address format error, expected "55c"
   arch/arm64/boot/dts/amlogic/meson-gxl.dtsi:17.22-38.5: Warning (simple_bus_reg): /soc/usb@c9000000: missing or empty reg/ranges property
--
   arch/arm64/boot/dts/amlogic/meson-gx.dtsi:187.29-192.6: Warning (unit_address_vs_reg): /scpi/clocks/scpi_clocks@0: node has a unit name, but no reg or ranges property
>> arch/arm64/boot/dts/amlogic/meson-gxl.dtsi:106.28-260.4: Warning (unit_address_vs_reg): /soc/bus@c8100000/pinctrl@14: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/amlogic/meson-gx.dtsi:463.15-466.6: Warning (unit_address_vs_reg): /soc/bus@c8834000/rng: node has a reg or ranges property, but no unit name
>> arch/arm64/boot/dts/amlogic/meson-gxl.dtsi:318.31-715.4: Warning (unit_address_vs_reg): /soc/bus@c8834000/pinctrl@4b0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/amlogic/meson-gxl.dtsi:717.14-743.4: Warning (unit_address_vs_reg): /soc/bus@c8834000/eth-phy-mux: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/amlogic/meson-gxl.dtsi:17.22-38.5: Warning (unit_address_vs_reg): /soc/usb@c9000000: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/amlogic/meson-gxl.dtsi:106.28-260.4: Warning (simple_bus_reg): /soc/bus@c8100000/pinctrl@14: missing or empty reg/ranges property
   arch/arm64/boot/dts/amlogic/meson-gx.dtsi:463.15-466.6: Warning (simple_bus_reg): /soc/bus@c8834000/rng: simple-bus unit address format error, expected "0"
   arch/arm64/boot/dts/amlogic/meson-gxl.dtsi:318.31-715.4: Warning (simple_bus_reg): /soc/bus@c8834000/pinctrl@4b0: missing or empty reg/ranges property
   arch/arm64/boot/dts/amlogic/meson-gxl.dtsi:717.14-743.4: Warning (simple_bus_reg): /soc/bus@c8834000/eth-phy-mux: simple-bus unit address format error, expected "55c"
   arch/arm64/boot/dts/amlogic/meson-gxl.dtsi:17.22-38.5: Warning (simple_bus_reg): /soc/usb@c9000000: missing or empty reg/ranges property
--
   arch/arm64/boot/dts/amlogic/meson-gx.dtsi:187.29-192.6: Warning (unit_address_vs_reg): /scpi/clocks/scpi_clocks@0: node has a unit name, but no reg or ranges property
>> arch/arm64/boot/dts/amlogic/meson-gxl.dtsi:106.28-260.4: Warning (unit_address_vs_reg): /soc/bus@c8100000/pinctrl@14: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/amlogic/meson-gx.dtsi:463.15-466.6: Warning (unit_address_vs_reg): /soc/bus@c8834000/rng: node has a reg or ranges property, but no unit name
>> arch/arm64/boot/dts/amlogic/meson-gxl.dtsi:318.31-715.4: Warning (unit_address_vs_reg): /soc/bus@c8834000/pinctrl@4b0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/amlogic/meson-gxl.dtsi:717.14-743.4: Warning (unit_address_vs_reg): /soc/bus@c8834000/eth-phy-mux: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/amlogic/meson-gxl.dtsi:17.22-38.5: Warning (unit_address_vs_reg): /soc/usb@c9000000: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/amlogic/meson-gxm-q200.dts:37.12-41.5: Warning (unit_address_vs_reg): /gpio-keys-polled/button@0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/amlogic/meson-gxl.dtsi:106.28-260.4: Warning (simple_bus_reg): /soc/bus@c8100000/pinctrl@14: missing or empty reg/ranges property
   arch/arm64/boot/dts/amlogic/meson-gx.dtsi:463.15-466.6: Warning (simple_bus_reg): /soc/bus@c8834000/rng: simple-bus unit address format error, expected "0"
   arch/arm64/boot/dts/amlogic/meson-gxl.dtsi:318.31-715.4: Warning (simple_bus_reg): /soc/bus@c8834000/pinctrl@4b0: missing or empty reg/ranges property
   arch/arm64/boot/dts/amlogic/meson-gxl.dtsi:717.14-743.4: Warning (simple_bus_reg): /soc/bus@c8834000/eth-phy-mux: simple-bus unit address format error, expected "55c"
   arch/arm64/boot/dts/amlogic/meson-gxl.dtsi:17.22-38.5: Warning (simple_bus_reg): /soc/usb@c9000000: missing or empty reg/ranges property
--
   arch/arm64/boot/dts/amlogic/meson-gx.dtsi:187.29-192.6: Warning (unit_address_vs_reg): /scpi/clocks/scpi_clocks@0: node has a unit name, but no reg or ranges property
>> arch/arm64/boot/dts/amlogic/meson-gxl.dtsi:106.28-260.4: Warning (unit_address_vs_reg): /soc/bus@c8100000/pinctrl@14: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/amlogic/meson-gx.dtsi:463.15-466.6: Warning (unit_address_vs_reg): /soc/bus@c8834000/rng: node has a reg or ranges property, but no unit name
>> arch/arm64/boot/dts/amlogic/meson-gxl.dtsi:318.31-715.4: Warning (unit_address_vs_reg): /soc/bus@c8834000/pinctrl@4b0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/amlogic/meson-gxl.dtsi:717.14-743.4: Warning (unit_address_vs_reg): /soc/bus@c8834000/eth-phy-mux: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/amlogic/meson-gxl.dtsi:17.22-38.5: Warning (unit_address_vs_reg): /soc/usb@c9000000: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/amlogic/meson-gxl.dtsi:106.28-260.4: Warning (simple_bus_reg): /soc/bus@c8100000/pinctrl@14: missing or empty reg/ranges property
   arch/arm64/boot/dts/amlogic/meson-gx.dtsi:463.15-466.6: Warning (simple_bus_reg): /soc/bus@c8834000/rng: simple-bus unit address format error, expected "0"
   arch/arm64/boot/dts/amlogic/meson-gxl.dtsi:318.31-715.4: Warning (simple_bus_reg): /soc/bus@c8834000/pinctrl@4b0: missing or empty reg/ranges property
   arch/arm64/boot/dts/amlogic/meson-gxl.dtsi:717.14-743.4: Warning (simple_bus_reg): /soc/bus@c8834000/eth-phy-mux: simple-bus unit address format error, expected "55c"
   arch/arm64/boot/dts/amlogic/meson-gxl.dtsi:17.22-38.5: Warning (simple_bus_reg): /soc/usb@c9000000: missing or empty reg/ranges property
--
   arch/arm64/boot/dts/amlogic/meson-gx.dtsi:187.29-192.6: Warning (unit_address_vs_reg): /scpi/clocks/scpi_clocks@0: node has a unit name, but no reg or ranges property
>> arch/arm64/boot/dts/amlogic/meson-gxl.dtsi:106.28-260.4: Warning (unit_address_vs_reg): /soc/bus@c8100000/pinctrl@14: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/amlogic/meson-gx.dtsi:463.15-466.6: Warning (unit_address_vs_reg): /soc/bus@c8834000/rng: node has a reg or ranges property, but no unit name
>> arch/arm64/boot/dts/amlogic/meson-gxl.dtsi:318.31-715.4: Warning (unit_address_vs_reg): /soc/bus@c8834000/pinctrl@4b0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/amlogic/meson-gxl.dtsi:717.14-743.4: Warning (unit_address_vs_reg): /soc/bus@c8834000/eth-phy-mux: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/amlogic/meson-gxl.dtsi:17.22-38.5: Warning (unit_address_vs_reg): /soc/usb@c9000000: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/amlogic/meson-gxl.dtsi:106.28-260.4: Warning (simple_bus_reg): /soc/bus@c8100000/pinctrl@14: missing or empty reg/ranges property
   arch/arm64/boot/dts/amlogic/meson-gx.dtsi:463.15-466.6: Warning (simple_bus_reg): /soc/bus@c8834000/rng: simple-bus unit address format error, expected "0"
   arch/arm64/boot/dts/amlogic/meson-gxl.dtsi:318.31-715.4: Warning (simple_bus_reg): /soc/bus@c8834000/pinctrl@4b0: missing or empty reg/ranges property
   arch/arm64/boot/dts/amlogic/meson-gxl.dtsi:717.14-743.4: Warning (simple_bus_reg): /soc/bus@c8834000/eth-phy-mux: simple-bus unit address format error, expected "55c"
   arch/arm64/boot/dts/amlogic/meson-gxl.dtsi:17.22-38.5: Warning (simple_bus_reg): /soc/usb@c9000000: missing or empty reg/ranges property
--
   arch/arm64/boot/dts/amlogic/meson-gx.dtsi:187.29-192.6: Warning (unit_address_vs_reg): /scpi/clocks/scpi_clocks@0: node has a unit name, but no reg or ranges property
>> arch/arm64/boot/dts/amlogic/meson-gxl.dtsi:106.28-260.4: Warning (unit_address_vs_reg): /soc/bus@c8100000/pinctrl@14: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/amlogic/meson-gx.dtsi:463.15-466.6: Warning (unit_address_vs_reg): /soc/bus@c8834000/rng: node has a reg or ranges property, but no unit name
>> arch/arm64/boot/dts/amlogic/meson-gxl.dtsi:318.31-715.4: Warning (unit_address_vs_reg): /soc/bus@c8834000/pinctrl@4b0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/amlogic/meson-gxl.dtsi:717.14-743.4: Warning (unit_address_vs_reg): /soc/bus@c8834000/eth-phy-mux: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/amlogic/meson-gxl.dtsi:17.22-38.5: Warning (unit_address_vs_reg): /soc/usb@c9000000: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/amlogic/meson-gxl.dtsi:106.28-260.4: Warning (simple_bus_reg): /soc/bus@c8100000/pinctrl@14: missing or empty reg/ranges property
   arch/arm64/boot/dts/amlogic/meson-gx.dtsi:463.15-466.6: Warning (simple_bus_reg): /soc/bus@c8834000/rng: simple-bus unit address format error, expected "0"
   arch/arm64/boot/dts/amlogic/meson-gxl.dtsi:318.31-715.4: Warning (simple_bus_reg): /soc/bus@c8834000/pinctrl@4b0: missing or empty reg/ranges property
--
>> arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:260.33-1436.7: Warning (unit_address_vs_reg): /soc/bus@ff600000/bus@34400/pinctrl@40: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:1628.28-1873.7: Warning (unit_address_vs_reg): /soc/bus@ff800000/sys-ctrl@0/pinctrl@14: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:123.17-176.5: Warning (simple_bus_reg): /soc/thermal-zones: missing or empty reg/ranges property
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:260.33-1436.7: Warning (simple_bus_reg): /soc/bus@ff600000/bus@34400/pinctrl@40: missing or empty reg/ranges property
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:1876.18-1879.6: Warning (simple_bus_reg): /soc/bus@ff800000/rtc@0a8: simple-bus unit address format error, expected "a8"
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:66.35-69.5: Warning (unique_unit_address): /reserved-memory/secmon@5000000: duplicate unit-address (also used in node /reserved-memory/bl32@5000000)
--
>> arch/arm64/boot/dts/amlogic/meson-a1.dtsi:85.34-100.6: Warning (unit_address_vs_reg): /soc/bus@fe000000/pinctrl@0400: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/amlogic/meson-a1.dtsi:91.21-98.7: Warning (unit_address_format): /soc/bus@fe000000/pinctrl@0400/bank@0400: unit name should not have leading 0s
   arch/arm64/boot/dts/amlogic/meson-a1.dtsi:85.34-100.6: Warning (simple_bus_reg): /soc/bus@fe000000/pinctrl@0400: missing or empty reg/ranges property
--
   arch/arm64/boot/dts/hisilicon/hi6220-hikey.dts:526.11-530.6: Warning (unit_address_vs_reg): /soc/i2c@f7102000/adv7533@39/ports/port@0: node has a unit name, but no reg or ranges property
>> arch/arm64/boot/dts/hisilicon/hi6220-hikey.dts:544.22-549.5: Warning (unit_address_vs_reg): /soc/i2s@f7118000/ports/port@0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/hisilicon/hi6220.dtsi:883.30-887.8: Warning (unit_address_vs_reg): /soc/thermal-zones/cls0/trips/trip-point@0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/hisilicon/hi6220.dtsi:889.27-893.8: Warning (unit_address_vs_reg): /soc/thermal-zones/cls0/trips/trip-point@1: node has a unit name, but no reg or ranges property
>> arch/arm64/boot/dts/hisilicon/hi6220-hikey.dts:502.25-504.6: Warning (unit_address_vs_reg): /soc/dsi@f4107800/ports/port@1/endpoint@0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/hisilicon/hi6220-hikey.dts:85.26-92.4: Warning (unit_address_vs_reg): /regulator@0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/hisilicon/hi6220-hikey.dts:94.27-102.4: Warning (unit_address_vs_reg): /regulator@1: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/hisilicon/hi6220-hikey.dts:104.26-113.4: Warning (unit_address_vs_reg): /regulator@2: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/hisilicon/hi6220.dtsi:297.26-303.5: Warning (simple_bus_reg): /soc/stub_clock: missing or empty reg/ranges property
   arch/arm64/boot/dts/hisilicon/hi6220.dtsi:770.19-775.5: Warning (simple_bus_reg): /soc/usbphy: missing or empty reg/ranges property
   arch/arm64/boot/dts/hisilicon/hi6220.dtsi:850.31-857.5: Warning (simple_bus_reg): /soc/tsensor@0,f7030700: simple-bus unit address format error, expected "f7030700"
   arch/arm64/boot/dts/hisilicon/hi6220.dtsi:872.17-910.5: Warning (simple_bus_reg): /soc/thermal-zones: missing or empty reg/ranges property
   arch/arm64/boot/dts/hisilicon/hi6220-coresight.dtsi:63.14-97.5: Warning (simple_bus_reg): /soc/replicator: missing or empty reg/ranges property
   arch/arm64/boot/dts/hisilicon/hi6220.dtsi:404.25-441.5: Warning (avoid_unnecessary_addr_size): /soc/pinmux@f7010000: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property

vim +217 arch/arm64/boot/dts/amlogic/meson-axg.dtsi

9d59b708500fcb Yixun Lan      2017-10-14   15  
9d59b708500fcb Yixun Lan      2017-10-14   16  / {
9d59b708500fcb Yixun Lan      2017-10-14   17  	compatible = "amlogic,meson-axg";
9d59b708500fcb Yixun Lan      2017-10-14   18  
9d59b708500fcb Yixun Lan      2017-10-14   19  	interrupt-parent = <&gic>;
9d59b708500fcb Yixun Lan      2017-10-14   20  	#address-cells = <2>;
9d59b708500fcb Yixun Lan      2017-10-14   21  	#size-cells = <2>;
9d59b708500fcb Yixun Lan      2017-10-14   22  
fbd5cbc5c9fb16 Jerome Brunet  2018-11-08   23  	tdmif_a: audio-controller-0 {
8c0cf40f06af01 Jerome Brunet  2018-08-29   24  		compatible = "amlogic,axg-tdm-iface";
8c0cf40f06af01 Jerome Brunet  2018-08-29   25  		#sound-dai-cells = <0>;
8c0cf40f06af01 Jerome Brunet  2018-08-29   26  		sound-name-prefix = "TDM_A";
8c0cf40f06af01 Jerome Brunet  2018-08-29   27  		clocks = <&clkc_audio AUD_CLKID_MST_A_MCLK>,
8c0cf40f06af01 Jerome Brunet  2018-08-29   28  			 <&clkc_audio AUD_CLKID_MST_A_SCLK>,
8c0cf40f06af01 Jerome Brunet  2018-08-29   29  			 <&clkc_audio AUD_CLKID_MST_A_LRCLK>;
8c0cf40f06af01 Jerome Brunet  2018-08-29   30  		clock-names = "mclk", "sclk", "lrclk";
8c0cf40f06af01 Jerome Brunet  2018-08-29   31  		status = "disabled";
8c0cf40f06af01 Jerome Brunet  2018-08-29   32  	};
9d59b708500fcb Yixun Lan      2017-10-14   33  
fbd5cbc5c9fb16 Jerome Brunet  2018-11-08   34  	tdmif_b: audio-controller-1 {
8c0cf40f06af01 Jerome Brunet  2018-08-29   35  		compatible = "amlogic,axg-tdm-iface";
8c0cf40f06af01 Jerome Brunet  2018-08-29   36  		#sound-dai-cells = <0>;
8c0cf40f06af01 Jerome Brunet  2018-08-29   37  		sound-name-prefix = "TDM_B";
8c0cf40f06af01 Jerome Brunet  2018-08-29   38  		clocks = <&clkc_audio AUD_CLKID_MST_B_MCLK>,
8c0cf40f06af01 Jerome Brunet  2018-08-29   39  			 <&clkc_audio AUD_CLKID_MST_B_SCLK>,
8c0cf40f06af01 Jerome Brunet  2018-08-29   40  			 <&clkc_audio AUD_CLKID_MST_B_LRCLK>;
8c0cf40f06af01 Jerome Brunet  2018-08-29   41  		clock-names = "mclk", "sclk", "lrclk";
8c0cf40f06af01 Jerome Brunet  2018-08-29   42  		status = "disabled";
9d59b708500fcb Yixun Lan      2017-10-14   43  	};
9d59b708500fcb Yixun Lan      2017-10-14   44  
fbd5cbc5c9fb16 Jerome Brunet  2018-11-08   45  	tdmif_c: audio-controller-2 {
8c0cf40f06af01 Jerome Brunet  2018-08-29   46  		compatible = "amlogic,axg-tdm-iface";
8c0cf40f06af01 Jerome Brunet  2018-08-29   47  		#sound-dai-cells = <0>;
8c0cf40f06af01 Jerome Brunet  2018-08-29   48  		sound-name-prefix = "TDM_C";
8c0cf40f06af01 Jerome Brunet  2018-08-29   49  		clocks = <&clkc_audio AUD_CLKID_MST_C_MCLK>,
8c0cf40f06af01 Jerome Brunet  2018-08-29   50  			 <&clkc_audio AUD_CLKID_MST_C_SCLK>,
8c0cf40f06af01 Jerome Brunet  2018-08-29   51  			 <&clkc_audio AUD_CLKID_MST_C_LRCLK>;
8c0cf40f06af01 Jerome Brunet  2018-08-29   52  		clock-names = "mclk", "sclk", "lrclk";
8c0cf40f06af01 Jerome Brunet  2018-08-29   53  		status = "disabled";
8c0cf40f06af01 Jerome Brunet  2018-08-29   54  	};
8c0cf40f06af01 Jerome Brunet  2018-08-29   55  
8c0cf40f06af01 Jerome Brunet  2018-08-29   56  	arm-pmu {
8c0cf40f06af01 Jerome Brunet  2018-08-29   57  		compatible = "arm,cortex-a53-pmu";
8c0cf40f06af01 Jerome Brunet  2018-08-29   58  		interrupts = <GIC_SPI 137 IRQ_TYPE_LEVEL_HIGH>,
8c0cf40f06af01 Jerome Brunet  2018-08-29   59  			     <GIC_SPI 138 IRQ_TYPE_LEVEL_HIGH>,
8c0cf40f06af01 Jerome Brunet  2018-08-29   60  			     <GIC_SPI 153 IRQ_TYPE_LEVEL_HIGH>,
8c0cf40f06af01 Jerome Brunet  2018-08-29   61  			     <GIC_SPI 154 IRQ_TYPE_LEVEL_HIGH>;
8c0cf40f06af01 Jerome Brunet  2018-08-29   62  		interrupt-affinity = <&cpu0>, <&cpu1>, <&cpu2>, <&cpu3>;
9d59b708500fcb Yixun Lan      2017-10-14   63  	};
9d59b708500fcb Yixun Lan      2017-10-14   64  
9d59b708500fcb Yixun Lan      2017-10-14   65  	cpus {
9d59b708500fcb Yixun Lan      2017-10-14   66  		#address-cells = <0x2>;
9d59b708500fcb Yixun Lan      2017-10-14   67  		#size-cells = <0x0>;
9d59b708500fcb Yixun Lan      2017-10-14   68  
9d59b708500fcb Yixun Lan      2017-10-14   69  		cpu0: cpu@0 {
9d59b708500fcb Yixun Lan      2017-10-14   70  			device_type = "cpu";
31af04cd60d316 Rob Herring    2019-01-14   71  			compatible = "arm,cortex-a53";
9d59b708500fcb Yixun Lan      2017-10-14   72  			reg = <0x0 0x0>;
9d59b708500fcb Yixun Lan      2017-10-14   73  			enable-method = "psci";
9d59b708500fcb Yixun Lan      2017-10-14   74  			next-level-cache = <&l2>;
2c130695ad5265 Jerome Brunet  2018-11-08   75  			clocks = <&scpi_dvfs 0>;
9d59b708500fcb Yixun Lan      2017-10-14   76  		};
9d59b708500fcb Yixun Lan      2017-10-14   77  
9d59b708500fcb Yixun Lan      2017-10-14   78  		cpu1: cpu@1 {
9d59b708500fcb Yixun Lan      2017-10-14   79  			device_type = "cpu";
31af04cd60d316 Rob Herring    2019-01-14   80  			compatible = "arm,cortex-a53";
9d59b708500fcb Yixun Lan      2017-10-14   81  			reg = <0x0 0x1>;
9d59b708500fcb Yixun Lan      2017-10-14   82  			enable-method = "psci";
9d59b708500fcb Yixun Lan      2017-10-14   83  			next-level-cache = <&l2>;
2c130695ad5265 Jerome Brunet  2018-11-08   84  			clocks = <&scpi_dvfs 0>;
9d59b708500fcb Yixun Lan      2017-10-14   85  		};
9d59b708500fcb Yixun Lan      2017-10-14   86  
9d59b708500fcb Yixun Lan      2017-10-14   87  		cpu2: cpu@2 {
9d59b708500fcb Yixun Lan      2017-10-14   88  			device_type = "cpu";
31af04cd60d316 Rob Herring    2019-01-14   89  			compatible = "arm,cortex-a53";
9d59b708500fcb Yixun Lan      2017-10-14   90  			reg = <0x0 0x2>;
9d59b708500fcb Yixun Lan      2017-10-14   91  			enable-method = "psci";
9d59b708500fcb Yixun Lan      2017-10-14   92  			next-level-cache = <&l2>;
2c130695ad5265 Jerome Brunet  2018-11-08   93  			clocks = <&scpi_dvfs 0>;
9d59b708500fcb Yixun Lan      2017-10-14   94  		};
9d59b708500fcb Yixun Lan      2017-10-14   95  
9d59b708500fcb Yixun Lan      2017-10-14   96  		cpu3: cpu@3 {
9d59b708500fcb Yixun Lan      2017-10-14   97  			device_type = "cpu";
31af04cd60d316 Rob Herring    2019-01-14   98  			compatible = "arm,cortex-a53";
9d59b708500fcb Yixun Lan      2017-10-14   99  			reg = <0x0 0x3>;
9d59b708500fcb Yixun Lan      2017-10-14  100  			enable-method = "psci";
9d59b708500fcb Yixun Lan      2017-10-14  101  			next-level-cache = <&l2>;
2c130695ad5265 Jerome Brunet  2018-11-08  102  			clocks = <&scpi_dvfs 0>;
9d59b708500fcb Yixun Lan      2017-10-14  103  		};
9d59b708500fcb Yixun Lan      2017-10-14  104  
9d59b708500fcb Yixun Lan      2017-10-14  105  		l2: l2-cache0 {
9d59b708500fcb Yixun Lan      2017-10-14  106  			compatible = "cache";
9d59b708500fcb Yixun Lan      2017-10-14  107  		};
9d59b708500fcb Yixun Lan      2017-10-14  108  	};
9d59b708500fcb Yixun Lan      2017-10-14  109  
96dc5702acbb20 Jerome Brunet  2018-11-08  110  	sm: secure-monitor {
96dc5702acbb20 Jerome Brunet  2018-11-08  111  		compatible = "amlogic,meson-gxbb-sm";
96dc5702acbb20 Jerome Brunet  2018-11-08  112  	};
96dc5702acbb20 Jerome Brunet  2018-11-08  113  
9ab2d15ce1c392 Jerome Brunet  2019-01-17  114  	efuse: efuse {
9ab2d15ce1c392 Jerome Brunet  2019-01-17  115  		compatible = "amlogic,meson-gxbb-efuse";
9ab2d15ce1c392 Jerome Brunet  2019-01-17  116  		clocks = <&clkc CLKID_EFUSE>;
9ab2d15ce1c392 Jerome Brunet  2019-01-17  117  		#address-cells = <1>;
9ab2d15ce1c392 Jerome Brunet  2019-01-17  118  		#size-cells = <1>;
9ab2d15ce1c392 Jerome Brunet  2019-01-17  119  		read-only;
de82e74a9f2631 Carlo Caione   2019-07-31  120  		secure-monitor = <&sm>;
9ab2d15ce1c392 Jerome Brunet  2019-01-17  121  	};
9ab2d15ce1c392 Jerome Brunet  2019-01-17  122  
9d59b708500fcb Yixun Lan      2017-10-14  123  	psci {
9d59b708500fcb Yixun Lan      2017-10-14  124  		compatible = "arm,psci-1.0";
9d59b708500fcb Yixun Lan      2017-10-14  125  		method = "smc";
9d59b708500fcb Yixun Lan      2017-10-14  126  	};
9d59b708500fcb Yixun Lan      2017-10-14  127  
8c0cf40f06af01 Jerome Brunet  2018-08-29  128  	reserved-memory {
8c0cf40f06af01 Jerome Brunet  2018-08-29  129  		#address-cells = <2>;
8c0cf40f06af01 Jerome Brunet  2018-08-29  130  		#size-cells = <2>;
8c0cf40f06af01 Jerome Brunet  2018-08-29  131  		ranges;
08307aabe0fb6d Jerome Brunet  2018-07-24  132  
8c0cf40f06af01 Jerome Brunet  2018-08-29  133  		/* 16 MiB reserved for Hardware ROM Firmware */
8c0cf40f06af01 Jerome Brunet  2018-08-29  134  		hwrom_reserved: hwrom@0 {
8c0cf40f06af01 Jerome Brunet  2018-08-29  135  			reg = <0x0 0x0 0x0 0x1000000>;
8c0cf40f06af01 Jerome Brunet  2018-08-29  136  			no-map;
9d59b708500fcb Yixun Lan      2017-10-14  137  		};
9d59b708500fcb Yixun Lan      2017-10-14  138  
8c0cf40f06af01 Jerome Brunet  2018-08-29  139  		/* Alternate 3 MiB reserved for ARM Trusted Firmware (BL31) */
8c0cf40f06af01 Jerome Brunet  2018-08-29  140  		secmon_reserved: secmon@5000000 {
8c0cf40f06af01 Jerome Brunet  2018-08-29  141  			reg = <0x0 0x05000000 0x0 0x300000>;
8c0cf40f06af01 Jerome Brunet  2018-08-29  142  			no-map;
9d59b708500fcb Yixun Lan      2017-10-14  143  		};
5e395e146667ef Yixun Lan      2018-03-28  144  	};
5e395e146667ef Yixun Lan      2018-03-28  145  
2c130695ad5265 Jerome Brunet  2018-11-08  146  	scpi {
2c130695ad5265 Jerome Brunet  2018-11-08  147  		compatible = "arm,scpi-pre-1.0";
2c130695ad5265 Jerome Brunet  2018-11-08  148  		mboxes = <&mailbox 1 &mailbox 2>;
2c130695ad5265 Jerome Brunet  2018-11-08  149  		shmem = <&cpu_scp_lpri &cpu_scp_hpri>;
2c130695ad5265 Jerome Brunet  2018-11-08  150  
2c130695ad5265 Jerome Brunet  2018-11-08  151  		scpi_clocks: clocks {
2c130695ad5265 Jerome Brunet  2018-11-08  152  			compatible = "arm,scpi-clocks";
2c130695ad5265 Jerome Brunet  2018-11-08  153  
2c130695ad5265 Jerome Brunet  2018-11-08  154  			scpi_dvfs: clock-controller {
2c130695ad5265 Jerome Brunet  2018-11-08  155  				compatible = "arm,scpi-dvfs-clocks";
2c130695ad5265 Jerome Brunet  2018-11-08  156  				#clock-cells = <1>;
2c130695ad5265 Jerome Brunet  2018-11-08  157  				clock-indices = <0>;
2c130695ad5265 Jerome Brunet  2018-11-08  158  				clock-output-names = "vcpu";
2c130695ad5265 Jerome Brunet  2018-11-08  159  			};
2c130695ad5265 Jerome Brunet  2018-11-08  160  		};
2c130695ad5265 Jerome Brunet  2018-11-08  161  
2c130695ad5265 Jerome Brunet  2018-11-08  162  		scpi_sensors: sensors {
2c130695ad5265 Jerome Brunet  2018-11-08  163  			compatible = "amlogic,meson-gxbb-scpi-sensors";
2c130695ad5265 Jerome Brunet  2018-11-08  164  			#thermal-sensor-cells = <1>;
2c130695ad5265 Jerome Brunet  2018-11-08  165  		};
2c130695ad5265 Jerome Brunet  2018-11-08  166  	};
2c130695ad5265 Jerome Brunet  2018-11-08  167  
9d59b708500fcb Yixun Lan      2017-10-14  168  	soc {
9d59b708500fcb Yixun Lan      2017-10-14  169  		compatible = "simple-bus";
9d59b708500fcb Yixun Lan      2017-10-14  170  		#address-cells = <2>;
9d59b708500fcb Yixun Lan      2017-10-14  171  		#size-cells = <2>;
9d59b708500fcb Yixun Lan      2017-10-14  172  		ranges;
9d59b708500fcb Yixun Lan      2017-10-14  173  
8c0cf40f06af01 Jerome Brunet  2018-08-29  174  		ethmac: ethernet@ff3f0000 {
9d63f5d1386ec4 Jerome Brunet  2019-05-24  175  			compatible = "amlogic,meson-axg-dwmac",
9d63f5d1386ec4 Jerome Brunet  2019-05-24  176  				     "snps,dwmac-3.70a",
9d63f5d1386ec4 Jerome Brunet  2019-05-24  177  				     "snps,dwmac";
3ad6c9e3575611 Neil Armstrong 2019-08-23  178  			reg = <0x0 0xff3f0000 0x0 0x10000>,
3ad6c9e3575611 Neil Armstrong 2019-08-23  179  			      <0x0 0xff634540 0x0 0x8>;
8b3e6f8999f8d7 Carlo Caione   2018-12-07  180  			interrupts = <GIC_SPI 8 IRQ_TYPE_LEVEL_HIGH>;
8c0cf40f06af01 Jerome Brunet  2018-08-29  181  			interrupt-names = "macirq";
8c0cf40f06af01 Jerome Brunet  2018-08-29  182  			clocks = <&clkc CLKID_ETH>,
8c0cf40f06af01 Jerome Brunet  2018-08-29  183  				 <&clkc CLKID_FCLK_DIV2>,
8c0cf40f06af01 Jerome Brunet  2018-08-29  184  				 <&clkc CLKID_MPLL2>;
8c0cf40f06af01 Jerome Brunet  2018-08-29  185  			clock-names = "stmmaceth", "clkin0", "clkin1";
ef68984eab6bbe Jerome Brunet  2019-07-18  186  			rx-fifo-depth = <4096>;
ef68984eab6bbe Jerome Brunet  2019-07-18  187  			tx-fifo-depth = <2048>;
221cf34bac5488 Nan Li         2018-04-08  188  			status = "disabled";
221cf34bac5488 Nan Li         2018-04-08  189  		};
221cf34bac5488 Nan Li         2018-04-08  190  
c362e4e0052a98 Jerome Brunet  2018-08-31  191  		pdm: audio-controller@ff632000 {
c362e4e0052a98 Jerome Brunet  2018-08-31  192  			compatible = "amlogic,axg-pdm";
c362e4e0052a98 Jerome Brunet  2018-08-31  193  			reg = <0x0 0xff632000 0x0 0x34>;
c362e4e0052a98 Jerome Brunet  2018-08-31  194  			#sound-dai-cells = <0>;
c362e4e0052a98 Jerome Brunet  2018-08-31  195  			sound-name-prefix = "PDM";
c362e4e0052a98 Jerome Brunet  2018-08-31  196  			clocks = <&clkc_audio AUD_CLKID_PDM>,
c362e4e0052a98 Jerome Brunet  2018-08-31  197  				 <&clkc_audio AUD_CLKID_PDM_DCLK>,
c362e4e0052a98 Jerome Brunet  2018-08-31  198  				 <&clkc_audio AUD_CLKID_PDM_SYSCLK>;
c362e4e0052a98 Jerome Brunet  2018-08-31  199  			clock-names = "pclk", "dclk", "sysclk";
c362e4e0052a98 Jerome Brunet  2018-08-31  200  			status = "disabled";
c362e4e0052a98 Jerome Brunet  2018-08-31  201  		};
c362e4e0052a98 Jerome Brunet  2018-08-31  202  
8c0cf40f06af01 Jerome Brunet  2018-08-29  203  		periphs: bus@ff634000 {
8909e72270f20f Jerome Brunet  2018-07-16  204  			compatible = "simple-bus";
8c0cf40f06af01 Jerome Brunet  2018-08-29  205  			reg = <0x0 0xff634000 0x0 0x2000>;
8909e72270f20f Jerome Brunet  2018-07-16  206  			#address-cells = <2>;
8909e72270f20f Jerome Brunet  2018-07-16  207  			#size-cells = <2>;
8c0cf40f06af01 Jerome Brunet  2018-08-29  208  			ranges = <0x0 0x0 0x0 0xff634000 0x0 0x2000>;
8909e72270f20f Jerome Brunet  2018-07-16  209  
8c0cf40f06af01 Jerome Brunet  2018-08-29  210  			hwrng: rng@18 {
8c0cf40f06af01 Jerome Brunet  2018-08-29  211  				compatible = "amlogic,meson-rng";
8c0cf40f06af01 Jerome Brunet  2018-08-29  212  				reg = <0x0 0x18 0x0 0x4>;
8c0cf40f06af01 Jerome Brunet  2018-08-29  213  				clocks = <&clkc CLKID_RNG0>;
8c0cf40f06af01 Jerome Brunet  2018-08-29  214  				clock-names = "core";
8c0cf40f06af01 Jerome Brunet  2018-08-29  215  			};
8909e72270f20f Jerome Brunet  2018-07-16  216  
8c0cf40f06af01 Jerome Brunet  2018-08-29 @217  			pinctrl_periphs: pinctrl@480 {

:::::: The code at line 217 was first introduced by commit
:::::: 8c0cf40f06af01eb3e14b19ec29f384b5030a85e arm64: dts: meson-axg: sort nodes consistently

:::::: TO: Jerome Brunet <jbrunet@baylibre.com>
:::::: CC: Kevin Hilman <khilman@baylibre.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
