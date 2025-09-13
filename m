Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5B2717D2
	for <oe-kbuild@lists.linux.dev>; Sat, 13 Sep 2025 20:35:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757795722; cv=none; b=eZNsxSISiYsiPgmGvCB3VqxFhvNDQx8p52b2LjLxvhayoDwce9abjVHk5ebvwEJMp/gg1WI1Xqe4q6kEt8hFDW2xUpZCrNzG06OAs46l+0P0l56mimV5cc0vLJgB+MaaX4hwUEmriuVz+GbCdB0Y4fkeaPakiAj5R6n5wE7ZOls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757795722; c=relaxed/simple;
	bh=Xf+aG/IC5GlgSqkp0/LF4USbqg9SxDIkgDocm+4M/EM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jIbGkHVIfHnnX+LEX5kZI+vgKFy8uMb5zEflMrj9tt/r1JEnfEX7KbOKMvo5ssba1tBwVSxyNGVboX8PI0xKjw5DD+USsEiilY87YIVH+qrElUOchj7NLW8AwYoHXu1KMxbwE+ljRxP9JR0Qu8WgKfU7evGFQ4dz5eDf9QRVE9s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Xmdpjobd; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Xmdpjobd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757795721; x=1789331721;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=Xf+aG/IC5GlgSqkp0/LF4USbqg9SxDIkgDocm+4M/EM=;
  b=XmdpjobdyLx54DqKzopCNEUPhuEctSPvtvyqcb5AK0mC408pWGsQ3M2x
   FHSPHGOiow7k1jWRXKZC81vzXz3sE4bP7FIMDfTn5FMd7F++PXXp8GVW2
   TjBfTuhu9RPONn5eFvBPcQzizMoIs1cL9LdOee5L1O5MKEBY11oqQGG58
   4ItSdsu1EwP77enTSuLXWIl1TnXDZ7ybfDAS/Y6VFG3shFyrhBDmibxeM
   EOkHGaL4RUihK6VfbHD8SJo7gJmBpWdfKm13Cmk+ebIA6SRz5Mc3B1B2V
   F8cV3Pn+ne/fEkWfXECcTxSGwhJmasKW/8Cr43GRAkilabGlaGEfzFk34
   g==;
X-CSE-ConnectionGUID: IzPjQuFuQx2RmTsPSDbaZQ==
X-CSE-MsgGUID: 3Nrwzv+XRPO2q1/fjEDW9w==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="82691453"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="82691453"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Sep 2025 13:35:20 -0700
X-CSE-ConnectionGUID: T1TIxEVgQyKkg/ekj9WYug==
X-CSE-MsgGUID: tVSQTbcZQGWJxs2g3P1doQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,262,1751266800"; 
   d="scan'208";a="174092164"
Received: from lkp-server02.sh.intel.com (HELO eb5fdfb2a9b7) ([10.239.97.151])
  by orviesa007.jf.intel.com with ESMTP; 13 Sep 2025 13:35:18 -0700
Received: from kbuild by eb5fdfb2a9b7 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uxWxo-0001qG-2X;
	Sat, 13 Sep 2025 20:35:16 +0000
Date: Sun, 14 Sep 2025 04:35:16 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [gclement-mvebu:mvebu/dt64 5/6]
 arch/arm64/boot/dts/marvell/armada-3720-atlas-v5.dtb:
 /soc/bus@d0000000/pinctrl@13800: failed to match any schema with compatible:
 ['marvell,armada3710-nb-pinctrl', 'syscon', 'simple-mfd']
Message-ID: <202509140413.TKKID1Ft-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

:::::: 
:::::: Manual check reason: "dtcheck: binding changes may go via different trees"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: "Tomáš Macholda" <tomas.macholda@nic.cz>
CC: Gregory CLEMENT <gregory.clement@bootlin.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gclement/mvebu.git mvebu/dt64
head:   1cc3d6c8640e4a75dab4077121b8cafd15eab8b0
commit: 0b738a2901f43980fc2307a50a26457be1c8030b [5/6] arm64: dts: marvell: add dts for RIPE Atlas Probe v5
:::::: branch date: 32 hours ago
:::::: commit date: 32 hours ago
config: arm64-randconfig-051-20250913 (https://download.01.org/0day-ci/archive/20250914/202509140413.TKKID1Ft-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.3.0
dtschema version: 2025.9.dev1+g4b28bc79f
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250914/202509140413.TKKID1Ft-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202509140413.TKKID1Ft-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/marvell/armada-3720-atlas-v5.dtb: /soc/bus@d0000000/watchdog@8300: failed to match any schema with compatible: ['marvell,armada-3700-wdt']
>> arch/arm64/boot/dts/marvell/armada-3720-atlas-v5.dtb: /soc/bus@d0000000/pinctrl@13800: failed to match any schema with compatible: ['marvell,armada3710-nb-pinctrl', 'syscon', 'simple-mfd']
>> arch/arm64/boot/dts/marvell/armada-3720-atlas-v5.dtb: pinctrl@13800 (marvell,armada3710-nb-pinctrl): reg: [[79872, 256], [80896, 32]] is too long
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
>> arch/arm64/boot/dts/marvell/armada-3720-atlas-v5.dtb: /soc/bus@d0000000/pinctrl@13800/xtal-clk: failed to match any schema with compatible: ['marvell,armada-3700-xtal-clock']
   arch/arm64/boot/dts/marvell/armada-3720-atlas-v5.dtb: phy@18300 (marvell,comphy-a3700): clock-names: False schema does not allow ['xtal']
   	from schema $id: http://devicetree.org/schemas/phy/marvell,comphy-cp110.yaml#
   arch/arm64/boot/dts/marvell/armada-3720-atlas-v5.dtb: phy@18300 (marvell,comphy-a3700): clocks: False schema does not allow [[4]]
   	from schema $id: http://devicetree.org/schemas/phy/marvell,comphy-cp110.yaml#
   arch/arm64/boot/dts/marvell/armada-3720-atlas-v5.dtb: phy@18300 (marvell,comphy-a3700): clock-names:0: 'mg_clk' was expected
   	from schema $id: http://devicetree.org/schemas/phy/marvell,comphy-cp110.yaml#
   arch/arm64/boot/dts/marvell/armada-3720-atlas-v5.dtb: phy@18300 (marvell,comphy-a3700): clock-names: ['xtal'] is too short
   	from schema $id: http://devicetree.org/schemas/phy/marvell,comphy-cp110.yaml#
   arch/arm64/boot/dts/marvell/armada-3720-atlas-v5.dtb: phy@18300 (marvell,comphy-a3700): clocks: [[4]] is too short
   	from schema $id: http://devicetree.org/schemas/phy/marvell,comphy-cp110.yaml#
>> arch/arm64/boot/dts/marvell/armada-3720-atlas-v5.dtb: /soc/bus@d0000000/pinctrl@18800: failed to match any schema with compatible: ['marvell,armada3710-sb-pinctrl', 'syscon', 'simple-mfd']
>> arch/arm64/boot/dts/marvell/armada-3720-atlas-v5.dtb: pinctrl@18800 (marvell,armada3710-sb-pinctrl): reg: [[100352, 256], [101376, 32]] is too long
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
>> arch/arm64/boot/dts/marvell/armada-3720-atlas-v5.dtb: /soc/bus@d0000000/system-controller@5d800: failed to match any schema with compatible: ['marvell,armada-3700-usb2-host-device-misc', 'syscon']
>> arch/arm64/boot/dts/marvell/armada-3720-atlas-v5.dtb: usb@5e000 (marvell,armada-3700-ehci): phy-names:0: 'usb' was expected
   	from schema $id: http://devicetree.org/schemas/usb/generic-ehci.yaml#
   arch/arm64/boot/dts/marvell/armada-3720-atlas-v5.dtb: /soc/bus@d0000000/mailbox@b0000: failed to match any schema with compatible: ['marvell,armada-3700-rwtm-mailbox']
>> arch/arm64/boot/dts/marvell/armada-3720-atlas-v5.dtb: mmc@d8000 (marvell,armada-3700-sdhci): Unevaluated properties are not allowed ('marvell,xenon-emmc' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mmc/marvell,xenon-sdhci.yaml#
   arch/arm64/boot/dts/marvell/armada-3720-atlas-v5.dtb: pcie@d0070000 (marvell,armada-3700-pcie): interrupt-controller: '#address-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/pci/marvell,armada-3700-pcie.yaml#
>> arch/arm64/boot/dts/marvell/armada-3720-atlas-v5.dtb: /firmware/armada-3700-rwtm: failed to match any schema with compatible: ['marvell,armada-3700-rwtm-firmware', 'cznic,turris-mox-rwtm']
>> arch/arm64/boot/dts/marvell/armada-3720-atlas-v5.dtb: /firmware/armada-3700-rwtm: failed to match any schema with compatible: ['marvell,armada-3700-rwtm-firmware', 'cznic,turris-mox-rwtm']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
