Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57D791D2F42
	for <oe-kbuild@lists.linux.dev>; Sat, 13 Sep 2025 15:38:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757777916; cv=none; b=TGqo/0nFx9IbjOSmanAT0qib/aminK1M5DsIrFQPGK/r0TTFgZxKBKBWrjxXfWEGM5El7ED/65rPksTckV248gJYQV6cuaiJmiP0OnraY83WwbWNLUyifQ3cayqR7W7JkxK9s+aD/apjjWTodbbTyEk+7ky4VWGePvWIgqCXKV0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757777916; c=relaxed/simple;
	bh=NYDzAoC7jflrJJfCxr5BSbe+Do25rgfEtWwRuMtHyjA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=hwMqQlBa09su7KR6/PmjPDohlk9K2588rc92BhCU73wX12jXYke7UEF6J202Ph+EeQdU3YEPxRSJkQ8rFMwB7AAFnL6WQis5MdF7l8XyupxuUkJYvFI4e1ujCAhkm34i5xYJPWimKMIjf2WBygSoobHHw9zqcEoUSfLywxmDj+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WnaWksf2; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WnaWksf2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757777914; x=1789313914;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=NYDzAoC7jflrJJfCxr5BSbe+Do25rgfEtWwRuMtHyjA=;
  b=WnaWksf2GhUYWDA8dTGEk26kk/pxHud4yYRZxJtpG8DwJiySD7VVRvnO
   f/AYlLPfxrVxuUEO3xQz03NbSa8MnYGhIEoWdY80VQeNSZE98byzh4ohM
   QKZP+7VJS+zQwGT8SSnxB16IcD/ZexTBnHuOaPLo/q+bpgWhiineAF/pP
   j9GLmXsmPH6Z13/MlXtMXNcatCzTjpaePJFGVtI/pVnnRH12uG2T+lhwc
   aBHZFFSL1vNXltEwskA0NrDyh3TorgrzvnzHu+2cYfSontfzJxbUnIc17
   JzK/oWb8VWCqdcQEBt93rJUMYMQbBE+axDxGkEVttatFmm39wuHfOcWWY
   A==;
X-CSE-ConnectionGUID: xVHubcLUTGGHjRF/iD90WA==
X-CSE-MsgGUID: nkJOOhciSy6ltopcjIZ+iA==
X-IronPort-AV: E=McAfee;i="6800,10657,11552"; a="70350813"
X-IronPort-AV: E=Sophos;i="6.18,262,1751266800"; 
   d="scan'208";a="70350813"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Sep 2025 08:38:34 -0700
X-CSE-ConnectionGUID: jJYXjNJgSv2XMyG6v/nqUQ==
X-CSE-MsgGUID: d8fdJDFDTRirQqBb+mPzWA==
X-ExtLoop1: 1
Received: from igk-lkp-server01.igk.intel.com (HELO 0e586ad5e7f7) ([10.91.175.65])
  by fmviesa003.fm.intel.com with ESMTP; 13 Sep 2025 08:38:33 -0700
Received: from kbuild by 0e586ad5e7f7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1uxSKc-000000001eb-2f5m;
	Sat, 13 Sep 2025 15:38:30 +0000
Date: Sat, 13 Sep 2025 17:38:04 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [gclement-mvebu:mvebu/dt64 5/6]
 arch/arm64/boot/dts/marvell/armada-3720-atlas-v5.dtb: phy@18300
 (marvell,comphy-a3700): clock-names: False schema does not allow ['xtal']
Message-ID: <202509131748.0cZSA8aP-lkp@intel.com>
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
:::::: branch date: 27 hours ago
:::::: commit date: 27 hours ago
config: arm64-randconfig-2052-20250913 (https://download.01.org/0day-ci/archive/20250913/202509131748.0cZSA8aP-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project ead0e976ed870ce10e88e94f6bac307190a70e62)
dtschema version: 2025.8
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250913/202509131748.0cZSA8aP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202509131748.0cZSA8aP-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/marvell/armada-3720-atlas-v5.dtb: /soc/bus@d0000000/watchdog@8300: failed to match any schema with compatible: ['marvell,armada-3700-wdt']
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
   arch/arm64/boot/dts/marvell/armada-3720-atlas-v5.dtb: /soc/bus@d0000000/mailbox@b0000: failed to match any schema with compatible: ['marvell,armada-3700-rwtm-mailbox']
   arch/arm64/boot/dts/marvell/armada-3720-atlas-v5.dtb: mmc@d8000 (marvell,armada-3700-sdhci): Unevaluated properties are not allowed ('marvell,xenon-emmc' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mmc/marvell,xenon-sdhci.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
