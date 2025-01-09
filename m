Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E15038DD8
	for <oe-kbuild@lists.linux.dev>; Thu,  9 Jan 2025 03:27:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736393278; cv=none; b=ZTxSscrIwpe3ANm32yu1dj2b9uB+EmuYz4qc4sPym51jANx/iKlzxuMjtMYeUzfQQzN7Y83J9inbXQKAsiItOvOeoQRQekP09dCy/IMxhzr2m3dlA76OfzBrkIqGF4ESF2ySBvYXSAolCeuaqbsOuJ5cl4LuVSl8m5hitdWxino=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736393278; c=relaxed/simple;
	bh=qBX+MWDJZN0eJZ2lw4bJ5TRyy2HQ2kP9l0BVHI64jP0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=EtvlZI3168W2fk8TTB8z1PFqbC+ox+Oo2jAVpAeiidr6zAhyjuXfGLFAUVqlF9R9PNFaIQIBVOawow2HgUipwe00Di0NmvT1gZxdw4/htySQh0CwoPfM9CNWtMNSLAakjL/Cofy8pfN3ebTlurfnSR6+0iwsDkq/DUwu/vwG0bY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZsXnE35s; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZsXnE35s"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736393275; x=1767929275;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=qBX+MWDJZN0eJZ2lw4bJ5TRyy2HQ2kP9l0BVHI64jP0=;
  b=ZsXnE35sDoBYOhLlviLgfCIgNaSeRr4sSpftHIwoJlYZZ1fEcBSI8bVM
   rkEEcDjLoU892QNbP9sTu87Jtyy0VsC3IFmYPlnZ89/t6Mz0l0fq8mzsB
   2yfTDLLGjKA2g1yz+C8cOKqG0RImMz0oPgE6p7J7WzgzNGEVEjUp8d6oh
   HsrJ7dKV7jR6HXBms5Q3cs1m/YOvNELUpKL88mZ2zhJYATCtS1A1X8GUa
   idBtbHSL4XPCSnbtaO5bul4JEfVjOZ8WJcpwpKr5LJH2Ecx2TRBGczk0l
   63BJUhPP5o3lcZa6cGVKJ6M6Noh6v8glu4uDN9VQz6hQa46HhI06iQmLN
   g==;
X-CSE-ConnectionGUID: 3Y2br1WfQF6AZKHS17kAGQ==
X-CSE-MsgGUID: hyX9h4NgRvm33jHQ8NaQ+w==
X-IronPort-AV: E=McAfee;i="6700,10204,11309"; a="36753416"
X-IronPort-AV: E=Sophos;i="6.12,300,1728975600"; 
   d="scan'208";a="36753416"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jan 2025 19:27:55 -0800
X-CSE-ConnectionGUID: +m7EVvrPR3qOueDD971UAg==
X-CSE-MsgGUID: 3ypD0S/4RTugL3MafqUlAQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,300,1728975600"; 
   d="scan'208";a="134121567"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 08 Jan 2025 19:27:53 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tVjD4-000GzH-23;
	Thu, 09 Jan 2025 03:27:50 +0000
Date: Thu, 9 Jan 2025 11:26:50 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [asahilinux:bits/000-devicetree 89/191]
 arch/arm64/boot/dts/apple/t6021-j475c.dtb: watchdog@29e2c4000: compatible:0:
 'apple,t6020-wdt' is not one of ['apple,t8103-wdt', 'apple,t8112-wdt',
 'apple,t6000-wdt']
Message-ID: <202501091110.u7rp0sRU-lkp@intel.com>
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
TO: Janne Grunau <j@jannau.net>

tree:   https://github.com/AsahiLinux/linux bits/000-devicetree
head:   3579121c157a4c56e00b67dbb6eb45d963046590
commit: 469806d590d9d6db6f5a3b3fece7c8a85896770d [89/191] arm64: dts: apple: t602x: Add initial Mac Studio (2023) device trees
:::::: branch date: 4 days ago
:::::: commit date: 6 weeks ago
config: arm64-randconfig-051-20250106 (https://download.01.org/0day-ci/archive/20250109/202501091110.u7rp0sRU-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
dtschema version: 2024.12.dev6+gc4da38d
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250109/202501091110.u7rp0sRU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202501091110.u7rp0sRU-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/apple/t6021-j475c.dtb: soc: display-subsystem: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm64/boot/dts/apple/t6021-j475c.dtb: clock-controller@28e03c000: compatible:0: 'apple,t6020-nco' is not one of ['apple,t6000-nco', 'apple,t8103-nco', 'apple,t8112-nco']
   	from schema $id: http://devicetree.org/schemas/clock/apple,nco.yaml#
   arch/arm64/boot/dts/apple/t6021-j475c.dtb: /soc/clock-controller@28e03c000: failed to match any schema with compatible: ['apple,t6020-nco', 'apple,nco']
   arch/arm64/boot/dts/apple/t6021-j475c.dtb: interrupt-controller@28e100000: compatible:0: 'apple,t6020-aic' is not one of ['apple,t8112-aic', 'apple,t6000-aic']
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/apple,aic2.yaml#
   arch/arm64/boot/dts/apple/t6021-j475c.dtb: /soc/interrupt-controller@28e100000: failed to match any schema with compatible: ['apple,t6020-aic', 'apple,aic2']
   arch/arm64/boot/dts/apple/t6021-j475c.dtb: /soc/power-management@28e20c000: failed to match any schema with compatible: ['apple,t6020-pmgr-misc', 'apple,t6000-pmgr-misc']
   arch/arm64/boot/dts/apple/t6021-j475c.dtb: /soc/power-management@28e20c000: failed to match any schema with compatible: ['apple,t6020-pmgr-misc', 'apple,t6000-pmgr-misc']
>> arch/arm64/boot/dts/apple/t6021-j475c.dtb: watchdog@29e2c4000: compatible:0: 'apple,t6020-wdt' is not one of ['apple,t8103-wdt', 'apple,t8112-wdt', 'apple,t6000-wdt']
   	from schema $id: http://devicetree.org/schemas/watchdog/apple,wdt.yaml#
   arch/arm64/boot/dts/apple/t6021-j475c.dtb: watchdog@29e2c4000: Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/watchdog/apple,wdt.yaml#
   arch/arm64/boot/dts/apple/t6021-j475c.dtb: /soc/watchdog@29e2c4000: failed to match any schema with compatible: ['apple,t6020-wdt', 'apple,wdt']
   arch/arm64/boot/dts/apple/t6021-j475c.dtb: /soc/spmi@29e114000: failed to match any schema with compatible: ['apple,t6020-spmi', 'apple,spmi']
   arch/arm64/boot/dts/apple/t6021-j475c.dtb: /soc/spmi@29e114000: failed to match any schema with compatible: ['apple,t6020-spmi', 'apple,spmi']
   arch/arm64/boot/dts/apple/t6021-j475c.dtb: /soc/spmi@29e114000/pmu@f: failed to match any schema with compatible: ['apple,maverick-pmu', 'apple,spmi-pmu']
   arch/arm64/boot/dts/apple/t6021-j475c.dtb: /soc/spmi@29e114000/pmu@f: failed to match any schema with compatible: ['apple,maverick-pmu', 'apple,spmi-pmu']
   arch/arm64/boot/dts/apple/t6021-j475c.dtb: /soc/spmi@29e114000/pmu@f/rtc_nvmem@1400: failed to match any schema with compatible: ['apple,spmi-pmu-nvmem']
   arch/arm64/boot/dts/apple/t6021-j475c.dtb: /soc/spmi@29e114000/pmu@f/legacy_nvmem@6000: failed to match any schema with compatible: ['apple,spmi-pmu-nvmem']
   arch/arm64/boot/dts/apple/t6021-j475c.dtb: /soc/spmi@29e114000/pmu@f/scrpad_nvmem@8000: failed to match any schema with compatible: ['apple,spmi-pmu-nvmem']
   arch/arm64/boot/dts/apple/t6021-j475c.dtb: mbox@2a2408000: compatible: 'oneOf' conditional failed, one must be fixed:
   	'apple,t6020-asc-mailbox' is not one of ['apple,t8103-asc-mailbox', 'apple,t8112-asc-mailbox', 'apple,t6000-asc-mailbox']
   	'apple,t6020-asc-mailbox' is not one of ['apple,t8103-m3-mailbox', 'apple,t8112-m3-mailbox', 'apple,t6000-m3-mailbox']
   	'apple,m3-mailbox-v2' was expected
   	from schema $id: http://devicetree.org/schemas/mailbox/apple,mailbox.yaml#
   arch/arm64/boot/dts/apple/t6021-j475c.dtb: /soc/mbox@2a2408000: failed to match any schema with compatible: ['apple,t6020-asc-mailbox', 'apple,asc-mailbox-v4']
   arch/arm64/boot/dts/apple/t6021-j475c.dtb: /soc/smc@2a2400000: failed to match any schema with compatible: ['apple,t6020-smc', 'apple,smc']
   arch/arm64/boot/dts/apple/t6021-j475c.dtb: /soc/smc@2a2400000: failed to match any schema with compatible: ['apple,t6020-smc', 'apple,smc']
>> arch/arm64/boot/dts/apple/t6021-j475c.dtb: pinctrl@2a2820000: compatible:0: 'apple,t6020-pinctrl' is not one of ['apple,t8103-pinctrl', 'apple,t8112-pinctrl', 'apple,t6000-pinctrl']
   	from schema $id: http://devicetree.org/schemas/pinctrl/apple,pinctrl.yaml#
   arch/arm64/boot/dts/apple/t6021-j475c.dtb: /soc/pinctrl@2a2820000: failed to match any schema with compatible: ['apple,t6020-pinctrl', 'apple,pinctrl']
   arch/arm64/boot/dts/apple/t6021-j475c.dtb: /soc/mtp@2a9400000: failed to match any schema with compatible: ['apple,t6020-mtp', 'apple,t6020-rtk-helper-asc4', 'apple,mtp', 'apple,rtk-helper-asc4']
   arch/arm64/boot/dts/apple/t6021-j475c.dtb: /soc/mtp@2a9400000: failed to match any schema with compatible: ['apple,t6020-mtp', 'apple,t6020-rtk-helper-asc4', 'apple,mtp', 'apple,rtk-helper-asc4']
   arch/arm64/boot/dts/apple/t6021-j475c.dtb: /soc/mtp@2a9400000: failed to match any schema with compatible: ['apple,t6020-mtp', 'apple,t6020-rtk-helper-asc4', 'apple,mtp', 'apple,rtk-helper-asc4']
   arch/arm64/boot/dts/apple/t6021-j475c.dtb: /soc/mtp@2a9400000: failed to match any schema with compatible: ['apple,t6020-mtp', 'apple,t6020-rtk-helper-asc4', 'apple,mtp', 'apple,rtk-helper-asc4']
   arch/arm64/boot/dts/apple/t6021-j475c.dtb: iommu@2a9808000: compatible:0: 'apple,t6020-dart' is not one of ['apple,t8103-dart', 'apple,t8103-usb4-dart', 'apple,t8110-dart', 'apple,t6000-dart']
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t6021-j475c.dtb: iommu@2a9808000: compatible: ['apple,t6020-dart', 'apple,t8110-dart'] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
--
   arch/arm64/boot/dts/apple/t6021-j475c.dtb: codec@38: compatible: ['ti,sn012776', 'ti,tas2764'] is too long
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas27xx.yaml#
   arch/arm64/boot/dts/apple/t6021-j475c.dtb: codec@38: Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas27xx.yaml#
   arch/arm64/boot/dts/apple/t6021-j475c.dtb: /soc/i2c@39b044000/codec@38: failed to match any schema with compatible: ['ti,sn012776', 'ti,tas2764']
   arch/arm64/boot/dts/apple/t6021-j475c.dtb: i2c@39b048000: compatible:0: 'apple,t6020-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
   arch/arm64/boot/dts/apple/t6021-j475c.dtb: i2c@39b048000: Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
   arch/arm64/boot/dts/apple/t6021-j475c.dtb: /soc/i2c@39b048000: failed to match any schema with compatible: ['apple,t6020-i2c', 'apple,i2c']
>> arch/arm64/boot/dts/apple/t6021-j475c.dtb: /soc/i2c@39b048000/codec@4b: failed to match any schema with compatible: ['cirrus,cs42l84']
   arch/arm64/boot/dts/apple/t6021-j475c.dtb: i2c@39b04c000: compatible:0: 'apple,t6020-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
   arch/arm64/boot/dts/apple/t6021-j475c.dtb: /soc/i2c@39b04c000: failed to match any schema with compatible: ['apple,t6020-i2c', 'apple,i2c']
   arch/arm64/boot/dts/apple/t6021-j475c.dtb: i2c@39b050000: compatible:0: 'apple,t6020-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
   arch/arm64/boot/dts/apple/t6021-j475c.dtb: /soc/i2c@39b050000: failed to match any schema with compatible: ['apple,t6020-i2c', 'apple,i2c']
   arch/arm64/boot/dts/apple/t6021-j475c.dtb: i2c@39b054000: compatible:0: 'apple,t6020-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
   arch/arm64/boot/dts/apple/t6021-j475c.dtb: /soc/i2c@39b054000: failed to match any schema with compatible: ['apple,t6020-i2c', 'apple,i2c']
   arch/arm64/boot/dts/apple/t6021-j475c.dtb: /soc/spi@39b104000: failed to match any schema with compatible: ['apple,t6020-spi', 'apple,spi']
--
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml#
   arch/arm64/boot/dts/apple/t6021-j475c.dtb: /soc/power-management@29e280000/power-controller@d8: failed to match any schema with compatible: ['apple,t6020-pmgr-pwrstate', 'apple,pmgr-pwrstate']
   arch/arm64/boot/dts/apple/t6021-j475c.dtb: power-controller@e0: compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml#
   arch/arm64/boot/dts/apple/t6021-j475c.dtb: /soc/power-management@29e280000/power-controller@e0: failed to match any schema with compatible: ['apple,t6020-pmgr-pwrstate', 'apple,pmgr-pwrstate']
   arch/arm64/boot/dts/apple/t6021-j475c.dtb: efuse@29e2cc000: compatible:0: 'apple,t6020-efuses' is not one of ['apple,t8103-efuses', 'apple,t6000-efuses']
   	from schema $id: http://devicetree.org/schemas/nvmem/apple,efuses.yaml#
   arch/arm64/boot/dts/apple/t6021-j475c.dtb: efuse@29e2cc000: Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/nvmem/apple,efuses.yaml#
   arch/arm64/boot/dts/apple/t6021-j475c.dtb: /soc/efuse@29e2cc000: failed to match any schema with compatible: ['apple,t6020-efuses', 'apple,efuses']
>> arch/arm64/boot/dts/apple/t6021-j475c.dtb: pinctrl@2a6820000: compatible:0: 'apple,t6020-pinctrl' is not one of ['apple,t8103-pinctrl', 'apple,t8112-pinctrl', 'apple,t6000-pinctrl']
   	from schema $id: http://devicetree.org/schemas/pinctrl/apple,pinctrl.yaml#
   arch/arm64/boot/dts/apple/t6021-j475c.dtb: /soc/pinctrl@2a6820000: failed to match any schema with compatible: ['apple,t6020-pinctrl', 'apple,pinctrl']
>> arch/arm64/boot/dts/apple/t6021-j475c.dtb: pinctrl@39b028000: compatible:0: 'apple,t6020-pinctrl' is not one of ['apple,t8103-pinctrl', 'apple,t8112-pinctrl', 'apple,t6000-pinctrl']
   	from schema $id: http://devicetree.org/schemas/pinctrl/apple,pinctrl.yaml#
   arch/arm64/boot/dts/apple/t6021-j475c.dtb: pinctrl@39b028000: 'usb_hub_oe-hog', 'usb_hub_rst-hog' do not match any of the regexes: '-pins$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/pinctrl/apple,pinctrl.yaml#
   arch/arm64/boot/dts/apple/t6021-j475c.dtb: /soc/pinctrl@39b028000: failed to match any schema with compatible: ['apple,t6020-pinctrl', 'apple,pinctrl']
   arch/arm64/boot/dts/apple/t6021-j475c.dtb: power-management@404e80000: compatible:0: 'apple,t6020-pmgr' is not one of ['apple,t8103-pmgr', 'apple,t8112-pmgr', 'apple,t6000-pmgr']
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml#
   arch/arm64/boot/dts/apple/t6021-j475c.dtb: power-management@404e80000: power-controller@0:compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml#
   arch/arm64/boot/dts/apple/t6021-j475c.dtb: power-management@404e80000: power-controller@100:compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml#
--
   arch/arm64/boot/dts/apple/t6022-j475d.dtb: opp-table-gpu-afr: Unevaluated properties are not allowed ('opp00', 'opp01', 'opp02', 'opp03', 'opp04', 'opp05', 'opp06' were unexpected)
   	from schema $id: http://devicetree.org/schemas/opp/opp-v2.yaml#
   arch/arm64/boot/dts/apple/t6022-j475d.dtb: clock-controller@28e03c000: compatible:0: 'apple,t6020-nco' is not one of ['apple,t6000-nco', 'apple,t8103-nco', 'apple,t8112-nco']
   	from schema $id: http://devicetree.org/schemas/clock/apple,nco.yaml#
   arch/arm64/boot/dts/apple/t6022-j475d.dtb: /soc@200000000/clock-controller@28e03c000: failed to match any schema with compatible: ['apple,t6020-nco', 'apple,nco']
   arch/arm64/boot/dts/apple/t6022-j475d.dtb: interrupt-controller@28e100000: compatible:0: 'apple,t6020-aic' is not one of ['apple,t8112-aic', 'apple,t6000-aic']
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/apple,aic2.yaml#
   arch/arm64/boot/dts/apple/t6022-j475d.dtb: /soc@200000000/interrupt-controller@28e100000: failed to match any schema with compatible: ['apple,t6020-aic', 'apple,aic2']
   arch/arm64/boot/dts/apple/t6022-j475d.dtb: /soc@200000000/power-management@28e20c000: failed to match any schema with compatible: ['apple,t6020-pmgr-misc', 'apple,t6000-pmgr-misc']
   arch/arm64/boot/dts/apple/t6022-j475d.dtb: /soc@200000000/power-management@28e20c000: failed to match any schema with compatible: ['apple,t6020-pmgr-misc', 'apple,t6000-pmgr-misc']
>> arch/arm64/boot/dts/apple/t6022-j475d.dtb: watchdog@29e2c4000: compatible:0: 'apple,t6020-wdt' is not one of ['apple,t8103-wdt', 'apple,t8112-wdt', 'apple,t6000-wdt']
   	from schema $id: http://devicetree.org/schemas/watchdog/apple,wdt.yaml#
   arch/arm64/boot/dts/apple/t6022-j475d.dtb: watchdog@29e2c4000: Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/watchdog/apple,wdt.yaml#
   arch/arm64/boot/dts/apple/t6022-j475d.dtb: /soc@200000000/watchdog@29e2c4000: failed to match any schema with compatible: ['apple,t6020-wdt', 'apple,wdt']
   arch/arm64/boot/dts/apple/t6022-j475d.dtb: /soc@200000000/spmi@29e114000: failed to match any schema with compatible: ['apple,t6020-spmi', 'apple,spmi']
   arch/arm64/boot/dts/apple/t6022-j475d.dtb: /soc@200000000/spmi@29e114000: failed to match any schema with compatible: ['apple,t6020-spmi', 'apple,spmi']
   arch/arm64/boot/dts/apple/t6022-j475d.dtb: /soc@200000000/spmi@29e114000/pmu@f: failed to match any schema with compatible: ['apple,maverick-pmu', 'apple,spmi-pmu']
   arch/arm64/boot/dts/apple/t6022-j475d.dtb: /soc@200000000/spmi@29e114000/pmu@f: failed to match any schema with compatible: ['apple,maverick-pmu', 'apple,spmi-pmu']
   arch/arm64/boot/dts/apple/t6022-j475d.dtb: /soc@200000000/spmi@29e114000/pmu@f/rtc_nvmem@1400: failed to match any schema with compatible: ['apple,spmi-pmu-nvmem']
   arch/arm64/boot/dts/apple/t6022-j475d.dtb: /soc@200000000/spmi@29e114000/pmu@f/legacy_nvmem@6000: failed to match any schema with compatible: ['apple,spmi-pmu-nvmem']
   arch/arm64/boot/dts/apple/t6022-j475d.dtb: /soc@200000000/spmi@29e114000/pmu@f/scrpad_nvmem@8000: failed to match any schema with compatible: ['apple,spmi-pmu-nvmem']
   arch/arm64/boot/dts/apple/t6022-j475d.dtb: mbox@2a2408000: compatible: 'oneOf' conditional failed, one must be fixed:
   	'apple,t6020-asc-mailbox' is not one of ['apple,t8103-asc-mailbox', 'apple,t8112-asc-mailbox', 'apple,t6000-asc-mailbox']
   	'apple,t6020-asc-mailbox' is not one of ['apple,t8103-m3-mailbox', 'apple,t8112-m3-mailbox', 'apple,t6000-m3-mailbox']
   	'apple,m3-mailbox-v2' was expected
   	from schema $id: http://devicetree.org/schemas/mailbox/apple,mailbox.yaml#
   arch/arm64/boot/dts/apple/t6022-j475d.dtb: /soc@200000000/mbox@2a2408000: failed to match any schema with compatible: ['apple,t6020-asc-mailbox', 'apple,asc-mailbox-v4']
   arch/arm64/boot/dts/apple/t6022-j475d.dtb: /soc@200000000/smc@2a2400000: failed to match any schema with compatible: ['apple,t6020-smc', 'apple,smc']
   arch/arm64/boot/dts/apple/t6022-j475d.dtb: /soc@200000000/smc@2a2400000: failed to match any schema with compatible: ['apple,t6020-smc', 'apple,smc']
>> arch/arm64/boot/dts/apple/t6022-j475d.dtb: pinctrl@2a2820000: compatible:0: 'apple,t6020-pinctrl' is not one of ['apple,t8103-pinctrl', 'apple,t8112-pinctrl', 'apple,t6000-pinctrl']
   	from schema $id: http://devicetree.org/schemas/pinctrl/apple,pinctrl.yaml#
   arch/arm64/boot/dts/apple/t6022-j475d.dtb: /soc@200000000/pinctrl@2a2820000: failed to match any schema with compatible: ['apple,t6020-pinctrl', 'apple,pinctrl']
   arch/arm64/boot/dts/apple/t6022-j475d.dtb: /soc@200000000/mtp@2a9400000: failed to match any schema with compatible: ['apple,t6020-mtp', 'apple,t6020-rtk-helper-asc4', 'apple,mtp', 'apple,rtk-helper-asc4']
   arch/arm64/boot/dts/apple/t6022-j475d.dtb: /soc@200000000/mtp@2a9400000: failed to match any schema with compatible: ['apple,t6020-mtp', 'apple,t6020-rtk-helper-asc4', 'apple,mtp', 'apple,rtk-helper-asc4']
   arch/arm64/boot/dts/apple/t6022-j475d.dtb: /soc@200000000/mtp@2a9400000: failed to match any schema with compatible: ['apple,t6020-mtp', 'apple,t6020-rtk-helper-asc4', 'apple,mtp', 'apple,rtk-helper-asc4']
   arch/arm64/boot/dts/apple/t6022-j475d.dtb: /soc@200000000/mtp@2a9400000: failed to match any schema with compatible: ['apple,t6020-mtp', 'apple,t6020-rtk-helper-asc4', 'apple,mtp', 'apple,rtk-helper-asc4']
   arch/arm64/boot/dts/apple/t6022-j475d.dtb: iommu@2a9808000: compatible:0: 'apple,t6020-dart' is not one of ['apple,t8103-dart', 'apple,t8103-usb4-dart', 'apple,t8110-dart', 'apple,t6000-dart']
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t6022-j475d.dtb: iommu@2a9808000: compatible: ['apple,t6020-dart', 'apple,t8110-dart'] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
--
   arch/arm64/boot/dts/apple/t6022-j475d.dtb: codec@38: compatible: ['ti,sn012776', 'ti,tas2764'] is too long
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas27xx.yaml#
   arch/arm64/boot/dts/apple/t6022-j475d.dtb: codec@38: Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas27xx.yaml#
   arch/arm64/boot/dts/apple/t6022-j475d.dtb: /soc@200000000/i2c@39b044000/codec@38: failed to match any schema with compatible: ['ti,sn012776', 'ti,tas2764']
   arch/arm64/boot/dts/apple/t6022-j475d.dtb: i2c@39b048000: compatible:0: 'apple,t6020-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
   arch/arm64/boot/dts/apple/t6022-j475d.dtb: i2c@39b048000: Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
   arch/arm64/boot/dts/apple/t6022-j475d.dtb: /soc@200000000/i2c@39b048000: failed to match any schema with compatible: ['apple,t6020-i2c', 'apple,i2c']
>> arch/arm64/boot/dts/apple/t6022-j475d.dtb: /soc@200000000/i2c@39b048000/codec@4b: failed to match any schema with compatible: ['cirrus,cs42l84']
   arch/arm64/boot/dts/apple/t6022-j475d.dtb: i2c@39b04c000: compatible:0: 'apple,t6020-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
   arch/arm64/boot/dts/apple/t6022-j475d.dtb: /soc@200000000/i2c@39b04c000: failed to match any schema with compatible: ['apple,t6020-i2c', 'apple,i2c']
   arch/arm64/boot/dts/apple/t6022-j475d.dtb: i2c@39b050000: compatible:0: 'apple,t6020-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
   arch/arm64/boot/dts/apple/t6022-j475d.dtb: /soc@200000000/i2c@39b050000: failed to match any schema with compatible: ['apple,t6020-i2c', 'apple,i2c']
   arch/arm64/boot/dts/apple/t6022-j475d.dtb: i2c@39b054000: compatible:0: 'apple,t6020-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
   arch/arm64/boot/dts/apple/t6022-j475d.dtb: /soc@200000000/i2c@39b054000: failed to match any schema with compatible: ['apple,t6020-i2c', 'apple,i2c']
   arch/arm64/boot/dts/apple/t6022-j475d.dtb: /soc@200000000/spi@39b104000: failed to match any schema with compatible: ['apple,t6020-spi', 'apple,spi']
--
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml#
   arch/arm64/boot/dts/apple/t6022-j475d.dtb: /soc@200000000/power-management@29e280000/power-controller@d8: failed to match any schema with compatible: ['apple,t6020-pmgr-pwrstate', 'apple,pmgr-pwrstate']
   arch/arm64/boot/dts/apple/t6022-j475d.dtb: power-controller@e0: compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml#
   arch/arm64/boot/dts/apple/t6022-j475d.dtb: /soc@200000000/power-management@29e280000/power-controller@e0: failed to match any schema with compatible: ['apple,t6020-pmgr-pwrstate', 'apple,pmgr-pwrstate']
   arch/arm64/boot/dts/apple/t6022-j475d.dtb: efuse@29e2cc000: compatible:0: 'apple,t6020-efuses' is not one of ['apple,t8103-efuses', 'apple,t6000-efuses']
   	from schema $id: http://devicetree.org/schemas/nvmem/apple,efuses.yaml#
   arch/arm64/boot/dts/apple/t6022-j475d.dtb: efuse@29e2cc000: Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/nvmem/apple,efuses.yaml#
   arch/arm64/boot/dts/apple/t6022-j475d.dtb: /soc@200000000/efuse@29e2cc000: failed to match any schema with compatible: ['apple,t6020-efuses', 'apple,efuses']
>> arch/arm64/boot/dts/apple/t6022-j475d.dtb: pinctrl@2a6820000: compatible:0: 'apple,t6020-pinctrl' is not one of ['apple,t8103-pinctrl', 'apple,t8112-pinctrl', 'apple,t6000-pinctrl']
   	from schema $id: http://devicetree.org/schemas/pinctrl/apple,pinctrl.yaml#
   arch/arm64/boot/dts/apple/t6022-j475d.dtb: /soc@200000000/pinctrl@2a6820000: failed to match any schema with compatible: ['apple,t6020-pinctrl', 'apple,pinctrl']
>> arch/arm64/boot/dts/apple/t6022-j475d.dtb: pinctrl@39b028000: compatible:0: 'apple,t6020-pinctrl' is not one of ['apple,t8103-pinctrl', 'apple,t8112-pinctrl', 'apple,t6000-pinctrl']
   	from schema $id: http://devicetree.org/schemas/pinctrl/apple,pinctrl.yaml#
   arch/arm64/boot/dts/apple/t6022-j475d.dtb: /soc@200000000/pinctrl@39b028000: failed to match any schema with compatible: ['apple,t6020-pinctrl', 'apple,pinctrl']
   arch/arm64/boot/dts/apple/t6022-j475d.dtb: power-management@404e80000: compatible:0: 'apple,t6020-pmgr' is not one of ['apple,t8103-pmgr', 'apple,t8112-pmgr', 'apple,t6000-pmgr']
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml#
   arch/arm64/boot/dts/apple/t6022-j475d.dtb: power-management@404e80000: power-controller@0:compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml#
   arch/arm64/boot/dts/apple/t6022-j475d.dtb: power-management@404e80000: power-controller@100:compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml#
   arch/arm64/boot/dts/apple/t6022-j475d.dtb: power-management@404e80000: power-controller@108:compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml#
--
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml#
   arch/arm64/boot/dts/apple/t6022-j475d.dtb: /soc@2200000000/power-management@29e280000/power-controller@c8: failed to match any schema with compatible: ['apple,t6020-pmgr-pwrstate', 'apple,pmgr-pwrstate']
   arch/arm64/boot/dts/apple/t6022-j475d.dtb: power-controller@d0: compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml#
   arch/arm64/boot/dts/apple/t6022-j475d.dtb: /soc@2200000000/power-management@29e280000/power-controller@d0: failed to match any schema with compatible: ['apple,t6020-pmgr-pwrstate', 'apple,pmgr-pwrstate']
   arch/arm64/boot/dts/apple/t6022-j475d.dtb: efuse@29e2cc000: compatible:0: 'apple,t6020-efuses' is not one of ['apple,t8103-efuses', 'apple,t6000-efuses']
   	from schema $id: http://devicetree.org/schemas/nvmem/apple,efuses.yaml#
   arch/arm64/boot/dts/apple/t6022-j475d.dtb: efuse@29e2cc000: Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/nvmem/apple,efuses.yaml#
   arch/arm64/boot/dts/apple/t6022-j475d.dtb: /soc@2200000000/efuse@29e2cc000: failed to match any schema with compatible: ['apple,t6020-efuses', 'apple,efuses']
>> arch/arm64/boot/dts/apple/t6022-j475d.dtb: pinctrl@2a6820000: compatible:0: 'apple,t6020-pinctrl' is not one of ['apple,t8103-pinctrl', 'apple,t8112-pinctrl', 'apple,t6000-pinctrl']
   	from schema $id: http://devicetree.org/schemas/pinctrl/apple,pinctrl.yaml#
   arch/arm64/boot/dts/apple/t6022-j475d.dtb: /soc@2200000000/pinctrl@2a6820000: failed to match any schema with compatible: ['apple,t6020-pinctrl', 'apple,pinctrl']
>> arch/arm64/boot/dts/apple/t6022-j475d.dtb: pinctrl@39b028000: compatible:0: 'apple,t6020-pinctrl' is not one of ['apple,t8103-pinctrl', 'apple,t8112-pinctrl', 'apple,t6000-pinctrl']
   	from schema $id: http://devicetree.org/schemas/pinctrl/apple,pinctrl.yaml#
   arch/arm64/boot/dts/apple/t6022-j475d.dtb: /soc@2200000000/pinctrl@39b028000: failed to match any schema with compatible: ['apple,t6020-pinctrl', 'apple,pinctrl']
   arch/arm64/boot/dts/apple/t6022-j475d.dtb: power-management@404e80000: compatible:0: 'apple,t6020-pmgr' is not one of ['apple,t8103-pmgr', 'apple,t8112-pmgr', 'apple,t6000-pmgr']
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml#
   arch/arm64/boot/dts/apple/t6022-j475d.dtb: power-management@404e80000: power-controller@0:compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml#
   arch/arm64/boot/dts/apple/t6022-j475d.dtb: power-management@404e80000: power-controller@100:compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml#
   arch/arm64/boot/dts/apple/t6022-j475d.dtb: power-management@404e80000: power-controller@108:compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
