Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26020270557
	for <oe-kbuild@lists.linux.dev>; Sun, 14 Sep 2025 03:57:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757822243; cv=none; b=G1eTkzvFT8PCgNFOPCu2Z2B2NRZ1HQ07OkEFhHPX4tw4dCeCc8RJ5suzLMKfqqjRsFRwJH9zL/ybHwh8c1/N3mAQ+PpCF9f/Cppk/BvpmjR6daRehWXMbdC466dW0hQKkaACUbOGPf5m500fa34USPzdRHDIuQw4GmbQbFJkCvc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757822243; c=relaxed/simple;
	bh=k32wml3UbyJA3rfZfZ5ZPef1LojYNGMXRheAzsj+gww=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ksKjf5W3Ad3DrKDxs+hEp5SNUW7A3CbbxMDU/FFYoktXMAHSU+t13srqwdXn2vBNXCzL0qwsHUDffL3eORwDshzhukvGTe26OcSfHZS9/Ft2cn11XIVRsXGpk/Jb+0nMwrCLWgwTmIqDw2HkJbc8iBb/vubNW8OX7bOH25Y9eJk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jh4NKw3M; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jh4NKw3M"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757822241; x=1789358241;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=k32wml3UbyJA3rfZfZ5ZPef1LojYNGMXRheAzsj+gww=;
  b=jh4NKw3MCO849KyhaIW26zLSOoinZyywSmaSrsLqvF0cnXsEegXGR2QQ
   qWJ/Yh1HcxV1JaiMVydT0jdc36r3/azCLvVYgAR/jT0CGt8p0MtUbhiUj
   7ugvJ5saRIC3sIJ+CNgITh6s3P3zxG3TxbynO+QaO/OdHLAXIOPC5AayA
   IQM3R3O/prn2yYCRUtcJ9RoDYeOvO2tcdVoPc45gvDAoIbhblqiwv7dI2
   R16udHY2eKiEG6WOKcbAOsBYK5FiyCyt5hV0SE2aTF+CeGXfrGJpr+W12
   RsSpn251d7jbTpsx/jQj4iU4Sx2cnTanxQU0m6Ap+aGwN79fYJxj49HLC
   g==;
X-CSE-ConnectionGUID: 6Oc8AME0TseWD5AcmBW0qQ==
X-CSE-MsgGUID: Fu3R6cS6RYKuSbnt/wngkQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11552"; a="59341740"
X-IronPort-AV: E=Sophos;i="6.18,263,1751266800"; 
   d="scan'208";a="59341740"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Sep 2025 20:57:20 -0700
X-CSE-ConnectionGUID: VAGqhh31T/+cV6RWN/84zA==
X-CSE-MsgGUID: ES/LuCJ9RqqwcG/POrw/yQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,263,1751266800"; 
   d="scan'208";a="211477534"
Received: from lkp-server02.sh.intel.com (HELO eb5fdfb2a9b7) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 13 Sep 2025 20:57:19 -0700
Received: from kbuild by eb5fdfb2a9b7 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uxdrZ-00025o-0B;
	Sun, 14 Sep 2025 03:57:17 +0000
Date: Sun, 14 Sep 2025 11:57:06 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [gclement-mvebu:mvebu/dt64 5/6]
 arch/arm64/boot/dts/marvell/armada-3720-atlas-v5.dtb:
 /soc/bus@d0000000/watchdog@8300: failed to match any schema with compatible:
 ['marvell,armada-3700-wdt']
Message-ID: <202509141132.I2Dvw1bu-lkp@intel.com>
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
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: arm64-randconfig-054-20250913 (https://download.01.org/0day-ci/archive/20250914/202509141132.I2Dvw1bu-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 21857ae337e0892a5522b6e7337899caa61de2a6)
dtschema version: 2025.9.dev1+g4b28bc79f
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250914/202509141132.I2Dvw1bu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202509141132.I2Dvw1bu-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/marvell/armada-3720-atlas-v5.dtb: /soc/bus@d0000000/watchdog@8300: failed to match any schema with compatible: ['marvell,armada-3700-wdt']
   arch/arm64/boot/dts/marvell/armada-3720-atlas-v5.dtb: /soc/bus@d0000000/pinctrl@13800: failed to match any schema with compatible: ['marvell,armada3710-nb-pinctrl', 'syscon', 'simple-mfd']
   arch/arm64/boot/dts/marvell/armada-3720-atlas-v5.dtb: pinctrl@13800 (marvell,armada3710-nb-pinctrl): reg: [[79872, 256], [80896, 32]] is too long
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
   arch/arm64/boot/dts/marvell/armada-3720-atlas-v5.dtb: /soc/bus@d0000000/pinctrl@13800/xtal-clk: failed to match any schema with compatible: ['marvell,armada-3700-xtal-clock']
>> arch/arm64/boot/dts/marvell/armada-3720-atlas-v5.dtb: phy@18300 (marvell,comphy-a3700): clock-names: False schema does not allow ['xtal']
   	from schema $id: http://devicetree.org/schemas/phy/marvell,comphy-cp110.yaml#
>> arch/arm64/boot/dts/marvell/armada-3720-atlas-v5.dtb: phy@18300 (marvell,comphy-a3700): clocks: False schema does not allow [[4]]
   	from schema $id: http://devicetree.org/schemas/phy/marvell,comphy-cp110.yaml#
>> arch/arm64/boot/dts/marvell/armada-3720-atlas-v5.dtb: phy@18300 (marvell,comphy-a3700): clock-names:0: 'mg_clk' was expected
   	from schema $id: http://devicetree.org/schemas/phy/marvell,comphy-cp110.yaml#
>> arch/arm64/boot/dts/marvell/armada-3720-atlas-v5.dtb: phy@18300 (marvell,comphy-a3700): clock-names: ['xtal'] is too short
   	from schema $id: http://devicetree.org/schemas/phy/marvell,comphy-cp110.yaml#
>> arch/arm64/boot/dts/marvell/armada-3720-atlas-v5.dtb: phy@18300 (marvell,comphy-a3700): clocks: [[4]] is too short
   	from schema $id: http://devicetree.org/schemas/phy/marvell,comphy-cp110.yaml#
   arch/arm64/boot/dts/marvell/armada-3720-atlas-v5.dtb: /soc/bus@d0000000/pinctrl@18800: failed to match any schema with compatible: ['marvell,armada3710-sb-pinctrl', 'syscon', 'simple-mfd']
   arch/arm64/boot/dts/marvell/armada-3720-atlas-v5.dtb: pinctrl@18800 (marvell,armada3710-sb-pinctrl): reg: [[100352, 256], [101376, 32]] is too long
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
   arch/arm64/boot/dts/marvell/armada-3720-atlas-v5.dtb: /soc/bus@d0000000/system-controller@5d800: failed to match any schema with compatible: ['marvell,armada-3700-usb2-host-device-misc', 'syscon']
   arch/arm64/boot/dts/marvell/armada-3720-atlas-v5.dtb: usb@5e000 (marvell,armada-3700-ehci): phy-names:0: 'usb' was expected
   	from schema $id: http://devicetree.org/schemas/usb/generic-ehci.yaml#
>> arch/arm64/boot/dts/marvell/armada-3720-atlas-v5.dtb: /soc/bus@d0000000/mailbox@b0000: failed to match any schema with compatible: ['marvell,armada-3700-rwtm-mailbox']
   arch/arm64/boot/dts/marvell/armada-3720-atlas-v5.dtb: mmc@d8000 (marvell,armada-3700-sdhci): Unevaluated properties are not allowed ('marvell,xenon-emmc' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mmc/marvell,xenon-sdhci.yaml#
>> arch/arm64/boot/dts/marvell/armada-3720-atlas-v5.dtb: pcie@d0070000 (marvell,armada-3700-pcie): interrupt-controller: '#address-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/pci/marvell,armada-3700-pcie.yaml#
   arch/arm64/boot/dts/marvell/armada-3720-atlas-v5.dtb: /firmware/armada-3700-rwtm: failed to match any schema with compatible: ['marvell,armada-3700-rwtm-firmware', 'cznic,turris-mox-rwtm']
   arch/arm64/boot/dts/marvell/armada-3720-atlas-v5.dtb: /firmware/armada-3700-rwtm: failed to match any schema with compatible: ['marvell,armada-3700-rwtm-firmware', 'cznic,turris-mox-rwtm']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
