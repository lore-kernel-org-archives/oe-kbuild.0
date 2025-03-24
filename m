Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D4171CD1E4
	for <oe-kbuild@lists.linux.dev>; Mon, 24 Mar 2025 17:08:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742836145; cv=none; b=Fu82AactwiQZyfl4Altb1BO+A+s5RKLT11wlHQ+XR1nz4/f4FL5TChYSflx2R0JWKbc3Gq4Of524tfDVPwp/cDo/yP0Bgh3zYm2ewrQSx2GyVNuwJRWsDxD7nDl4MYNjDUZIgK8kaDUXEJdoRAvGmkqId4hjkHS4zPmjUwkeNac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742836145; c=relaxed/simple;
	bh=4/4Fq87GHN8j6MwBGGGrZYvQ2dDD7hDRati5JCqb+74=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=JwEXydfmKscY4nkz3oNttoS7BmUqmI1rfm7Fv+CA+RyvLja/Q2XrotV97U4TJldtp1jmI/e36C4vPsK+58vFumAVzyDAV/NS4r6o/bqYnOuZE/+hFsqkuqzqrMRM1cB3nhqLKVQlyEtWsdO+qfguO3KSR6CjWCwr1ZE2PqTtjyc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=a9ysHI7l; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="a9ysHI7l"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742836136; x=1774372136;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=4/4Fq87GHN8j6MwBGGGrZYvQ2dDD7hDRati5JCqb+74=;
  b=a9ysHI7lx1FaflUhNdVVvK0XsCPLO1Ogg5JERVi70ICPHlzHWUqqiRkk
   jY16/ySYj2z8PZI863XJ5x0z79K3LwGxJQyJVUPxGzBhwwyxZVb7fb/dQ
   hDl0vRCAIpnaD5VrHjBx0+nVphW1BNmLkL2TkswL8y2onvqvSJeVdS4EQ
   dYGa22LkecCdh2d9WP/eT2japFrZ9I7LRv6WB1z3+WWvewoPbHDP0DpvY
   VOTXXIJUKyMi0Cj+yH3TA8SgU9xIR6iftBdvBS1hYVkiS1HVUVy/R3ARd
   U4GELrR+nnpZuFGUdV3rl777QvHswMseh2RBMPAFLZgFF/0kGuAeg6Qvv
   A==;
X-CSE-ConnectionGUID: RqpqSgvqTm+0mW+JFvEMqA==
X-CSE-MsgGUID: F2tpEUiPSn6d4k+X5rge4g==
X-IronPort-AV: E=McAfee;i="6700,10204,11383"; a="43213541"
X-IronPort-AV: E=Sophos;i="6.14,272,1736841600"; 
   d="scan'208";a="43213541"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Mar 2025 10:08:38 -0700
X-CSE-ConnectionGUID: daWGIgKLSIaI5s7nsny/kw==
X-CSE-MsgGUID: RA2amXImTQWE822haTBPpQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,272,1736841600"; 
   d="scan'208";a="155129391"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 24 Mar 2025 10:08:36 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1twlHt-0003nV-2U;
	Mon, 24 Mar 2025 17:08:33 +0000
Date: Tue, 25 Mar 2025 01:08:02 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [soc:mvebu/dt64 12/12]
 arch/arm64/boot/dts/marvell/armada-3720-db.dtb:
 /soc/bus@d0000000/watchdog@8300: failed to match any schema with compatible:
 ['marvell,armada-3700-wdt']
Message-ID: <202503250145.wOMBTk20-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "dtcheck: binding changes may go via different trees"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-arm-kernel@lists.infradead.org
CC: arm@kernel.org
TO: "Rob Herring (Arm)" <robh@kernel.org>
CC: Gregory CLEMENT <gregory.clement@bootlin.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git mvebu/dt64
head:   ed9c2b28ebef3333f25cefdc2ef37ee1f05cad95
commit: ed9c2b28ebef3333f25cefdc2ef37ee1f05cad95 [12/12] arm64: dts: marvell: Use preferred node names for "simple-bus"
:::::: branch date: 9 days ago
:::::: commit date: 9 days ago
config: arm64-randconfig-051-20250317 (https://download.01.org/0day-ci/archive/20250325/202503250145.wOMBTk20-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
dtschema version: 2025.3.dev5+g0f9dc23
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250325/202503250145.wOMBTk20-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202503250145.wOMBTk20-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/marvell/armada-3720-db.dtb: /soc/bus@d0000000/watchdog@8300: failed to match any schema with compatible: ['marvell,armada-3700-wdt']
>> arch/arm64/boot/dts/marvell/armada-3720-db.dtb: /soc/bus@d0000000/serial@12000: failed to match any schema with compatible: ['marvell,armada-3700-uart']
>> arch/arm64/boot/dts/marvell/armada-3720-db.dtb: /soc/bus@d0000000/serial@12200: failed to match any schema with compatible: ['marvell,armada-3700-uart-ext']
>> arch/arm64/boot/dts/marvell/armada-3720-db.dtb: /soc/bus@d0000000/nb-periph-clk@13000: failed to match any schema with compatible: ['marvell,armada-3700-periph-clock-nb', 'syscon']
>> arch/arm64/boot/dts/marvell/armada-3720-db.dtb: /soc/bus@d0000000/sb-periph-clk@18000: failed to match any schema with compatible: ['marvell,armada-3700-periph-clock-sb']
>> arch/arm64/boot/dts/marvell/armada-3720-db.dtb: /soc/bus@d0000000/tbg@13200: failed to match any schema with compatible: ['marvell,armada-3700-tbg-clock']
   arch/arm64/boot/dts/marvell/armada-3720-db.dtb: pinctrl@13800: reg: [[79872, 256], [80896, 32]] is too long
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
>> arch/arm64/boot/dts/marvell/armada-3720-db.dtb: /soc/bus@d0000000/pinctrl@13800: failed to match any schema with compatible: ['marvell,armada3710-nb-pinctrl', 'syscon', 'simple-mfd']
>> arch/arm64/boot/dts/marvell/armada-3720-db.dtb: /soc/bus@d0000000/pinctrl@13800/xtal-clk: failed to match any schema with compatible: ['marvell,armada-3700-xtal-clock']
>> arch/arm64/boot/dts/marvell/armada-3720-db.dtb: /soc/bus@d0000000/phy@18300: failed to match any schema with compatible: ['marvell,comphy-a3700']
   arch/arm64/boot/dts/marvell/armada-3720-db.dtb: pinctrl@18800: reg: [[100352, 256], [101376, 32]] is too long
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
>> arch/arm64/boot/dts/marvell/armada-3720-db.dtb: /soc/bus@d0000000/pinctrl@18800: failed to match any schema with compatible: ['marvell,armada3710-sb-pinctrl', 'syscon', 'simple-mfd']
>> arch/arm64/boot/dts/marvell/armada-3720-db.dtb: /soc/bus@d0000000/ethernet@30000: failed to match any schema with compatible: ['marvell,armada-3700-neta']
   arch/arm64/boot/dts/marvell/armada-3720-db.dtb: /soc/bus@d0000000/ethernet@40000: failed to match any schema with compatible: ['marvell,armada-3700-neta']
   arch/arm64/boot/dts/marvell/armada-3720-db.dtb: usb@58000: Unevaluated properties are not allowed ('marvell,usb-misc-reg' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/generic-xhci.yaml#
>> arch/arm64/boot/dts/marvell/armada-3720-db.dtb: /soc/bus@d0000000/system-controller@5d800: failed to match any schema with compatible: ['marvell,armada-3700-usb2-host-device-misc', 'syscon']
   arch/arm64/boot/dts/marvell/armada-3720-db.dtb: usb@5e000: phy-names:0: 'usb' was expected
   	from schema $id: http://devicetree.org/schemas/usb/generic-ehci.yaml#
   arch/arm64/boot/dts/marvell/armada-3720-db.dtb: usb@5e000: Unevaluated properties are not allowed ('marvell,usb-misc-reg' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/generic-ehci.yaml#
>> arch/arm64/boot/dts/marvell/armada-3720-db.dtb: /soc/bus@d0000000/xor@60900: failed to match any schema with compatible: ['marvell,armada-3700-xor']
>> arch/arm64/boot/dts/marvell/armada-3720-db.dtb: /soc/bus@d0000000/mailbox@b0000: failed to match any schema with compatible: ['marvell,armada-3700-rwtm-mailbox']
   arch/arm64/boot/dts/marvell/armada-3720-db.dtb: /soc/pcie@d0070000: failed to match any schema with compatible: ['marvell,armada-3700-pcie']
   arch/arm64/boot/dts/marvell/armada-3720-db.dtb: /firmware/armada-3700-rwtm: failed to match any schema with compatible: ['marvell,armada-3700-rwtm-firmware']
   arch/arm64/boot/dts/marvell/armada-3720-db.dtb: usb3-phy: '#phy-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/usb/usb-nop-xceiv.yaml#
--
>> arch/arm64/boot/dts/marvell/armada-3720-eDPU.dtb: /soc/bus@d0000000/watchdog@8300: failed to match any schema with compatible: ['marvell,armada-3700-wdt']
>> arch/arm64/boot/dts/marvell/armada-3720-eDPU.dtb: /soc/bus@d0000000/serial@12000: failed to match any schema with compatible: ['marvell,armada-3700-uart']
>> arch/arm64/boot/dts/marvell/armada-3720-eDPU.dtb: /soc/bus@d0000000/serial@12200: failed to match any schema with compatible: ['marvell,armada-3700-uart-ext']
>> arch/arm64/boot/dts/marvell/armada-3720-eDPU.dtb: /soc/bus@d0000000/nb-periph-clk@13000: failed to match any schema with compatible: ['marvell,armada-3700-periph-clock-nb', 'syscon']
>> arch/arm64/boot/dts/marvell/armada-3720-eDPU.dtb: /soc/bus@d0000000/sb-periph-clk@18000: failed to match any schema with compatible: ['marvell,armada-3700-periph-clock-sb']
>> arch/arm64/boot/dts/marvell/armada-3720-eDPU.dtb: /soc/bus@d0000000/tbg@13200: failed to match any schema with compatible: ['marvell,armada-3700-tbg-clock']
   arch/arm64/boot/dts/marvell/armada-3720-eDPU.dtb: pinctrl@13800: reg: [[79872, 256], [80896, 32]] is too long
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
>> arch/arm64/boot/dts/marvell/armada-3720-eDPU.dtb: /soc/bus@d0000000/pinctrl@13800: failed to match any schema with compatible: ['marvell,armada3710-nb-pinctrl', 'syscon', 'simple-mfd']
>> arch/arm64/boot/dts/marvell/armada-3720-eDPU.dtb: /soc/bus@d0000000/pinctrl@13800/xtal-clk: failed to match any schema with compatible: ['marvell,armada-3700-xtal-clock']
>> arch/arm64/boot/dts/marvell/armada-3720-eDPU.dtb: /soc/bus@d0000000/phy@18300: failed to match any schema with compatible: ['marvell,comphy-a3700']
   arch/arm64/boot/dts/marvell/armada-3720-eDPU.dtb: pinctrl@18800: reg: [[100352, 256], [101376, 32]] is too long
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
>> arch/arm64/boot/dts/marvell/armada-3720-eDPU.dtb: /soc/bus@d0000000/pinctrl@18800: failed to match any schema with compatible: ['marvell,armada3710-sb-pinctrl', 'syscon', 'simple-mfd']
>> arch/arm64/boot/dts/marvell/armada-3720-eDPU.dtb: /soc/bus@d0000000/ethernet@30000: failed to match any schema with compatible: ['marvell,armada-3700-neta']
   arch/arm64/boot/dts/marvell/armada-3720-eDPU.dtb: /soc/bus@d0000000/ethernet@40000: failed to match any schema with compatible: ['marvell,armada-3700-neta']
   arch/arm64/boot/dts/marvell/armada-3720-eDPU.dtb: usb@58000: Unevaluated properties are not allowed ('marvell,usb-misc-reg' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/generic-xhci.yaml#
>> arch/arm64/boot/dts/marvell/armada-3720-eDPU.dtb: /soc/bus@d0000000/system-controller@5d800: failed to match any schema with compatible: ['marvell,armada-3700-usb2-host-device-misc', 'syscon']
   arch/arm64/boot/dts/marvell/armada-3720-eDPU.dtb: usb@5e000: phy-names:0: 'usb' was expected
   	from schema $id: http://devicetree.org/schemas/usb/generic-ehci.yaml#
>> arch/arm64/boot/dts/marvell/armada-3720-eDPU.dtb: /soc/bus@d0000000/xor@60900: failed to match any schema with compatible: ['marvell,armada-3700-xor']
>> arch/arm64/boot/dts/marvell/armada-3720-eDPU.dtb: /soc/bus@d0000000/mailbox@b0000: failed to match any schema with compatible: ['marvell,armada-3700-rwtm-mailbox']
   arch/arm64/boot/dts/marvell/armada-3720-eDPU.dtb: /soc/pcie@d0070000: failed to match any schema with compatible: ['marvell,armada-3700-pcie']
   arch/arm64/boot/dts/marvell/armada-3720-eDPU.dtb: /firmware/armada-3700-rwtm: failed to match any schema with compatible: ['marvell,armada-3700-rwtm-firmware']
--
>> arch/arm64/boot/dts/marvell/armada-3720-espressobin.dtb: /soc/bus@d0000000/watchdog@8300: failed to match any schema with compatible: ['marvell,armada-3700-wdt']
>> arch/arm64/boot/dts/marvell/armada-3720-espressobin.dtb: /soc/bus@d0000000/serial@12000: failed to match any schema with compatible: ['marvell,armada-3700-uart']
>> arch/arm64/boot/dts/marvell/armada-3720-espressobin.dtb: /soc/bus@d0000000/serial@12200: failed to match any schema with compatible: ['marvell,armada-3700-uart-ext']
>> arch/arm64/boot/dts/marvell/armada-3720-espressobin.dtb: /soc/bus@d0000000/nb-periph-clk@13000: failed to match any schema with compatible: ['marvell,armada-3700-periph-clock-nb', 'syscon']
>> arch/arm64/boot/dts/marvell/armada-3720-espressobin.dtb: /soc/bus@d0000000/sb-periph-clk@18000: failed to match any schema with compatible: ['marvell,armada-3700-periph-clock-sb']
>> arch/arm64/boot/dts/marvell/armada-3720-espressobin.dtb: /soc/bus@d0000000/tbg@13200: failed to match any schema with compatible: ['marvell,armada-3700-tbg-clock']
   arch/arm64/boot/dts/marvell/armada-3720-espressobin.dtb: pinctrl@13800: reg: [[79872, 256], [80896, 32]] is too long
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
>> arch/arm64/boot/dts/marvell/armada-3720-espressobin.dtb: /soc/bus@d0000000/pinctrl@13800: failed to match any schema with compatible: ['marvell,armada3710-nb-pinctrl', 'syscon', 'simple-mfd']
>> arch/arm64/boot/dts/marvell/armada-3720-espressobin.dtb: /soc/bus@d0000000/pinctrl@13800/xtal-clk: failed to match any schema with compatible: ['marvell,armada-3700-xtal-clock']
>> arch/arm64/boot/dts/marvell/armada-3720-espressobin.dtb: /soc/bus@d0000000/phy@18300: failed to match any schema with compatible: ['marvell,comphy-a3700']
   arch/arm64/boot/dts/marvell/armada-3720-espressobin.dtb: pinctrl@18800: reg: [[100352, 256], [101376, 32]] is too long
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
>> arch/arm64/boot/dts/marvell/armada-3720-espressobin.dtb: /soc/bus@d0000000/pinctrl@18800: failed to match any schema with compatible: ['marvell,armada3710-sb-pinctrl', 'syscon', 'simple-mfd']
>> arch/arm64/boot/dts/marvell/armada-3720-espressobin.dtb: /soc/bus@d0000000/ethernet@30000: failed to match any schema with compatible: ['marvell,armada-3700-neta']
   arch/arm64/boot/dts/marvell/armada-3720-espressobin.dtb: /soc/bus@d0000000/ethernet@40000: failed to match any schema with compatible: ['marvell,armada-3700-neta']
   arch/arm64/boot/dts/marvell/armada-3720-espressobin.dtb: usb@58000: Unevaluated properties are not allowed ('marvell,usb-misc-reg' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/generic-xhci.yaml#
>> arch/arm64/boot/dts/marvell/armada-3720-espressobin.dtb: /soc/bus@d0000000/system-controller@5d800: failed to match any schema with compatible: ['marvell,armada-3700-usb2-host-device-misc', 'syscon']
   arch/arm64/boot/dts/marvell/armada-3720-espressobin.dtb: usb@5e000: phy-names:0: 'usb' was expected
   	from schema $id: http://devicetree.org/schemas/usb/generic-ehci.yaml#
   arch/arm64/boot/dts/marvell/armada-3720-espressobin.dtb: usb@5e000: Unevaluated properties are not allowed ('marvell,usb-misc-reg' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/generic-ehci.yaml#
>> arch/arm64/boot/dts/marvell/armada-3720-espressobin.dtb: /soc/bus@d0000000/xor@60900: failed to match any schema with compatible: ['marvell,armada-3700-xor']
>> arch/arm64/boot/dts/marvell/armada-3720-espressobin.dtb: /soc/bus@d0000000/mailbox@b0000: failed to match any schema with compatible: ['marvell,armada-3700-rwtm-mailbox']
   arch/arm64/boot/dts/marvell/armada-3720-espressobin.dtb: /soc/pcie@d0070000: failed to match any schema with compatible: ['marvell,armada-3700-pcie']
   arch/arm64/boot/dts/marvell/armada-3720-espressobin.dtb: /firmware/armada-3700-rwtm: failed to match any schema with compatible: ['marvell,armada-3700-rwtm-firmware']
--
>> arch/arm64/boot/dts/marvell/armada-3720-espressobin-emmc.dtb: /soc/bus@d0000000/watchdog@8300: failed to match any schema with compatible: ['marvell,armada-3700-wdt']
>> arch/arm64/boot/dts/marvell/armada-3720-espressobin-emmc.dtb: /soc/bus@d0000000/serial@12000: failed to match any schema with compatible: ['marvell,armada-3700-uart']
>> arch/arm64/boot/dts/marvell/armada-3720-espressobin-emmc.dtb: /soc/bus@d0000000/serial@12200: failed to match any schema with compatible: ['marvell,armada-3700-uart-ext']
>> arch/arm64/boot/dts/marvell/armada-3720-espressobin-emmc.dtb: /soc/bus@d0000000/nb-periph-clk@13000: failed to match any schema with compatible: ['marvell,armada-3700-periph-clock-nb', 'syscon']
>> arch/arm64/boot/dts/marvell/armada-3720-espressobin-emmc.dtb: /soc/bus@d0000000/sb-periph-clk@18000: failed to match any schema with compatible: ['marvell,armada-3700-periph-clock-sb']
>> arch/arm64/boot/dts/marvell/armada-3720-espressobin-emmc.dtb: /soc/bus@d0000000/tbg@13200: failed to match any schema with compatible: ['marvell,armada-3700-tbg-clock']
   arch/arm64/boot/dts/marvell/armada-3720-espressobin-emmc.dtb: pinctrl@13800: reg: [[79872, 256], [80896, 32]] is too long
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
>> arch/arm64/boot/dts/marvell/armada-3720-espressobin-emmc.dtb: /soc/bus@d0000000/pinctrl@13800: failed to match any schema with compatible: ['marvell,armada3710-nb-pinctrl', 'syscon', 'simple-mfd']
>> arch/arm64/boot/dts/marvell/armada-3720-espressobin-emmc.dtb: /soc/bus@d0000000/pinctrl@13800/xtal-clk: failed to match any schema with compatible: ['marvell,armada-3700-xtal-clock']
>> arch/arm64/boot/dts/marvell/armada-3720-espressobin-emmc.dtb: /soc/bus@d0000000/phy@18300: failed to match any schema with compatible: ['marvell,comphy-a3700']
   arch/arm64/boot/dts/marvell/armada-3720-espressobin-emmc.dtb: pinctrl@18800: reg: [[100352, 256], [101376, 32]] is too long
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
>> arch/arm64/boot/dts/marvell/armada-3720-espressobin-emmc.dtb: /soc/bus@d0000000/pinctrl@18800: failed to match any schema with compatible: ['marvell,armada3710-sb-pinctrl', 'syscon', 'simple-mfd']
>> arch/arm64/boot/dts/marvell/armada-3720-espressobin-emmc.dtb: /soc/bus@d0000000/ethernet@30000: failed to match any schema with compatible: ['marvell,armada-3700-neta']
   arch/arm64/boot/dts/marvell/armada-3720-espressobin-emmc.dtb: /soc/bus@d0000000/ethernet@40000: failed to match any schema with compatible: ['marvell,armada-3700-neta']
   arch/arm64/boot/dts/marvell/armada-3720-espressobin-emmc.dtb: usb@58000: Unevaluated properties are not allowed ('marvell,usb-misc-reg' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/generic-xhci.yaml#
>> arch/arm64/boot/dts/marvell/armada-3720-espressobin-emmc.dtb: /soc/bus@d0000000/system-controller@5d800: failed to match any schema with compatible: ['marvell,armada-3700-usb2-host-device-misc', 'syscon']
   arch/arm64/boot/dts/marvell/armada-3720-espressobin-emmc.dtb: usb@5e000: phy-names:0: 'usb' was expected
   	from schema $id: http://devicetree.org/schemas/usb/generic-ehci.yaml#
   arch/arm64/boot/dts/marvell/armada-3720-espressobin-emmc.dtb: usb@5e000: Unevaluated properties are not allowed ('marvell,usb-misc-reg' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/generic-ehci.yaml#
>> arch/arm64/boot/dts/marvell/armada-3720-espressobin-emmc.dtb: /soc/bus@d0000000/xor@60900: failed to match any schema with compatible: ['marvell,armada-3700-xor']
>> arch/arm64/boot/dts/marvell/armada-3720-espressobin-emmc.dtb: /soc/bus@d0000000/mailbox@b0000: failed to match any schema with compatible: ['marvell,armada-3700-rwtm-mailbox']
   arch/arm64/boot/dts/marvell/armada-3720-espressobin-emmc.dtb: /soc/pcie@d0070000: failed to match any schema with compatible: ['marvell,armada-3700-pcie']
   arch/arm64/boot/dts/marvell/armada-3720-espressobin-emmc.dtb: /firmware/armada-3700-rwtm: failed to match any schema with compatible: ['marvell,armada-3700-rwtm-firmware']
--
>> arch/arm64/boot/dts/marvell/armada-3720-espressobin-ultra.dtb: /soc/bus@d0000000/watchdog@8300: failed to match any schema with compatible: ['marvell,armada-3700-wdt']
>> arch/arm64/boot/dts/marvell/armada-3720-espressobin-ultra.dtb: /soc/bus@d0000000/serial@12000: failed to match any schema with compatible: ['marvell,armada-3700-uart']
>> arch/arm64/boot/dts/marvell/armada-3720-espressobin-ultra.dtb: /soc/bus@d0000000/serial@12200: failed to match any schema with compatible: ['marvell,armada-3700-uart-ext']
>> arch/arm64/boot/dts/marvell/armada-3720-espressobin-ultra.dtb: /soc/bus@d0000000/nb-periph-clk@13000: failed to match any schema with compatible: ['marvell,armada-3700-periph-clock-nb', 'syscon']
>> arch/arm64/boot/dts/marvell/armada-3720-espressobin-ultra.dtb: /soc/bus@d0000000/sb-periph-clk@18000: failed to match any schema with compatible: ['marvell,armada-3700-periph-clock-sb']
>> arch/arm64/boot/dts/marvell/armada-3720-espressobin-ultra.dtb: /soc/bus@d0000000/tbg@13200: failed to match any schema with compatible: ['marvell,armada-3700-tbg-clock']
   arch/arm64/boot/dts/marvell/armada-3720-espressobin-ultra.dtb: pinctrl@13800: reg: [[79872, 256], [80896, 32]] is too long
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
>> arch/arm64/boot/dts/marvell/armada-3720-espressobin-ultra.dtb: /soc/bus@d0000000/pinctrl@13800: failed to match any schema with compatible: ['marvell,armada3710-nb-pinctrl', 'syscon', 'simple-mfd']
>> arch/arm64/boot/dts/marvell/armada-3720-espressobin-ultra.dtb: /soc/bus@d0000000/pinctrl@13800/xtal-clk: failed to match any schema with compatible: ['marvell,armada-3700-xtal-clock']
>> arch/arm64/boot/dts/marvell/armada-3720-espressobin-ultra.dtb: /soc/bus@d0000000/phy@18300: failed to match any schema with compatible: ['marvell,comphy-a3700']
   arch/arm64/boot/dts/marvell/armada-3720-espressobin-ultra.dtb: pinctrl@18800: reg: [[100352, 256], [101376, 32]] is too long
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
>> arch/arm64/boot/dts/marvell/armada-3720-espressobin-ultra.dtb: /soc/bus@d0000000/pinctrl@18800: failed to match any schema with compatible: ['marvell,armada3710-sb-pinctrl', 'syscon', 'simple-mfd']
>> arch/arm64/boot/dts/marvell/armada-3720-espressobin-ultra.dtb: /soc/bus@d0000000/ethernet@30000: failed to match any schema with compatible: ['marvell,armada-3700-neta']
   arch/arm64/boot/dts/marvell/armada-3720-espressobin-ultra.dtb: /soc/bus@d0000000/ethernet@40000: failed to match any schema with compatible: ['marvell,armada-3700-neta']
   arch/arm64/boot/dts/marvell/armada-3720-espressobin-ultra.dtb: usb@58000: Unevaluated properties are not allowed ('marvell,usb-misc-reg' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/generic-xhci.yaml#
>> arch/arm64/boot/dts/marvell/armada-3720-espressobin-ultra.dtb: /soc/bus@d0000000/system-controller@5d800: failed to match any schema with compatible: ['marvell,armada-3700-usb2-host-device-misc', 'syscon']
   arch/arm64/boot/dts/marvell/armada-3720-espressobin-ultra.dtb: usb@5e000: phy-names:0: 'usb' was expected
   	from schema $id: http://devicetree.org/schemas/usb/generic-ehci.yaml#
   arch/arm64/boot/dts/marvell/armada-3720-espressobin-ultra.dtb: usb@5e000: Unevaluated properties are not allowed ('marvell,usb-misc-reg' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/generic-ehci.yaml#
>> arch/arm64/boot/dts/marvell/armada-3720-espressobin-ultra.dtb: /soc/bus@d0000000/xor@60900: failed to match any schema with compatible: ['marvell,armada-3700-xor']
>> arch/arm64/boot/dts/marvell/armada-3720-espressobin-ultra.dtb: /soc/bus@d0000000/mailbox@b0000: failed to match any schema with compatible: ['marvell,armada-3700-rwtm-mailbox']
   arch/arm64/boot/dts/marvell/armada-3720-espressobin-ultra.dtb: /soc/pcie@d0070000: failed to match any schema with compatible: ['marvell,armada-3700-pcie']
   arch/arm64/boot/dts/marvell/armada-3720-espressobin-ultra.dtb: /firmware/armada-3700-rwtm: failed to match any schema with compatible: ['marvell,armada-3700-rwtm-firmware']
   arch/arm64/boot/dts/marvell/armada-3720-espressobin-ultra.dtb: usb3-phy: '#phy-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/usb/usb-nop-xceiv.yaml#
   arch/arm64/boot/dts/marvell/armada-3720-espressobin-ultra.dtb: gpio-leds: 'pinctrl-0' is a dependency of 'pinctrl-names'
   	from schema $id: http://devicetree.org/schemas/pinctrl/pinctrl-consumer.yaml#
--
>> arch/arm64/boot/dts/marvell/armada-3720-espressobin-v7.dtb: /soc/bus@d0000000/watchdog@8300: failed to match any schema with compatible: ['marvell,armada-3700-wdt']
>> arch/arm64/boot/dts/marvell/armada-3720-espressobin-v7.dtb: /soc/bus@d0000000/serial@12000: failed to match any schema with compatible: ['marvell,armada-3700-uart']
>> arch/arm64/boot/dts/marvell/armada-3720-espressobin-v7.dtb: /soc/bus@d0000000/serial@12200: failed to match any schema with compatible: ['marvell,armada-3700-uart-ext']
>> arch/arm64/boot/dts/marvell/armada-3720-espressobin-v7.dtb: /soc/bus@d0000000/nb-periph-clk@13000: failed to match any schema with compatible: ['marvell,armada-3700-periph-clock-nb', 'syscon']
>> arch/arm64/boot/dts/marvell/armada-3720-espressobin-v7.dtb: /soc/bus@d0000000/sb-periph-clk@18000: failed to match any schema with compatible: ['marvell,armada-3700-periph-clock-sb']
>> arch/arm64/boot/dts/marvell/armada-3720-espressobin-v7.dtb: /soc/bus@d0000000/tbg@13200: failed to match any schema with compatible: ['marvell,armada-3700-tbg-clock']
   arch/arm64/boot/dts/marvell/armada-3720-espressobin-v7.dtb: pinctrl@13800: reg: [[79872, 256], [80896, 32]] is too long
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
>> arch/arm64/boot/dts/marvell/armada-3720-espressobin-v7.dtb: /soc/bus@d0000000/pinctrl@13800: failed to match any schema with compatible: ['marvell,armada3710-nb-pinctrl', 'syscon', 'simple-mfd']
>> arch/arm64/boot/dts/marvell/armada-3720-espressobin-v7.dtb: /soc/bus@d0000000/pinctrl@13800/xtal-clk: failed to match any schema with compatible: ['marvell,armada-3700-xtal-clock']
>> arch/arm64/boot/dts/marvell/armada-3720-espressobin-v7.dtb: /soc/bus@d0000000/phy@18300: failed to match any schema with compatible: ['marvell,comphy-a3700']
   arch/arm64/boot/dts/marvell/armada-3720-espressobin-v7.dtb: pinctrl@18800: reg: [[100352, 256], [101376, 32]] is too long
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
>> arch/arm64/boot/dts/marvell/armada-3720-espressobin-v7.dtb: /soc/bus@d0000000/pinctrl@18800: failed to match any schema with compatible: ['marvell,armada3710-sb-pinctrl', 'syscon', 'simple-mfd']
>> arch/arm64/boot/dts/marvell/armada-3720-espressobin-v7.dtb: /soc/bus@d0000000/ethernet@30000: failed to match any schema with compatible: ['marvell,armada-3700-neta']
   arch/arm64/boot/dts/marvell/armada-3720-espressobin-v7.dtb: /soc/bus@d0000000/ethernet@40000: failed to match any schema with compatible: ['marvell,armada-3700-neta']
   arch/arm64/boot/dts/marvell/armada-3720-espressobin-v7.dtb: usb@58000: Unevaluated properties are not allowed ('marvell,usb-misc-reg' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/generic-xhci.yaml#
>> arch/arm64/boot/dts/marvell/armada-3720-espressobin-v7.dtb: /soc/bus@d0000000/system-controller@5d800: failed to match any schema with compatible: ['marvell,armada-3700-usb2-host-device-misc', 'syscon']
   arch/arm64/boot/dts/marvell/armada-3720-espressobin-v7.dtb: usb@5e000: phy-names:0: 'usb' was expected
   	from schema $id: http://devicetree.org/schemas/usb/generic-ehci.yaml#
   arch/arm64/boot/dts/marvell/armada-3720-espressobin-v7.dtb: usb@5e000: Unevaluated properties are not allowed ('marvell,usb-misc-reg' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/generic-ehci.yaml#
>> arch/arm64/boot/dts/marvell/armada-3720-espressobin-v7.dtb: /soc/bus@d0000000/xor@60900: failed to match any schema with compatible: ['marvell,armada-3700-xor']
>> arch/arm64/boot/dts/marvell/armada-3720-espressobin-v7.dtb: /soc/bus@d0000000/mailbox@b0000: failed to match any schema with compatible: ['marvell,armada-3700-rwtm-mailbox']
   arch/arm64/boot/dts/marvell/armada-3720-espressobin-v7.dtb: /soc/pcie@d0070000: failed to match any schema with compatible: ['marvell,armada-3700-pcie']
   arch/arm64/boot/dts/marvell/armada-3720-espressobin-v7.dtb: /firmware/armada-3700-rwtm: failed to match any schema with compatible: ['marvell,armada-3700-rwtm-firmware']
--
>> arch/arm64/boot/dts/marvell/armada-3720-espressobin-v7-emmc.dtb: /soc/bus@d0000000/watchdog@8300: failed to match any schema with compatible: ['marvell,armada-3700-wdt']
>> arch/arm64/boot/dts/marvell/armada-3720-espressobin-v7-emmc.dtb: /soc/bus@d0000000/serial@12000: failed to match any schema with compatible: ['marvell,armada-3700-uart']
>> arch/arm64/boot/dts/marvell/armada-3720-espressobin-v7-emmc.dtb: /soc/bus@d0000000/serial@12200: failed to match any schema with compatible: ['marvell,armada-3700-uart-ext']
>> arch/arm64/boot/dts/marvell/armada-3720-espressobin-v7-emmc.dtb: /soc/bus@d0000000/nb-periph-clk@13000: failed to match any schema with compatible: ['marvell,armada-3700-periph-clock-nb', 'syscon']
>> arch/arm64/boot/dts/marvell/armada-3720-espressobin-v7-emmc.dtb: /soc/bus@d0000000/sb-periph-clk@18000: failed to match any schema with compatible: ['marvell,armada-3700-periph-clock-sb']
>> arch/arm64/boot/dts/marvell/armada-3720-espressobin-v7-emmc.dtb: /soc/bus@d0000000/tbg@13200: failed to match any schema with compatible: ['marvell,armada-3700-tbg-clock']
   arch/arm64/boot/dts/marvell/armada-3720-espressobin-v7-emmc.dtb: pinctrl@13800: reg: [[79872, 256], [80896, 32]] is too long
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
>> arch/arm64/boot/dts/marvell/armada-3720-espressobin-v7-emmc.dtb: /soc/bus@d0000000/pinctrl@13800: failed to match any schema with compatible: ['marvell,armada3710-nb-pinctrl', 'syscon', 'simple-mfd']
>> arch/arm64/boot/dts/marvell/armada-3720-espressobin-v7-emmc.dtb: /soc/bus@d0000000/pinctrl@13800/xtal-clk: failed to match any schema with compatible: ['marvell,armada-3700-xtal-clock']
>> arch/arm64/boot/dts/marvell/armada-3720-espressobin-v7-emmc.dtb: /soc/bus@d0000000/phy@18300: failed to match any schema with compatible: ['marvell,comphy-a3700']
   arch/arm64/boot/dts/marvell/armada-3720-espressobin-v7-emmc.dtb: pinctrl@18800: reg: [[100352, 256], [101376, 32]] is too long
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
>> arch/arm64/boot/dts/marvell/armada-3720-espressobin-v7-emmc.dtb: /soc/bus@d0000000/pinctrl@18800: failed to match any schema with compatible: ['marvell,armada3710-sb-pinctrl', 'syscon', 'simple-mfd']
>> arch/arm64/boot/dts/marvell/armada-3720-espressobin-v7-emmc.dtb: /soc/bus@d0000000/ethernet@30000: failed to match any schema with compatible: ['marvell,armada-3700-neta']
   arch/arm64/boot/dts/marvell/armada-3720-espressobin-v7-emmc.dtb: /soc/bus@d0000000/ethernet@40000: failed to match any schema with compatible: ['marvell,armada-3700-neta']
   arch/arm64/boot/dts/marvell/armada-3720-espressobin-v7-emmc.dtb: usb@58000: Unevaluated properties are not allowed ('marvell,usb-misc-reg' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/generic-xhci.yaml#
>> arch/arm64/boot/dts/marvell/armada-3720-espressobin-v7-emmc.dtb: /soc/bus@d0000000/system-controller@5d800: failed to match any schema with compatible: ['marvell,armada-3700-usb2-host-device-misc', 'syscon']
   arch/arm64/boot/dts/marvell/armada-3720-espressobin-v7-emmc.dtb: usb@5e000: phy-names:0: 'usb' was expected
   	from schema $id: http://devicetree.org/schemas/usb/generic-ehci.yaml#
   arch/arm64/boot/dts/marvell/armada-3720-espressobin-v7-emmc.dtb: usb@5e000: Unevaluated properties are not allowed ('marvell,usb-misc-reg' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/generic-ehci.yaml#
>> arch/arm64/boot/dts/marvell/armada-3720-espressobin-v7-emmc.dtb: /soc/bus@d0000000/xor@60900: failed to match any schema with compatible: ['marvell,armada-3700-xor']
>> arch/arm64/boot/dts/marvell/armada-3720-espressobin-v7-emmc.dtb: /soc/bus@d0000000/mailbox@b0000: failed to match any schema with compatible: ['marvell,armada-3700-rwtm-mailbox']
   arch/arm64/boot/dts/marvell/armada-3720-espressobin-v7-emmc.dtb: /soc/pcie@d0070000: failed to match any schema with compatible: ['marvell,armada-3700-pcie']
   arch/arm64/boot/dts/marvell/armada-3720-espressobin-v7-emmc.dtb: /firmware/armada-3700-rwtm: failed to match any schema with compatible: ['marvell,armada-3700-rwtm-firmware']
--
>> arch/arm64/boot/dts/marvell/armada-3720-gl-mv1000.dtb: /soc/bus@d0000000/watchdog@8300: failed to match any schema with compatible: ['marvell,armada-3700-wdt']
>> arch/arm64/boot/dts/marvell/armada-3720-gl-mv1000.dtb: /soc/bus@d0000000/serial@12000: failed to match any schema with compatible: ['marvell,armada-3700-uart']
>> arch/arm64/boot/dts/marvell/armada-3720-gl-mv1000.dtb: /soc/bus@d0000000/serial@12200: failed to match any schema with compatible: ['marvell,armada-3700-uart-ext']
>> arch/arm64/boot/dts/marvell/armada-3720-gl-mv1000.dtb: /soc/bus@d0000000/nb-periph-clk@13000: failed to match any schema with compatible: ['marvell,armada-3700-periph-clock-nb', 'syscon']
>> arch/arm64/boot/dts/marvell/armada-3720-gl-mv1000.dtb: /soc/bus@d0000000/sb-periph-clk@18000: failed to match any schema with compatible: ['marvell,armada-3700-periph-clock-sb']
>> arch/arm64/boot/dts/marvell/armada-3720-gl-mv1000.dtb: /soc/bus@d0000000/tbg@13200: failed to match any schema with compatible: ['marvell,armada-3700-tbg-clock']
   arch/arm64/boot/dts/marvell/armada-3720-gl-mv1000.dtb: pinctrl@13800: reg: [[79872, 256], [80896, 32]] is too long
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
>> arch/arm64/boot/dts/marvell/armada-3720-gl-mv1000.dtb: /soc/bus@d0000000/pinctrl@13800: failed to match any schema with compatible: ['marvell,armada3710-nb-pinctrl', 'syscon', 'simple-mfd']
>> arch/arm64/boot/dts/marvell/armada-3720-gl-mv1000.dtb: /soc/bus@d0000000/pinctrl@13800/xtal-clk: failed to match any schema with compatible: ['marvell,armada-3700-xtal-clock']
>> arch/arm64/boot/dts/marvell/armada-3720-gl-mv1000.dtb: /soc/bus@d0000000/phy@18300: failed to match any schema with compatible: ['marvell,comphy-a3700']
   arch/arm64/boot/dts/marvell/armada-3720-gl-mv1000.dtb: pinctrl@18800: reg: [[100352, 256], [101376, 32]] is too long
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
>> arch/arm64/boot/dts/marvell/armada-3720-gl-mv1000.dtb: /soc/bus@d0000000/pinctrl@18800: failed to match any schema with compatible: ['marvell,armada3710-sb-pinctrl', 'syscon', 'simple-mfd']
>> arch/arm64/boot/dts/marvell/armada-3720-gl-mv1000.dtb: /soc/bus@d0000000/ethernet@30000: failed to match any schema with compatible: ['marvell,armada-3700-neta']
   arch/arm64/boot/dts/marvell/armada-3720-gl-mv1000.dtb: ethernet-switch@1: ethernet-ports:ethernet-port@0: 'phy-mode' is a required property
   	from schema $id: http://devicetree.org/schemas/net/dsa/marvell,mv88e6xxx.yaml#
   arch/arm64/boot/dts/marvell/armada-3720-gl-mv1000.dtb: ethernet-switch@1: ethernet-ports:ethernet-port@0: 'oneOf' conditional failed, one must be fixed:
   	'fixed-link' is a required property
   	'phy-handle' is a required property
   	'managed' is a required property
   	from schema $id: http://devicetree.org/schemas/net/dsa/marvell,mv88e6xxx.yaml#
   arch/arm64/boot/dts/marvell/armada-3720-gl-mv1000.dtb: ethernet-switch@1: Unevaluated properties are not allowed ('dsa,member', 'ethernet-ports' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/dsa/marvell,mv88e6xxx.yaml#
   arch/arm64/boot/dts/marvell/armada-3720-gl-mv1000.dtb: /soc/bus@d0000000/ethernet@40000: failed to match any schema with compatible: ['marvell,armada-3700-neta']
   arch/arm64/boot/dts/marvell/armada-3720-gl-mv1000.dtb: usb@58000: Unevaluated properties are not allowed ('marvell,usb-misc-reg' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/generic-xhci.yaml#
>> arch/arm64/boot/dts/marvell/armada-3720-gl-mv1000.dtb: /soc/bus@d0000000/system-controller@5d800: failed to match any schema with compatible: ['marvell,armada-3700-usb2-host-device-misc', 'syscon']
   arch/arm64/boot/dts/marvell/armada-3720-gl-mv1000.dtb: usb@5e000: phy-names:0: 'usb' was expected
   	from schema $id: http://devicetree.org/schemas/usb/generic-ehci.yaml#
   arch/arm64/boot/dts/marvell/armada-3720-gl-mv1000.dtb: usb@5e000: Unevaluated properties are not allowed ('marvell,usb-misc-reg' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/generic-ehci.yaml#
>> arch/arm64/boot/dts/marvell/armada-3720-gl-mv1000.dtb: /soc/bus@d0000000/xor@60900: failed to match any schema with compatible: ['marvell,armada-3700-xor']
>> arch/arm64/boot/dts/marvell/armada-3720-gl-mv1000.dtb: /soc/bus@d0000000/mailbox@b0000: failed to match any schema with compatible: ['marvell,armada-3700-rwtm-mailbox']
   arch/arm64/boot/dts/marvell/armada-3720-gl-mv1000.dtb: /soc/pcie@d0070000: failed to match any schema with compatible: ['marvell,armada-3700-pcie']
   arch/arm64/boot/dts/marvell/armada-3720-gl-mv1000.dtb: /firmware/armada-3700-rwtm: failed to match any schema with compatible: ['marvell,armada-3700-rwtm-firmware']
   arch/arm64/boot/dts/marvell/armada-3720-gl-mv1000.dtb: regulator: 'gpios' is a required property
   	from schema $id: http://devicetree.org/schemas/regulator/gpio-regulator.yaml#
--
>> arch/arm64/boot/dts/marvell/armada-3720-turris-mox.dtb: /soc/bus@d0000000/watchdog@8300: failed to match any schema with compatible: ['marvell,armada-3700-wdt']
>> arch/arm64/boot/dts/marvell/armada-3720-turris-mox.dtb: /soc/bus@d0000000/spi@10600/moxtet@1: failed to match any schema with compatible: ['cznic,moxtet']
>> arch/arm64/boot/dts/marvell/armada-3720-turris-mox.dtb: /soc/bus@d0000000/spi@10600/moxtet@1/gpio@0: failed to match any schema with compatible: ['cznic,moxtet-gpio']
>> arch/arm64/boot/dts/marvell/armada-3720-turris-mox.dtb: /soc/bus@d0000000/serial@12000: failed to match any schema with compatible: ['marvell,armada-3700-uart']
>> arch/arm64/boot/dts/marvell/armada-3720-turris-mox.dtb: /soc/bus@d0000000/serial@12200: failed to match any schema with compatible: ['marvell,armada-3700-uart-ext']
>> arch/arm64/boot/dts/marvell/armada-3720-turris-mox.dtb: /soc/bus@d0000000/nb-periph-clk@13000: failed to match any schema with compatible: ['marvell,armada-3700-periph-clock-nb', 'syscon']
>> arch/arm64/boot/dts/marvell/armada-3720-turris-mox.dtb: /soc/bus@d0000000/sb-periph-clk@18000: failed to match any schema with compatible: ['marvell,armada-3700-periph-clock-sb']
>> arch/arm64/boot/dts/marvell/armada-3720-turris-mox.dtb: /soc/bus@d0000000/tbg@13200: failed to match any schema with compatible: ['marvell,armada-3700-tbg-clock']
   arch/arm64/boot/dts/marvell/armada-3720-turris-mox.dtb: pinctrl@13800: reg: [[79872, 256], [80896, 32]] is too long
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
>> arch/arm64/boot/dts/marvell/armada-3720-turris-mox.dtb: /soc/bus@d0000000/pinctrl@13800: failed to match any schema with compatible: ['marvell,armada3710-nb-pinctrl', 'syscon', 'simple-mfd']
>> arch/arm64/boot/dts/marvell/armada-3720-turris-mox.dtb: /soc/bus@d0000000/pinctrl@13800/xtal-clk: failed to match any schema with compatible: ['marvell,armada-3700-xtal-clock']
>> arch/arm64/boot/dts/marvell/armada-3720-turris-mox.dtb: /soc/bus@d0000000/phy@18300: failed to match any schema with compatible: ['marvell,comphy-a3700']
   arch/arm64/boot/dts/marvell/armada-3720-turris-mox.dtb: connector: Unevaluated properties are not allowed ('phy-supply' was unexpected)
   	from schema $id: http://devicetree.org/schemas/connector/usb-connector.yaml#
   arch/arm64/boot/dts/marvell/armada-3720-turris-mox.dtb: pinctrl@18800: reg: [[100352, 256], [101376, 32]] is too long
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
>> arch/arm64/boot/dts/marvell/armada-3720-turris-mox.dtb: /soc/bus@d0000000/pinctrl@18800: failed to match any schema with compatible: ['marvell,armada3710-sb-pinctrl', 'syscon', 'simple-mfd']
>> arch/arm64/boot/dts/marvell/armada-3720-turris-mox.dtb: /soc/bus@d0000000/ethernet@30000: failed to match any schema with compatible: ['marvell,armada-3700-neta']
   arch/arm64/boot/dts/marvell/armada-3720-turris-mox.dtb: /soc/bus@d0000000/ethernet@40000: failed to match any schema with compatible: ['marvell,armada-3700-neta']
   arch/arm64/boot/dts/marvell/armada-3720-turris-mox.dtb: usb@58000: Unevaluated properties are not allowed ('marvell,usb-misc-reg' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/generic-xhci.yaml#
>> arch/arm64/boot/dts/marvell/armada-3720-turris-mox.dtb: /soc/bus@d0000000/system-controller@5d800: failed to match any schema with compatible: ['marvell,armada-3700-usb2-host-device-misc', 'syscon']
   arch/arm64/boot/dts/marvell/armada-3720-turris-mox.dtb: usb@5e000: phy-names:0: 'usb' was expected
   	from schema $id: http://devicetree.org/schemas/usb/generic-ehci.yaml#
   arch/arm64/boot/dts/marvell/armada-3720-turris-mox.dtb: usb@5e000: Unevaluated properties are not allowed ('marvell,usb-misc-reg' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/generic-ehci.yaml#
>> arch/arm64/boot/dts/marvell/armada-3720-turris-mox.dtb: /soc/bus@d0000000/xor@60900: failed to match any schema with compatible: ['marvell,armada-3700-xor']
>> arch/arm64/boot/dts/marvell/armada-3720-turris-mox.dtb: /soc/bus@d0000000/mailbox@b0000: failed to match any schema with compatible: ['marvell,armada-3700-rwtm-mailbox']
   arch/arm64/boot/dts/marvell/armada-3720-turris-mox.dtb: /soc/pcie@d0070000: failed to match any schema with compatible: ['marvell,armada-3700-pcie']
   arch/arm64/boot/dts/marvell/armada-3720-turris-mox.dtb: /firmware/armada-3700-rwtm: failed to match any schema with compatible: ['marvell,armada-3700-rwtm-firmware', 'cznic,turris-mox-rwtm']
   arch/arm64/boot/dts/marvell/armada-3720-turris-mox.dtb: /firmware/armada-3700-rwtm: failed to match any schema with compatible: ['marvell,armada-3700-rwtm-firmware', 'cznic,turris-mox-rwtm']
--
>> arch/arm64/boot/dts/marvell/armada-3720-uDPU.dtb: /soc/bus@d0000000/watchdog@8300: failed to match any schema with compatible: ['marvell,armada-3700-wdt']
>> arch/arm64/boot/dts/marvell/armada-3720-uDPU.dtb: /soc/bus@d0000000/serial@12000: failed to match any schema with compatible: ['marvell,armada-3700-uart']
>> arch/arm64/boot/dts/marvell/armada-3720-uDPU.dtb: /soc/bus@d0000000/serial@12200: failed to match any schema with compatible: ['marvell,armada-3700-uart-ext']
>> arch/arm64/boot/dts/marvell/armada-3720-uDPU.dtb: /soc/bus@d0000000/nb-periph-clk@13000: failed to match any schema with compatible: ['marvell,armada-3700-periph-clock-nb', 'syscon']
>> arch/arm64/boot/dts/marvell/armada-3720-uDPU.dtb: /soc/bus@d0000000/sb-periph-clk@18000: failed to match any schema with compatible: ['marvell,armada-3700-periph-clock-sb']
>> arch/arm64/boot/dts/marvell/armada-3720-uDPU.dtb: /soc/bus@d0000000/tbg@13200: failed to match any schema with compatible: ['marvell,armada-3700-tbg-clock']
   arch/arm64/boot/dts/marvell/armada-3720-uDPU.dtb: pinctrl@13800: reg: [[79872, 256], [80896, 32]] is too long
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
>> arch/arm64/boot/dts/marvell/armada-3720-uDPU.dtb: /soc/bus@d0000000/pinctrl@13800: failed to match any schema with compatible: ['marvell,armada3710-nb-pinctrl', 'syscon', 'simple-mfd']
>> arch/arm64/boot/dts/marvell/armada-3720-uDPU.dtb: /soc/bus@d0000000/pinctrl@13800/xtal-clk: failed to match any schema with compatible: ['marvell,armada-3700-xtal-clock']
>> arch/arm64/boot/dts/marvell/armada-3720-uDPU.dtb: /soc/bus@d0000000/phy@18300: failed to match any schema with compatible: ['marvell,comphy-a3700']
   arch/arm64/boot/dts/marvell/armada-3720-uDPU.dtb: pinctrl@18800: reg: [[100352, 256], [101376, 32]] is too long
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
>> arch/arm64/boot/dts/marvell/armada-3720-uDPU.dtb: /soc/bus@d0000000/pinctrl@18800: failed to match any schema with compatible: ['marvell,armada3710-sb-pinctrl', 'syscon', 'simple-mfd']
>> arch/arm64/boot/dts/marvell/armada-3720-uDPU.dtb: /soc/bus@d0000000/ethernet@30000: failed to match any schema with compatible: ['marvell,armada-3700-neta']
   arch/arm64/boot/dts/marvell/armada-3720-uDPU.dtb: /soc/bus@d0000000/ethernet@40000: failed to match any schema with compatible: ['marvell,armada-3700-neta']
   arch/arm64/boot/dts/marvell/armada-3720-uDPU.dtb: usb@58000: Unevaluated properties are not allowed ('marvell,usb-misc-reg' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/generic-xhci.yaml#
>> arch/arm64/boot/dts/marvell/armada-3720-uDPU.dtb: /soc/bus@d0000000/system-controller@5d800: failed to match any schema with compatible: ['marvell,armada-3700-usb2-host-device-misc', 'syscon']
   arch/arm64/boot/dts/marvell/armada-3720-uDPU.dtb: usb@5e000: phy-names:0: 'usb' was expected
   	from schema $id: http://devicetree.org/schemas/usb/generic-ehci.yaml#
>> arch/arm64/boot/dts/marvell/armada-3720-uDPU.dtb: /soc/bus@d0000000/xor@60900: failed to match any schema with compatible: ['marvell,armada-3700-xor']
>> arch/arm64/boot/dts/marvell/armada-3720-uDPU.dtb: /soc/bus@d0000000/mailbox@b0000: failed to match any schema with compatible: ['marvell,armada-3700-rwtm-mailbox']
   arch/arm64/boot/dts/marvell/armada-3720-uDPU.dtb: /soc/pcie@d0070000: failed to match any schema with compatible: ['marvell,armada-3700-pcie']
   arch/arm64/boot/dts/marvell/armada-3720-uDPU.dtb: /firmware/armada-3700-rwtm: failed to match any schema with compatible: ['marvell,armada-3700-rwtm-firmware']
--
   arch/arm64/boot/dts/marvell/armada-ap80x.dtsi:282.24-292.7: Warning (unit_address_vs_reg): /soc/bus@f0000000/system-controller@6f4000/gpio@1040: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/marvell/armada-cp11x.dtsi:235.24-254.6: Warning (unit_address_vs_reg): /cp0-bus/bus@f2000000/system-controller@440000/gpio@100: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/marvell/armada-cp11x.dtsi:256.24-275.6: Warning (unit_address_vs_reg): /cp0-bus/bus@f2000000/system-controller@440000/gpio@140: node has a unit name, but no reg or ranges property
>> arch/arm64/boot/dts/marvell/armada-7040-db.dtb: /soc/bus@f0000000/odmi@300000: failed to match any schema with compatible: ['marvell,odmi-controller']
>> arch/arm64/boot/dts/marvell/armada-7040-db.dtb: /soc/bus@f0000000/gicp@3f0040: failed to match any schema with compatible: ['marvell,ap806-gicp']
>> arch/arm64/boot/dts/marvell/armada-7040-db.dtb: /soc/bus@f0000000/interrupt-controller@3f0100: failed to match any schema with compatible: ['marvell,armada-8k-pic']
>> arch/arm64/boot/dts/marvell/armada-7040-db.dtb: /soc/bus@f0000000/interrupt-controller@3f0200: failed to match any schema with compatible: ['marvell,ap806-sei']
>> arch/arm64/boot/dts/marvell/armada-7040-db.dtb: /soc/bus@f0000000/spi@510600: failed to match any schema with compatible: ['marvell,armada-380-spi']
   arch/arm64/boot/dts/marvell/armada-7040-db.dtb: mmc@6e0000: clocks: [[4, 4]] is too short
   	from schema $id: http://devicetree.org/schemas/mmc/marvell,xenon-sdhci.yaml#
   arch/arm64/boot/dts/marvell/armada-7040-db.dtb: mmc@6e0000: clock-names: ['core'] is too short
   	from schema $id: http://devicetree.org/schemas/mmc/marvell,xenon-sdhci.yaml#
   arch/arm64/boot/dts/marvell/armada-7040-db.dtb: system-controller@6f4000: compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
>> arch/arm64/boot/dts/marvell/armada-7040-db.dtb: /soc/bus@f0000000/system-controller@6f4000/pinctrl: failed to match any schema with compatible: ['marvell,ap806-pinctrl']
   arch/arm64/boot/dts/marvell/armada-7040-db.dtb: gpio@1040: Unevaluated properties are not allowed ('gpio-ranges' was unexpected)
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-mvebu.yaml#
>> arch/arm64/boot/dts/marvell/armada-7040-db.dtb: /soc/bus@f0000000/system-controller@6f4000/clock: failed to match any schema with compatible: ['marvell,ap806-clock']
   arch/arm64/boot/dts/marvell/armada-7040-db.dtb: system-controller@6f8000: compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
>> arch/arm64/boot/dts/marvell/armada-7040-db.dtb: /soc/bus@f0000000/system-controller@6f8000/thermal-sensor@80: failed to match any schema with compatible: ['marvell,armada-ap806-thermal']
>> arch/arm64/boot/dts/marvell/armada-7040-db.dtb: /soc/bus@f0000000/system-controller@6f8000/clock-cpu@278: failed to match any schema with compatible: ['marvell,ap806-cpu-clock']
>> arch/arm64/boot/dts/marvell/armada-7040-db.dtb: /cp0-bus/bus@f2000000/phy@120000: failed to match any schema with compatible: ['marvell,comphy-cp110']
   arch/arm64/boot/dts/marvell/armada-7040-db.dtb: connector: Unevaluated properties are not allowed ('phy-supply' was unexpected)
   	from schema $id: http://devicetree.org/schemas/connector/usb-connector.yaml#
   arch/arm64/boot/dts/marvell/armada-7040-db.dtb: connector: Unevaluated properties are not allowed ('phy-supply' was unexpected)
   	from schema $id: http://devicetree.org/schemas/connector/usb-connector.yaml#
>> arch/arm64/boot/dts/marvell/armada-7040-db.dtb: /cp0-bus/bus@f2000000/interrupt-controller@1e0000: failed to match any schema with compatible: ['marvell,cp110-icu']
>> arch/arm64/boot/dts/marvell/armada-7040-db.dtb: /cp0-bus/bus@f2000000/interrupt-controller@1e0000/interrupt-controller@10: failed to match any schema with compatible: ['marvell,cp110-icu-nsr']
>> arch/arm64/boot/dts/marvell/armada-7040-db.dtb: /cp0-bus/bus@f2000000/interrupt-controller@1e0000/interrupt-controller@50: failed to match any schema with compatible: ['marvell,cp110-icu-sei']
   arch/arm64/boot/dts/marvell/armada-7040-db.dtb: system-controller@440000: compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
>> arch/arm64/boot/dts/marvell/armada-7040-db.dtb: /cp0-bus/bus@f2000000/system-controller@440000/clock: failed to match any schema with compatible: ['marvell,cp110-clock']
   arch/arm64/boot/dts/marvell/armada-7040-db.dtb: gpio@100: Unevaluated properties are not allowed ('gpio-ranges' was unexpected)
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-mvebu.yaml#
   arch/arm64/boot/dts/marvell/armada-7040-db.dtb: gpio@140: Unevaluated properties are not allowed ('gpio-ranges' was unexpected)
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-mvebu.yaml#
>> arch/arm64/boot/dts/marvell/armada-7040-db.dtb: /cp0-bus/bus@f2000000/system-controller@440000/pinctrl: failed to match any schema with compatible: ['marvell,armada-7k-pinctrl']
   arch/arm64/boot/dts/marvell/armada-7040-db.dtb: system-controller@400000: compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
>> arch/arm64/boot/dts/marvell/armada-7040-db.dtb: /cp0-bus/bus@f2000000/system-controller@400000/thermal-sensor@70: failed to match any schema with compatible: ['marvell,armada-cp110-thermal']
   arch/arm64/boot/dts/marvell/armada-7040-db.dtb: usb@500000: Unevaluated properties are not allowed ('dma-coherent', 'dr_mode', 'iommus' were unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/generic-xhci.yaml#
   arch/arm64/boot/dts/marvell/armada-7040-db.dtb: usb@510000: Unevaluated properties are not allowed ('dma-coherent', 'dr_mode', 'iommus' were unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/generic-xhci.yaml#
>> arch/arm64/boot/dts/marvell/armada-7040-db.dtb: /cp0-bus/bus@f2000000/spi@700600: failed to match any schema with compatible: ['marvell,armada-380-spi']
   arch/arm64/boot/dts/marvell/armada-7040-db.dtb: /cp0-bus/bus@f2000000/spi@700680: failed to match any schema with compatible: ['marvell,armada-380-spi']
   arch/arm64/boot/dts/marvell/armada-7040-db.dtb: pca9555@21: 'pinctrl-0' is a dependency of 'pinctrl-names'
   	from schema $id: http://devicetree.org/schemas/pinctrl/pinctrl-consumer.yaml#
   arch/arm64/boot/dts/marvell/armada-7040-db.dtb: crypto@800000: 'dma-coherent' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/crypto/inside-secure,safexcel.yaml#
>> arch/arm64/boot/dts/marvell/armada-7040-db.dtb: /cp0-bus/pcie@f2600000: failed to match any schema with compatible: ['marvell,armada8k-pcie', 'snps,dw-pcie']
>> arch/arm64/boot/dts/marvell/armada-7040-db.dtb: /cp0-bus/pcie@f2620000: failed to match any schema with compatible: ['marvell,armada8k-pcie', 'snps,dw-pcie']
>> arch/arm64/boot/dts/marvell/armada-7040-db.dtb: /cp0-bus/pcie@f2640000: failed to match any schema with compatible: ['marvell,armada8k-pcie', 'snps,dw-pcie']
--
   arch/arm64/boot/dts/marvell/armada-ap80x.dtsi:282.24-292.7: Warning (unit_address_vs_reg): /soc/bus@f0000000/system-controller@6f4000/gpio@1040: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/marvell/armada-cp11x.dtsi:235.24-254.6: Warning (unit_address_vs_reg): /cp0-bus/bus@f2000000/system-controller@440000/gpio@100: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/marvell/armada-cp11x.dtsi:256.24-275.6: Warning (unit_address_vs_reg): /cp0-bus/bus@f2000000/system-controller@440000/gpio@140: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/marvell/armada-7040-mochabin.dts:158.10-187.4: Warning (avoid_unnecessary_addr_size): /cp0-bus/bus@f2000000/spi@700680/flash@0: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>> arch/arm64/boot/dts/marvell/armada-7040-mochabin.dtb: /soc/bus@f0000000/odmi@300000: failed to match any schema with compatible: ['marvell,odmi-controller']
>> arch/arm64/boot/dts/marvell/armada-7040-mochabin.dtb: /soc/bus@f0000000/gicp@3f0040: failed to match any schema with compatible: ['marvell,ap806-gicp']
>> arch/arm64/boot/dts/marvell/armada-7040-mochabin.dtb: /soc/bus@f0000000/interrupt-controller@3f0100: failed to match any schema with compatible: ['marvell,armada-8k-pic']
>> arch/arm64/boot/dts/marvell/armada-7040-mochabin.dtb: /soc/bus@f0000000/interrupt-controller@3f0200: failed to match any schema with compatible: ['marvell,ap806-sei']
>> arch/arm64/boot/dts/marvell/armada-7040-mochabin.dtb: /soc/bus@f0000000/spi@510600: failed to match any schema with compatible: ['marvell,armada-380-spi']
   arch/arm64/boot/dts/marvell/armada-7040-mochabin.dtb: mmc@6e0000: clocks: [[4, 4]] is too short
   	from schema $id: http://devicetree.org/schemas/mmc/marvell,xenon-sdhci.yaml#
   arch/arm64/boot/dts/marvell/armada-7040-mochabin.dtb: mmc@6e0000: clock-names: ['core'] is too short
   	from schema $id: http://devicetree.org/schemas/mmc/marvell,xenon-sdhci.yaml#
   arch/arm64/boot/dts/marvell/armada-7040-mochabin.dtb: system-controller@6f4000: compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
>> arch/arm64/boot/dts/marvell/armada-7040-mochabin.dtb: /soc/bus@f0000000/system-controller@6f4000/pinctrl: failed to match any schema with compatible: ['marvell,ap806-pinctrl']
   arch/arm64/boot/dts/marvell/armada-7040-mochabin.dtb: gpio@1040: Unevaluated properties are not allowed ('gpio-ranges' was unexpected)
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-mvebu.yaml#
>> arch/arm64/boot/dts/marvell/armada-7040-mochabin.dtb: /soc/bus@f0000000/system-controller@6f4000/clock: failed to match any schema with compatible: ['marvell,ap806-clock']
   arch/arm64/boot/dts/marvell/armada-7040-mochabin.dtb: system-controller@6f8000: compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
>> arch/arm64/boot/dts/marvell/armada-7040-mochabin.dtb: /soc/bus@f0000000/system-controller@6f8000/thermal-sensor@80: failed to match any schema with compatible: ['marvell,armada-ap806-thermal']
>> arch/arm64/boot/dts/marvell/armada-7040-mochabin.dtb: /soc/bus@f0000000/system-controller@6f8000/clock-cpu@278: failed to match any schema with compatible: ['marvell,ap806-cpu-clock']
>> arch/arm64/boot/dts/marvell/armada-7040-mochabin.dtb: /cp0-bus/bus@f2000000/phy@120000: failed to match any schema with compatible: ['marvell,comphy-cp110']
>> arch/arm64/boot/dts/marvell/armada-7040-mochabin.dtb: /cp0-bus/bus@f2000000/interrupt-controller@1e0000: failed to match any schema with compatible: ['marvell,cp110-icu']
>> arch/arm64/boot/dts/marvell/armada-7040-mochabin.dtb: /cp0-bus/bus@f2000000/interrupt-controller@1e0000/interrupt-controller@10: failed to match any schema with compatible: ['marvell,cp110-icu-nsr']
>> arch/arm64/boot/dts/marvell/armada-7040-mochabin.dtb: /cp0-bus/bus@f2000000/interrupt-controller@1e0000/interrupt-controller@50: failed to match any schema with compatible: ['marvell,cp110-icu-sei']
   arch/arm64/boot/dts/marvell/armada-7040-mochabin.dtb: system-controller@440000: compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
>> arch/arm64/boot/dts/marvell/armada-7040-mochabin.dtb: /cp0-bus/bus@f2000000/system-controller@440000/clock: failed to match any schema with compatible: ['marvell,cp110-clock']
   arch/arm64/boot/dts/marvell/armada-7040-mochabin.dtb: gpio@100: Unevaluated properties are not allowed ('gpio-ranges' was unexpected)
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-mvebu.yaml#
   arch/arm64/boot/dts/marvell/armada-7040-mochabin.dtb: gpio@140: Unevaluated properties are not allowed ('gpio-ranges' was unexpected)
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-mvebu.yaml#
>> arch/arm64/boot/dts/marvell/armada-7040-mochabin.dtb: /cp0-bus/bus@f2000000/system-controller@440000/pinctrl: failed to match any schema with compatible: ['marvell,armada-7k-pinctrl']
   arch/arm64/boot/dts/marvell/armada-7040-mochabin.dtb: system-controller@400000: compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
>> arch/arm64/boot/dts/marvell/armada-7040-mochabin.dtb: /cp0-bus/bus@f2000000/system-controller@400000/thermal-sensor@70: failed to match any schema with compatible: ['marvell,armada-cp110-thermal']
   arch/arm64/boot/dts/marvell/armada-7040-mochabin.dtb: usb@500000: Unevaluated properties are not allowed ('dma-coherent', 'iommus' were unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/generic-xhci.yaml#
   arch/arm64/boot/dts/marvell/armada-7040-mochabin.dtb: usb@510000: Unevaluated properties are not allowed ('dma-coherent', 'iommus' were unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/generic-xhci.yaml#
>> arch/arm64/boot/dts/marvell/armada-7040-mochabin.dtb: /cp0-bus/bus@f2000000/spi@700600: failed to match any schema with compatible: ['marvell,armada-380-spi']
   arch/arm64/boot/dts/marvell/armada-7040-mochabin.dtb: /cp0-bus/bus@f2000000/spi@700680: failed to match any schema with compatible: ['marvell,armada-380-spi']
   arch/arm64/boot/dts/marvell/armada-7040-mochabin.dtb: crypto@800000: 'dma-coherent' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/crypto/inside-secure,safexcel.yaml#
>> arch/arm64/boot/dts/marvell/armada-7040-mochabin.dtb: /cp0-bus/pcie@f2600000: failed to match any schema with compatible: ['marvell,armada8k-pcie', 'snps,dw-pcie']
>> arch/arm64/boot/dts/marvell/armada-7040-mochabin.dtb: /cp0-bus/pcie@f2620000: failed to match any schema with compatible: ['marvell,armada8k-pcie', 'snps,dw-pcie']
>> arch/arm64/boot/dts/marvell/armada-7040-mochabin.dtb: /cp0-bus/pcie@f2640000: failed to match any schema with compatible: ['marvell,armada8k-pcie', 'snps,dw-pcie']
--
   arch/arm64/boot/dts/marvell/armada-ap80x.dtsi:282.24-292.7: Warning (unit_address_vs_reg): /soc/bus@f0000000/system-controller@6f4000/gpio@1040: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/marvell/armada-cp11x.dtsi:235.24-254.6: Warning (unit_address_vs_reg): /cp0-bus/bus@f2000000/system-controller@440000/gpio@100: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/marvell/armada-cp11x.dtsi:256.24-275.6: Warning (unit_address_vs_reg): /cp0-bus/bus@f2000000/system-controller@440000/gpio@140: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/marvell/armada-cp11x.dtsi:235.24-254.6: Warning (unit_address_vs_reg): /cp1-bus/bus@f4000000/system-controller@440000/gpio@100: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/marvell/armada-cp11x.dtsi:256.24-275.6: Warning (unit_address_vs_reg): /cp1-bus/bus@f4000000/system-controller@440000/gpio@140: node has a unit name, but no reg or ranges property
>> arch/arm64/boot/dts/marvell/armada-8040-clearfog-gt-8k.dtb: /soc/bus@f0000000/odmi@300000: failed to match any schema with compatible: ['marvell,odmi-controller']
>> arch/arm64/boot/dts/marvell/armada-8040-clearfog-gt-8k.dtb: /soc/bus@f0000000/gicp@3f0040: failed to match any schema with compatible: ['marvell,ap806-gicp']
>> arch/arm64/boot/dts/marvell/armada-8040-clearfog-gt-8k.dtb: /soc/bus@f0000000/interrupt-controller@3f0100: failed to match any schema with compatible: ['marvell,armada-8k-pic']
>> arch/arm64/boot/dts/marvell/armada-8040-clearfog-gt-8k.dtb: /soc/bus@f0000000/interrupt-controller@3f0200: failed to match any schema with compatible: ['marvell,ap806-sei']
>> arch/arm64/boot/dts/marvell/armada-8040-clearfog-gt-8k.dtb: /soc/bus@f0000000/spi@510600: failed to match any schema with compatible: ['marvell,armada-380-spi']
   arch/arm64/boot/dts/marvell/armada-8040-clearfog-gt-8k.dtb: mmc@6e0000: clocks: [[4, 4]] is too short
   	from schema $id: http://devicetree.org/schemas/mmc/marvell,xenon-sdhci.yaml#
   arch/arm64/boot/dts/marvell/armada-8040-clearfog-gt-8k.dtb: mmc@6e0000: clock-names: ['core'] is too short
   	from schema $id: http://devicetree.org/schemas/mmc/marvell,xenon-sdhci.yaml#
   arch/arm64/boot/dts/marvell/armada-8040-clearfog-gt-8k.dtb: system-controller@6f4000: compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
>> arch/arm64/boot/dts/marvell/armada-8040-clearfog-gt-8k.dtb: /soc/bus@f0000000/system-controller@6f4000/pinctrl: failed to match any schema with compatible: ['marvell,ap806-pinctrl']
   arch/arm64/boot/dts/marvell/armada-8040-clearfog-gt-8k.dtb: gpio@1040: Unevaluated properties are not allowed ('gpio-ranges' was unexpected)
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-mvebu.yaml#
>> arch/arm64/boot/dts/marvell/armada-8040-clearfog-gt-8k.dtb: /soc/bus@f0000000/system-controller@6f4000/clock: failed to match any schema with compatible: ['marvell,ap806-clock']
   arch/arm64/boot/dts/marvell/armada-8040-clearfog-gt-8k.dtb: system-controller@6f8000: compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
>> arch/arm64/boot/dts/marvell/armada-8040-clearfog-gt-8k.dtb: /soc/bus@f0000000/system-controller@6f8000/thermal-sensor@80: failed to match any schema with compatible: ['marvell,armada-ap806-thermal']
>> arch/arm64/boot/dts/marvell/armada-8040-clearfog-gt-8k.dtb: /soc/bus@f0000000/system-controller@6f8000/clock-cpu@278: failed to match any schema with compatible: ['marvell,ap806-cpu-clock']
>> arch/arm64/boot/dts/marvell/armada-8040-clearfog-gt-8k.dtb: /cp0-bus/bus@f2000000/phy@120000: failed to match any schema with compatible: ['marvell,comphy-cp110']
>> arch/arm64/boot/dts/marvell/armada-8040-clearfog-gt-8k.dtb: /cp0-bus/bus@f2000000/interrupt-controller@1e0000: failed to match any schema with compatible: ['marvell,cp110-icu']
>> arch/arm64/boot/dts/marvell/armada-8040-clearfog-gt-8k.dtb: /cp0-bus/bus@f2000000/interrupt-controller@1e0000/interrupt-controller@10: failed to match any schema with compatible: ['marvell,cp110-icu-nsr']
>> arch/arm64/boot/dts/marvell/armada-8040-clearfog-gt-8k.dtb: /cp0-bus/bus@f2000000/interrupt-controller@1e0000/interrupt-controller@50: failed to match any schema with compatible: ['marvell,cp110-icu-sei']
   arch/arm64/boot/dts/marvell/armada-8040-clearfog-gt-8k.dtb: system-controller@440000: compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
>> arch/arm64/boot/dts/marvell/armada-8040-clearfog-gt-8k.dtb: /cp0-bus/bus@f2000000/system-controller@440000/clock: failed to match any schema with compatible: ['marvell,cp110-clock']
   arch/arm64/boot/dts/marvell/armada-8040-clearfog-gt-8k.dtb: gpio@140: Unevaluated properties are not allowed ('gpio-ranges', 'lte-disable-hog', 'lte-reset-hog', 'sata-reset-hog', 'wlan_disable-hog' were unexpected)
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-mvebu.yaml#
>> arch/arm64/boot/dts/marvell/armada-8040-clearfog-gt-8k.dtb: /cp0-bus/bus@f2000000/system-controller@440000/pinctrl: failed to match any schema with compatible: ['marvell,armada-8k-cpm-pinctrl']
   arch/arm64/boot/dts/marvell/armada-8040-clearfog-gt-8k.dtb: system-controller@400000: compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
>> arch/arm64/boot/dts/marvell/armada-8040-clearfog-gt-8k.dtb: /cp0-bus/bus@f2000000/system-controller@400000/thermal-sensor@70: failed to match any schema with compatible: ['marvell,armada-cp110-thermal']
   arch/arm64/boot/dts/marvell/armada-8040-clearfog-gt-8k.dtb: usb@510000: Unevaluated properties are not allowed ('dma-coherent', 'iommus' were unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/generic-xhci.yaml#
>> arch/arm64/boot/dts/marvell/armada-8040-clearfog-gt-8k.dtb: /cp0-bus/bus@f2000000/spi@700600: failed to match any schema with compatible: ['marvell,armada-380-spi']
   arch/arm64/boot/dts/marvell/armada-8040-clearfog-gt-8k.dtb: /cp0-bus/bus@f2000000/spi@700680: failed to match any schema with compatible: ['marvell,armada-380-spi']
   arch/arm64/boot/dts/marvell/armada-8040-clearfog-gt-8k.dtb: crypto@800000: 'dma-coherent' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/crypto/inside-secure,safexcel.yaml#
>> arch/arm64/boot/dts/marvell/armada-8040-clearfog-gt-8k.dtb: /cp0-bus/pcie@f2600000: failed to match any schema with compatible: ['marvell,armada8k-pcie', 'snps,dw-pcie']
>> arch/arm64/boot/dts/marvell/armada-8040-clearfog-gt-8k.dtb: /cp0-bus/pcie@f2620000: failed to match any schema with compatible: ['marvell,armada8k-pcie', 'snps,dw-pcie']
>> arch/arm64/boot/dts/marvell/armada-8040-clearfog-gt-8k.dtb: /cp0-bus/pcie@f2640000: failed to match any schema with compatible: ['marvell,armada8k-pcie', 'snps,dw-pcie']
>> arch/arm64/boot/dts/marvell/armada-8040-clearfog-gt-8k.dtb: /cp1-bus/bus@f4000000/phy@120000: failed to match any schema with compatible: ['marvell,comphy-cp110']
   arch/arm64/boot/dts/marvell/armada-8040-clearfog-gt-8k.dtb: connector: Unevaluated properties are not allowed ('phy-supply' was unexpected)
   	from schema $id: http://devicetree.org/schemas/connector/usb-connector.yaml#
>> arch/arm64/boot/dts/marvell/armada-8040-clearfog-gt-8k.dtb: /cp1-bus/bus@f4000000/interrupt-controller@1e0000: failed to match any schema with compatible: ['marvell,cp110-icu']
>> arch/arm64/boot/dts/marvell/armada-8040-clearfog-gt-8k.dtb: /cp1-bus/bus@f4000000/interrupt-controller@1e0000/interrupt-controller@10: failed to match any schema with compatible: ['marvell,cp110-icu-nsr']
>> arch/arm64/boot/dts/marvell/armada-8040-clearfog-gt-8k.dtb: /cp1-bus/bus@f4000000/interrupt-controller@1e0000/interrupt-controller@50: failed to match any schema with compatible: ['marvell,cp110-icu-sei']
   arch/arm64/boot/dts/marvell/armada-8040-clearfog-gt-8k.dtb: system-controller@440000: compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
>> arch/arm64/boot/dts/marvell/armada-8040-clearfog-gt-8k.dtb: /cp1-bus/bus@f4000000/system-controller@440000/clock: failed to match any schema with compatible: ['marvell,cp110-clock']
   arch/arm64/boot/dts/marvell/armada-8040-clearfog-gt-8k.dtb: gpio@100: Unevaluated properties are not allowed ('gpio-ranges' was unexpected)
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-mvebu.yaml#
>> arch/arm64/boot/dts/marvell/armada-8040-clearfog-gt-8k.dtb: /cp1-bus/bus@f4000000/system-controller@440000/pinctrl: failed to match any schema with compatible: ['marvell,armada-8k-cps-pinctrl']
   arch/arm64/boot/dts/marvell/armada-8040-clearfog-gt-8k.dtb: system-controller@400000: compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
>> arch/arm64/boot/dts/marvell/armada-8040-clearfog-gt-8k.dtb: /cp1-bus/bus@f4000000/system-controller@400000/thermal-sensor@70: failed to match any schema with compatible: ['marvell,armada-cp110-thermal']
   arch/arm64/boot/dts/marvell/armada-8040-clearfog-gt-8k.dtb: usb@500000: Unevaluated properties are not allowed ('dma-coherent', 'iommus' were unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/generic-xhci.yaml#
>> arch/arm64/boot/dts/marvell/armada-8040-clearfog-gt-8k.dtb: /cp1-bus/bus@f4000000/spi@700600: failed to match any schema with compatible: ['marvell,armada-380-spi']
   arch/arm64/boot/dts/marvell/armada-8040-clearfog-gt-8k.dtb: /cp1-bus/bus@f4000000/spi@700680: failed to match any schema with compatible: ['marvell,armada-380-spi']
>> arch/arm64/boot/dts/marvell/armada-8040-clearfog-gt-8k.dtb: /cp1-bus/bus@f4000000/spi@700680/flash@0: failed to match any schema with compatible: ['st,w25q32']
   arch/arm64/boot/dts/marvell/armada-8040-clearfog-gt-8k.dtb: crypto@800000: 'dma-coherent' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/crypto/inside-secure,safexcel.yaml#
>> arch/arm64/boot/dts/marvell/armada-8040-clearfog-gt-8k.dtb: /cp1-bus/pcie@f4600000: failed to match any schema with compatible: ['marvell,armada8k-pcie', 'snps,dw-pcie']
>> arch/arm64/boot/dts/marvell/armada-8040-clearfog-gt-8k.dtb: /cp1-bus/pcie@f4620000: failed to match any schema with compatible: ['marvell,armada8k-pcie', 'snps,dw-pcie']
>> arch/arm64/boot/dts/marvell/armada-8040-clearfog-gt-8k.dtb: /cp1-bus/pcie@f4640000: failed to match any schema with compatible: ['marvell,armada8k-pcie', 'snps,dw-pcie']
--
   arch/arm64/boot/dts/marvell/armada-8040-db.dtb: connector: Unevaluated properties are not allowed ('phy-supply' was unexpected)
   	from schema $id: http://devicetree.org/schemas/connector/usb-connector.yaml#
   arch/arm64/boot/dts/marvell/armada-8040-db.dtb: /cp0-bus/bus@f2000000/interrupt-controller@1e0000: failed to match any schema with compatible: ['marvell,cp110-icu']
   arch/arm64/boot/dts/marvell/armada-8040-db.dtb: /cp0-bus/bus@f2000000/interrupt-controller@1e0000/interrupt-controller@10: failed to match any schema with compatible: ['marvell,cp110-icu-nsr']
   arch/arm64/boot/dts/marvell/armada-8040-db.dtb: /cp0-bus/bus@f2000000/interrupt-controller@1e0000/interrupt-controller@50: failed to match any schema with compatible: ['marvell,cp110-icu-sei']
   arch/arm64/boot/dts/marvell/armada-8040-db.dtb: system-controller@440000: compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
   arch/arm64/boot/dts/marvell/armada-8040-db.dtb: /cp0-bus/bus@f2000000/system-controller@440000/clock: failed to match any schema with compatible: ['marvell,cp110-clock']
   arch/arm64/boot/dts/marvell/armada-8040-db.dtb: gpio@140: Unevaluated properties are not allowed ('gpio-ranges' was unexpected)
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-mvebu.yaml#
>> arch/arm64/boot/dts/marvell/armada-8040-db.dtb: /cp0-bus/bus@f2000000/system-controller@440000/pinctrl: failed to match any schema with compatible: ['marvell,armada-8k-cpm-pinctrl']
   arch/arm64/boot/dts/marvell/armada-8040-db.dtb: system-controller@400000: compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
   arch/arm64/boot/dts/marvell/armada-8040-db.dtb: /cp0-bus/bus@f2000000/system-controller@400000/thermal-sensor@70: failed to match any schema with compatible: ['marvell,armada-cp110-thermal']
   arch/arm64/boot/dts/marvell/armada-8040-db.dtb: usb@500000: Unevaluated properties are not allowed ('dma-coherent', 'dr_mode', 'iommus' were unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/generic-xhci.yaml#
   arch/arm64/boot/dts/marvell/armada-8040-db.dtb: usb@510000: Unevaluated properties are not allowed ('dma-coherent', 'dr_mode', 'iommus' were unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/generic-xhci.yaml#
   arch/arm64/boot/dts/marvell/armada-8040-db.dtb: /cp0-bus/bus@f2000000/spi@700600: failed to match any schema with compatible: ['marvell,armada-380-spi']
   arch/arm64/boot/dts/marvell/armada-8040-db.dtb: /cp0-bus/bus@f2000000/spi@700680: failed to match any schema with compatible: ['marvell,armada-380-spi']
   arch/arm64/boot/dts/marvell/armada-8040-db.dtb: pca9555@21: 'pinctrl-0' is a dependency of 'pinctrl-names'
   	from schema $id: http://devicetree.org/schemas/pinctrl/pinctrl-consumer.yaml#
   arch/arm64/boot/dts/marvell/armada-8040-db.dtb: pca9555@25: 'pinctrl-0' is a dependency of 'pinctrl-names'
   	from schema $id: http://devicetree.org/schemas/pinctrl/pinctrl-consumer.yaml#
   arch/arm64/boot/dts/marvell/armada-8040-db.dtb: crypto@800000: 'dma-coherent' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/crypto/inside-secure,safexcel.yaml#
   arch/arm64/boot/dts/marvell/armada-8040-db.dtb: /cp0-bus/pcie@f2600000: failed to match any schema with compatible: ['marvell,armada8k-pcie', 'snps,dw-pcie']
   arch/arm64/boot/dts/marvell/armada-8040-db.dtb: /cp0-bus/pcie@f2620000: failed to match any schema with compatible: ['marvell,armada8k-pcie', 'snps,dw-pcie']
   arch/arm64/boot/dts/marvell/armada-8040-db.dtb: /cp0-bus/pcie@f2640000: failed to match any schema with compatible: ['marvell,armada8k-pcie', 'snps,dw-pcie']
>> arch/arm64/boot/dts/marvell/armada-8040-db.dtb: /cp1-bus/bus@f4000000/phy@120000: failed to match any schema with compatible: ['marvell,comphy-cp110']
>> arch/arm64/boot/dts/marvell/armada-8040-db.dtb: /cp1-bus/bus@f4000000/interrupt-controller@1e0000: failed to match any schema with compatible: ['marvell,cp110-icu']
>> arch/arm64/boot/dts/marvell/armada-8040-db.dtb: /cp1-bus/bus@f4000000/interrupt-controller@1e0000/interrupt-controller@10: failed to match any schema with compatible: ['marvell,cp110-icu-nsr']
>> arch/arm64/boot/dts/marvell/armada-8040-db.dtb: /cp1-bus/bus@f4000000/interrupt-controller@1e0000/interrupt-controller@50: failed to match any schema with compatible: ['marvell,cp110-icu-sei']
   arch/arm64/boot/dts/marvell/armada-8040-db.dtb: system-controller@440000: compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
>> arch/arm64/boot/dts/marvell/armada-8040-db.dtb: /cp1-bus/bus@f4000000/system-controller@440000/clock: failed to match any schema with compatible: ['marvell,cp110-clock']
   arch/arm64/boot/dts/marvell/armada-8040-db.dtb: gpio@100: Unevaluated properties are not allowed ('gpio-ranges' was unexpected)
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-mvebu.yaml#
>> arch/arm64/boot/dts/marvell/armada-8040-db.dtb: /cp1-bus/bus@f4000000/system-controller@440000/pinctrl: failed to match any schema with compatible: ['marvell,armada-8k-cps-pinctrl']
   arch/arm64/boot/dts/marvell/armada-8040-db.dtb: system-controller@400000: compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
>> arch/arm64/boot/dts/marvell/armada-8040-db.dtb: /cp1-bus/bus@f4000000/system-controller@400000/thermal-sensor@70: failed to match any schema with compatible: ['marvell,armada-cp110-thermal']
   arch/arm64/boot/dts/marvell/armada-8040-db.dtb: usb@500000: Unevaluated properties are not allowed ('dma-coherent', 'dr_mode', 'iommus' were unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/generic-xhci.yaml#
   arch/arm64/boot/dts/marvell/armada-8040-db.dtb: usb@510000: Unevaluated properties are not allowed ('dma-coherent', 'iommus' were unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/generic-xhci.yaml#
>> arch/arm64/boot/dts/marvell/armada-8040-db.dtb: /cp1-bus/bus@f4000000/spi@700600: failed to match any schema with compatible: ['marvell,armada-380-spi']
   arch/arm64/boot/dts/marvell/armada-8040-db.dtb: /cp1-bus/bus@f4000000/spi@700680: failed to match any schema with compatible: ['marvell,armada-380-spi']
   arch/arm64/boot/dts/marvell/armada-8040-db.dtb: crypto@800000: 'dma-coherent' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/crypto/inside-secure,safexcel.yaml#
>> arch/arm64/boot/dts/marvell/armada-8040-db.dtb: /cp1-bus/pcie@f4600000: failed to match any schema with compatible: ['marvell,armada8k-pcie', 'snps,dw-pcie']
>> arch/arm64/boot/dts/marvell/armada-8040-db.dtb: /cp1-bus/pcie@f4620000: failed to match any schema with compatible: ['marvell,armada8k-pcie', 'snps,dw-pcie']
>> arch/arm64/boot/dts/marvell/armada-8040-db.dtb: /cp1-bus/pcie@f4640000: failed to match any schema with compatible: ['marvell,armada8k-pcie', 'snps,dw-pcie']
   arch/arm64/boot/dts/marvell/armada-8040-db.dtb: cp0-usb3-0-phy: '#phy-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/usb/usb-nop-xceiv.yaml#
   arch/arm64/boot/dts/marvell/armada-8040-db.dtb: cp1-usb3-0-phy: '#phy-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/usb/usb-nop-xceiv.yaml#
--
   arch/arm64/boot/dts/marvell/armada-ap80x.dtsi:282.24-292.7: Warning (unit_address_vs_reg): /soc/bus@f0000000/system-controller@6f4000/gpio@1040: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/marvell/armada-cp11x.dtsi:235.24-254.6: Warning (unit_address_vs_reg): /cp0-bus/bus@f2000000/system-controller@440000/gpio@100: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/marvell/armada-cp11x.dtsi:256.24-275.6: Warning (unit_address_vs_reg): /cp0-bus/bus@f2000000/system-controller@440000/gpio@140: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/marvell/armada-cp11x.dtsi:235.24-254.6: Warning (unit_address_vs_reg): /cp1-bus/bus@f4000000/system-controller@440000/gpio@100: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/marvell/armada-cp11x.dtsi:256.24-275.6: Warning (unit_address_vs_reg): /cp1-bus/bus@f4000000/system-controller@440000/gpio@140: node has a unit name, but no reg or ranges property
>> arch/arm64/boot/dts/marvell/armada-8040-mcbin.dtb: /soc/bus@f0000000/odmi@300000: failed to match any schema with compatible: ['marvell,odmi-controller']
>> arch/arm64/boot/dts/marvell/armada-8040-mcbin.dtb: /soc/bus@f0000000/gicp@3f0040: failed to match any schema with compatible: ['marvell,ap806-gicp']
>> arch/arm64/boot/dts/marvell/armada-8040-mcbin.dtb: /soc/bus@f0000000/interrupt-controller@3f0100: failed to match any schema with compatible: ['marvell,armada-8k-pic']
>> arch/arm64/boot/dts/marvell/armada-8040-mcbin.dtb: /soc/bus@f0000000/interrupt-controller@3f0200: failed to match any schema with compatible: ['marvell,ap806-sei']
>> arch/arm64/boot/dts/marvell/armada-8040-mcbin.dtb: /soc/bus@f0000000/spi@510600: failed to match any schema with compatible: ['marvell,armada-380-spi']
   arch/arm64/boot/dts/marvell/armada-8040-mcbin.dtb: mmc@6e0000: clocks: [[4, 4]] is too short
   	from schema $id: http://devicetree.org/schemas/mmc/marvell,xenon-sdhci.yaml#
   arch/arm64/boot/dts/marvell/armada-8040-mcbin.dtb: mmc@6e0000: clock-names: ['core'] is too short
   	from schema $id: http://devicetree.org/schemas/mmc/marvell,xenon-sdhci.yaml#
   arch/arm64/boot/dts/marvell/armada-8040-mcbin.dtb: system-controller@6f4000: compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
>> arch/arm64/boot/dts/marvell/armada-8040-mcbin.dtb: /soc/bus@f0000000/system-controller@6f4000/pinctrl: failed to match any schema with compatible: ['marvell,ap806-pinctrl']
   arch/arm64/boot/dts/marvell/armada-8040-mcbin.dtb: gpio@1040: Unevaluated properties are not allowed ('gpio-ranges' was unexpected)
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-mvebu.yaml#
>> arch/arm64/boot/dts/marvell/armada-8040-mcbin.dtb: /soc/bus@f0000000/system-controller@6f4000/clock: failed to match any schema with compatible: ['marvell,ap806-clock']
   arch/arm64/boot/dts/marvell/armada-8040-mcbin.dtb: system-controller@6f8000: compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
>> arch/arm64/boot/dts/marvell/armada-8040-mcbin.dtb: /soc/bus@f0000000/system-controller@6f8000/thermal-sensor@80: failed to match any schema with compatible: ['marvell,armada-ap806-thermal']
>> arch/arm64/boot/dts/marvell/armada-8040-mcbin.dtb: /soc/bus@f0000000/system-controller@6f8000/clock-cpu@278: failed to match any schema with compatible: ['marvell,ap806-cpu-clock']
>> arch/arm64/boot/dts/marvell/armada-8040-mcbin.dtb: /cp0-bus/bus@f2000000/phy@120000: failed to match any schema with compatible: ['marvell,comphy-cp110']
>> arch/arm64/boot/dts/marvell/armada-8040-mcbin.dtb: /cp0-bus/bus@f2000000/interrupt-controller@1e0000: failed to match any schema with compatible: ['marvell,cp110-icu']
>> arch/arm64/boot/dts/marvell/armada-8040-mcbin.dtb: /cp0-bus/bus@f2000000/interrupt-controller@1e0000/interrupt-controller@10: failed to match any schema with compatible: ['marvell,cp110-icu-nsr']
>> arch/arm64/boot/dts/marvell/armada-8040-mcbin.dtb: /cp0-bus/bus@f2000000/interrupt-controller@1e0000/interrupt-controller@50: failed to match any schema with compatible: ['marvell,cp110-icu-sei']
   arch/arm64/boot/dts/marvell/armada-8040-mcbin.dtb: system-controller@440000: compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
>> arch/arm64/boot/dts/marvell/armada-8040-mcbin.dtb: /cp0-bus/bus@f2000000/system-controller@440000/clock: failed to match any schema with compatible: ['marvell,cp110-clock']
   arch/arm64/boot/dts/marvell/armada-8040-mcbin.dtb: gpio@140: Unevaluated properties are not allowed ('gpio-ranges' was unexpected)
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-mvebu.yaml#
>> arch/arm64/boot/dts/marvell/armada-8040-mcbin.dtb: /cp0-bus/bus@f2000000/system-controller@440000/pinctrl: failed to match any schema with compatible: ['marvell,armada-8k-cpm-pinctrl']
   arch/arm64/boot/dts/marvell/armada-8040-mcbin.dtb: system-controller@400000: compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
>> arch/arm64/boot/dts/marvell/armada-8040-mcbin.dtb: /cp0-bus/bus@f2000000/system-controller@400000/thermal-sensor@70: failed to match any schema with compatible: ['marvell,armada-cp110-thermal']
   arch/arm64/boot/dts/marvell/armada-8040-mcbin.dtb: usb@500000: Unevaluated properties are not allowed ('dma-coherent', 'dr_mode', 'iommus' were unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/generic-xhci.yaml#
   arch/arm64/boot/dts/marvell/armada-8040-mcbin.dtb: usb@510000: Unevaluated properties are not allowed ('dma-coherent', 'dr_mode', 'iommus' were unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/generic-xhci.yaml#
>> arch/arm64/boot/dts/marvell/armada-8040-mcbin.dtb: /cp0-bus/bus@f2000000/spi@700600: failed to match any schema with compatible: ['marvell,armada-380-spi']
   arch/arm64/boot/dts/marvell/armada-8040-mcbin.dtb: /cp0-bus/bus@f2000000/spi@700680: failed to match any schema with compatible: ['marvell,armada-380-spi']
   arch/arm64/boot/dts/marvell/armada-8040-mcbin.dtb: crypto@800000: 'dma-coherent' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/crypto/inside-secure,safexcel.yaml#
>> arch/arm64/boot/dts/marvell/armada-8040-mcbin.dtb: /cp0-bus/pcie@f2600000: failed to match any schema with compatible: ['marvell,armada8k-pcie', 'snps,dw-pcie']
>> arch/arm64/boot/dts/marvell/armada-8040-mcbin.dtb: /cp0-bus/pcie@f2620000: failed to match any schema with compatible: ['marvell,armada8k-pcie', 'snps,dw-pcie']
>> arch/arm64/boot/dts/marvell/armada-8040-mcbin.dtb: /cp0-bus/pcie@f2640000: failed to match any schema with compatible: ['marvell,armada8k-pcie', 'snps,dw-pcie']
>> arch/arm64/boot/dts/marvell/armada-8040-mcbin.dtb: /cp1-bus/bus@f4000000/phy@120000: failed to match any schema with compatible: ['marvell,comphy-cp110']
   arch/arm64/boot/dts/marvell/armada-8040-mcbin.dtb: connector: Unevaluated properties are not allowed ('phy-supply' was unexpected)
   	from schema $id: http://devicetree.org/schemas/connector/usb-connector.yaml#
>> arch/arm64/boot/dts/marvell/armada-8040-mcbin.dtb: /cp1-bus/bus@f4000000/interrupt-controller@1e0000: failed to match any schema with compatible: ['marvell,cp110-icu']
>> arch/arm64/boot/dts/marvell/armada-8040-mcbin.dtb: /cp1-bus/bus@f4000000/interrupt-controller@1e0000/interrupt-controller@10: failed to match any schema with compatible: ['marvell,cp110-icu-nsr']
>> arch/arm64/boot/dts/marvell/armada-8040-mcbin.dtb: /cp1-bus/bus@f4000000/interrupt-controller@1e0000/interrupt-controller@50: failed to match any schema with compatible: ['marvell,cp110-icu-sei']
   arch/arm64/boot/dts/marvell/armada-8040-mcbin.dtb: system-controller@440000: compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
>> arch/arm64/boot/dts/marvell/armada-8040-mcbin.dtb: /cp1-bus/bus@f4000000/system-controller@440000/clock: failed to match any schema with compatible: ['marvell,cp110-clock']
   arch/arm64/boot/dts/marvell/armada-8040-mcbin.dtb: gpio@100: Unevaluated properties are not allowed ('gpio-ranges' was unexpected)
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-mvebu.yaml#
>> arch/arm64/boot/dts/marvell/armada-8040-mcbin.dtb: /cp1-bus/bus@f4000000/system-controller@440000/pinctrl: failed to match any schema with compatible: ['marvell,armada-8k-cps-pinctrl']
   arch/arm64/boot/dts/marvell/armada-8040-mcbin.dtb: system-controller@400000: compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
>> arch/arm64/boot/dts/marvell/armada-8040-mcbin.dtb: /cp1-bus/bus@f4000000/system-controller@400000/thermal-sensor@70: failed to match any schema with compatible: ['marvell,armada-cp110-thermal']
   arch/arm64/boot/dts/marvell/armada-8040-mcbin.dtb: usb@500000: Unevaluated properties are not allowed ('dma-coherent', 'dr_mode', 'iommus' were unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/generic-xhci.yaml#
>> arch/arm64/boot/dts/marvell/armada-8040-mcbin.dtb: /cp1-bus/bus@f4000000/spi@700600: failed to match any schema with compatible: ['marvell,armada-380-spi']
   arch/arm64/boot/dts/marvell/armada-8040-mcbin.dtb: /cp1-bus/bus@f4000000/spi@700680: failed to match any schema with compatible: ['marvell,armada-380-spi']
>> arch/arm64/boot/dts/marvell/armada-8040-mcbin.dtb: /cp1-bus/bus@f4000000/spi@700680/flash@0: failed to match any schema with compatible: ['st,w25q32']
   arch/arm64/boot/dts/marvell/armada-8040-mcbin.dtb: crypto@800000: 'dma-coherent' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/crypto/inside-secure,safexcel.yaml#
>> arch/arm64/boot/dts/marvell/armada-8040-mcbin.dtb: /cp1-bus/pcie@f4600000: failed to match any schema with compatible: ['marvell,armada8k-pcie', 'snps,dw-pcie']
>> arch/arm64/boot/dts/marvell/armada-8040-mcbin.dtb: /cp1-bus/pcie@f4620000: failed to match any schema with compatible: ['marvell,armada8k-pcie', 'snps,dw-pcie']
>> arch/arm64/boot/dts/marvell/armada-8040-mcbin.dtb: /cp1-bus/pcie@f4640000: failed to match any schema with compatible: ['marvell,armada8k-pcie', 'snps,dw-pcie']
--
   arch/arm64/boot/dts/marvell/armada-ap80x.dtsi:282.24-292.7: Warning (unit_address_vs_reg): /soc/bus@f0000000/system-controller@6f4000/gpio@1040: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/marvell/armada-cp11x.dtsi:235.24-254.6: Warning (unit_address_vs_reg): /cp0-bus/bus@f2000000/system-controller@440000/gpio@100: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/marvell/armada-cp11x.dtsi:256.24-275.6: Warning (unit_address_vs_reg): /cp0-bus/bus@f2000000/system-controller@440000/gpio@140: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/marvell/armada-cp11x.dtsi:235.24-254.6: Warning (unit_address_vs_reg): /cp1-bus/bus@f4000000/system-controller@440000/gpio@100: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/marvell/armada-cp11x.dtsi:256.24-275.6: Warning (unit_address_vs_reg): /cp1-bus/bus@f4000000/system-controller@440000/gpio@140: node has a unit name, but no reg or ranges property
>> arch/arm64/boot/dts/marvell/armada-8040-mcbin-singleshot.dtb: /soc/bus@f0000000/odmi@300000: failed to match any schema with compatible: ['marvell,odmi-controller']
>> arch/arm64/boot/dts/marvell/armada-8040-mcbin-singleshot.dtb: /soc/bus@f0000000/gicp@3f0040: failed to match any schema with compatible: ['marvell,ap806-gicp']
>> arch/arm64/boot/dts/marvell/armada-8040-mcbin-singleshot.dtb: /soc/bus@f0000000/interrupt-controller@3f0100: failed to match any schema with compatible: ['marvell,armada-8k-pic']
>> arch/arm64/boot/dts/marvell/armada-8040-mcbin-singleshot.dtb: /soc/bus@f0000000/interrupt-controller@3f0200: failed to match any schema with compatible: ['marvell,ap806-sei']
>> arch/arm64/boot/dts/marvell/armada-8040-mcbin-singleshot.dtb: /soc/bus@f0000000/spi@510600: failed to match any schema with compatible: ['marvell,armada-380-spi']
   arch/arm64/boot/dts/marvell/armada-8040-mcbin-singleshot.dtb: mmc@6e0000: clocks: [[4, 4]] is too short
   	from schema $id: http://devicetree.org/schemas/mmc/marvell,xenon-sdhci.yaml#
   arch/arm64/boot/dts/marvell/armada-8040-mcbin-singleshot.dtb: mmc@6e0000: clock-names: ['core'] is too short
   	from schema $id: http://devicetree.org/schemas/mmc/marvell,xenon-sdhci.yaml#
   arch/arm64/boot/dts/marvell/armada-8040-mcbin-singleshot.dtb: system-controller@6f4000: compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
>> arch/arm64/boot/dts/marvell/armada-8040-mcbin-singleshot.dtb: /soc/bus@f0000000/system-controller@6f4000/pinctrl: failed to match any schema with compatible: ['marvell,ap806-pinctrl']
   arch/arm64/boot/dts/marvell/armada-8040-mcbin-singleshot.dtb: gpio@1040: Unevaluated properties are not allowed ('gpio-ranges' was unexpected)
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-mvebu.yaml#
>> arch/arm64/boot/dts/marvell/armada-8040-mcbin-singleshot.dtb: /soc/bus@f0000000/system-controller@6f4000/clock: failed to match any schema with compatible: ['marvell,ap806-clock']
   arch/arm64/boot/dts/marvell/armada-8040-mcbin-singleshot.dtb: system-controller@6f8000: compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
>> arch/arm64/boot/dts/marvell/armada-8040-mcbin-singleshot.dtb: /soc/bus@f0000000/system-controller@6f8000/thermal-sensor@80: failed to match any schema with compatible: ['marvell,armada-ap806-thermal']
>> arch/arm64/boot/dts/marvell/armada-8040-mcbin-singleshot.dtb: /soc/bus@f0000000/system-controller@6f8000/clock-cpu@278: failed to match any schema with compatible: ['marvell,ap806-cpu-clock']
>> arch/arm64/boot/dts/marvell/armada-8040-mcbin-singleshot.dtb: /cp0-bus/bus@f2000000/phy@120000: failed to match any schema with compatible: ['marvell,comphy-cp110']
>> arch/arm64/boot/dts/marvell/armada-8040-mcbin-singleshot.dtb: /cp0-bus/bus@f2000000/interrupt-controller@1e0000: failed to match any schema with compatible: ['marvell,cp110-icu']
>> arch/arm64/boot/dts/marvell/armada-8040-mcbin-singleshot.dtb: /cp0-bus/bus@f2000000/interrupt-controller@1e0000/interrupt-controller@10: failed to match any schema with compatible: ['marvell,cp110-icu-nsr']
>> arch/arm64/boot/dts/marvell/armada-8040-mcbin-singleshot.dtb: /cp0-bus/bus@f2000000/interrupt-controller@1e0000/interrupt-controller@50: failed to match any schema with compatible: ['marvell,cp110-icu-sei']
   arch/arm64/boot/dts/marvell/armada-8040-mcbin-singleshot.dtb: system-controller@440000: compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
>> arch/arm64/boot/dts/marvell/armada-8040-mcbin-singleshot.dtb: /cp0-bus/bus@f2000000/system-controller@440000/clock: failed to match any schema with compatible: ['marvell,cp110-clock']
   arch/arm64/boot/dts/marvell/armada-8040-mcbin-singleshot.dtb: gpio@140: Unevaluated properties are not allowed ('gpio-ranges' was unexpected)
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-mvebu.yaml#
>> arch/arm64/boot/dts/marvell/armada-8040-mcbin-singleshot.dtb: /cp0-bus/bus@f2000000/system-controller@440000/pinctrl: failed to match any schema with compatible: ['marvell,armada-8k-cpm-pinctrl']
   arch/arm64/boot/dts/marvell/armada-8040-mcbin-singleshot.dtb: system-controller@400000: compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
>> arch/arm64/boot/dts/marvell/armada-8040-mcbin-singleshot.dtb: /cp0-bus/bus@f2000000/system-controller@400000/thermal-sensor@70: failed to match any schema with compatible: ['marvell,armada-cp110-thermal']
   arch/arm64/boot/dts/marvell/armada-8040-mcbin-singleshot.dtb: usb@500000: Unevaluated properties are not allowed ('dma-coherent', 'dr_mode', 'iommus' were unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/generic-xhci.yaml#
   arch/arm64/boot/dts/marvell/armada-8040-mcbin-singleshot.dtb: usb@510000: Unevaluated properties are not allowed ('dma-coherent', 'dr_mode', 'iommus' were unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/generic-xhci.yaml#
>> arch/arm64/boot/dts/marvell/armada-8040-mcbin-singleshot.dtb: /cp0-bus/bus@f2000000/spi@700600: failed to match any schema with compatible: ['marvell,armada-380-spi']
   arch/arm64/boot/dts/marvell/armada-8040-mcbin-singleshot.dtb: /cp0-bus/bus@f2000000/spi@700680: failed to match any schema with compatible: ['marvell,armada-380-spi']
   arch/arm64/boot/dts/marvell/armada-8040-mcbin-singleshot.dtb: crypto@800000: 'dma-coherent' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/crypto/inside-secure,safexcel.yaml#
>> arch/arm64/boot/dts/marvell/armada-8040-mcbin-singleshot.dtb: /cp0-bus/pcie@f2600000: failed to match any schema with compatible: ['marvell,armada8k-pcie', 'snps,dw-pcie']
>> arch/arm64/boot/dts/marvell/armada-8040-mcbin-singleshot.dtb: /cp0-bus/pcie@f2620000: failed to match any schema with compatible: ['marvell,armada8k-pcie', 'snps,dw-pcie']
>> arch/arm64/boot/dts/marvell/armada-8040-mcbin-singleshot.dtb: /cp0-bus/pcie@f2640000: failed to match any schema with compatible: ['marvell,armada8k-pcie', 'snps,dw-pcie']
>> arch/arm64/boot/dts/marvell/armada-8040-mcbin-singleshot.dtb: /cp1-bus/bus@f4000000/phy@120000: failed to match any schema with compatible: ['marvell,comphy-cp110']
   arch/arm64/boot/dts/marvell/armada-8040-mcbin-singleshot.dtb: connector: Unevaluated properties are not allowed ('phy-supply' was unexpected)
   	from schema $id: http://devicetree.org/schemas/connector/usb-connector.yaml#
>> arch/arm64/boot/dts/marvell/armada-8040-mcbin-singleshot.dtb: /cp1-bus/bus@f4000000/interrupt-controller@1e0000: failed to match any schema with compatible: ['marvell,cp110-icu']
>> arch/arm64/boot/dts/marvell/armada-8040-mcbin-singleshot.dtb: /cp1-bus/bus@f4000000/interrupt-controller@1e0000/interrupt-controller@10: failed to match any schema with compatible: ['marvell,cp110-icu-nsr']
>> arch/arm64/boot/dts/marvell/armada-8040-mcbin-singleshot.dtb: /cp1-bus/bus@f4000000/interrupt-controller@1e0000/interrupt-controller@50: failed to match any schema with compatible: ['marvell,cp110-icu-sei']
   arch/arm64/boot/dts/marvell/armada-8040-mcbin-singleshot.dtb: system-controller@440000: compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
>> arch/arm64/boot/dts/marvell/armada-8040-mcbin-singleshot.dtb: /cp1-bus/bus@f4000000/system-controller@440000/clock: failed to match any schema with compatible: ['marvell,cp110-clock']
   arch/arm64/boot/dts/marvell/armada-8040-mcbin-singleshot.dtb: gpio@100: Unevaluated properties are not allowed ('gpio-ranges' was unexpected)
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-mvebu.yaml#
>> arch/arm64/boot/dts/marvell/armada-8040-mcbin-singleshot.dtb: /cp1-bus/bus@f4000000/system-controller@440000/pinctrl: failed to match any schema with compatible: ['marvell,armada-8k-cps-pinctrl']
   arch/arm64/boot/dts/marvell/armada-8040-mcbin-singleshot.dtb: system-controller@400000: compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
>> arch/arm64/boot/dts/marvell/armada-8040-mcbin-singleshot.dtb: /cp1-bus/bus@f4000000/system-controller@400000/thermal-sensor@70: failed to match any schema with compatible: ['marvell,armada-cp110-thermal']
   arch/arm64/boot/dts/marvell/armada-8040-mcbin-singleshot.dtb: usb@500000: Unevaluated properties are not allowed ('dma-coherent', 'dr_mode', 'iommus' were unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/generic-xhci.yaml#
>> arch/arm64/boot/dts/marvell/armada-8040-mcbin-singleshot.dtb: /cp1-bus/bus@f4000000/spi@700600: failed to match any schema with compatible: ['marvell,armada-380-spi']
   arch/arm64/boot/dts/marvell/armada-8040-mcbin-singleshot.dtb: /cp1-bus/bus@f4000000/spi@700680: failed to match any schema with compatible: ['marvell,armada-380-spi']
>> arch/arm64/boot/dts/marvell/armada-8040-mcbin-singleshot.dtb: /cp1-bus/bus@f4000000/spi@700680/flash@0: failed to match any schema with compatible: ['st,w25q32']
   arch/arm64/boot/dts/marvell/armada-8040-mcbin-singleshot.dtb: crypto@800000: 'dma-coherent' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/crypto/inside-secure,safexcel.yaml#
>> arch/arm64/boot/dts/marvell/armada-8040-mcbin-singleshot.dtb: /cp1-bus/pcie@f4600000: failed to match any schema with compatible: ['marvell,armada8k-pcie', 'snps,dw-pcie']
>> arch/arm64/boot/dts/marvell/armada-8040-mcbin-singleshot.dtb: /cp1-bus/pcie@f4620000: failed to match any schema with compatible: ['marvell,armada8k-pcie', 'snps,dw-pcie']
>> arch/arm64/boot/dts/marvell/armada-8040-mcbin-singleshot.dtb: /cp1-bus/pcie@f4640000: failed to match any schema with compatible: ['marvell,armada8k-pcie', 'snps,dw-pcie']
--
   arch/arm64/boot/dts/marvell/armada-ap80x.dtsi:282.24-292.7: Warning (unit_address_vs_reg): /soc/bus@f0000000/system-controller@6f4000/gpio@1040: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/marvell/armada-cp11x.dtsi:235.24-254.6: Warning (unit_address_vs_reg): /cp0-bus/bus@f2000000/system-controller@440000/gpio@100: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/marvell/armada-cp11x.dtsi:256.24-275.6: Warning (unit_address_vs_reg): /cp0-bus/bus@f2000000/system-controller@440000/gpio@140: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/marvell/armada-cp11x.dtsi:235.24-254.6: Warning (unit_address_vs_reg): /cp1-bus/bus@f4000000/system-controller@440000/gpio@100: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/marvell/armada-cp11x.dtsi:256.24-275.6: Warning (unit_address_vs_reg): /cp1-bus/bus@f4000000/system-controller@440000/gpio@140: node has a unit name, but no reg or ranges property
>> arch/arm64/boot/dts/marvell/armada-8040-puzzle-m801.dtb: /soc/bus@f0000000/odmi@300000: failed to match any schema with compatible: ['marvell,odmi-controller']
>> arch/arm64/boot/dts/marvell/armada-8040-puzzle-m801.dtb: /soc/bus@f0000000/gicp@3f0040: failed to match any schema with compatible: ['marvell,ap806-gicp']
>> arch/arm64/boot/dts/marvell/armada-8040-puzzle-m801.dtb: /soc/bus@f0000000/interrupt-controller@3f0100: failed to match any schema with compatible: ['marvell,armada-8k-pic']
>> arch/arm64/boot/dts/marvell/armada-8040-puzzle-m801.dtb: /soc/bus@f0000000/interrupt-controller@3f0200: failed to match any schema with compatible: ['marvell,ap806-sei']
>> arch/arm64/boot/dts/marvell/armada-8040-puzzle-m801.dtb: /soc/bus@f0000000/spi@510600: failed to match any schema with compatible: ['marvell,armada-380-spi']
   arch/arm64/boot/dts/marvell/armada-8040-puzzle-m801.dtb: flash@0: Unevaluated properties are not allowed ('partition@u-boot', 'partition@u-boot-env', 'partition@ubi1', 'partition@ubi2' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mtd/jedec,spi-nor.yaml#
   arch/arm64/boot/dts/marvell/armada-8040-puzzle-m801.dtb: flash@0: 'partition@u-boot', 'partition@u-boot-env', 'partition@ubi1', 'partition@ubi2' do not match any of the regexes: '.*-names$', '.*-supply$', '^#.*-cells$', '^#[a-zA-Z0-9,+\\-._]{0,63}$', '^[a-zA-Z0-9][a-zA-Z0-9#,+\\-._]{0,63}$', '^[a-zA-Z0-9][a-zA-Z0-9,+\\-._]{0,63}@[0-9a-fA-F]+(,[0-9a-fA-F]+)*$', '^__.*__$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/marvell/armada-8040-puzzle-m801.dtb: /soc/bus@f0000000/serial@512100/mcu: failed to match any schema with compatible: ['iei,wt61p803-puzzle']
>> arch/arm64/boot/dts/marvell/armada-8040-puzzle-m801.dtb: /soc/bus@f0000000/serial@512100/mcu/leds: failed to match any schema with compatible: ['iei,wt61p803-puzzle-leds']
>> arch/arm64/boot/dts/marvell/armada-8040-puzzle-m801.dtb: /soc/bus@f0000000/serial@512100/mcu/hwmon: failed to match any schema with compatible: ['iei,wt61p803-puzzle-hwmon']
   arch/arm64/boot/dts/marvell/armada-8040-puzzle-m801.dtb: mmc@6e0000: clocks: [[4, 4]] is too short
   	from schema $id: http://devicetree.org/schemas/mmc/marvell,xenon-sdhci.yaml#
   arch/arm64/boot/dts/marvell/armada-8040-puzzle-m801.dtb: mmc@6e0000: clock-names: ['core'] is too short
   	from schema $id: http://devicetree.org/schemas/mmc/marvell,xenon-sdhci.yaml#
   arch/arm64/boot/dts/marvell/armada-8040-puzzle-m801.dtb: system-controller@6f4000: compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
>> arch/arm64/boot/dts/marvell/armada-8040-puzzle-m801.dtb: /soc/bus@f0000000/system-controller@6f4000/pinctrl: failed to match any schema with compatible: ['marvell,ap806-pinctrl']
   arch/arm64/boot/dts/marvell/armada-8040-puzzle-m801.dtb: gpio@1040: Unevaluated properties are not allowed ('gpio-ranges' was unexpected)
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-mvebu.yaml#
>> arch/arm64/boot/dts/marvell/armada-8040-puzzle-m801.dtb: /soc/bus@f0000000/system-controller@6f4000/clock: failed to match any schema with compatible: ['marvell,ap806-clock']
   arch/arm64/boot/dts/marvell/armada-8040-puzzle-m801.dtb: system-controller@6f8000: compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
>> arch/arm64/boot/dts/marvell/armada-8040-puzzle-m801.dtb: /soc/bus@f0000000/system-controller@6f8000/thermal-sensor@80: failed to match any schema with compatible: ['marvell,armada-ap806-thermal']
>> arch/arm64/boot/dts/marvell/armada-8040-puzzle-m801.dtb: /soc/bus@f0000000/system-controller@6f8000/clock-cpu@278: failed to match any schema with compatible: ['marvell,ap806-cpu-clock']
   arch/arm64/boot/dts/marvell/armada-8040-puzzle-m801.dtb: thermal-zones: ap-cpu1-thermal:cooling-maps: 'fan-map' does not match any of the regexes: '^map[-a-zA-Z0-9]*$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/marvell/armada-8040-puzzle-m801.dtb: /cp0-bus/bus@f2000000/phy@120000: failed to match any schema with compatible: ['marvell,comphy-cp110']
>> arch/arm64/boot/dts/marvell/armada-8040-puzzle-m801.dtb: /cp0-bus/bus@f2000000/interrupt-controller@1e0000: failed to match any schema with compatible: ['marvell,cp110-icu']
>> arch/arm64/boot/dts/marvell/armada-8040-puzzle-m801.dtb: /cp0-bus/bus@f2000000/interrupt-controller@1e0000/interrupt-controller@10: failed to match any schema with compatible: ['marvell,cp110-icu-nsr']
>> arch/arm64/boot/dts/marvell/armada-8040-puzzle-m801.dtb: /cp0-bus/bus@f2000000/interrupt-controller@1e0000/interrupt-controller@50: failed to match any schema with compatible: ['marvell,cp110-icu-sei']
   arch/arm64/boot/dts/marvell/armada-8040-puzzle-m801.dtb: system-controller@440000: compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
>> arch/arm64/boot/dts/marvell/armada-8040-puzzle-m801.dtb: /cp0-bus/bus@f2000000/system-controller@440000/clock: failed to match any schema with compatible: ['marvell,cp110-clock']
   arch/arm64/boot/dts/marvell/armada-8040-puzzle-m801.dtb: gpio@140: Unevaluated properties are not allowed ('gpio-ranges' was unexpected)
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-mvebu.yaml#
>> arch/arm64/boot/dts/marvell/armada-8040-puzzle-m801.dtb: /cp0-bus/bus@f2000000/system-controller@440000/pinctrl: failed to match any schema with compatible: ['marvell,armada-8k-cpm-pinctrl']
   arch/arm64/boot/dts/marvell/armada-8040-puzzle-m801.dtb: system-controller@400000: compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
>> arch/arm64/boot/dts/marvell/armada-8040-puzzle-m801.dtb: /cp0-bus/bus@f2000000/system-controller@400000/thermal-sensor@70: failed to match any schema with compatible: ['marvell,armada-cp110-thermal']
   arch/arm64/boot/dts/marvell/armada-8040-puzzle-m801.dtb: usb@500000: Unevaluated properties are not allowed ('dma-coherent', 'iommus' were unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/generic-xhci.yaml#
   arch/arm64/boot/dts/marvell/armada-8040-puzzle-m801.dtb: usb@510000: Unevaluated properties are not allowed ('dma-coherent', 'iommus' were unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/generic-xhci.yaml#
>> arch/arm64/boot/dts/marvell/armada-8040-puzzle-m801.dtb: /cp0-bus/bus@f2000000/spi@700600: failed to match any schema with compatible: ['marvell,armada-380-spi']
   arch/arm64/boot/dts/marvell/armada-8040-puzzle-m801.dtb: /cp0-bus/bus@f2000000/spi@700680: failed to match any schema with compatible: ['marvell,armada-380-spi']
   arch/arm64/boot/dts/marvell/armada-8040-puzzle-m801.dtb: crypto@800000: 'dma-coherent' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/crypto/inside-secure,safexcel.yaml#
>> arch/arm64/boot/dts/marvell/armada-8040-puzzle-m801.dtb: /cp0-bus/pcie@f2600000: failed to match any schema with compatible: ['marvell,armada8k-pcie', 'snps,dw-pcie']
>> arch/arm64/boot/dts/marvell/armada-8040-puzzle-m801.dtb: /cp0-bus/pcie@f2620000: failed to match any schema with compatible: ['marvell,armada8k-pcie', 'snps,dw-pcie']
>> arch/arm64/boot/dts/marvell/armada-8040-puzzle-m801.dtb: /cp0-bus/pcie@f2640000: failed to match any schema with compatible: ['marvell,armada8k-pcie', 'snps,dw-pcie']
>> arch/arm64/boot/dts/marvell/armada-8040-puzzle-m801.dtb: /cp1-bus/bus@f4000000/phy@120000: failed to match any schema with compatible: ['marvell,comphy-cp110']
   arch/arm64/boot/dts/marvell/armada-8040-puzzle-m801.dtb: connector: Unevaluated properties are not allowed ('phy-supply' was unexpected)
   	from schema $id: http://devicetree.org/schemas/connector/usb-connector.yaml#
>> arch/arm64/boot/dts/marvell/armada-8040-puzzle-m801.dtb: /cp1-bus/bus@f4000000/interrupt-controller@1e0000: failed to match any schema with compatible: ['marvell,cp110-icu']
>> arch/arm64/boot/dts/marvell/armada-8040-puzzle-m801.dtb: /cp1-bus/bus@f4000000/interrupt-controller@1e0000/interrupt-controller@10: failed to match any schema with compatible: ['marvell,cp110-icu-nsr']
>> arch/arm64/boot/dts/marvell/armada-8040-puzzle-m801.dtb: /cp1-bus/bus@f4000000/interrupt-controller@1e0000/interrupt-controller@50: failed to match any schema with compatible: ['marvell,cp110-icu-sei']
   arch/arm64/boot/dts/marvell/armada-8040-puzzle-m801.dtb: system-controller@440000: compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
>> arch/arm64/boot/dts/marvell/armada-8040-puzzle-m801.dtb: /cp1-bus/bus@f4000000/system-controller@440000/clock: failed to match any schema with compatible: ['marvell,cp110-clock']
   arch/arm64/boot/dts/marvell/armada-8040-puzzle-m801.dtb: gpio@100: Unevaluated properties are not allowed ('gpio-ranges' was unexpected)
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-mvebu.yaml#
>> arch/arm64/boot/dts/marvell/armada-8040-puzzle-m801.dtb: /cp1-bus/bus@f4000000/system-controller@440000/pinctrl: failed to match any schema with compatible: ['marvell,armada-8k-cps-pinctrl']
   arch/arm64/boot/dts/marvell/armada-8040-puzzle-m801.dtb: system-controller@400000: compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
>> arch/arm64/boot/dts/marvell/armada-8040-puzzle-m801.dtb: /cp1-bus/bus@f4000000/system-controller@400000/thermal-sensor@70: failed to match any schema with compatible: ['marvell,armada-cp110-thermal']
   arch/arm64/boot/dts/marvell/armada-8040-puzzle-m801.dtb: usb@500000: Unevaluated properties are not allowed ('dma-coherent', 'iommus' were unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/generic-xhci.yaml#
>> arch/arm64/boot/dts/marvell/armada-8040-puzzle-m801.dtb: /cp1-bus/bus@f4000000/spi@700600: failed to match any schema with compatible: ['marvell,armada-380-spi']
   arch/arm64/boot/dts/marvell/armada-8040-puzzle-m801.dtb: /cp1-bus/bus@f4000000/spi@700680: failed to match any schema with compatible: ['marvell,armada-380-spi']
   arch/arm64/boot/dts/marvell/armada-8040-puzzle-m801.dtb: crypto@800000: 'dma-coherent' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/crypto/inside-secure,safexcel.yaml#
>> arch/arm64/boot/dts/marvell/armada-8040-puzzle-m801.dtb: /cp1-bus/pcie@f4600000: failed to match any schema with compatible: ['marvell,armada8k-pcie', 'snps,dw-pcie']
>> arch/arm64/boot/dts/marvell/armada-8040-puzzle-m801.dtb: /cp1-bus/pcie@f4620000: failed to match any schema with compatible: ['marvell,armada8k-pcie', 'snps,dw-pcie']
>> arch/arm64/boot/dts/marvell/armada-8040-puzzle-m801.dtb: /cp1-bus/pcie@f4640000: failed to match any schema with compatible: ['marvell,armada8k-pcie', 'snps,dw-pcie']
--
   arch/arm64/boot/dts/marvell/armada-ap80x.dtsi:282.24-292.7: Warning (unit_address_vs_reg): /soc/bus@f0000000/system-controller@6f4000/gpio@1040: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/marvell/armada-cp11x.dtsi:235.24-254.6: Warning (unit_address_vs_reg): /cp0-bus/bus@f2000000/system-controller@440000/gpio@100: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/marvell/armada-cp11x.dtsi:256.24-275.6: Warning (unit_address_vs_reg): /cp0-bus/bus@f2000000/system-controller@440000/gpio@140: node has a unit name, but no reg or ranges property
>> arch/arm64/boot/dts/marvell/cn9130-db.dtb: /soc/bus@f0000000/odmi@300000: failed to match any schema with compatible: ['marvell,odmi-controller']
>> arch/arm64/boot/dts/marvell/cn9130-db.dtb: /soc/bus@f0000000/gicp@3f0040: failed to match any schema with compatible: ['marvell,ap806-gicp']
>> arch/arm64/boot/dts/marvell/cn9130-db.dtb: /soc/bus@f0000000/interrupt-controller@3f0100: failed to match any schema with compatible: ['marvell,armada-8k-pic']
>> arch/arm64/boot/dts/marvell/cn9130-db.dtb: /soc/bus@f0000000/interrupt-controller@3f0200: failed to match any schema with compatible: ['marvell,ap806-sei']
>> arch/arm64/boot/dts/marvell/cn9130-db.dtb: /soc/bus@f0000000/spi@510600: failed to match any schema with compatible: ['marvell,armada-380-spi']
   arch/arm64/boot/dts/marvell/cn9130-db.dtb: mmc@6e0000: clocks: [[4, 4]] is too short
   	from schema $id: http://devicetree.org/schemas/mmc/marvell,xenon-sdhci.yaml#
   arch/arm64/boot/dts/marvell/cn9130-db.dtb: mmc@6e0000: clock-names: ['core'] is too short
   	from schema $id: http://devicetree.org/schemas/mmc/marvell,xenon-sdhci.yaml#
   arch/arm64/boot/dts/marvell/cn9130-db.dtb: mmc@6e0000: 'pinctrl-0' is a dependency of 'pinctrl-names'
   	from schema $id: http://devicetree.org/schemas/pinctrl/pinctrl-consumer.yaml#
   arch/arm64/boot/dts/marvell/cn9130-db.dtb: system-controller@6f4000: compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
>> arch/arm64/boot/dts/marvell/cn9130-db.dtb: /soc/bus@f0000000/system-controller@6f4000/pinctrl: failed to match any schema with compatible: ['marvell,ap806-pinctrl']
   arch/arm64/boot/dts/marvell/cn9130-db.dtb: gpio@1040: Unevaluated properties are not allowed ('gpio-ranges' was unexpected)
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-mvebu.yaml#
>> arch/arm64/boot/dts/marvell/cn9130-db.dtb: /soc/bus@f0000000/system-controller@6f4000/clock: failed to match any schema with compatible: ['marvell,ap807-clock']
   arch/arm64/boot/dts/marvell/cn9130-db.dtb: system-controller@6f8000: compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
>> arch/arm64/boot/dts/marvell/cn9130-db.dtb: /soc/bus@f0000000/system-controller@6f8000/thermal-sensor@80: failed to match any schema with compatible: ['marvell,armada-ap807-thermal']
>> arch/arm64/boot/dts/marvell/cn9130-db.dtb: /soc/bus@f0000000/system-controller@6f8000/clock-cpu: failed to match any schema with compatible: ['marvell,ap807-cpu-clock']
>> arch/arm64/boot/dts/marvell/cn9130-db.dtb: /cp0-bus/bus@f2000000/phy@120000: failed to match any schema with compatible: ['marvell,comphy-cp110']
>> arch/arm64/boot/dts/marvell/cn9130-db.dtb: /cp0-bus/bus@f2000000/interrupt-controller@1e0000: failed to match any schema with compatible: ['marvell,cp110-icu']
>> arch/arm64/boot/dts/marvell/cn9130-db.dtb: /cp0-bus/bus@f2000000/interrupt-controller@1e0000/interrupt-controller@10: failed to match any schema with compatible: ['marvell,cp110-icu-nsr']
>> arch/arm64/boot/dts/marvell/cn9130-db.dtb: /cp0-bus/bus@f2000000/interrupt-controller@1e0000/interrupt-controller@50: failed to match any schema with compatible: ['marvell,cp110-icu-sei']
   arch/arm64/boot/dts/marvell/cn9130-db.dtb: system-controller@440000: compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
>> arch/arm64/boot/dts/marvell/cn9130-db.dtb: /cp0-bus/bus@f2000000/system-controller@440000/clock: failed to match any schema with compatible: ['marvell,cp110-clock']
   arch/arm64/boot/dts/marvell/cn9130-db.dtb: gpio@100: Unevaluated properties are not allowed ('gpio-ranges' was unexpected)
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-mvebu.yaml#
   arch/arm64/boot/dts/marvell/cn9130-db.dtb: gpio@140: Unevaluated properties are not allowed ('gpio-ranges' was unexpected)
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-mvebu.yaml#
>> arch/arm64/boot/dts/marvell/cn9130-db.dtb: /cp0-bus/bus@f2000000/system-controller@440000/pinctrl: failed to match any schema with compatible: ['marvell,cp115-standalone-pinctrl']
   arch/arm64/boot/dts/marvell/cn9130-db.dtb: system-controller@400000: compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
>> arch/arm64/boot/dts/marvell/cn9130-db.dtb: /cp0-bus/bus@f2000000/system-controller@400000/thermal-sensor@70: failed to match any schema with compatible: ['marvell,armada-cp110-thermal']
   arch/arm64/boot/dts/marvell/cn9130-db.dtb: usb@500000: Unevaluated properties are not allowed ('dma-coherent', 'dr_mode' were unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/generic-xhci.yaml#
   arch/arm64/boot/dts/marvell/cn9130-db.dtb: usb@510000: Unevaluated properties are not allowed ('dma-coherent', 'dr_mode' were unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/generic-xhci.yaml#
>> arch/arm64/boot/dts/marvell/cn9130-db.dtb: /cp0-bus/bus@f2000000/spi@700600: failed to match any schema with compatible: ['marvell,armada-380-spi']
   arch/arm64/boot/dts/marvell/cn9130-db.dtb: /cp0-bus/bus@f2000000/spi@700680: failed to match any schema with compatible: ['marvell,armada-380-spi']
   arch/arm64/boot/dts/marvell/cn9130-db.dtb: pca953x@21: 'pinctrl-0' is a dependency of 'pinctrl-names'
   	from schema $id: http://devicetree.org/schemas/pinctrl/pinctrl-consumer.yaml#
   arch/arm64/boot/dts/marvell/cn9130-db.dtb: pca9555@21: 'pinctrl-0' is a dependency of 'pinctrl-names'
   	from schema $id: http://devicetree.org/schemas/pinctrl/pinctrl-consumer.yaml#
   arch/arm64/boot/dts/marvell/cn9130-db.dtb: crypto@800000: 'dma-coherent' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/crypto/inside-secure,safexcel.yaml#
>> arch/arm64/boot/dts/marvell/cn9130-db.dtb: /cp0-bus/pcie@f2600000: failed to match any schema with compatible: ['marvell,armada8k-pcie', 'snps,dw-pcie']
>> arch/arm64/boot/dts/marvell/cn9130-db.dtb: /cp0-bus/pcie@f2620000: failed to match any schema with compatible: ['marvell,armada8k-pcie', 'snps,dw-pcie']
>> arch/arm64/boot/dts/marvell/cn9130-db.dtb: /cp0-bus/pcie@f2640000: failed to match any schema with compatible: ['marvell,armada8k-pcie', 'snps,dw-pcie']
   arch/arm64/boot/dts/marvell/cn9130-db.dtb: usb-phy-1: '#phy-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/usb/usb-nop-xceiv.yaml#
   arch/arm64/boot/dts/marvell/cn9130-db.dtb: usb-phy-2: '#phy-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/usb/usb-nop-xceiv.yaml#
--
   arch/arm64/boot/dts/marvell/armada-ap80x.dtsi:282.24-292.7: Warning (unit_address_vs_reg): /soc/bus@f0000000/system-controller@6f4000/gpio@1040: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/marvell/armada-cp11x.dtsi:235.24-254.6: Warning (unit_address_vs_reg): /cp0-bus/bus@f2000000/system-controller@440000/gpio@100: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/marvell/armada-cp11x.dtsi:256.24-275.6: Warning (unit_address_vs_reg): /cp0-bus/bus@f2000000/system-controller@440000/gpio@140: node has a unit name, but no reg or ranges property
>> arch/arm64/boot/dts/marvell/cn9130-db-B.dtb: /soc/bus@f0000000/odmi@300000: failed to match any schema with compatible: ['marvell,odmi-controller']
>> arch/arm64/boot/dts/marvell/cn9130-db-B.dtb: /soc/bus@f0000000/gicp@3f0040: failed to match any schema with compatible: ['marvell,ap806-gicp']
>> arch/arm64/boot/dts/marvell/cn9130-db-B.dtb: /soc/bus@f0000000/interrupt-controller@3f0100: failed to match any schema with compatible: ['marvell,armada-8k-pic']
>> arch/arm64/boot/dts/marvell/cn9130-db-B.dtb: /soc/bus@f0000000/interrupt-controller@3f0200: failed to match any schema with compatible: ['marvell,ap806-sei']
>> arch/arm64/boot/dts/marvell/cn9130-db-B.dtb: /soc/bus@f0000000/spi@510600: failed to match any schema with compatible: ['marvell,armada-380-spi']
   arch/arm64/boot/dts/marvell/cn9130-db-B.dtb: mmc@6e0000: clocks: [[4, 4]] is too short
   	from schema $id: http://devicetree.org/schemas/mmc/marvell,xenon-sdhci.yaml#
   arch/arm64/boot/dts/marvell/cn9130-db-B.dtb: mmc@6e0000: clock-names: ['core'] is too short
   	from schema $id: http://devicetree.org/schemas/mmc/marvell,xenon-sdhci.yaml#
   arch/arm64/boot/dts/marvell/cn9130-db-B.dtb: mmc@6e0000: 'pinctrl-0' is a dependency of 'pinctrl-names'
   	from schema $id: http://devicetree.org/schemas/pinctrl/pinctrl-consumer.yaml#
   arch/arm64/boot/dts/marvell/cn9130-db-B.dtb: system-controller@6f4000: compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
>> arch/arm64/boot/dts/marvell/cn9130-db-B.dtb: /soc/bus@f0000000/system-controller@6f4000/pinctrl: failed to match any schema with compatible: ['marvell,ap806-pinctrl']
   arch/arm64/boot/dts/marvell/cn9130-db-B.dtb: gpio@1040: Unevaluated properties are not allowed ('gpio-ranges' was unexpected)
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-mvebu.yaml#
>> arch/arm64/boot/dts/marvell/cn9130-db-B.dtb: /soc/bus@f0000000/system-controller@6f4000/clock: failed to match any schema with compatible: ['marvell,ap807-clock']
   arch/arm64/boot/dts/marvell/cn9130-db-B.dtb: system-controller@6f8000: compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
>> arch/arm64/boot/dts/marvell/cn9130-db-B.dtb: /soc/bus@f0000000/system-controller@6f8000/thermal-sensor@80: failed to match any schema with compatible: ['marvell,armada-ap807-thermal']
>> arch/arm64/boot/dts/marvell/cn9130-db-B.dtb: /soc/bus@f0000000/system-controller@6f8000/clock-cpu: failed to match any schema with compatible: ['marvell,ap807-cpu-clock']
>> arch/arm64/boot/dts/marvell/cn9130-db-B.dtb: /cp0-bus/bus@f2000000/phy@120000: failed to match any schema with compatible: ['marvell,comphy-cp110']
>> arch/arm64/boot/dts/marvell/cn9130-db-B.dtb: /cp0-bus/bus@f2000000/interrupt-controller@1e0000: failed to match any schema with compatible: ['marvell,cp110-icu']
>> arch/arm64/boot/dts/marvell/cn9130-db-B.dtb: /cp0-bus/bus@f2000000/interrupt-controller@1e0000/interrupt-controller@10: failed to match any schema with compatible: ['marvell,cp110-icu-nsr']
>> arch/arm64/boot/dts/marvell/cn9130-db-B.dtb: /cp0-bus/bus@f2000000/interrupt-controller@1e0000/interrupt-controller@50: failed to match any schema with compatible: ['marvell,cp110-icu-sei']
   arch/arm64/boot/dts/marvell/cn9130-db-B.dtb: system-controller@440000: compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
>> arch/arm64/boot/dts/marvell/cn9130-db-B.dtb: /cp0-bus/bus@f2000000/system-controller@440000/clock: failed to match any schema with compatible: ['marvell,cp110-clock']
   arch/arm64/boot/dts/marvell/cn9130-db-B.dtb: gpio@100: Unevaluated properties are not allowed ('gpio-ranges' was unexpected)
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-mvebu.yaml#
   arch/arm64/boot/dts/marvell/cn9130-db-B.dtb: gpio@140: Unevaluated properties are not allowed ('gpio-ranges' was unexpected)
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-mvebu.yaml#
>> arch/arm64/boot/dts/marvell/cn9130-db-B.dtb: /cp0-bus/bus@f2000000/system-controller@440000/pinctrl: failed to match any schema with compatible: ['marvell,cp115-standalone-pinctrl']
   arch/arm64/boot/dts/marvell/cn9130-db-B.dtb: system-controller@400000: compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
>> arch/arm64/boot/dts/marvell/cn9130-db-B.dtb: /cp0-bus/bus@f2000000/system-controller@400000/thermal-sensor@70: failed to match any schema with compatible: ['marvell,armada-cp110-thermal']
   arch/arm64/boot/dts/marvell/cn9130-db-B.dtb: usb@500000: Unevaluated properties are not allowed ('dma-coherent', 'dr_mode' were unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/generic-xhci.yaml#
   arch/arm64/boot/dts/marvell/cn9130-db-B.dtb: usb@510000: Unevaluated properties are not allowed ('dma-coherent', 'dr_mode' were unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/generic-xhci.yaml#
>> arch/arm64/boot/dts/marvell/cn9130-db-B.dtb: /cp0-bus/bus@f2000000/spi@700600: failed to match any schema with compatible: ['marvell,armada-380-spi']
   arch/arm64/boot/dts/marvell/cn9130-db-B.dtb: /cp0-bus/bus@f2000000/spi@700680: failed to match any schema with compatible: ['marvell,armada-380-spi']
   arch/arm64/boot/dts/marvell/cn9130-db-B.dtb: pca953x@21: 'pinctrl-0' is a dependency of 'pinctrl-names'
   	from schema $id: http://devicetree.org/schemas/pinctrl/pinctrl-consumer.yaml#
   arch/arm64/boot/dts/marvell/cn9130-db-B.dtb: pca9555@21: 'pinctrl-0' is a dependency of 'pinctrl-names'
   	from schema $id: http://devicetree.org/schemas/pinctrl/pinctrl-consumer.yaml#
   arch/arm64/boot/dts/marvell/cn9130-db-B.dtb: crypto@800000: 'dma-coherent' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/crypto/inside-secure,safexcel.yaml#
>> arch/arm64/boot/dts/marvell/cn9130-db-B.dtb: /cp0-bus/pcie@f2600000: failed to match any schema with compatible: ['marvell,armada8k-pcie', 'snps,dw-pcie']
>> arch/arm64/boot/dts/marvell/cn9130-db-B.dtb: /cp0-bus/pcie@f2620000: failed to match any schema with compatible: ['marvell,armada8k-pcie', 'snps,dw-pcie']
>> arch/arm64/boot/dts/marvell/cn9130-db-B.dtb: /cp0-bus/pcie@f2640000: failed to match any schema with compatible: ['marvell,armada8k-pcie', 'snps,dw-pcie']
   arch/arm64/boot/dts/marvell/cn9130-db-B.dtb: usb-phy-1: '#phy-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/usb/usb-nop-xceiv.yaml#
   arch/arm64/boot/dts/marvell/cn9130-db-B.dtb: usb-phy-2: '#phy-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/usb/usb-nop-xceiv.yaml#
--
   arch/arm64/boot/dts/marvell/armada-cp11x.dtsi:235.24-254.6: Warning (unit_address_vs_reg): /cp0-bus/bus@f2000000/system-controller@440000/gpio@100: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/marvell/armada-cp11x.dtsi:256.24-275.6: Warning (unit_address_vs_reg): /cp0-bus/bus@f2000000/system-controller@440000/gpio@140: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/marvell/armada-cp11x.dtsi:235.24-254.6: Warning (unit_address_vs_reg): /cp1-bus/bus@f4000000/system-controller@440000/gpio@100: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/marvell/armada-cp11x.dtsi:256.24-275.6: Warning (unit_address_vs_reg): /cp1-bus/bus@f4000000/system-controller@440000/gpio@140: node has a unit name, but no reg or ranges property
>> arch/arm64/boot/dts/marvell/cn9131-db.dtb: /soc/bus@f0000000/odmi@300000: failed to match any schema with compatible: ['marvell,odmi-controller']
>> arch/arm64/boot/dts/marvell/cn9131-db.dtb: /soc/bus@f0000000/gicp@3f0040: failed to match any schema with compatible: ['marvell,ap806-gicp']
>> arch/arm64/boot/dts/marvell/cn9131-db.dtb: /soc/bus@f0000000/interrupt-controller@3f0100: failed to match any schema with compatible: ['marvell,armada-8k-pic']
>> arch/arm64/boot/dts/marvell/cn9131-db.dtb: /soc/bus@f0000000/interrupt-controller@3f0200: failed to match any schema with compatible: ['marvell,ap806-sei']
>> arch/arm64/boot/dts/marvell/cn9131-db.dtb: /soc/bus@f0000000/spi@510600: failed to match any schema with compatible: ['marvell,armada-380-spi']
   arch/arm64/boot/dts/marvell/cn9131-db.dtb: mmc@6e0000: clocks: [[4, 4]] is too short
   	from schema $id: http://devicetree.org/schemas/mmc/marvell,xenon-sdhci.yaml#
   arch/arm64/boot/dts/marvell/cn9131-db.dtb: mmc@6e0000: clock-names: ['core'] is too short
   	from schema $id: http://devicetree.org/schemas/mmc/marvell,xenon-sdhci.yaml#
   arch/arm64/boot/dts/marvell/cn9131-db.dtb: mmc@6e0000: 'pinctrl-0' is a dependency of 'pinctrl-names'
   	from schema $id: http://devicetree.org/schemas/pinctrl/pinctrl-consumer.yaml#
   arch/arm64/boot/dts/marvell/cn9131-db.dtb: system-controller@6f4000: compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
>> arch/arm64/boot/dts/marvell/cn9131-db.dtb: /soc/bus@f0000000/system-controller@6f4000/pinctrl: failed to match any schema with compatible: ['marvell,ap806-pinctrl']
   arch/arm64/boot/dts/marvell/cn9131-db.dtb: gpio@1040: Unevaluated properties are not allowed ('gpio-ranges' was unexpected)
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-mvebu.yaml#
>> arch/arm64/boot/dts/marvell/cn9131-db.dtb: /soc/bus@f0000000/system-controller@6f4000/clock: failed to match any schema with compatible: ['marvell,ap807-clock']
   arch/arm64/boot/dts/marvell/cn9131-db.dtb: system-controller@6f8000: compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
>> arch/arm64/boot/dts/marvell/cn9131-db.dtb: /soc/bus@f0000000/system-controller@6f8000/thermal-sensor@80: failed to match any schema with compatible: ['marvell,armada-ap807-thermal']
>> arch/arm64/boot/dts/marvell/cn9131-db.dtb: /soc/bus@f0000000/system-controller@6f8000/clock-cpu: failed to match any schema with compatible: ['marvell,ap807-cpu-clock']
>> arch/arm64/boot/dts/marvell/cn9131-db.dtb: /cp0-bus/bus@f2000000/phy@120000: failed to match any schema with compatible: ['marvell,comphy-cp110']
>> arch/arm64/boot/dts/marvell/cn9131-db.dtb: /cp0-bus/bus@f2000000/interrupt-controller@1e0000: failed to match any schema with compatible: ['marvell,cp110-icu']
>> arch/arm64/boot/dts/marvell/cn9131-db.dtb: /cp0-bus/bus@f2000000/interrupt-controller@1e0000/interrupt-controller@10: failed to match any schema with compatible: ['marvell,cp110-icu-nsr']
>> arch/arm64/boot/dts/marvell/cn9131-db.dtb: /cp0-bus/bus@f2000000/interrupt-controller@1e0000/interrupt-controller@50: failed to match any schema with compatible: ['marvell,cp110-icu-sei']
   arch/arm64/boot/dts/marvell/cn9131-db.dtb: system-controller@440000: compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
>> arch/arm64/boot/dts/marvell/cn9131-db.dtb: /cp0-bus/bus@f2000000/system-controller@440000/clock: failed to match any schema with compatible: ['marvell,cp110-clock']
   arch/arm64/boot/dts/marvell/cn9131-db.dtb: gpio@100: Unevaluated properties are not allowed ('gpio-ranges' was unexpected)
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-mvebu.yaml#
   arch/arm64/boot/dts/marvell/cn9131-db.dtb: gpio@140: Unevaluated properties are not allowed ('gpio-ranges' was unexpected)
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-mvebu.yaml#
>> arch/arm64/boot/dts/marvell/cn9131-db.dtb: /cp0-bus/bus@f2000000/system-controller@440000/pinctrl: failed to match any schema with compatible: ['marvell,cp115-standalone-pinctrl']
   arch/arm64/boot/dts/marvell/cn9131-db.dtb: system-controller@400000: compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
>> arch/arm64/boot/dts/marvell/cn9131-db.dtb: /cp0-bus/bus@f2000000/system-controller@400000/thermal-sensor@70: failed to match any schema with compatible: ['marvell,armada-cp110-thermal']
   arch/arm64/boot/dts/marvell/cn9131-db.dtb: usb@500000: Unevaluated properties are not allowed ('dma-coherent', 'dr_mode' were unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/generic-xhci.yaml#
   arch/arm64/boot/dts/marvell/cn9131-db.dtb: usb@510000: Unevaluated properties are not allowed ('dma-coherent', 'dr_mode' were unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/generic-xhci.yaml#
>> arch/arm64/boot/dts/marvell/cn9131-db.dtb: /cp0-bus/bus@f2000000/spi@700600: failed to match any schema with compatible: ['marvell,armada-380-spi']
   arch/arm64/boot/dts/marvell/cn9131-db.dtb: /cp0-bus/bus@f2000000/spi@700680: failed to match any schema with compatible: ['marvell,armada-380-spi']
   arch/arm64/boot/dts/marvell/cn9131-db.dtb: pca953x@21: 'pinctrl-0' is a dependency of 'pinctrl-names'
   	from schema $id: http://devicetree.org/schemas/pinctrl/pinctrl-consumer.yaml#
   arch/arm64/boot/dts/marvell/cn9131-db.dtb: pca9555@21: 'pinctrl-0' is a dependency of 'pinctrl-names'
   	from schema $id: http://devicetree.org/schemas/pinctrl/pinctrl-consumer.yaml#
   arch/arm64/boot/dts/marvell/cn9131-db.dtb: crypto@800000: 'dma-coherent' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/crypto/inside-secure,safexcel.yaml#
>> arch/arm64/boot/dts/marvell/cn9131-db.dtb: /cp0-bus/pcie@f2600000: failed to match any schema with compatible: ['marvell,armada8k-pcie', 'snps,dw-pcie']
>> arch/arm64/boot/dts/marvell/cn9131-db.dtb: /cp0-bus/pcie@f2620000: failed to match any schema with compatible: ['marvell,armada8k-pcie', 'snps,dw-pcie']
>> arch/arm64/boot/dts/marvell/cn9131-db.dtb: /cp0-bus/pcie@f2640000: failed to match any schema with compatible: ['marvell,armada8k-pcie', 'snps,dw-pcie']
   arch/arm64/boot/dts/marvell/cn9131-db.dtb: usb-phy-1: '#phy-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/usb/usb-nop-xceiv.yaml#
   arch/arm64/boot/dts/marvell/cn9131-db.dtb: usb-phy-2: '#phy-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/usb/usb-nop-xceiv.yaml#
   arch/arm64/boot/dts/marvell/cn9131-db.dtb: usb-phy-3: '#phy-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/usb/usb-nop-xceiv.yaml#
>> arch/arm64/boot/dts/marvell/cn9131-db.dtb: /cp1-bus/bus@f4000000/phy@120000: failed to match any schema with compatible: ['marvell,comphy-cp110']
>> arch/arm64/boot/dts/marvell/cn9131-db.dtb: /cp1-bus/bus@f4000000/interrupt-controller@1e0000: failed to match any schema with compatible: ['marvell,cp110-icu']
>> arch/arm64/boot/dts/marvell/cn9131-db.dtb: /cp1-bus/bus@f4000000/interrupt-controller@1e0000/interrupt-controller@10: failed to match any schema with compatible: ['marvell,cp110-icu-nsr']
>> arch/arm64/boot/dts/marvell/cn9131-db.dtb: /cp1-bus/bus@f4000000/interrupt-controller@1e0000/interrupt-controller@50: failed to match any schema with compatible: ['marvell,cp110-icu-sei']
   arch/arm64/boot/dts/marvell/cn9131-db.dtb: system-controller@440000: compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
>> arch/arm64/boot/dts/marvell/cn9131-db.dtb: /cp1-bus/bus@f4000000/system-controller@440000/clock: failed to match any schema with compatible: ['marvell,cp110-clock']
   arch/arm64/boot/dts/marvell/cn9131-db.dtb: gpio@100: Unevaluated properties are not allowed ('gpio-ranges' was unexpected)
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-mvebu.yaml#
   arch/arm64/boot/dts/marvell/cn9131-db.dtb: gpio@140: Unevaluated properties are not allowed ('gpio-ranges' was unexpected)
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-mvebu.yaml#
>> arch/arm64/boot/dts/marvell/cn9131-db.dtb: /cp1-bus/bus@f4000000/system-controller@440000/pinctrl: failed to match any schema with compatible: ['marvell,cp115-standalone-pinctrl']
   arch/arm64/boot/dts/marvell/cn9131-db.dtb: system-controller@400000: compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
>> arch/arm64/boot/dts/marvell/cn9131-db.dtb: /cp1-bus/bus@f4000000/system-controller@400000/thermal-sensor@70: failed to match any schema with compatible: ['marvell,armada-cp110-thermal']
   arch/arm64/boot/dts/marvell/cn9131-db.dtb: usb@510000: Unevaluated properties are not allowed ('dma-coherent', 'dr_mode' were unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/generic-xhci.yaml#
>> arch/arm64/boot/dts/marvell/cn9131-db.dtb: /cp1-bus/bus@f4000000/spi@700600: failed to match any schema with compatible: ['marvell,armada-380-spi']
   arch/arm64/boot/dts/marvell/cn9131-db.dtb: /cp1-bus/bus@f4000000/spi@700680: failed to match any schema with compatible: ['marvell,armada-380-spi']
   arch/arm64/boot/dts/marvell/cn9131-db.dtb: crypto@800000: 'dma-coherent' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/crypto/inside-secure,safexcel.yaml#
>> arch/arm64/boot/dts/marvell/cn9131-db.dtb: /cp1-bus/pcie@f4600000: failed to match any schema with compatible: ['marvell,armada8k-pcie', 'snps,dw-pcie']
>> arch/arm64/boot/dts/marvell/cn9131-db.dtb: /cp1-bus/pcie@f4620000: failed to match any schema with compatible: ['marvell,armada8k-pcie', 'snps,dw-pcie']
>> arch/arm64/boot/dts/marvell/cn9131-db.dtb: /cp1-bus/pcie@f4640000: failed to match any schema with compatible: ['marvell,armada8k-pcie', 'snps,dw-pcie']
--
   arch/arm64/boot/dts/marvell/armada-cp11x.dtsi:235.24-254.6: Warning (unit_address_vs_reg): /cp0-bus/bus@f2000000/system-controller@440000/gpio@100: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/marvell/armada-cp11x.dtsi:256.24-275.6: Warning (unit_address_vs_reg): /cp0-bus/bus@f2000000/system-controller@440000/gpio@140: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/marvell/armada-cp11x.dtsi:235.24-254.6: Warning (unit_address_vs_reg): /cp1-bus/bus@f4000000/system-controller@440000/gpio@100: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/marvell/armada-cp11x.dtsi:256.24-275.6: Warning (unit_address_vs_reg): /cp1-bus/bus@f4000000/system-controller@440000/gpio@140: node has a unit name, but no reg or ranges property
>> arch/arm64/boot/dts/marvell/cn9131-db-B.dtb: /soc/bus@f0000000/odmi@300000: failed to match any schema with compatible: ['marvell,odmi-controller']
>> arch/arm64/boot/dts/marvell/cn9131-db-B.dtb: /soc/bus@f0000000/gicp@3f0040: failed to match any schema with compatible: ['marvell,ap806-gicp']
>> arch/arm64/boot/dts/marvell/cn9131-db-B.dtb: /soc/bus@f0000000/interrupt-controller@3f0100: failed to match any schema with compatible: ['marvell,armada-8k-pic']
>> arch/arm64/boot/dts/marvell/cn9131-db-B.dtb: /soc/bus@f0000000/interrupt-controller@3f0200: failed to match any schema with compatible: ['marvell,ap806-sei']
>> arch/arm64/boot/dts/marvell/cn9131-db-B.dtb: /soc/bus@f0000000/spi@510600: failed to match any schema with compatible: ['marvell,armada-380-spi']
   arch/arm64/boot/dts/marvell/cn9131-db-B.dtb: mmc@6e0000: clocks: [[4, 4]] is too short
   	from schema $id: http://devicetree.org/schemas/mmc/marvell,xenon-sdhci.yaml#
   arch/arm64/boot/dts/marvell/cn9131-db-B.dtb: mmc@6e0000: clock-names: ['core'] is too short
   	from schema $id: http://devicetree.org/schemas/mmc/marvell,xenon-sdhci.yaml#
   arch/arm64/boot/dts/marvell/cn9131-db-B.dtb: mmc@6e0000: 'pinctrl-0' is a dependency of 'pinctrl-names'
   	from schema $id: http://devicetree.org/schemas/pinctrl/pinctrl-consumer.yaml#
   arch/arm64/boot/dts/marvell/cn9131-db-B.dtb: system-controller@6f4000: compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
>> arch/arm64/boot/dts/marvell/cn9131-db-B.dtb: /soc/bus@f0000000/system-controller@6f4000/pinctrl: failed to match any schema with compatible: ['marvell,ap806-pinctrl']
   arch/arm64/boot/dts/marvell/cn9131-db-B.dtb: gpio@1040: Unevaluated properties are not allowed ('gpio-ranges' was unexpected)
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-mvebu.yaml#
>> arch/arm64/boot/dts/marvell/cn9131-db-B.dtb: /soc/bus@f0000000/system-controller@6f4000/clock: failed to match any schema with compatible: ['marvell,ap807-clock']
   arch/arm64/boot/dts/marvell/cn9131-db-B.dtb: system-controller@6f8000: compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
>> arch/arm64/boot/dts/marvell/cn9131-db-B.dtb: /soc/bus@f0000000/system-controller@6f8000/thermal-sensor@80: failed to match any schema with compatible: ['marvell,armada-ap807-thermal']
>> arch/arm64/boot/dts/marvell/cn9131-db-B.dtb: /soc/bus@f0000000/system-controller@6f8000/clock-cpu: failed to match any schema with compatible: ['marvell,ap807-cpu-clock']
>> arch/arm64/boot/dts/marvell/cn9131-db-B.dtb: /cp0-bus/bus@f2000000/phy@120000: failed to match any schema with compatible: ['marvell,comphy-cp110']
>> arch/arm64/boot/dts/marvell/cn9131-db-B.dtb: /cp0-bus/bus@f2000000/interrupt-controller@1e0000: failed to match any schema with compatible: ['marvell,cp110-icu']
>> arch/arm64/boot/dts/marvell/cn9131-db-B.dtb: /cp0-bus/bus@f2000000/interrupt-controller@1e0000/interrupt-controller@10: failed to match any schema with compatible: ['marvell,cp110-icu-nsr']
>> arch/arm64/boot/dts/marvell/cn9131-db-B.dtb: /cp0-bus/bus@f2000000/interrupt-controller@1e0000/interrupt-controller@50: failed to match any schema with compatible: ['marvell,cp110-icu-sei']
   arch/arm64/boot/dts/marvell/cn9131-db-B.dtb: system-controller@440000: compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
>> arch/arm64/boot/dts/marvell/cn9131-db-B.dtb: /cp0-bus/bus@f2000000/system-controller@440000/clock: failed to match any schema with compatible: ['marvell,cp110-clock']
   arch/arm64/boot/dts/marvell/cn9131-db-B.dtb: gpio@100: Unevaluated properties are not allowed ('gpio-ranges' was unexpected)
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-mvebu.yaml#
   arch/arm64/boot/dts/marvell/cn9131-db-B.dtb: gpio@140: Unevaluated properties are not allowed ('gpio-ranges' was unexpected)
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-mvebu.yaml#
>> arch/arm64/boot/dts/marvell/cn9131-db-B.dtb: /cp0-bus/bus@f2000000/system-controller@440000/pinctrl: failed to match any schema with compatible: ['marvell,cp115-standalone-pinctrl']
   arch/arm64/boot/dts/marvell/cn9131-db-B.dtb: system-controller@400000: compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
>> arch/arm64/boot/dts/marvell/cn9131-db-B.dtb: /cp0-bus/bus@f2000000/system-controller@400000/thermal-sensor@70: failed to match any schema with compatible: ['marvell,armada-cp110-thermal']
   arch/arm64/boot/dts/marvell/cn9131-db-B.dtb: usb@500000: Unevaluated properties are not allowed ('dma-coherent', 'dr_mode' were unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/generic-xhci.yaml#
   arch/arm64/boot/dts/marvell/cn9131-db-B.dtb: usb@510000: Unevaluated properties are not allowed ('dma-coherent', 'dr_mode' were unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/generic-xhci.yaml#
>> arch/arm64/boot/dts/marvell/cn9131-db-B.dtb: /cp0-bus/bus@f2000000/spi@700600: failed to match any schema with compatible: ['marvell,armada-380-spi']
   arch/arm64/boot/dts/marvell/cn9131-db-B.dtb: /cp0-bus/bus@f2000000/spi@700680: failed to match any schema with compatible: ['marvell,armada-380-spi']
   arch/arm64/boot/dts/marvell/cn9131-db-B.dtb: pca953x@21: 'pinctrl-0' is a dependency of 'pinctrl-names'
   	from schema $id: http://devicetree.org/schemas/pinctrl/pinctrl-consumer.yaml#
   arch/arm64/boot/dts/marvell/cn9131-db-B.dtb: pca9555@21: 'pinctrl-0' is a dependency of 'pinctrl-names'
   	from schema $id: http://devicetree.org/schemas/pinctrl/pinctrl-consumer.yaml#
   arch/arm64/boot/dts/marvell/cn9131-db-B.dtb: crypto@800000: 'dma-coherent' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/crypto/inside-secure,safexcel.yaml#
>> arch/arm64/boot/dts/marvell/cn9131-db-B.dtb: /cp0-bus/pcie@f2600000: failed to match any schema with compatible: ['marvell,armada8k-pcie', 'snps,dw-pcie']
>> arch/arm64/boot/dts/marvell/cn9131-db-B.dtb: /cp0-bus/pcie@f2620000: failed to match any schema with compatible: ['marvell,armada8k-pcie', 'snps,dw-pcie']
>> arch/arm64/boot/dts/marvell/cn9131-db-B.dtb: /cp0-bus/pcie@f2640000: failed to match any schema with compatible: ['marvell,armada8k-pcie', 'snps,dw-pcie']
   arch/arm64/boot/dts/marvell/cn9131-db-B.dtb: usb-phy-1: '#phy-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/usb/usb-nop-xceiv.yaml#
   arch/arm64/boot/dts/marvell/cn9131-db-B.dtb: usb-phy-2: '#phy-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/usb/usb-nop-xceiv.yaml#
   arch/arm64/boot/dts/marvell/cn9131-db-B.dtb: usb-phy-3: '#phy-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/usb/usb-nop-xceiv.yaml#
>> arch/arm64/boot/dts/marvell/cn9131-db-B.dtb: /cp1-bus/bus@f4000000/phy@120000: failed to match any schema with compatible: ['marvell,comphy-cp110']
>> arch/arm64/boot/dts/marvell/cn9131-db-B.dtb: /cp1-bus/bus@f4000000/interrupt-controller@1e0000: failed to match any schema with compatible: ['marvell,cp110-icu']
>> arch/arm64/boot/dts/marvell/cn9131-db-B.dtb: /cp1-bus/bus@f4000000/interrupt-controller@1e0000/interrupt-controller@10: failed to match any schema with compatible: ['marvell,cp110-icu-nsr']
>> arch/arm64/boot/dts/marvell/cn9131-db-B.dtb: /cp1-bus/bus@f4000000/interrupt-controller@1e0000/interrupt-controller@50: failed to match any schema with compatible: ['marvell,cp110-icu-sei']
   arch/arm64/boot/dts/marvell/cn9131-db-B.dtb: system-controller@440000: compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
>> arch/arm64/boot/dts/marvell/cn9131-db-B.dtb: /cp1-bus/bus@f4000000/system-controller@440000/clock: failed to match any schema with compatible: ['marvell,cp110-clock']
   arch/arm64/boot/dts/marvell/cn9131-db-B.dtb: gpio@100: Unevaluated properties are not allowed ('gpio-ranges' was unexpected)
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-mvebu.yaml#
   arch/arm64/boot/dts/marvell/cn9131-db-B.dtb: gpio@140: Unevaluated properties are not allowed ('gpio-ranges' was unexpected)
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-mvebu.yaml#
>> arch/arm64/boot/dts/marvell/cn9131-db-B.dtb: /cp1-bus/bus@f4000000/system-controller@440000/pinctrl: failed to match any schema with compatible: ['marvell,cp115-standalone-pinctrl']
   arch/arm64/boot/dts/marvell/cn9131-db-B.dtb: system-controller@400000: compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
>> arch/arm64/boot/dts/marvell/cn9131-db-B.dtb: /cp1-bus/bus@f4000000/system-controller@400000/thermal-sensor@70: failed to match any schema with compatible: ['marvell,armada-cp110-thermal']
   arch/arm64/boot/dts/marvell/cn9131-db-B.dtb: usb@510000: Unevaluated properties are not allowed ('dma-coherent', 'dr_mode' were unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/generic-xhci.yaml#
>> arch/arm64/boot/dts/marvell/cn9131-db-B.dtb: /cp1-bus/bus@f4000000/spi@700600: failed to match any schema with compatible: ['marvell,armada-380-spi']
   arch/arm64/boot/dts/marvell/cn9131-db-B.dtb: /cp1-bus/bus@f4000000/spi@700680: failed to match any schema with compatible: ['marvell,armada-380-spi']
   arch/arm64/boot/dts/marvell/cn9131-db-B.dtb: crypto@800000: 'dma-coherent' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/crypto/inside-secure,safexcel.yaml#
>> arch/arm64/boot/dts/marvell/cn9131-db-B.dtb: /cp1-bus/pcie@f4600000: failed to match any schema with compatible: ['marvell,armada8k-pcie', 'snps,dw-pcie']
>> arch/arm64/boot/dts/marvell/cn9131-db-B.dtb: /cp1-bus/pcie@f4620000: failed to match any schema with compatible: ['marvell,armada8k-pcie', 'snps,dw-pcie']
>> arch/arm64/boot/dts/marvell/cn9131-db-B.dtb: /cp1-bus/pcie@f4640000: failed to match any schema with compatible: ['marvell,armada8k-pcie', 'snps,dw-pcie']
--
   arch/arm64/boot/dts/marvell/armada-cp11x.dtsi:235.24-254.6: Warning (unit_address_vs_reg): /cp1-bus/bus@f4000000/system-controller@440000/gpio@100: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/marvell/armada-cp11x.dtsi:256.24-275.6: Warning (unit_address_vs_reg): /cp1-bus/bus@f4000000/system-controller@440000/gpio@140: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/marvell/armada-cp11x.dtsi:235.24-254.6: Warning (unit_address_vs_reg): /cp2-bus/bus@f6000000/system-controller@440000/gpio@100: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/marvell/armada-cp11x.dtsi:256.24-275.6: Warning (unit_address_vs_reg): /cp2-bus/bus@f6000000/system-controller@440000/gpio@140: node has a unit name, but no reg or ranges property
>> arch/arm64/boot/dts/marvell/cn9132-db.dtb: /soc/bus@f0000000/odmi@300000: failed to match any schema with compatible: ['marvell,odmi-controller']
>> arch/arm64/boot/dts/marvell/cn9132-db.dtb: /soc/bus@f0000000/gicp@3f0040: failed to match any schema with compatible: ['marvell,ap806-gicp']
>> arch/arm64/boot/dts/marvell/cn9132-db.dtb: /soc/bus@f0000000/interrupt-controller@3f0100: failed to match any schema with compatible: ['marvell,armada-8k-pic']
>> arch/arm64/boot/dts/marvell/cn9132-db.dtb: /soc/bus@f0000000/interrupt-controller@3f0200: failed to match any schema with compatible: ['marvell,ap806-sei']
>> arch/arm64/boot/dts/marvell/cn9132-db.dtb: /soc/bus@f0000000/spi@510600: failed to match any schema with compatible: ['marvell,armada-380-spi']
   arch/arm64/boot/dts/marvell/cn9132-db.dtb: mmc@6e0000: clocks: [[4, 4]] is too short
   	from schema $id: http://devicetree.org/schemas/mmc/marvell,xenon-sdhci.yaml#
   arch/arm64/boot/dts/marvell/cn9132-db.dtb: mmc@6e0000: clock-names: ['core'] is too short
   	from schema $id: http://devicetree.org/schemas/mmc/marvell,xenon-sdhci.yaml#
   arch/arm64/boot/dts/marvell/cn9132-db.dtb: mmc@6e0000: 'pinctrl-0' is a dependency of 'pinctrl-names'
   	from schema $id: http://devicetree.org/schemas/pinctrl/pinctrl-consumer.yaml#
   arch/arm64/boot/dts/marvell/cn9132-db.dtb: system-controller@6f4000: compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
>> arch/arm64/boot/dts/marvell/cn9132-db.dtb: /soc/bus@f0000000/system-controller@6f4000/pinctrl: failed to match any schema with compatible: ['marvell,ap806-pinctrl']
   arch/arm64/boot/dts/marvell/cn9132-db.dtb: gpio@1040: Unevaluated properties are not allowed ('gpio-ranges' was unexpected)
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-mvebu.yaml#
>> arch/arm64/boot/dts/marvell/cn9132-db.dtb: /soc/bus@f0000000/system-controller@6f4000/clock: failed to match any schema with compatible: ['marvell,ap807-clock']
   arch/arm64/boot/dts/marvell/cn9132-db.dtb: system-controller@6f8000: compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
>> arch/arm64/boot/dts/marvell/cn9132-db.dtb: /soc/bus@f0000000/system-controller@6f8000/thermal-sensor@80: failed to match any schema with compatible: ['marvell,armada-ap807-thermal']
>> arch/arm64/boot/dts/marvell/cn9132-db.dtb: /soc/bus@f0000000/system-controller@6f8000/clock-cpu: failed to match any schema with compatible: ['marvell,ap807-cpu-clock']
>> arch/arm64/boot/dts/marvell/cn9132-db.dtb: /cp0-bus/bus@f2000000/phy@120000: failed to match any schema with compatible: ['marvell,comphy-cp110']
>> arch/arm64/boot/dts/marvell/cn9132-db.dtb: /cp0-bus/bus@f2000000/interrupt-controller@1e0000: failed to match any schema with compatible: ['marvell,cp110-icu']
>> arch/arm64/boot/dts/marvell/cn9132-db.dtb: /cp0-bus/bus@f2000000/interrupt-controller@1e0000/interrupt-controller@10: failed to match any schema with compatible: ['marvell,cp110-icu-nsr']
>> arch/arm64/boot/dts/marvell/cn9132-db.dtb: /cp0-bus/bus@f2000000/interrupt-controller@1e0000/interrupt-controller@50: failed to match any schema with compatible: ['marvell,cp110-icu-sei']
   arch/arm64/boot/dts/marvell/cn9132-db.dtb: system-controller@440000: compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
>> arch/arm64/boot/dts/marvell/cn9132-db.dtb: /cp0-bus/bus@f2000000/system-controller@440000/clock: failed to match any schema with compatible: ['marvell,cp110-clock']
   arch/arm64/boot/dts/marvell/cn9132-db.dtb: gpio@100: Unevaluated properties are not allowed ('gpio-ranges' was unexpected)
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-mvebu.yaml#
   arch/arm64/boot/dts/marvell/cn9132-db.dtb: gpio@140: Unevaluated properties are not allowed ('gpio-ranges' was unexpected)
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-mvebu.yaml#
>> arch/arm64/boot/dts/marvell/cn9132-db.dtb: /cp0-bus/bus@f2000000/system-controller@440000/pinctrl: failed to match any schema with compatible: ['marvell,cp115-standalone-pinctrl']
   arch/arm64/boot/dts/marvell/cn9132-db.dtb: system-controller@400000: compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
>> arch/arm64/boot/dts/marvell/cn9132-db.dtb: /cp0-bus/bus@f2000000/system-controller@400000/thermal-sensor@70: failed to match any schema with compatible: ['marvell,armada-cp110-thermal']
   arch/arm64/boot/dts/marvell/cn9132-db.dtb: usb@500000: Unevaluated properties are not allowed ('dma-coherent', 'dr_mode' were unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/generic-xhci.yaml#
   arch/arm64/boot/dts/marvell/cn9132-db.dtb: usb@510000: Unevaluated properties are not allowed ('dma-coherent', 'dr_mode' were unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/generic-xhci.yaml#
>> arch/arm64/boot/dts/marvell/cn9132-db.dtb: /cp0-bus/bus@f2000000/spi@700600: failed to match any schema with compatible: ['marvell,armada-380-spi']
   arch/arm64/boot/dts/marvell/cn9132-db.dtb: /cp0-bus/bus@f2000000/spi@700680: failed to match any schema with compatible: ['marvell,armada-380-spi']
   arch/arm64/boot/dts/marvell/cn9132-db.dtb: pca953x@21: 'pinctrl-0' is a dependency of 'pinctrl-names'
   	from schema $id: http://devicetree.org/schemas/pinctrl/pinctrl-consumer.yaml#
   arch/arm64/boot/dts/marvell/cn9132-db.dtb: pca9555@21: 'pinctrl-0' is a dependency of 'pinctrl-names'
   	from schema $id: http://devicetree.org/schemas/pinctrl/pinctrl-consumer.yaml#
   arch/arm64/boot/dts/marvell/cn9132-db.dtb: crypto@800000: 'dma-coherent' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/crypto/inside-secure,safexcel.yaml#
>> arch/arm64/boot/dts/marvell/cn9132-db.dtb: /cp0-bus/pcie@f2600000: failed to match any schema with compatible: ['marvell,armada8k-pcie', 'snps,dw-pcie']
>> arch/arm64/boot/dts/marvell/cn9132-db.dtb: /cp0-bus/pcie@f2620000: failed to match any schema with compatible: ['marvell,armada8k-pcie', 'snps,dw-pcie']
>> arch/arm64/boot/dts/marvell/cn9132-db.dtb: /cp0-bus/pcie@f2640000: failed to match any schema with compatible: ['marvell,armada8k-pcie', 'snps,dw-pcie']
   arch/arm64/boot/dts/marvell/cn9132-db.dtb: usb-phy-1: '#phy-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/usb/usb-nop-xceiv.yaml#
   arch/arm64/boot/dts/marvell/cn9132-db.dtb: usb-phy-2: '#phy-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/usb/usb-nop-xceiv.yaml#
   arch/arm64/boot/dts/marvell/cn9132-db.dtb: usb-phy-3: '#phy-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/usb/usb-nop-xceiv.yaml#
>> arch/arm64/boot/dts/marvell/cn9132-db.dtb: /cp1-bus/bus@f4000000/phy@120000: failed to match any schema with compatible: ['marvell,comphy-cp110']
>> arch/arm64/boot/dts/marvell/cn9132-db.dtb: /cp1-bus/bus@f4000000/interrupt-controller@1e0000: failed to match any schema with compatible: ['marvell,cp110-icu']
>> arch/arm64/boot/dts/marvell/cn9132-db.dtb: /cp1-bus/bus@f4000000/interrupt-controller@1e0000/interrupt-controller@10: failed to match any schema with compatible: ['marvell,cp110-icu-nsr']
>> arch/arm64/boot/dts/marvell/cn9132-db.dtb: /cp1-bus/bus@f4000000/interrupt-controller@1e0000/interrupt-controller@50: failed to match any schema with compatible: ['marvell,cp110-icu-sei']
   arch/arm64/boot/dts/marvell/cn9132-db.dtb: system-controller@440000: compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
>> arch/arm64/boot/dts/marvell/cn9132-db.dtb: /cp1-bus/bus@f4000000/system-controller@440000/clock: failed to match any schema with compatible: ['marvell,cp110-clock']
   arch/arm64/boot/dts/marvell/cn9132-db.dtb: gpio@100: Unevaluated properties are not allowed ('gpio-ranges' was unexpected)
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-mvebu.yaml#
   arch/arm64/boot/dts/marvell/cn9132-db.dtb: gpio@140: Unevaluated properties are not allowed ('gpio-ranges' was unexpected)
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-mvebu.yaml#
>> arch/arm64/boot/dts/marvell/cn9132-db.dtb: /cp1-bus/bus@f4000000/system-controller@440000/pinctrl: failed to match any schema with compatible: ['marvell,cp115-standalone-pinctrl']
   arch/arm64/boot/dts/marvell/cn9132-db.dtb: system-controller@400000: compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
>> arch/arm64/boot/dts/marvell/cn9132-db.dtb: /cp1-bus/bus@f4000000/system-controller@400000/thermal-sensor@70: failed to match any schema with compatible: ['marvell,armada-cp110-thermal']
   arch/arm64/boot/dts/marvell/cn9132-db.dtb: usb@510000: Unevaluated properties are not allowed ('dma-coherent', 'dr_mode' were unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/generic-xhci.yaml#
>> arch/arm64/boot/dts/marvell/cn9132-db.dtb: /cp1-bus/bus@f4000000/spi@700600: failed to match any schema with compatible: ['marvell,armada-380-spi']
   arch/arm64/boot/dts/marvell/cn9132-db.dtb: /cp1-bus/bus@f4000000/spi@700680: failed to match any schema with compatible: ['marvell,armada-380-spi']
   arch/arm64/boot/dts/marvell/cn9132-db.dtb: crypto@800000: 'dma-coherent' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/crypto/inside-secure,safexcel.yaml#
>> arch/arm64/boot/dts/marvell/cn9132-db.dtb: /cp1-bus/pcie@f4600000: failed to match any schema with compatible: ['marvell,armada8k-pcie', 'snps,dw-pcie']
>> arch/arm64/boot/dts/marvell/cn9132-db.dtb: /cp1-bus/pcie@f4620000: failed to match any schema with compatible: ['marvell,armada8k-pcie', 'snps,dw-pcie']
>> arch/arm64/boot/dts/marvell/cn9132-db.dtb: /cp1-bus/pcie@f4640000: failed to match any schema with compatible: ['marvell,armada8k-pcie', 'snps,dw-pcie']
   arch/arm64/boot/dts/marvell/cn9132-db.dtb: usb-phy-4: '#phy-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/usb/usb-nop-xceiv.yaml#
   arch/arm64/boot/dts/marvell/cn9132-db.dtb: usb-phy-5: '#phy-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/usb/usb-nop-xceiv.yaml#
>> arch/arm64/boot/dts/marvell/cn9132-db.dtb: /cp2-bus/bus@f6000000/phy@120000: failed to match any schema with compatible: ['marvell,comphy-cp110']
>> arch/arm64/boot/dts/marvell/cn9132-db.dtb: /cp2-bus/bus@f6000000/interrupt-controller@1e0000: failed to match any schema with compatible: ['marvell,cp110-icu']
>> arch/arm64/boot/dts/marvell/cn9132-db.dtb: /cp2-bus/bus@f6000000/interrupt-controller@1e0000/interrupt-controller@10: failed to match any schema with compatible: ['marvell,cp110-icu-nsr']
>> arch/arm64/boot/dts/marvell/cn9132-db.dtb: /cp2-bus/bus@f6000000/interrupt-controller@1e0000/interrupt-controller@50: failed to match any schema with compatible: ['marvell,cp110-icu-sei']
   arch/arm64/boot/dts/marvell/cn9132-db.dtb: system-controller@440000: compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
>> arch/arm64/boot/dts/marvell/cn9132-db.dtb: /cp2-bus/bus@f6000000/system-controller@440000/clock: failed to match any schema with compatible: ['marvell,cp110-clock']
   arch/arm64/boot/dts/marvell/cn9132-db.dtb: gpio@100: Unevaluated properties are not allowed ('gpio-ranges' was unexpected)
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-mvebu.yaml#
   arch/arm64/boot/dts/marvell/cn9132-db.dtb: gpio@140: Unevaluated properties are not allowed ('gpio-ranges' was unexpected)
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-mvebu.yaml#
>> arch/arm64/boot/dts/marvell/cn9132-db.dtb: /cp2-bus/bus@f6000000/system-controller@440000/pinctrl: failed to match any schema with compatible: ['marvell,cp115-standalone-pinctrl']
   arch/arm64/boot/dts/marvell/cn9132-db.dtb: system-controller@400000: compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
>> arch/arm64/boot/dts/marvell/cn9132-db.dtb: /cp2-bus/bus@f6000000/system-controller@400000/thermal-sensor@70: failed to match any schema with compatible: ['marvell,armada-cp110-thermal']
   arch/arm64/boot/dts/marvell/cn9132-db.dtb: usb@500000: Unevaluated properties are not allowed ('dma-coherent', 'dr_mode' were unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/generic-xhci.yaml#
   arch/arm64/boot/dts/marvell/cn9132-db.dtb: usb@510000: Unevaluated properties are not allowed ('dma-coherent', 'dr_mode' were unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/generic-xhci.yaml#
>> arch/arm64/boot/dts/marvell/cn9132-db.dtb: /cp2-bus/bus@f6000000/spi@700600: failed to match any schema with compatible: ['marvell,armada-380-spi']
   arch/arm64/boot/dts/marvell/cn9132-db.dtb: /cp2-bus/bus@f6000000/spi@700680: failed to match any schema with compatible: ['marvell,armada-380-spi']
   arch/arm64/boot/dts/marvell/cn9132-db.dtb: pca9555@21: 'pinctrl-0' is a dependency of 'pinctrl-names'
   	from schema $id: http://devicetree.org/schemas/pinctrl/pinctrl-consumer.yaml#
   arch/arm64/boot/dts/marvell/cn9132-db.dtb: crypto@800000: 'dma-coherent' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/crypto/inside-secure,safexcel.yaml#
>> arch/arm64/boot/dts/marvell/cn9132-db.dtb: /cp2-bus/pcie@f6600000: failed to match any schema with compatible: ['marvell,armada8k-pcie', 'snps,dw-pcie']
>> arch/arm64/boot/dts/marvell/cn9132-db.dtb: /cp2-bus/pcie@f6620000: failed to match any schema with compatible: ['marvell,armada8k-pcie', 'snps,dw-pcie']
>> arch/arm64/boot/dts/marvell/cn9132-db.dtb: /cp2-bus/pcie@f6640000: failed to match any schema with compatible: ['marvell,armada8k-pcie', 'snps,dw-pcie']
--
   arch/arm64/boot/dts/marvell/armada-cp11x.dtsi:235.24-254.6: Warning (unit_address_vs_reg): /cp1-bus/bus@f4000000/system-controller@440000/gpio@100: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/marvell/armada-cp11x.dtsi:256.24-275.6: Warning (unit_address_vs_reg): /cp1-bus/bus@f4000000/system-controller@440000/gpio@140: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/marvell/armada-cp11x.dtsi:235.24-254.6: Warning (unit_address_vs_reg): /cp2-bus/bus@f6000000/system-controller@440000/gpio@100: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/marvell/armada-cp11x.dtsi:256.24-275.6: Warning (unit_address_vs_reg): /cp2-bus/bus@f6000000/system-controller@440000/gpio@140: node has a unit name, but no reg or ranges property
>> arch/arm64/boot/dts/marvell/cn9132-db-B.dtb: /soc/bus@f0000000/odmi@300000: failed to match any schema with compatible: ['marvell,odmi-controller']
>> arch/arm64/boot/dts/marvell/cn9132-db-B.dtb: /soc/bus@f0000000/gicp@3f0040: failed to match any schema with compatible: ['marvell,ap806-gicp']
>> arch/arm64/boot/dts/marvell/cn9132-db-B.dtb: /soc/bus@f0000000/interrupt-controller@3f0100: failed to match any schema with compatible: ['marvell,armada-8k-pic']
>> arch/arm64/boot/dts/marvell/cn9132-db-B.dtb: /soc/bus@f0000000/interrupt-controller@3f0200: failed to match any schema with compatible: ['marvell,ap806-sei']
>> arch/arm64/boot/dts/marvell/cn9132-db-B.dtb: /soc/bus@f0000000/spi@510600: failed to match any schema with compatible: ['marvell,armada-380-spi']
   arch/arm64/boot/dts/marvell/cn9132-db-B.dtb: mmc@6e0000: clocks: [[4, 4]] is too short
   	from schema $id: http://devicetree.org/schemas/mmc/marvell,xenon-sdhci.yaml#
   arch/arm64/boot/dts/marvell/cn9132-db-B.dtb: mmc@6e0000: clock-names: ['core'] is too short
   	from schema $id: http://devicetree.org/schemas/mmc/marvell,xenon-sdhci.yaml#
   arch/arm64/boot/dts/marvell/cn9132-db-B.dtb: mmc@6e0000: 'pinctrl-0' is a dependency of 'pinctrl-names'
   	from schema $id: http://devicetree.org/schemas/pinctrl/pinctrl-consumer.yaml#
   arch/arm64/boot/dts/marvell/cn9132-db-B.dtb: system-controller@6f4000: compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
>> arch/arm64/boot/dts/marvell/cn9132-db-B.dtb: /soc/bus@f0000000/system-controller@6f4000/pinctrl: failed to match any schema with compatible: ['marvell,ap806-pinctrl']
   arch/arm64/boot/dts/marvell/cn9132-db-B.dtb: gpio@1040: Unevaluated properties are not allowed ('gpio-ranges' was unexpected)
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-mvebu.yaml#
>> arch/arm64/boot/dts/marvell/cn9132-db-B.dtb: /soc/bus@f0000000/system-controller@6f4000/clock: failed to match any schema with compatible: ['marvell,ap807-clock']
   arch/arm64/boot/dts/marvell/cn9132-db-B.dtb: system-controller@6f8000: compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
>> arch/arm64/boot/dts/marvell/cn9132-db-B.dtb: /soc/bus@f0000000/system-controller@6f8000/thermal-sensor@80: failed to match any schema with compatible: ['marvell,armada-ap807-thermal']
>> arch/arm64/boot/dts/marvell/cn9132-db-B.dtb: /soc/bus@f0000000/system-controller@6f8000/clock-cpu: failed to match any schema with compatible: ['marvell,ap807-cpu-clock']
>> arch/arm64/boot/dts/marvell/cn9132-db-B.dtb: /cp0-bus/bus@f2000000/phy@120000: failed to match any schema with compatible: ['marvell,comphy-cp110']
>> arch/arm64/boot/dts/marvell/cn9132-db-B.dtb: /cp0-bus/bus@f2000000/interrupt-controller@1e0000: failed to match any schema with compatible: ['marvell,cp110-icu']
>> arch/arm64/boot/dts/marvell/cn9132-db-B.dtb: /cp0-bus/bus@f2000000/interrupt-controller@1e0000/interrupt-controller@10: failed to match any schema with compatible: ['marvell,cp110-icu-nsr']
>> arch/arm64/boot/dts/marvell/cn9132-db-B.dtb: /cp0-bus/bus@f2000000/interrupt-controller@1e0000/interrupt-controller@50: failed to match any schema with compatible: ['marvell,cp110-icu-sei']
   arch/arm64/boot/dts/marvell/cn9132-db-B.dtb: system-controller@440000: compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
>> arch/arm64/boot/dts/marvell/cn9132-db-B.dtb: /cp0-bus/bus@f2000000/system-controller@440000/clock: failed to match any schema with compatible: ['marvell,cp110-clock']
   arch/arm64/boot/dts/marvell/cn9132-db-B.dtb: gpio@100: Unevaluated properties are not allowed ('gpio-ranges' was unexpected)
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-mvebu.yaml#
   arch/arm64/boot/dts/marvell/cn9132-db-B.dtb: gpio@140: Unevaluated properties are not allowed ('gpio-ranges' was unexpected)
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-mvebu.yaml#
>> arch/arm64/boot/dts/marvell/cn9132-db-B.dtb: /cp0-bus/bus@f2000000/system-controller@440000/pinctrl: failed to match any schema with compatible: ['marvell,cp115-standalone-pinctrl']
   arch/arm64/boot/dts/marvell/cn9132-db-B.dtb: system-controller@400000: compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
>> arch/arm64/boot/dts/marvell/cn9132-db-B.dtb: /cp0-bus/bus@f2000000/system-controller@400000/thermal-sensor@70: failed to match any schema with compatible: ['marvell,armada-cp110-thermal']
   arch/arm64/boot/dts/marvell/cn9132-db-B.dtb: usb@500000: Unevaluated properties are not allowed ('dma-coherent', 'dr_mode' were unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/generic-xhci.yaml#
   arch/arm64/boot/dts/marvell/cn9132-db-B.dtb: usb@510000: Unevaluated properties are not allowed ('dma-coherent', 'dr_mode' were unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/generic-xhci.yaml#
>> arch/arm64/boot/dts/marvell/cn9132-db-B.dtb: /cp0-bus/bus@f2000000/spi@700600: failed to match any schema with compatible: ['marvell,armada-380-spi']
   arch/arm64/boot/dts/marvell/cn9132-db-B.dtb: /cp0-bus/bus@f2000000/spi@700680: failed to match any schema with compatible: ['marvell,armada-380-spi']
   arch/arm64/boot/dts/marvell/cn9132-db-B.dtb: pca953x@21: 'pinctrl-0' is a dependency of 'pinctrl-names'
   	from schema $id: http://devicetree.org/schemas/pinctrl/pinctrl-consumer.yaml#
   arch/arm64/boot/dts/marvell/cn9132-db-B.dtb: pca9555@21: 'pinctrl-0' is a dependency of 'pinctrl-names'
   	from schema $id: http://devicetree.org/schemas/pinctrl/pinctrl-consumer.yaml#
   arch/arm64/boot/dts/marvell/cn9132-db-B.dtb: crypto@800000: 'dma-coherent' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/crypto/inside-secure,safexcel.yaml#
>> arch/arm64/boot/dts/marvell/cn9132-db-B.dtb: /cp0-bus/pcie@f2600000: failed to match any schema with compatible: ['marvell,armada8k-pcie', 'snps,dw-pcie']
>> arch/arm64/boot/dts/marvell/cn9132-db-B.dtb: /cp0-bus/pcie@f2620000: failed to match any schema with compatible: ['marvell,armada8k-pcie', 'snps,dw-pcie']
>> arch/arm64/boot/dts/marvell/cn9132-db-B.dtb: /cp0-bus/pcie@f2640000: failed to match any schema with compatible: ['marvell,armada8k-pcie', 'snps,dw-pcie']
   arch/arm64/boot/dts/marvell/cn9132-db-B.dtb: usb-phy-1: '#phy-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/usb/usb-nop-xceiv.yaml#
   arch/arm64/boot/dts/marvell/cn9132-db-B.dtb: usb-phy-2: '#phy-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/usb/usb-nop-xceiv.yaml#
   arch/arm64/boot/dts/marvell/cn9132-db-B.dtb: usb-phy-3: '#phy-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/usb/usb-nop-xceiv.yaml#
>> arch/arm64/boot/dts/marvell/cn9132-db-B.dtb: /cp1-bus/bus@f4000000/phy@120000: failed to match any schema with compatible: ['marvell,comphy-cp110']
>> arch/arm64/boot/dts/marvell/cn9132-db-B.dtb: /cp1-bus/bus@f4000000/interrupt-controller@1e0000: failed to match any schema with compatible: ['marvell,cp110-icu']
>> arch/arm64/boot/dts/marvell/cn9132-db-B.dtb: /cp1-bus/bus@f4000000/interrupt-controller@1e0000/interrupt-controller@10: failed to match any schema with compatible: ['marvell,cp110-icu-nsr']
>> arch/arm64/boot/dts/marvell/cn9132-db-B.dtb: /cp1-bus/bus@f4000000/interrupt-controller@1e0000/interrupt-controller@50: failed to match any schema with compatible: ['marvell,cp110-icu-sei']
   arch/arm64/boot/dts/marvell/cn9132-db-B.dtb: system-controller@440000: compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
>> arch/arm64/boot/dts/marvell/cn9132-db-B.dtb: /cp1-bus/bus@f4000000/system-controller@440000/clock: failed to match any schema with compatible: ['marvell,cp110-clock']
   arch/arm64/boot/dts/marvell/cn9132-db-B.dtb: gpio@100: Unevaluated properties are not allowed ('gpio-ranges' was unexpected)
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-mvebu.yaml#
   arch/arm64/boot/dts/marvell/cn9132-db-B.dtb: gpio@140: Unevaluated properties are not allowed ('gpio-ranges' was unexpected)
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-mvebu.yaml#
>> arch/arm64/boot/dts/marvell/cn9132-db-B.dtb: /cp1-bus/bus@f4000000/system-controller@440000/pinctrl: failed to match any schema with compatible: ['marvell,cp115-standalone-pinctrl']
   arch/arm64/boot/dts/marvell/cn9132-db-B.dtb: system-controller@400000: compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
>> arch/arm64/boot/dts/marvell/cn9132-db-B.dtb: /cp1-bus/bus@f4000000/system-controller@400000/thermal-sensor@70: failed to match any schema with compatible: ['marvell,armada-cp110-thermal']
   arch/arm64/boot/dts/marvell/cn9132-db-B.dtb: usb@510000: Unevaluated properties are not allowed ('dma-coherent', 'dr_mode' were unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/generic-xhci.yaml#
>> arch/arm64/boot/dts/marvell/cn9132-db-B.dtb: /cp1-bus/bus@f4000000/spi@700600: failed to match any schema with compatible: ['marvell,armada-380-spi']
   arch/arm64/boot/dts/marvell/cn9132-db-B.dtb: /cp1-bus/bus@f4000000/spi@700680: failed to match any schema with compatible: ['marvell,armada-380-spi']
   arch/arm64/boot/dts/marvell/cn9132-db-B.dtb: crypto@800000: 'dma-coherent' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/crypto/inside-secure,safexcel.yaml#
>> arch/arm64/boot/dts/marvell/cn9132-db-B.dtb: /cp1-bus/pcie@f4600000: failed to match any schema with compatible: ['marvell,armada8k-pcie', 'snps,dw-pcie']
>> arch/arm64/boot/dts/marvell/cn9132-db-B.dtb: /cp1-bus/pcie@f4620000: failed to match any schema with compatible: ['marvell,armada8k-pcie', 'snps,dw-pcie']
>> arch/arm64/boot/dts/marvell/cn9132-db-B.dtb: /cp1-bus/pcie@f4640000: failed to match any schema with compatible: ['marvell,armada8k-pcie', 'snps,dw-pcie']
   arch/arm64/boot/dts/marvell/cn9132-db-B.dtb: usb-phy-4: '#phy-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/usb/usb-nop-xceiv.yaml#
   arch/arm64/boot/dts/marvell/cn9132-db-B.dtb: usb-phy-5: '#phy-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/usb/usb-nop-xceiv.yaml#
>> arch/arm64/boot/dts/marvell/cn9132-db-B.dtb: /cp2-bus/bus@f6000000/phy@120000: failed to match any schema with compatible: ['marvell,comphy-cp110']
>> arch/arm64/boot/dts/marvell/cn9132-db-B.dtb: /cp2-bus/bus@f6000000/interrupt-controller@1e0000: failed to match any schema with compatible: ['marvell,cp110-icu']
>> arch/arm64/boot/dts/marvell/cn9132-db-B.dtb: /cp2-bus/bus@f6000000/interrupt-controller@1e0000/interrupt-controller@10: failed to match any schema with compatible: ['marvell,cp110-icu-nsr']
>> arch/arm64/boot/dts/marvell/cn9132-db-B.dtb: /cp2-bus/bus@f6000000/interrupt-controller@1e0000/interrupt-controller@50: failed to match any schema with compatible: ['marvell,cp110-icu-sei']
   arch/arm64/boot/dts/marvell/cn9132-db-B.dtb: system-controller@440000: compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
>> arch/arm64/boot/dts/marvell/cn9132-db-B.dtb: /cp2-bus/bus@f6000000/system-controller@440000/clock: failed to match any schema with compatible: ['marvell,cp110-clock']
   arch/arm64/boot/dts/marvell/cn9132-db-B.dtb: gpio@100: Unevaluated properties are not allowed ('gpio-ranges' was unexpected)
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-mvebu.yaml#
   arch/arm64/boot/dts/marvell/cn9132-db-B.dtb: gpio@140: Unevaluated properties are not allowed ('gpio-ranges' was unexpected)
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-mvebu.yaml#
>> arch/arm64/boot/dts/marvell/cn9132-db-B.dtb: /cp2-bus/bus@f6000000/system-controller@440000/pinctrl: failed to match any schema with compatible: ['marvell,cp115-standalone-pinctrl']
   arch/arm64/boot/dts/marvell/cn9132-db-B.dtb: system-controller@400000: compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
>> arch/arm64/boot/dts/marvell/cn9132-db-B.dtb: /cp2-bus/bus@f6000000/system-controller@400000/thermal-sensor@70: failed to match any schema with compatible: ['marvell,armada-cp110-thermal']
   arch/arm64/boot/dts/marvell/cn9132-db-B.dtb: usb@500000: Unevaluated properties are not allowed ('dma-coherent', 'dr_mode' were unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/generic-xhci.yaml#
   arch/arm64/boot/dts/marvell/cn9132-db-B.dtb: usb@510000: Unevaluated properties are not allowed ('dma-coherent', 'dr_mode' were unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/generic-xhci.yaml#
>> arch/arm64/boot/dts/marvell/cn9132-db-B.dtb: /cp2-bus/bus@f6000000/spi@700600: failed to match any schema with compatible: ['marvell,armada-380-spi']
   arch/arm64/boot/dts/marvell/cn9132-db-B.dtb: /cp2-bus/bus@f6000000/spi@700680: failed to match any schema with compatible: ['marvell,armada-380-spi']
   arch/arm64/boot/dts/marvell/cn9132-db-B.dtb: pca9555@21: 'pinctrl-0' is a dependency of 'pinctrl-names'
   	from schema $id: http://devicetree.org/schemas/pinctrl/pinctrl-consumer.yaml#
   arch/arm64/boot/dts/marvell/cn9132-db-B.dtb: crypto@800000: 'dma-coherent' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/crypto/inside-secure,safexcel.yaml#
>> arch/arm64/boot/dts/marvell/cn9132-db-B.dtb: /cp2-bus/pcie@f6600000: failed to match any schema with compatible: ['marvell,armada8k-pcie', 'snps,dw-pcie']
>> arch/arm64/boot/dts/marvell/cn9132-db-B.dtb: /cp2-bus/pcie@f6620000: failed to match any schema with compatible: ['marvell,armada8k-pcie', 'snps,dw-pcie']
>> arch/arm64/boot/dts/marvell/cn9132-db-B.dtb: /cp2-bus/pcie@f6640000: failed to match any schema with compatible: ['marvell,armada8k-pcie', 'snps,dw-pcie']
--
   arch/arm64/boot/dts/marvell/armada-ap80x.dtsi:282.24-292.7: Warning (unit_address_vs_reg): /soc/bus@f0000000/system-controller@6f4000/gpio@1040: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/marvell/armada-cp11x.dtsi:235.24-254.6: Warning (unit_address_vs_reg): /cp0-bus/bus@f2000000/system-controller@440000/gpio@100: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/marvell/armada-cp11x.dtsi:256.24-275.6: Warning (unit_address_vs_reg): /cp0-bus/bus@f2000000/system-controller@440000/gpio@140: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/marvell/cn9130-crb.dtsi:177.10-200.4: Warning (avoid_unnecessary_addr_size): /cp0-bus/bus@f2000000/spi@700680/flash@0: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>> arch/arm64/boot/dts/marvell/cn9130-crb-A.dtb: /soc/bus@f0000000/odmi@300000: failed to match any schema with compatible: ['marvell,odmi-controller']
>> arch/arm64/boot/dts/marvell/cn9130-crb-A.dtb: /soc/bus@f0000000/gicp@3f0040: failed to match any schema with compatible: ['marvell,ap806-gicp']
>> arch/arm64/boot/dts/marvell/cn9130-crb-A.dtb: /soc/bus@f0000000/interrupt-controller@3f0100: failed to match any schema with compatible: ['marvell,armada-8k-pic']
>> arch/arm64/boot/dts/marvell/cn9130-crb-A.dtb: /soc/bus@f0000000/interrupt-controller@3f0200: failed to match any schema with compatible: ['marvell,ap806-sei']
>> arch/arm64/boot/dts/marvell/cn9130-crb-A.dtb: /soc/bus@f0000000/spi@510600: failed to match any schema with compatible: ['marvell,armada-380-spi']
   arch/arm64/boot/dts/marvell/cn9130-crb-A.dtb: mmc@6e0000: clocks: [[4, 4]] is too short
   	from schema $id: http://devicetree.org/schemas/mmc/marvell,xenon-sdhci.yaml#
   arch/arm64/boot/dts/marvell/cn9130-crb-A.dtb: mmc@6e0000: clock-names: ['core'] is too short
   	from schema $id: http://devicetree.org/schemas/mmc/marvell,xenon-sdhci.yaml#
   arch/arm64/boot/dts/marvell/cn9130-crb-A.dtb: mmc@6e0000: 'pinctrl-0' is a dependency of 'pinctrl-names'
   	from schema $id: http://devicetree.org/schemas/pinctrl/pinctrl-consumer.yaml#
   arch/arm64/boot/dts/marvell/cn9130-crb-A.dtb: system-controller@6f4000: compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
>> arch/arm64/boot/dts/marvell/cn9130-crb-A.dtb: /soc/bus@f0000000/system-controller@6f4000/pinctrl: failed to match any schema with compatible: ['marvell,ap806-pinctrl']
   arch/arm64/boot/dts/marvell/cn9130-crb-A.dtb: gpio@1040: Unevaluated properties are not allowed ('gpio-ranges' was unexpected)
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-mvebu.yaml#
>> arch/arm64/boot/dts/marvell/cn9130-crb-A.dtb: /soc/bus@f0000000/system-controller@6f4000/clock: failed to match any schema with compatible: ['marvell,ap807-clock']
   arch/arm64/boot/dts/marvell/cn9130-crb-A.dtb: system-controller@6f8000: compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
>> arch/arm64/boot/dts/marvell/cn9130-crb-A.dtb: /soc/bus@f0000000/system-controller@6f8000/thermal-sensor@80: failed to match any schema with compatible: ['marvell,armada-ap807-thermal']
>> arch/arm64/boot/dts/marvell/cn9130-crb-A.dtb: /soc/bus@f0000000/system-controller@6f8000/clock-cpu: failed to match any schema with compatible: ['marvell,ap807-cpu-clock']
>> arch/arm64/boot/dts/marvell/cn9130-crb-A.dtb: /cp0-bus/bus@f2000000/phy@120000: failed to match any schema with compatible: ['marvell,comphy-cp110']
>> arch/arm64/boot/dts/marvell/cn9130-crb-A.dtb: /cp0-bus/bus@f2000000/interrupt-controller@1e0000: failed to match any schema with compatible: ['marvell,cp110-icu']
>> arch/arm64/boot/dts/marvell/cn9130-crb-A.dtb: /cp0-bus/bus@f2000000/interrupt-controller@1e0000/interrupt-controller@10: failed to match any schema with compatible: ['marvell,cp110-icu-nsr']
>> arch/arm64/boot/dts/marvell/cn9130-crb-A.dtb: /cp0-bus/bus@f2000000/interrupt-controller@1e0000/interrupt-controller@50: failed to match any schema with compatible: ['marvell,cp110-icu-sei']
   arch/arm64/boot/dts/marvell/cn9130-crb-A.dtb: system-controller@440000: compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
>> arch/arm64/boot/dts/marvell/cn9130-crb-A.dtb: /cp0-bus/bus@f2000000/system-controller@440000/clock: failed to match any schema with compatible: ['marvell,cp110-clock']
   arch/arm64/boot/dts/marvell/cn9130-crb-A.dtb: gpio@100: Unevaluated properties are not allowed ('gpio-ranges' was unexpected)
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-mvebu.yaml#
   arch/arm64/boot/dts/marvell/cn9130-crb-A.dtb: gpio@140: Unevaluated properties are not allowed ('gpio-ranges' was unexpected)
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-mvebu.yaml#
>> arch/arm64/boot/dts/marvell/cn9130-crb-A.dtb: /cp0-bus/bus@f2000000/system-controller@440000/pinctrl: failed to match any schema with compatible: ['marvell,cp115-standalone-pinctrl']
   arch/arm64/boot/dts/marvell/cn9130-crb-A.dtb: system-controller@400000: compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
>> arch/arm64/boot/dts/marvell/cn9130-crb-A.dtb: /cp0-bus/bus@f2000000/system-controller@400000/thermal-sensor@70: failed to match any schema with compatible: ['marvell,armada-cp110-thermal']
   arch/arm64/boot/dts/marvell/cn9130-crb-A.dtb: usb@500000: Unevaluated properties are not allowed ('dma-coherent' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/generic-xhci.yaml#
   arch/arm64/boot/dts/marvell/cn9130-crb-A.dtb: usb@500000: 'phys' is a dependency of 'phy-names'
   	from schema $id: http://devicetree.org/schemas/phy/phy-consumer.yaml#
   arch/arm64/boot/dts/marvell/cn9130-crb-A.dtb: usb@510000: Unevaluated properties are not allowed ('dma-coherent' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/generic-xhci.yaml#
   arch/arm64/boot/dts/marvell/cn9130-crb-A.dtb: usb@510000: 'phys' is a dependency of 'phy-names'
   	from schema $id: http://devicetree.org/schemas/phy/phy-consumer.yaml#
>> arch/arm64/boot/dts/marvell/cn9130-crb-A.dtb: /cp0-bus/bus@f2000000/spi@700600: failed to match any schema with compatible: ['marvell,armada-380-spi']
   arch/arm64/boot/dts/marvell/cn9130-crb-A.dtb: /cp0-bus/bus@f2000000/spi@700680: failed to match any schema with compatible: ['marvell,armada-380-spi']
   arch/arm64/boot/dts/marvell/cn9130-crb-A.dtb: crypto@800000: 'dma-coherent' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/crypto/inside-secure,safexcel.yaml#
>> arch/arm64/boot/dts/marvell/cn9130-crb-A.dtb: /cp0-bus/pcie@f2600000: failed to match any schema with compatible: ['marvell,armada8k-pcie', 'snps,dw-pcie']
>> arch/arm64/boot/dts/marvell/cn9130-crb-A.dtb: /cp0-bus/pcie@f2620000: failed to match any schema with compatible: ['marvell,armada8k-pcie', 'snps,dw-pcie']
>> arch/arm64/boot/dts/marvell/cn9130-crb-A.dtb: /cp0-bus/pcie@f2640000: failed to match any schema with compatible: ['marvell,armada8k-pcie', 'snps,dw-pcie']
   arch/arm64/boot/dts/marvell/cn9130-crb-A.dtb: usb-phy-1: '#phy-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/usb/usb-nop-xceiv.yaml#
   arch/arm64/boot/dts/marvell/cn9130-crb-A.dtb: usb-phy-2: '#phy-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/usb/usb-nop-xceiv.yaml#
--
   arch/arm64/boot/dts/marvell/armada-ap80x.dtsi:282.24-292.7: Warning (unit_address_vs_reg): /soc/bus@f0000000/system-controller@6f4000/gpio@1040: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/marvell/armada-cp11x.dtsi:235.24-254.6: Warning (unit_address_vs_reg): /cp0-bus/bus@f2000000/system-controller@440000/gpio@100: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/marvell/armada-cp11x.dtsi:256.24-275.6: Warning (unit_address_vs_reg): /cp0-bus/bus@f2000000/system-controller@440000/gpio@140: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/marvell/cn9130-crb.dtsi:177.10-200.4: Warning (avoid_unnecessary_addr_size): /cp0-bus/bus@f2000000/spi@700680/flash@0: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>> arch/arm64/boot/dts/marvell/cn9130-crb-B.dtb: /soc/bus@f0000000/odmi@300000: failed to match any schema with compatible: ['marvell,odmi-controller']
>> arch/arm64/boot/dts/marvell/cn9130-crb-B.dtb: /soc/bus@f0000000/gicp@3f0040: failed to match any schema with compatible: ['marvell,ap806-gicp']
>> arch/arm64/boot/dts/marvell/cn9130-crb-B.dtb: /soc/bus@f0000000/interrupt-controller@3f0100: failed to match any schema with compatible: ['marvell,armada-8k-pic']
>> arch/arm64/boot/dts/marvell/cn9130-crb-B.dtb: /soc/bus@f0000000/interrupt-controller@3f0200: failed to match any schema with compatible: ['marvell,ap806-sei']
>> arch/arm64/boot/dts/marvell/cn9130-crb-B.dtb: /soc/bus@f0000000/spi@510600: failed to match any schema with compatible: ['marvell,armada-380-spi']
   arch/arm64/boot/dts/marvell/cn9130-crb-B.dtb: mmc@6e0000: clocks: [[4, 4]] is too short
   	from schema $id: http://devicetree.org/schemas/mmc/marvell,xenon-sdhci.yaml#
   arch/arm64/boot/dts/marvell/cn9130-crb-B.dtb: mmc@6e0000: clock-names: ['core'] is too short
   	from schema $id: http://devicetree.org/schemas/mmc/marvell,xenon-sdhci.yaml#
   arch/arm64/boot/dts/marvell/cn9130-crb-B.dtb: mmc@6e0000: 'pinctrl-0' is a dependency of 'pinctrl-names'
   	from schema $id: http://devicetree.org/schemas/pinctrl/pinctrl-consumer.yaml#
   arch/arm64/boot/dts/marvell/cn9130-crb-B.dtb: system-controller@6f4000: compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
>> arch/arm64/boot/dts/marvell/cn9130-crb-B.dtb: /soc/bus@f0000000/system-controller@6f4000/pinctrl: failed to match any schema with compatible: ['marvell,ap806-pinctrl']
   arch/arm64/boot/dts/marvell/cn9130-crb-B.dtb: gpio@1040: Unevaluated properties are not allowed ('gpio-ranges' was unexpected)
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-mvebu.yaml#
>> arch/arm64/boot/dts/marvell/cn9130-crb-B.dtb: /soc/bus@f0000000/system-controller@6f4000/clock: failed to match any schema with compatible: ['marvell,ap807-clock']
   arch/arm64/boot/dts/marvell/cn9130-crb-B.dtb: system-controller@6f8000: compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
>> arch/arm64/boot/dts/marvell/cn9130-crb-B.dtb: /soc/bus@f0000000/system-controller@6f8000/thermal-sensor@80: failed to match any schema with compatible: ['marvell,armada-ap807-thermal']
>> arch/arm64/boot/dts/marvell/cn9130-crb-B.dtb: /soc/bus@f0000000/system-controller@6f8000/clock-cpu: failed to match any schema with compatible: ['marvell,ap807-cpu-clock']
>> arch/arm64/boot/dts/marvell/cn9130-crb-B.dtb: /cp0-bus/bus@f2000000/phy@120000: failed to match any schema with compatible: ['marvell,comphy-cp110']
>> arch/arm64/boot/dts/marvell/cn9130-crb-B.dtb: /cp0-bus/bus@f2000000/interrupt-controller@1e0000: failed to match any schema with compatible: ['marvell,cp110-icu']
>> arch/arm64/boot/dts/marvell/cn9130-crb-B.dtb: /cp0-bus/bus@f2000000/interrupt-controller@1e0000/interrupt-controller@10: failed to match any schema with compatible: ['marvell,cp110-icu-nsr']
>> arch/arm64/boot/dts/marvell/cn9130-crb-B.dtb: /cp0-bus/bus@f2000000/interrupt-controller@1e0000/interrupt-controller@50: failed to match any schema with compatible: ['marvell,cp110-icu-sei']
   arch/arm64/boot/dts/marvell/cn9130-crb-B.dtb: system-controller@440000: compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
>> arch/arm64/boot/dts/marvell/cn9130-crb-B.dtb: /cp0-bus/bus@f2000000/system-controller@440000/clock: failed to match any schema with compatible: ['marvell,cp110-clock']
   arch/arm64/boot/dts/marvell/cn9130-crb-B.dtb: gpio@100: Unevaluated properties are not allowed ('gpio-ranges' was unexpected)
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-mvebu.yaml#
   arch/arm64/boot/dts/marvell/cn9130-crb-B.dtb: gpio@140: Unevaluated properties are not allowed ('gpio-ranges' was unexpected)
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-mvebu.yaml#
>> arch/arm64/boot/dts/marvell/cn9130-crb-B.dtb: /cp0-bus/bus@f2000000/system-controller@440000/pinctrl: failed to match any schema with compatible: ['marvell,cp115-standalone-pinctrl']
   arch/arm64/boot/dts/marvell/cn9130-crb-B.dtb: system-controller@400000: compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
>> arch/arm64/boot/dts/marvell/cn9130-crb-B.dtb: /cp0-bus/bus@f2000000/system-controller@400000/thermal-sensor@70: failed to match any schema with compatible: ['marvell,armada-cp110-thermal']
   arch/arm64/boot/dts/marvell/cn9130-crb-B.dtb: usb@500000: Unevaluated properties are not allowed ('dma-coherent' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/generic-xhci.yaml#
   arch/arm64/boot/dts/marvell/cn9130-crb-B.dtb: usb@510000: Unevaluated properties are not allowed ('dma-coherent' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/generic-xhci.yaml#
>> arch/arm64/boot/dts/marvell/cn9130-crb-B.dtb: /cp0-bus/bus@f2000000/spi@700600: failed to match any schema with compatible: ['marvell,armada-380-spi']
   arch/arm64/boot/dts/marvell/cn9130-crb-B.dtb: /cp0-bus/bus@f2000000/spi@700680: failed to match any schema with compatible: ['marvell,armada-380-spi']
   arch/arm64/boot/dts/marvell/cn9130-crb-B.dtb: crypto@800000: 'dma-coherent' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/crypto/inside-secure,safexcel.yaml#
>> arch/arm64/boot/dts/marvell/cn9130-crb-B.dtb: /cp0-bus/pcie@f2600000: failed to match any schema with compatible: ['marvell,armada8k-pcie', 'snps,dw-pcie']
>> arch/arm64/boot/dts/marvell/cn9130-crb-B.dtb: /cp0-bus/pcie@f2620000: failed to match any schema with compatible: ['marvell,armada8k-pcie', 'snps,dw-pcie']
>> arch/arm64/boot/dts/marvell/cn9130-crb-B.dtb: /cp0-bus/pcie@f2640000: failed to match any schema with compatible: ['marvell,armada8k-pcie', 'snps,dw-pcie']
   arch/arm64/boot/dts/marvell/cn9130-crb-B.dtb: usb-phy-1: '#phy-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/usb/usb-nop-xceiv.yaml#
   arch/arm64/boot/dts/marvell/cn9130-crb-B.dtb: usb-phy-2: '#phy-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/usb/usb-nop-xceiv.yaml#
--
   arch/arm64/boot/dts/marvell/armada-cp11x.dtsi:235.24-254.6: Warning (unit_address_vs_reg): /cp0-bus/bus@f2000000/system-controller@440000/gpio@100: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/marvell/armada-cp11x.dtsi:256.24-275.6: Warning (unit_address_vs_reg): /cp0-bus/bus@f2000000/system-controller@440000/gpio@140: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/marvell/armada-cp11x.dtsi:235.24-254.6: Warning (unit_address_vs_reg): /cp1-bus/bus@f4000000/system-controller@440000/gpio@100: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/marvell/armada-cp11x.dtsi:256.24-275.6: Warning (unit_address_vs_reg): /cp1-bus/bus@f4000000/system-controller@440000/gpio@140: node has a unit name, but no reg or ranges property
>> arch/arm64/boot/dts/marvell/ac5x-rd-carrier-cn9131.dtb: /soc/bus@f0000000/odmi@300000: failed to match any schema with compatible: ['marvell,odmi-controller']
>> arch/arm64/boot/dts/marvell/ac5x-rd-carrier-cn9131.dtb: /soc/bus@f0000000/gicp@3f0040: failed to match any schema with compatible: ['marvell,ap806-gicp']
>> arch/arm64/boot/dts/marvell/ac5x-rd-carrier-cn9131.dtb: /soc/bus@f0000000/interrupt-controller@3f0100: failed to match any schema with compatible: ['marvell,armada-8k-pic']
>> arch/arm64/boot/dts/marvell/ac5x-rd-carrier-cn9131.dtb: /soc/bus@f0000000/interrupt-controller@3f0200: failed to match any schema with compatible: ['marvell,ap806-sei']
>> arch/arm64/boot/dts/marvell/ac5x-rd-carrier-cn9131.dtb: /soc/bus@f0000000/spi@510600: failed to match any schema with compatible: ['marvell,armada-380-spi']
   arch/arm64/boot/dts/marvell/ac5x-rd-carrier-cn9131.dtb: mmc@6e0000: clocks: [[4, 4]] is too short
   	from schema $id: http://devicetree.org/schemas/mmc/marvell,xenon-sdhci.yaml#
   arch/arm64/boot/dts/marvell/ac5x-rd-carrier-cn9131.dtb: mmc@6e0000: clock-names: ['core'] is too short
   	from schema $id: http://devicetree.org/schemas/mmc/marvell,xenon-sdhci.yaml#
   arch/arm64/boot/dts/marvell/ac5x-rd-carrier-cn9131.dtb: mmc@6e0000: 'pinctrl-0' is a dependency of 'pinctrl-names'
   	from schema $id: http://devicetree.org/schemas/pinctrl/pinctrl-consumer.yaml#
   arch/arm64/boot/dts/marvell/ac5x-rd-carrier-cn9131.dtb: system-controller@6f4000: compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
>> arch/arm64/boot/dts/marvell/ac5x-rd-carrier-cn9131.dtb: /soc/bus@f0000000/system-controller@6f4000/pinctrl: failed to match any schema with compatible: ['marvell,ap806-pinctrl']
   arch/arm64/boot/dts/marvell/ac5x-rd-carrier-cn9131.dtb: gpio@1040: Unevaluated properties are not allowed ('gpio-ranges' was unexpected)
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-mvebu.yaml#
>> arch/arm64/boot/dts/marvell/ac5x-rd-carrier-cn9131.dtb: /soc/bus@f0000000/system-controller@6f4000/clock: failed to match any schema with compatible: ['marvell,ap807-clock']
   arch/arm64/boot/dts/marvell/ac5x-rd-carrier-cn9131.dtb: system-controller@6f8000: compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
>> arch/arm64/boot/dts/marvell/ac5x-rd-carrier-cn9131.dtb: /soc/bus@f0000000/system-controller@6f8000/thermal-sensor@80: failed to match any schema with compatible: ['marvell,armada-ap807-thermal']
>> arch/arm64/boot/dts/marvell/ac5x-rd-carrier-cn9131.dtb: /soc/bus@f0000000/system-controller@6f8000/clock-cpu: failed to match any schema with compatible: ['marvell,ap807-cpu-clock']
>> arch/arm64/boot/dts/marvell/ac5x-rd-carrier-cn9131.dtb: /cp0-bus/bus@f2000000/phy@120000: failed to match any schema with compatible: ['marvell,comphy-cp110']
>> arch/arm64/boot/dts/marvell/ac5x-rd-carrier-cn9131.dtb: /cp0-bus/bus@f2000000/interrupt-controller@1e0000: failed to match any schema with compatible: ['marvell,cp110-icu']
>> arch/arm64/boot/dts/marvell/ac5x-rd-carrier-cn9131.dtb: /cp0-bus/bus@f2000000/interrupt-controller@1e0000/interrupt-controller@10: failed to match any schema with compatible: ['marvell,cp110-icu-nsr']
>> arch/arm64/boot/dts/marvell/ac5x-rd-carrier-cn9131.dtb: /cp0-bus/bus@f2000000/interrupt-controller@1e0000/interrupt-controller@50: failed to match any schema with compatible: ['marvell,cp110-icu-sei']
   arch/arm64/boot/dts/marvell/ac5x-rd-carrier-cn9131.dtb: system-controller@440000: compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
>> arch/arm64/boot/dts/marvell/ac5x-rd-carrier-cn9131.dtb: /cp0-bus/bus@f2000000/system-controller@440000/clock: failed to match any schema with compatible: ['marvell,cp110-clock']
   arch/arm64/boot/dts/marvell/ac5x-rd-carrier-cn9131.dtb: gpio@100: Unevaluated properties are not allowed ('gpio-ranges' was unexpected)
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-mvebu.yaml#
   arch/arm64/boot/dts/marvell/ac5x-rd-carrier-cn9131.dtb: gpio@140: Unevaluated properties are not allowed ('gpio-ranges' was unexpected)
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-mvebu.yaml#
>> arch/arm64/boot/dts/marvell/ac5x-rd-carrier-cn9131.dtb: /cp0-bus/bus@f2000000/system-controller@440000/pinctrl: failed to match any schema with compatible: ['marvell,cp115-standalone-pinctrl']
   arch/arm64/boot/dts/marvell/ac5x-rd-carrier-cn9131.dtb: system-controller@400000: compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
>> arch/arm64/boot/dts/marvell/ac5x-rd-carrier-cn9131.dtb: /cp0-bus/bus@f2000000/system-controller@400000/thermal-sensor@70: failed to match any schema with compatible: ['marvell,armada-cp110-thermal']
   arch/arm64/boot/dts/marvell/ac5x-rd-carrier-cn9131.dtb: usb@500000: Unevaluated properties are not allowed ('dma-coherent', 'dr_mode' were unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/generic-xhci.yaml#
   arch/arm64/boot/dts/marvell/ac5x-rd-carrier-cn9131.dtb: usb@500000: 'phys' is a dependency of 'phy-names'
   	from schema $id: http://devicetree.org/schemas/phy/phy-consumer.yaml#
   arch/arm64/boot/dts/marvell/ac5x-rd-carrier-cn9131.dtb: usb@510000: Unevaluated properties are not allowed ('dma-coherent', 'dr_mode' were unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/generic-xhci.yaml#
   arch/arm64/boot/dts/marvell/ac5x-rd-carrier-cn9131.dtb: usb@510000: 'phys' is a dependency of 'phy-names'
   	from schema $id: http://devicetree.org/schemas/phy/phy-consumer.yaml#
>> arch/arm64/boot/dts/marvell/ac5x-rd-carrier-cn9131.dtb: /cp0-bus/bus@f2000000/spi@700600: failed to match any schema with compatible: ['marvell,armada-380-spi']
   arch/arm64/boot/dts/marvell/ac5x-rd-carrier-cn9131.dtb: /cp0-bus/bus@f2000000/spi@700680: failed to match any schema with compatible: ['marvell,armada-380-spi']
   arch/arm64/boot/dts/marvell/ac5x-rd-carrier-cn9131.dtb: pca953x@21: 'pinctrl-0' is a dependency of 'pinctrl-names'
   	from schema $id: http://devicetree.org/schemas/pinctrl/pinctrl-consumer.yaml#
   arch/arm64/boot/dts/marvell/ac5x-rd-carrier-cn9131.dtb: pca9555@21: 'pinctrl-0' is a dependency of 'pinctrl-names'
   	from schema $id: http://devicetree.org/schemas/pinctrl/pinctrl-consumer.yaml#
   arch/arm64/boot/dts/marvell/ac5x-rd-carrier-cn9131.dtb: crypto@800000: 'dma-coherent' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/crypto/inside-secure,safexcel.yaml#
>> arch/arm64/boot/dts/marvell/ac5x-rd-carrier-cn9131.dtb: /cp0-bus/pcie@f2600000: failed to match any schema with compatible: ['marvell,armada8k-pcie', 'snps,dw-pcie']
>> arch/arm64/boot/dts/marvell/ac5x-rd-carrier-cn9131.dtb: /cp0-bus/pcie@f2620000: failed to match any schema with compatible: ['marvell,armada8k-pcie', 'snps,dw-pcie']
>> arch/arm64/boot/dts/marvell/ac5x-rd-carrier-cn9131.dtb: /cp0-bus/pcie@f2640000: failed to match any schema with compatible: ['marvell,armada8k-pcie', 'snps,dw-pcie']
   arch/arm64/boot/dts/marvell/ac5x-rd-carrier-cn9131.dtb: regulator-1: 'gpios' is a required property
   	from schema $id: http://devicetree.org/schemas/regulator/gpio-regulator.yaml#
   arch/arm64/boot/dts/marvell/ac5x-rd-carrier-cn9131.dtb: usb-phy-1: '#phy-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/usb/usb-nop-xceiv.yaml#
   arch/arm64/boot/dts/marvell/ac5x-rd-carrier-cn9131.dtb: usb-phy-2: '#phy-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/usb/usb-nop-xceiv.yaml#
   arch/arm64/boot/dts/marvell/ac5x-rd-carrier-cn9131.dtb: usb-phy-3: '#phy-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/usb/usb-nop-xceiv.yaml#
>> arch/arm64/boot/dts/marvell/ac5x-rd-carrier-cn9131.dtb: /cp1-bus/bus@f4000000/phy@120000: failed to match any schema with compatible: ['marvell,comphy-cp110']
>> arch/arm64/boot/dts/marvell/ac5x-rd-carrier-cn9131.dtb: /cp1-bus/bus@f4000000/interrupt-controller@1e0000: failed to match any schema with compatible: ['marvell,cp110-icu']
>> arch/arm64/boot/dts/marvell/ac5x-rd-carrier-cn9131.dtb: /cp1-bus/bus@f4000000/interrupt-controller@1e0000/interrupt-controller@10: failed to match any schema with compatible: ['marvell,cp110-icu-nsr']
>> arch/arm64/boot/dts/marvell/ac5x-rd-carrier-cn9131.dtb: /cp1-bus/bus@f4000000/interrupt-controller@1e0000/interrupt-controller@50: failed to match any schema with compatible: ['marvell,cp110-icu-sei']
   arch/arm64/boot/dts/marvell/ac5x-rd-carrier-cn9131.dtb: system-controller@440000: compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
>> arch/arm64/boot/dts/marvell/ac5x-rd-carrier-cn9131.dtb: /cp1-bus/bus@f4000000/system-controller@440000/clock: failed to match any schema with compatible: ['marvell,cp110-clock']
   arch/arm64/boot/dts/marvell/ac5x-rd-carrier-cn9131.dtb: gpio@100: Unevaluated properties are not allowed ('gpio-ranges' was unexpected)
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-mvebu.yaml#
   arch/arm64/boot/dts/marvell/ac5x-rd-carrier-cn9131.dtb: gpio@140: Unevaluated properties are not allowed ('gpio-ranges' was unexpected)
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-mvebu.yaml#
>> arch/arm64/boot/dts/marvell/ac5x-rd-carrier-cn9131.dtb: /cp1-bus/bus@f4000000/system-controller@440000/pinctrl: failed to match any schema with compatible: ['marvell,cp115-standalone-pinctrl']
   arch/arm64/boot/dts/marvell/ac5x-rd-carrier-cn9131.dtb: system-controller@400000: compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
>> arch/arm64/boot/dts/marvell/ac5x-rd-carrier-cn9131.dtb: /cp1-bus/bus@f4000000/system-controller@400000/thermal-sensor@70: failed to match any schema with compatible: ['marvell,armada-cp110-thermal']
   arch/arm64/boot/dts/marvell/ac5x-rd-carrier-cn9131.dtb: usb@510000: Unevaluated properties are not allowed ('dma-coherent', 'dr_mode' were unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/generic-xhci.yaml#
>> arch/arm64/boot/dts/marvell/ac5x-rd-carrier-cn9131.dtb: /cp1-bus/bus@f4000000/spi@700600: failed to match any schema with compatible: ['marvell,armada-380-spi']
   arch/arm64/boot/dts/marvell/ac5x-rd-carrier-cn9131.dtb: /cp1-bus/bus@f4000000/spi@700680: failed to match any schema with compatible: ['marvell,armada-380-spi']
   arch/arm64/boot/dts/marvell/ac5x-rd-carrier-cn9131.dtb: crypto@800000: 'dma-coherent' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/crypto/inside-secure,safexcel.yaml#
>> arch/arm64/boot/dts/marvell/ac5x-rd-carrier-cn9131.dtb: /cp1-bus/pcie@f4600000: failed to match any schema with compatible: ['marvell,armada8k-pcie', 'snps,dw-pcie']
>> arch/arm64/boot/dts/marvell/ac5x-rd-carrier-cn9131.dtb: /cp1-bus/pcie@f4620000: failed to match any schema with compatible: ['marvell,armada8k-pcie', 'snps,dw-pcie']
>> arch/arm64/boot/dts/marvell/ac5x-rd-carrier-cn9131.dtb: /cp1-bus/pcie@f4640000: failed to match any schema with compatible: ['marvell,armada8k-pcie', 'snps,dw-pcie']
--
   arch/arm64/boot/dts/marvell/armada-ap80x.dtsi:282.24-292.7: Warning (unit_address_vs_reg): /soc/bus@f0000000/system-controller@6f4000/gpio@1040: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/marvell/armada-cp11x.dtsi:235.24-254.6: Warning (unit_address_vs_reg): /cp0-bus/bus@f2000000/system-controller@440000/gpio@100: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/marvell/armada-cp11x.dtsi:256.24-275.6: Warning (unit_address_vs_reg): /cp0-bus/bus@f2000000/system-controller@440000/gpio@140: node has a unit name, but no reg or ranges property
>> arch/arm64/boot/dts/marvell/cn9130-cf-base.dtb: /soc/bus@f0000000/odmi@300000: failed to match any schema with compatible: ['marvell,odmi-controller']
>> arch/arm64/boot/dts/marvell/cn9130-cf-base.dtb: /soc/bus@f0000000/gicp@3f0040: failed to match any schema with compatible: ['marvell,ap806-gicp']
>> arch/arm64/boot/dts/marvell/cn9130-cf-base.dtb: /soc/bus@f0000000/interrupt-controller@3f0100: failed to match any schema with compatible: ['marvell,armada-8k-pic']
>> arch/arm64/boot/dts/marvell/cn9130-cf-base.dtb: /soc/bus@f0000000/interrupt-controller@3f0200: failed to match any schema with compatible: ['marvell,ap806-sei']
>> arch/arm64/boot/dts/marvell/cn9130-cf-base.dtb: /soc/bus@f0000000/spi@510600: failed to match any schema with compatible: ['marvell,armada-380-spi']
   arch/arm64/boot/dts/marvell/cn9130-cf-base.dtb: mmc@6e0000: clocks: [[4, 4]] is too short
   	from schema $id: http://devicetree.org/schemas/mmc/marvell,xenon-sdhci.yaml#
   arch/arm64/boot/dts/marvell/cn9130-cf-base.dtb: mmc@6e0000: clock-names: ['core'] is too short
   	from schema $id: http://devicetree.org/schemas/mmc/marvell,xenon-sdhci.yaml#
   arch/arm64/boot/dts/marvell/cn9130-cf-base.dtb: system-controller@6f4000: compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
>> arch/arm64/boot/dts/marvell/cn9130-cf-base.dtb: /soc/bus@f0000000/system-controller@6f4000/pinctrl: failed to match any schema with compatible: ['marvell,ap806-pinctrl']
   arch/arm64/boot/dts/marvell/cn9130-cf-base.dtb: gpio@1040: Unevaluated properties are not allowed ('gpio-ranges' was unexpected)
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-mvebu.yaml#
>> arch/arm64/boot/dts/marvell/cn9130-cf-base.dtb: /soc/bus@f0000000/system-controller@6f4000/clock: failed to match any schema with compatible: ['marvell,ap807-clock']
   arch/arm64/boot/dts/marvell/cn9130-cf-base.dtb: system-controller@6f8000: compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
>> arch/arm64/boot/dts/marvell/cn9130-cf-base.dtb: /soc/bus@f0000000/system-controller@6f8000/thermal-sensor@80: failed to match any schema with compatible: ['marvell,armada-ap807-thermal']
>> arch/arm64/boot/dts/marvell/cn9130-cf-base.dtb: /soc/bus@f0000000/system-controller@6f8000/clock-cpu: failed to match any schema with compatible: ['marvell,ap807-cpu-clock']
>> arch/arm64/boot/dts/marvell/cn9130-cf-base.dtb: /cp0-bus/bus@f2000000/phy@120000: failed to match any schema with compatible: ['marvell,comphy-cp110']
>> arch/arm64/boot/dts/marvell/cn9130-cf-base.dtb: /cp0-bus/bus@f2000000/interrupt-controller@1e0000: failed to match any schema with compatible: ['marvell,cp110-icu']
>> arch/arm64/boot/dts/marvell/cn9130-cf-base.dtb: /cp0-bus/bus@f2000000/interrupt-controller@1e0000/interrupt-controller@10: failed to match any schema with compatible: ['marvell,cp110-icu-nsr']
>> arch/arm64/boot/dts/marvell/cn9130-cf-base.dtb: /cp0-bus/bus@f2000000/interrupt-controller@1e0000/interrupt-controller@50: failed to match any schema with compatible: ['marvell,cp110-icu-sei']
   arch/arm64/boot/dts/marvell/cn9130-cf-base.dtb: system-controller@440000: compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
>> arch/arm64/boot/dts/marvell/cn9130-cf-base.dtb: /cp0-bus/bus@f2000000/system-controller@440000/clock: failed to match any schema with compatible: ['marvell,cp110-clock']
   arch/arm64/boot/dts/marvell/cn9130-cf-base.dtb: gpio@100: Unevaluated properties are not allowed ('gpio-ranges', 'sim-select-hog' were unexpected)
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-mvebu.yaml#
   arch/arm64/boot/dts/marvell/cn9130-cf-base.dtb: gpio@140: Unevaluated properties are not allowed ('gpio-ranges' was unexpected)
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-mvebu.yaml#
>> arch/arm64/boot/dts/marvell/cn9130-cf-base.dtb: /cp0-bus/bus@f2000000/system-controller@440000/pinctrl: failed to match any schema with compatible: ['marvell,cp115-standalone-pinctrl']
   arch/arm64/boot/dts/marvell/cn9130-cf-base.dtb: system-controller@400000: compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
>> arch/arm64/boot/dts/marvell/cn9130-cf-base.dtb: /cp0-bus/bus@f2000000/system-controller@400000/thermal-sensor@70: failed to match any schema with compatible: ['marvell,armada-cp110-thermal']
   arch/arm64/boot/dts/marvell/cn9130-cf-base.dtb: usb@500000: Unevaluated properties are not allowed ('dma-coherent', 'dr_mode', 'vbus-supply' were unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/generic-xhci.yaml#
   arch/arm64/boot/dts/marvell/cn9130-cf-base.dtb: usb@510000: Unevaluated properties are not allowed ('dma-coherent', 'dr_mode' were unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/generic-xhci.yaml#
>> arch/arm64/boot/dts/marvell/cn9130-cf-base.dtb: /cp0-bus/bus@f2000000/spi@700600: failed to match any schema with compatible: ['marvell,armada-380-spi']
   arch/arm64/boot/dts/marvell/cn9130-cf-base.dtb: /cp0-bus/bus@f2000000/spi@700680: failed to match any schema with compatible: ['marvell,armada-380-spi']
   arch/arm64/boot/dts/marvell/cn9130-cf-base.dtb: crypto@800000: 'dma-coherent' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/crypto/inside-secure,safexcel.yaml#
>> arch/arm64/boot/dts/marvell/cn9130-cf-base.dtb: /cp0-bus/pcie@f2600000: failed to match any schema with compatible: ['marvell,armada8k-pcie', 'snps,dw-pcie']
>> arch/arm64/boot/dts/marvell/cn9130-cf-base.dtb: /cp0-bus/pcie@f2620000: failed to match any schema with compatible: ['marvell,armada8k-pcie', 'snps,dw-pcie']
>> arch/arm64/boot/dts/marvell/cn9130-cf-base.dtb: /cp0-bus/pcie@f2640000: failed to match any schema with compatible: ['marvell,armada8k-pcie', 'snps,dw-pcie']
--
   arch/arm64/boot/dts/marvell/armada-ap80x.dtsi:282.24-292.7: Warning (unit_address_vs_reg): /soc/bus@f0000000/system-controller@6f4000/gpio@1040: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/marvell/armada-cp11x.dtsi:235.24-254.6: Warning (unit_address_vs_reg): /cp0-bus/bus@f2000000/system-controller@440000/gpio@100: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/marvell/armada-cp11x.dtsi:256.24-275.6: Warning (unit_address_vs_reg): /cp0-bus/bus@f2000000/system-controller@440000/gpio@140: node has a unit name, but no reg or ranges property
>> arch/arm64/boot/dts/marvell/cn9130-cf-pro.dtb: /soc/bus@f0000000/odmi@300000: failed to match any schema with compatible: ['marvell,odmi-controller']
>> arch/arm64/boot/dts/marvell/cn9130-cf-pro.dtb: /soc/bus@f0000000/gicp@3f0040: failed to match any schema with compatible: ['marvell,ap806-gicp']
>> arch/arm64/boot/dts/marvell/cn9130-cf-pro.dtb: /soc/bus@f0000000/interrupt-controller@3f0100: failed to match any schema with compatible: ['marvell,armada-8k-pic']
>> arch/arm64/boot/dts/marvell/cn9130-cf-pro.dtb: /soc/bus@f0000000/interrupt-controller@3f0200: failed to match any schema with compatible: ['marvell,ap806-sei']
>> arch/arm64/boot/dts/marvell/cn9130-cf-pro.dtb: /soc/bus@f0000000/spi@510600: failed to match any schema with compatible: ['marvell,armada-380-spi']
   arch/arm64/boot/dts/marvell/cn9130-cf-pro.dtb: mmc@6e0000: clocks: [[4, 4]] is too short
   	from schema $id: http://devicetree.org/schemas/mmc/marvell,xenon-sdhci.yaml#
   arch/arm64/boot/dts/marvell/cn9130-cf-pro.dtb: mmc@6e0000: clock-names: ['core'] is too short
   	from schema $id: http://devicetree.org/schemas/mmc/marvell,xenon-sdhci.yaml#
   arch/arm64/boot/dts/marvell/cn9130-cf-pro.dtb: system-controller@6f4000: compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
>> arch/arm64/boot/dts/marvell/cn9130-cf-pro.dtb: /soc/bus@f0000000/system-controller@6f4000/pinctrl: failed to match any schema with compatible: ['marvell,ap806-pinctrl']
   arch/arm64/boot/dts/marvell/cn9130-cf-pro.dtb: gpio@1040: Unevaluated properties are not allowed ('gpio-ranges' was unexpected)
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-mvebu.yaml#
>> arch/arm64/boot/dts/marvell/cn9130-cf-pro.dtb: /soc/bus@f0000000/system-controller@6f4000/clock: failed to match any schema with compatible: ['marvell,ap807-clock']
   arch/arm64/boot/dts/marvell/cn9130-cf-pro.dtb: system-controller@6f8000: compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
>> arch/arm64/boot/dts/marvell/cn9130-cf-pro.dtb: /soc/bus@f0000000/system-controller@6f8000/thermal-sensor@80: failed to match any schema with compatible: ['marvell,armada-ap807-thermal']
>> arch/arm64/boot/dts/marvell/cn9130-cf-pro.dtb: /soc/bus@f0000000/system-controller@6f8000/clock-cpu: failed to match any schema with compatible: ['marvell,ap807-cpu-clock']
>> arch/arm64/boot/dts/marvell/cn9130-cf-pro.dtb: /cp0-bus/bus@f2000000/phy@120000: failed to match any schema with compatible: ['marvell,comphy-cp110']
>> arch/arm64/boot/dts/marvell/cn9130-cf-pro.dtb: /cp0-bus/bus@f2000000/interrupt-controller@1e0000: failed to match any schema with compatible: ['marvell,cp110-icu']
>> arch/arm64/boot/dts/marvell/cn9130-cf-pro.dtb: /cp0-bus/bus@f2000000/interrupt-controller@1e0000/interrupt-controller@10: failed to match any schema with compatible: ['marvell,cp110-icu-nsr']
>> arch/arm64/boot/dts/marvell/cn9130-cf-pro.dtb: /cp0-bus/bus@f2000000/interrupt-controller@1e0000/interrupt-controller@50: failed to match any schema with compatible: ['marvell,cp110-icu-sei']
   arch/arm64/boot/dts/marvell/cn9130-cf-pro.dtb: system-controller@440000: compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
>> arch/arm64/boot/dts/marvell/cn9130-cf-pro.dtb: /cp0-bus/bus@f2000000/system-controller@440000/clock: failed to match any schema with compatible: ['marvell,cp110-clock']
   arch/arm64/boot/dts/marvell/cn9130-cf-pro.dtb: gpio@100: Unevaluated properties are not allowed ('gpio-ranges' was unexpected)
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-mvebu.yaml#
   arch/arm64/boot/dts/marvell/cn9130-cf-pro.dtb: gpio@140: Unevaluated properties are not allowed ('gpio-ranges' was unexpected)
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-mvebu.yaml#
>> arch/arm64/boot/dts/marvell/cn9130-cf-pro.dtb: /cp0-bus/bus@f2000000/system-controller@440000/pinctrl: failed to match any schema with compatible: ['marvell,cp115-standalone-pinctrl']
   arch/arm64/boot/dts/marvell/cn9130-cf-pro.dtb: system-controller@400000: compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
>> arch/arm64/boot/dts/marvell/cn9130-cf-pro.dtb: /cp0-bus/bus@f2000000/system-controller@400000/thermal-sensor@70: failed to match any schema with compatible: ['marvell,armada-cp110-thermal']
   arch/arm64/boot/dts/marvell/cn9130-cf-pro.dtb: usb@500000: Unevaluated properties are not allowed ('dma-coherent', 'dr_mode', 'vbus-supply' were unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/generic-xhci.yaml#
   arch/arm64/boot/dts/marvell/cn9130-cf-pro.dtb: usb@510000: Unevaluated properties are not allowed ('dma-coherent', 'dr_mode' were unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/generic-xhci.yaml#
>> arch/arm64/boot/dts/marvell/cn9130-cf-pro.dtb: /cp0-bus/bus@f2000000/spi@700600: failed to match any schema with compatible: ['marvell,armada-380-spi']
   arch/arm64/boot/dts/marvell/cn9130-cf-pro.dtb: /cp0-bus/bus@f2000000/spi@700680: failed to match any schema with compatible: ['marvell,armada-380-spi']
   arch/arm64/boot/dts/marvell/cn9130-cf-pro.dtb: crypto@800000: 'dma-coherent' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/crypto/inside-secure,safexcel.yaml#
>> arch/arm64/boot/dts/marvell/cn9130-cf-pro.dtb: /cp0-bus/pcie@f2600000: failed to match any schema with compatible: ['marvell,armada8k-pcie', 'snps,dw-pcie']
>> arch/arm64/boot/dts/marvell/cn9130-cf-pro.dtb: /cp0-bus/pcie@f2620000: failed to match any schema with compatible: ['marvell,armada8k-pcie', 'snps,dw-pcie']
>> arch/arm64/boot/dts/marvell/cn9130-cf-pro.dtb: /cp0-bus/pcie@f2640000: failed to match any schema with compatible: ['marvell,armada8k-pcie', 'snps,dw-pcie']
--
   arch/arm64/boot/dts/marvell/armada-ap80x.dtsi:282.24-292.7: Warning (unit_address_vs_reg): /soc/bus@f0000000/system-controller@6f4000/gpio@1040: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/marvell/armada-cp11x.dtsi:235.24-254.6: Warning (unit_address_vs_reg): /cp0-bus/bus@f2000000/system-controller@440000/gpio@100: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/marvell/armada-cp11x.dtsi:256.24-275.6: Warning (unit_address_vs_reg): /cp0-bus/bus@f2000000/system-controller@440000/gpio@140: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/marvell/armada-cp11x.dtsi:235.24-254.6: Warning (unit_address_vs_reg): /cp1-bus/bus@f4000000/system-controller@440000/gpio@100: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/marvell/armada-cp11x.dtsi:256.24-275.6: Warning (unit_address_vs_reg): /cp1-bus/bus@f4000000/system-controller@440000/gpio@140: node has a unit name, but no reg or ranges property
>> arch/arm64/boot/dts/marvell/cn9131-cf-solidwan.dtb: /soc/bus@f0000000/odmi@300000: failed to match any schema with compatible: ['marvell,odmi-controller']
>> arch/arm64/boot/dts/marvell/cn9131-cf-solidwan.dtb: /soc/bus@f0000000/gicp@3f0040: failed to match any schema with compatible: ['marvell,ap806-gicp']
>> arch/arm64/boot/dts/marvell/cn9131-cf-solidwan.dtb: /soc/bus@f0000000/interrupt-controller@3f0100: failed to match any schema with compatible: ['marvell,armada-8k-pic']
>> arch/arm64/boot/dts/marvell/cn9131-cf-solidwan.dtb: /soc/bus@f0000000/interrupt-controller@3f0200: failed to match any schema with compatible: ['marvell,ap806-sei']
>> arch/arm64/boot/dts/marvell/cn9131-cf-solidwan.dtb: /soc/bus@f0000000/spi@510600: failed to match any schema with compatible: ['marvell,armada-380-spi']
   arch/arm64/boot/dts/marvell/cn9131-cf-solidwan.dtb: mmc@6e0000: clocks: [[4, 4]] is too short
   	from schema $id: http://devicetree.org/schemas/mmc/marvell,xenon-sdhci.yaml#
   arch/arm64/boot/dts/marvell/cn9131-cf-solidwan.dtb: mmc@6e0000: clock-names: ['core'] is too short
   	from schema $id: http://devicetree.org/schemas/mmc/marvell,xenon-sdhci.yaml#
   arch/arm64/boot/dts/marvell/cn9131-cf-solidwan.dtb: system-controller@6f4000: compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
>> arch/arm64/boot/dts/marvell/cn9131-cf-solidwan.dtb: /soc/bus@f0000000/system-controller@6f4000/pinctrl: failed to match any schema with compatible: ['marvell,ap806-pinctrl']
   arch/arm64/boot/dts/marvell/cn9131-cf-solidwan.dtb: gpio@1040: Unevaluated properties are not allowed ('gpio-ranges' was unexpected)
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-mvebu.yaml#
>> arch/arm64/boot/dts/marvell/cn9131-cf-solidwan.dtb: /soc/bus@f0000000/system-controller@6f4000/clock: failed to match any schema with compatible: ['marvell,ap807-clock']
   arch/arm64/boot/dts/marvell/cn9131-cf-solidwan.dtb: system-controller@6f8000: compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
>> arch/arm64/boot/dts/marvell/cn9131-cf-solidwan.dtb: /soc/bus@f0000000/system-controller@6f8000/thermal-sensor@80: failed to match any schema with compatible: ['marvell,armada-ap807-thermal']
>> arch/arm64/boot/dts/marvell/cn9131-cf-solidwan.dtb: /soc/bus@f0000000/system-controller@6f8000/clock-cpu: failed to match any schema with compatible: ['marvell,ap807-cpu-clock']
>> arch/arm64/boot/dts/marvell/cn9131-cf-solidwan.dtb: /cp0-bus/bus@f2000000/phy@120000: failed to match any schema with compatible: ['marvell,comphy-cp110']
>> arch/arm64/boot/dts/marvell/cn9131-cf-solidwan.dtb: /cp0-bus/bus@f2000000/interrupt-controller@1e0000: failed to match any schema with compatible: ['marvell,cp110-icu']
>> arch/arm64/boot/dts/marvell/cn9131-cf-solidwan.dtb: /cp0-bus/bus@f2000000/interrupt-controller@1e0000/interrupt-controller@10: failed to match any schema with compatible: ['marvell,cp110-icu-nsr']
>> arch/arm64/boot/dts/marvell/cn9131-cf-solidwan.dtb: /cp0-bus/bus@f2000000/interrupt-controller@1e0000/interrupt-controller@50: failed to match any schema with compatible: ['marvell,cp110-icu-sei']
   arch/arm64/boot/dts/marvell/cn9131-cf-solidwan.dtb: system-controller@440000: compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
>> arch/arm64/boot/dts/marvell/cn9131-cf-solidwan.dtb: /cp0-bus/bus@f2000000/system-controller@440000/clock: failed to match any schema with compatible: ['marvell,cp110-clock']
   arch/arm64/boot/dts/marvell/cn9131-cf-solidwan.dtb: gpio@100: Unevaluated properties are not allowed ('gpio-ranges', 'm2-full-card-power-off-hog', 'pcie0-0-w-disable-hog' were unexpected)
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-mvebu.yaml#
   arch/arm64/boot/dts/marvell/cn9131-cf-solidwan.dtb: gpio@140: Unevaluated properties are not allowed ('gpio-ranges' was unexpected)
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-mvebu.yaml#
>> arch/arm64/boot/dts/marvell/cn9131-cf-solidwan.dtb: /cp0-bus/bus@f2000000/system-controller@440000/pinctrl: failed to match any schema with compatible: ['marvell,cp115-standalone-pinctrl']
   arch/arm64/boot/dts/marvell/cn9131-cf-solidwan.dtb: system-controller@400000: compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
>> arch/arm64/boot/dts/marvell/cn9131-cf-solidwan.dtb: /cp0-bus/bus@f2000000/system-controller@400000/thermal-sensor@70: failed to match any schema with compatible: ['marvell,armada-cp110-thermal']
   arch/arm64/boot/dts/marvell/cn9131-cf-solidwan.dtb: usb@500000: Unevaluated properties are not allowed ('dma-coherent', 'dr_mode' were unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/generic-xhci.yaml#
   arch/arm64/boot/dts/marvell/cn9131-cf-solidwan.dtb: usb@510000: Unevaluated properties are not allowed ('dma-coherent', 'dr_mode' were unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/generic-xhci.yaml#
>> arch/arm64/boot/dts/marvell/cn9131-cf-solidwan.dtb: /cp0-bus/bus@f2000000/spi@700600: failed to match any schema with compatible: ['marvell,armada-380-spi']
   arch/arm64/boot/dts/marvell/cn9131-cf-solidwan.dtb: /cp0-bus/bus@f2000000/spi@700680: failed to match any schema with compatible: ['marvell,armada-380-spi']
   arch/arm64/boot/dts/marvell/cn9131-cf-solidwan.dtb: gpio@41: 'gpio-controller' is a required property
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-pca95xx.yaml#
   arch/arm64/boot/dts/marvell/cn9131-cf-solidwan.dtb: gpio@41: '#gpio-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-pca95xx.yaml#
   arch/arm64/boot/dts/marvell/cn9131-cf-solidwan.dtb: rtc@68: Unevaluated properties are not allowed ('reset-gpios' was unexpected)
   	from schema $id: http://devicetree.org/schemas/rtc/st,m41t80.yaml#
   arch/arm64/boot/dts/marvell/cn9131-cf-solidwan.dtb: crypto@800000: 'dma-coherent' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/crypto/inside-secure,safexcel.yaml#
>> arch/arm64/boot/dts/marvell/cn9131-cf-solidwan.dtb: /cp0-bus/pcie@f2600000: failed to match any schema with compatible: ['marvell,armada8k-pcie', 'snps,dw-pcie']
>> arch/arm64/boot/dts/marvell/cn9131-cf-solidwan.dtb: /cp0-bus/pcie@f2620000: failed to match any schema with compatible: ['marvell,armada8k-pcie', 'snps,dw-pcie']
>> arch/arm64/boot/dts/marvell/cn9131-cf-solidwan.dtb: /cp0-bus/pcie@f2640000: failed to match any schema with compatible: ['marvell,armada8k-pcie', 'snps,dw-pcie']
>> arch/arm64/boot/dts/marvell/cn9131-cf-solidwan.dtb: /cp1-bus/bus@f4000000/phy@120000: failed to match any schema with compatible: ['marvell,comphy-cp110']
>> arch/arm64/boot/dts/marvell/cn9131-cf-solidwan.dtb: /cp1-bus/bus@f4000000/interrupt-controller@1e0000: failed to match any schema with compatible: ['marvell,cp110-icu']
>> arch/arm64/boot/dts/marvell/cn9131-cf-solidwan.dtb: /cp1-bus/bus@f4000000/interrupt-controller@1e0000/interrupt-controller@10: failed to match any schema with compatible: ['marvell,cp110-icu-nsr']
>> arch/arm64/boot/dts/marvell/cn9131-cf-solidwan.dtb: /cp1-bus/bus@f4000000/interrupt-controller@1e0000/interrupt-controller@50: failed to match any schema with compatible: ['marvell,cp110-icu-sei']
   arch/arm64/boot/dts/marvell/cn9131-cf-solidwan.dtb: system-controller@440000: compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
>> arch/arm64/boot/dts/marvell/cn9131-cf-solidwan.dtb: /cp1-bus/bus@f4000000/system-controller@440000/clock: failed to match any schema with compatible: ['marvell,cp110-clock']
   arch/arm64/boot/dts/marvell/cn9131-cf-solidwan.dtb: gpio@100: Unevaluated properties are not allowed ('gpio-ranges', 'm2-full-card-power-off-hog-0', 'm2-full-card-power-off-hog-1' were unexpected)
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-mvebu.yaml#
   arch/arm64/boot/dts/marvell/cn9131-cf-solidwan.dtb: gpio@140: Unevaluated properties are not allowed ('gpio-ranges' was unexpected)
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-mvebu.yaml#
>> arch/arm64/boot/dts/marvell/cn9131-cf-solidwan.dtb: /cp1-bus/bus@f4000000/system-controller@440000/pinctrl: failed to match any schema with compatible: ['marvell,cp115-standalone-pinctrl']
   arch/arm64/boot/dts/marvell/cn9131-cf-solidwan.dtb: system-controller@400000: compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
>> arch/arm64/boot/dts/marvell/cn9131-cf-solidwan.dtb: /cp1-bus/bus@f4000000/system-controller@400000/thermal-sensor@70: failed to match any schema with compatible: ['marvell,armada-cp110-thermal']
   arch/arm64/boot/dts/marvell/cn9131-cf-solidwan.dtb: usb@500000: Unevaluated properties are not allowed ('dma-coherent', 'dr_mode' were unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/generic-xhci.yaml#
   arch/arm64/boot/dts/marvell/cn9131-cf-solidwan.dtb: usb@510000: Unevaluated properties are not allowed ('dma-coherent', 'dr_mode' were unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/generic-xhci.yaml#
>> arch/arm64/boot/dts/marvell/cn9131-cf-solidwan.dtb: /cp1-bus/bus@f4000000/spi@700600: failed to match any schema with compatible: ['marvell,armada-380-spi']
   arch/arm64/boot/dts/marvell/cn9131-cf-solidwan.dtb: /cp1-bus/bus@f4000000/spi@700680: failed to match any schema with compatible: ['marvell,armada-380-spi']
   arch/arm64/boot/dts/marvell/cn9131-cf-solidwan.dtb: crypto@800000: 'dma-coherent' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/crypto/inside-secure,safexcel.yaml#
>> arch/arm64/boot/dts/marvell/cn9131-cf-solidwan.dtb: /cp1-bus/pcie@f4600000: failed to match any schema with compatible: ['marvell,armada8k-pcie', 'snps,dw-pcie']
>> arch/arm64/boot/dts/marvell/cn9131-cf-solidwan.dtb: /cp1-bus/pcie@f4620000: failed to match any schema with compatible: ['marvell,armada8k-pcie', 'snps,dw-pcie']
>> arch/arm64/boot/dts/marvell/cn9131-cf-solidwan.dtb: /cp1-bus/pcie@f4640000: failed to match any schema with compatible: ['marvell,armada8k-pcie', 'snps,dw-pcie']
--
   arch/arm64/boot/dts/marvell/armada-cp11x.dtsi:235.24-254.6: Warning (unit_address_vs_reg): /cp1-bus/bus@f4000000/system-controller@440000/gpio@100: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/marvell/armada-cp11x.dtsi:256.24-275.6: Warning (unit_address_vs_reg): /cp1-bus/bus@f4000000/system-controller@440000/gpio@140: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/marvell/armada-cp11x.dtsi:235.24-254.6: Warning (unit_address_vs_reg): /cp2-bus/bus@f6000000/system-controller@440000/gpio@100: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/marvell/armada-cp11x.dtsi:256.24-275.6: Warning (unit_address_vs_reg): /cp2-bus/bus@f6000000/system-controller@440000/gpio@140: node has a unit name, but no reg or ranges property
>> arch/arm64/boot/dts/marvell/cn9132-clearfog.dtb: /soc/bus@f0000000/odmi@300000: failed to match any schema with compatible: ['marvell,odmi-controller']
>> arch/arm64/boot/dts/marvell/cn9132-clearfog.dtb: /soc/bus@f0000000/gicp@3f0040: failed to match any schema with compatible: ['marvell,ap806-gicp']
>> arch/arm64/boot/dts/marvell/cn9132-clearfog.dtb: /soc/bus@f0000000/interrupt-controller@3f0100: failed to match any schema with compatible: ['marvell,armada-8k-pic']
>> arch/arm64/boot/dts/marvell/cn9132-clearfog.dtb: /soc/bus@f0000000/interrupt-controller@3f0200: failed to match any schema with compatible: ['marvell,ap806-sei']
>> arch/arm64/boot/dts/marvell/cn9132-clearfog.dtb: /soc/bus@f0000000/spi@510600: failed to match any schema with compatible: ['marvell,armada-380-spi']
   arch/arm64/boot/dts/marvell/cn9132-clearfog.dtb: mmc@6e0000: clocks: [[4, 4]] is too short
   	from schema $id: http://devicetree.org/schemas/mmc/marvell,xenon-sdhci.yaml#
   arch/arm64/boot/dts/marvell/cn9132-clearfog.dtb: mmc@6e0000: clock-names: ['core'] is too short
   	from schema $id: http://devicetree.org/schemas/mmc/marvell,xenon-sdhci.yaml#
   arch/arm64/boot/dts/marvell/cn9132-clearfog.dtb: system-controller@6f4000: compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
>> arch/arm64/boot/dts/marvell/cn9132-clearfog.dtb: /soc/bus@f0000000/system-controller@6f4000/pinctrl: failed to match any schema with compatible: ['marvell,ap806-pinctrl']
   arch/arm64/boot/dts/marvell/cn9132-clearfog.dtb: gpio@1040: Unevaluated properties are not allowed ('gpio-ranges' was unexpected)
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-mvebu.yaml#
>> arch/arm64/boot/dts/marvell/cn9132-clearfog.dtb: /soc/bus@f0000000/system-controller@6f4000/clock: failed to match any schema with compatible: ['marvell,ap807-clock']
   arch/arm64/boot/dts/marvell/cn9132-clearfog.dtb: system-controller@6f8000: compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
>> arch/arm64/boot/dts/marvell/cn9132-clearfog.dtb: /soc/bus@f0000000/system-controller@6f8000/thermal-sensor@80: failed to match any schema with compatible: ['marvell,armada-ap807-thermal']
>> arch/arm64/boot/dts/marvell/cn9132-clearfog.dtb: /soc/bus@f0000000/system-controller@6f8000/clock-cpu: failed to match any schema with compatible: ['marvell,ap807-cpu-clock']
>> arch/arm64/boot/dts/marvell/cn9132-clearfog.dtb: /cp0-bus/bus@f2000000/phy@120000: failed to match any schema with compatible: ['marvell,comphy-cp110']
>> arch/arm64/boot/dts/marvell/cn9132-clearfog.dtb: /cp0-bus/bus@f2000000/interrupt-controller@1e0000: failed to match any schema with compatible: ['marvell,cp110-icu']
>> arch/arm64/boot/dts/marvell/cn9132-clearfog.dtb: /cp0-bus/bus@f2000000/interrupt-controller@1e0000/interrupt-controller@10: failed to match any schema with compatible: ['marvell,cp110-icu-nsr']
>> arch/arm64/boot/dts/marvell/cn9132-clearfog.dtb: /cp0-bus/bus@f2000000/interrupt-controller@1e0000/interrupt-controller@50: failed to match any schema with compatible: ['marvell,cp110-icu-sei']
   arch/arm64/boot/dts/marvell/cn9132-clearfog.dtb: system-controller@440000: compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
>> arch/arm64/boot/dts/marvell/cn9132-clearfog.dtb: /cp0-bus/bus@f2000000/system-controller@440000/clock: failed to match any schema with compatible: ['marvell,cp110-clock']
   arch/arm64/boot/dts/marvell/cn9132-clearfog.dtb: gpio@100: Unevaluated properties are not allowed ('gpio-ranges', 'pwm-tacho-irq-hog' were unexpected)
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-mvebu.yaml#
   arch/arm64/boot/dts/marvell/cn9132-clearfog.dtb: gpio@140: Unevaluated properties are not allowed ('gpio-ranges' was unexpected)
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-mvebu.yaml#
>> arch/arm64/boot/dts/marvell/cn9132-clearfog.dtb: /cp0-bus/bus@f2000000/system-controller@440000/pinctrl: failed to match any schema with compatible: ['marvell,cp115-standalone-pinctrl']
   arch/arm64/boot/dts/marvell/cn9132-clearfog.dtb: system-controller@400000: compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
>> arch/arm64/boot/dts/marvell/cn9132-clearfog.dtb: /cp0-bus/bus@f2000000/system-controller@400000/thermal-sensor@70: failed to match any schema with compatible: ['marvell,armada-cp110-thermal']
   arch/arm64/boot/dts/marvell/cn9132-clearfog.dtb: usb@500000: Unevaluated properties are not allowed ('dma-coherent', 'dr_mode' were unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/generic-xhci.yaml#
   arch/arm64/boot/dts/marvell/cn9132-clearfog.dtb: usb@510000: Unevaluated properties are not allowed ('dma-coherent', 'dr_mode' were unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/generic-xhci.yaml#
>> arch/arm64/boot/dts/marvell/cn9132-clearfog.dtb: /cp0-bus/bus@f2000000/spi@700600: failed to match any schema with compatible: ['marvell,armada-380-spi']
   arch/arm64/boot/dts/marvell/cn9132-clearfog.dtb: /cp0-bus/bus@f2000000/spi@700680: failed to match any schema with compatible: ['marvell,armada-380-spi']
   arch/arm64/boot/dts/marvell/cn9132-clearfog.dtb: crypto@800000: 'dma-coherent' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/crypto/inside-secure,safexcel.yaml#
>> arch/arm64/boot/dts/marvell/cn9132-clearfog.dtb: /cp0-bus/pcie@f2600000: failed to match any schema with compatible: ['marvell,armada8k-pcie', 'snps,dw-pcie']
>> arch/arm64/boot/dts/marvell/cn9132-clearfog.dtb: /cp0-bus/pcie@f2620000: failed to match any schema with compatible: ['marvell,armada8k-pcie', 'snps,dw-pcie']
>> arch/arm64/boot/dts/marvell/cn9132-clearfog.dtb: /cp0-bus/pcie@f2640000: failed to match any schema with compatible: ['marvell,armada8k-pcie', 'snps,dw-pcie']
>> arch/arm64/boot/dts/marvell/cn9132-clearfog.dtb: /cp1-bus/bus@f4000000/phy@120000: failed to match any schema with compatible: ['marvell,comphy-cp110']
>> arch/arm64/boot/dts/marvell/cn9132-clearfog.dtb: /cp1-bus/bus@f4000000/interrupt-controller@1e0000: failed to match any schema with compatible: ['marvell,cp110-icu']
>> arch/arm64/boot/dts/marvell/cn9132-clearfog.dtb: /cp1-bus/bus@f4000000/interrupt-controller@1e0000/interrupt-controller@10: failed to match any schema with compatible: ['marvell,cp110-icu-nsr']
>> arch/arm64/boot/dts/marvell/cn9132-clearfog.dtb: /cp1-bus/bus@f4000000/interrupt-controller@1e0000/interrupt-controller@50: failed to match any schema with compatible: ['marvell,cp110-icu-sei']
   arch/arm64/boot/dts/marvell/cn9132-clearfog.dtb: system-controller@440000: compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
>> arch/arm64/boot/dts/marvell/cn9132-clearfog.dtb: /cp1-bus/bus@f4000000/system-controller@440000/clock: failed to match any schema with compatible: ['marvell,cp110-clock']
   arch/arm64/boot/dts/marvell/cn9132-clearfog.dtb: gpio@100: Unevaluated properties are not allowed ('gpio-ranges' was unexpected)
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-mvebu.yaml#
   arch/arm64/boot/dts/marvell/cn9132-clearfog.dtb: gpio@140: Unevaluated properties are not allowed ('gpio-ranges' was unexpected)
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-mvebu.yaml#
>> arch/arm64/boot/dts/marvell/cn9132-clearfog.dtb: /cp1-bus/bus@f4000000/system-controller@440000/pinctrl: failed to match any schema with compatible: ['marvell,cp115-standalone-pinctrl']
   arch/arm64/boot/dts/marvell/cn9132-clearfog.dtb: system-controller@400000: compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
>> arch/arm64/boot/dts/marvell/cn9132-clearfog.dtb: /cp1-bus/bus@f4000000/system-controller@400000/thermal-sensor@70: failed to match any schema with compatible: ['marvell,armada-cp110-thermal']
   arch/arm64/boot/dts/marvell/cn9132-clearfog.dtb: usb@500000: Unevaluated properties are not allowed ('dma-coherent', 'dr_mode' were unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/generic-xhci.yaml#
>> arch/arm64/boot/dts/marvell/cn9132-clearfog.dtb: /cp1-bus/bus@f4000000/spi@700600: failed to match any schema with compatible: ['marvell,armada-380-spi']
   arch/arm64/boot/dts/marvell/cn9132-clearfog.dtb: /cp1-bus/bus@f4000000/spi@700680: failed to match any schema with compatible: ['marvell,armada-380-spi']
   arch/arm64/boot/dts/marvell/cn9132-clearfog.dtb: crypto@800000: 'dma-coherent' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/crypto/inside-secure,safexcel.yaml#
>> arch/arm64/boot/dts/marvell/cn9132-clearfog.dtb: /cp1-bus/pcie@f4600000: failed to match any schema with compatible: ['marvell,armada8k-pcie', 'snps,dw-pcie']
>> arch/arm64/boot/dts/marvell/cn9132-clearfog.dtb: /cp1-bus/pcie@f4620000: failed to match any schema with compatible: ['marvell,armada8k-pcie', 'snps,dw-pcie']
>> arch/arm64/boot/dts/marvell/cn9132-clearfog.dtb: /cp1-bus/pcie@f4640000: failed to match any schema with compatible: ['marvell,armada8k-pcie', 'snps,dw-pcie']
>> arch/arm64/boot/dts/marvell/cn9132-clearfog.dtb: /cp2-bus/bus@f6000000/phy@120000: failed to match any schema with compatible: ['marvell,comphy-cp110']
>> arch/arm64/boot/dts/marvell/cn9132-clearfog.dtb: /cp2-bus/bus@f6000000/interrupt-controller@1e0000: failed to match any schema with compatible: ['marvell,cp110-icu']
>> arch/arm64/boot/dts/marvell/cn9132-clearfog.dtb: /cp2-bus/bus@f6000000/interrupt-controller@1e0000/interrupt-controller@10: failed to match any schema with compatible: ['marvell,cp110-icu-nsr']
>> arch/arm64/boot/dts/marvell/cn9132-clearfog.dtb: /cp2-bus/bus@f6000000/interrupt-controller@1e0000/interrupt-controller@50: failed to match any schema with compatible: ['marvell,cp110-icu-sei']
   arch/arm64/boot/dts/marvell/cn9132-clearfog.dtb: system-controller@440000: compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
>> arch/arm64/boot/dts/marvell/cn9132-clearfog.dtb: /cp2-bus/bus@f6000000/system-controller@440000/clock: failed to match any schema with compatible: ['marvell,cp110-clock']
   arch/arm64/boot/dts/marvell/cn9132-clearfog.dtb: gpio@100: Unevaluated properties are not allowed ('gpio-ranges', 'm2-wwan-reset-hog' were unexpected)
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-mvebu.yaml#
   arch/arm64/boot/dts/marvell/cn9132-clearfog.dtb: gpio@140: Unevaluated properties are not allowed ('gpio-ranges' was unexpected)
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-mvebu.yaml#
>> arch/arm64/boot/dts/marvell/cn9132-clearfog.dtb: /cp2-bus/bus@f6000000/system-controller@440000/pinctrl: failed to match any schema with compatible: ['marvell,cp115-standalone-pinctrl']
   arch/arm64/boot/dts/marvell/cn9132-clearfog.dtb: system-controller@400000: compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
>> arch/arm64/boot/dts/marvell/cn9132-clearfog.dtb: /cp2-bus/bus@f6000000/system-controller@400000/thermal-sensor@70: failed to match any schema with compatible: ['marvell,armada-cp110-thermal']
   arch/arm64/boot/dts/marvell/cn9132-clearfog.dtb: usb@500000: Unevaluated properties are not allowed ('dma-coherent', 'dr_mode' were unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/generic-xhci.yaml#
>> arch/arm64/boot/dts/marvell/cn9132-clearfog.dtb: /cp2-bus/bus@f6000000/spi@700600: failed to match any schema with compatible: ['marvell,armada-380-spi']
   arch/arm64/boot/dts/marvell/cn9132-clearfog.dtb: /cp2-bus/bus@f6000000/spi@700680: failed to match any schema with compatible: ['marvell,armada-380-spi']
   arch/arm64/boot/dts/marvell/cn9132-clearfog.dtb: crypto@800000: 'dma-coherent' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/crypto/inside-secure,safexcel.yaml#
>> arch/arm64/boot/dts/marvell/cn9132-clearfog.dtb: /cp2-bus/pcie@f6600000: failed to match any schema with compatible: ['marvell,armada8k-pcie', 'snps,dw-pcie']
>> arch/arm64/boot/dts/marvell/cn9132-clearfog.dtb: /cp2-bus/pcie@f6620000: failed to match any schema with compatible: ['marvell,armada8k-pcie', 'snps,dw-pcie']
>> arch/arm64/boot/dts/marvell/cn9132-clearfog.dtb: /cp2-bus/pcie@f6640000: failed to match any schema with compatible: ['marvell,armada8k-pcie', 'snps,dw-pcie']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
