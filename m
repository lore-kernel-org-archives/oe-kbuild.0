Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 250991FCCF8
	for <oe-kbuild@lists.linux.dev>; Sat, 14 Jun 2025 21:52:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749937962; cv=none; b=Ra5u0XY0P3qIk8Y48pkuMtjjm6Y3I4f6VcEI6oHqTiOnRW/FRe11RqRTi3sVxqPM4ykBbaKYCcC4jBp2GFQzWZYDs6XOEPrp8ODQZDUauOLEClrCZfy1DRx78sUeNQG19mQSiEYwYpo1bhDrnqEXGOw/mVo1sZjiyudf3SPINxI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749937962; c=relaxed/simple;
	bh=ZQhF4emg49y1jyReCPSM39TtvwqqtMn6Kb88IembfPc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=TE/kwyMNcgsVoK1YstRZRW46YGmqvAzZMIP36YYk8rF1QQEDa6rc0V63ULmdPEmuFTCycCXEkZHlr1OX37ufCUnYXc2mdPandIDXxqAGXB4oJDSRrbzmp4bs/ECrpLqacvUuiYEQElpt7XMJU1nLw5N9lpQinc9afKUEx08FYiI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=e6JhruCp; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="e6JhruCp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749937960; x=1781473960;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ZQhF4emg49y1jyReCPSM39TtvwqqtMn6Kb88IembfPc=;
  b=e6JhruCpKcVCA28jWC7HiyTXpOWBnUYvLpDz265UzKo7vwopWRuAwGSg
   MQbc3wjPKcnlTd7PTIphp2iAYaylNQkM/4gJV9ti+L8bRwokXIuGu96iC
   EBZHKPx3ORrDffWqBRYid6iSOsFz+vYS1pVdBNZ0Cy6pe1j2p7cfyBgrt
   geNQPJ0X3W3jGdB0AMr5M1GDjYp+kJW56ooQmloekWhVOq+dmwIaLxYOa
   DcA96WLQu6e8tDJxAfnBARDRHNGp1SrnvG/S7jilG5kJnV55xcVQT8Yfl
   5i2+KEZaL5f85fvRAnQkeY0fLIbF1y8a328rOnjPhE6eDZOBc/DoSqSWQ
   g==;
X-CSE-ConnectionGUID: tUy+09IpRTejWe8qS8tIlg==
X-CSE-MsgGUID: D+Ds1u3nTPOAX35q3CwMCA==
X-IronPort-AV: E=McAfee;i="6800,10657,11464"; a="52217167"
X-IronPort-AV: E=Sophos;i="6.16,237,1744095600"; 
   d="scan'208";a="52217167"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jun 2025 14:52:37 -0700
X-CSE-ConnectionGUID: ieJMB9NgQlCGwAu3RJNvuA==
X-CSE-MsgGUID: 6uGjrxFxT6W+E9de/cYbGw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,237,1744095600"; 
   d="scan'208";a="148594283"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 14 Jun 2025 14:52:37 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uQYni-000DtE-0k;
	Sat, 14 Jun 2025 21:52:34 +0000
Date: Sun, 15 Jun 2025 05:52:16 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v4 1/1] ARM: dts: aspeed: Add device tree for Nvidia's
 GB200 UT3.0b platform BMC
Message-ID: <202506150521.IdMMG4O0-lkp@intel.com>
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
In-Reply-To: <20250611013025.2898412-2-donalds@nvidia.com>
References: <20250611013025.2898412-2-donalds@nvidia.com>
TO: Donald Shannon <donalds@nvidia.com>
TO: robh@kernel.org
TO: krzk+dt@kernel.org
TO: conor+dt@kernel.org
CC: joel@jms.id.au
CC: andrew@codeconstruct.com.au
CC: devicetree@vger.kernel.org
CC: linux-arm-kernel@lists.infradead.org
CC: linux-aspeed@lists.ozlabs.org
CC: linux-kernel@vger.kernel.org
CC: etanous@nvidia.com
CC: Donald Shannon <donalds@nvidia.com>

Hi Donald,

kernel test robot noticed the following build warnings:

[auto build test WARNING on next-20250610]
[cannot apply to robh/for-next v6.16-rc1 v6.15 v6.15-rc7 linus/master v6.16-rc1]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Donald-Shannon/ARM-dts-aspeed-Add-device-tree-for-Nvidia-s-GB200-UT3-0b-platform-BMC/20250611-104321
base:   next-20250610
patch link:    https://lore.kernel.org/r/20250611013025.2898412-2-donalds%40nvidia.com
patch subject: [PATCH v4 1/1] ARM: dts: aspeed: Add device tree for Nvidia's GB200 UT3.0b platform BMC
:::::: branch date: 4 days ago
:::::: commit date: 4 days ago
config: arm-randconfig-051-20250612 (https://download.01.org/0day-ci/archive/20250615/202506150521.IdMMG4O0-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
dtschema version: 2025.3.dev28+g49451a5
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250615/202506150521.IdMMG4O0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202506150521.IdMMG4O0-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-gb200-ut30b.dtb: timer (arm,armv7-timer): 'clocks' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/timer/arm,arch_timer.yaml#
>> arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-gb200-ut30b.dtb: /sdram@1e6e0000: failed to match any schema with compatible: ['aspeed,ast2600-sdram-edac', 'syscon']
>> arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-gb200-ut30b.dtb: bus@1e600000 (aspeed,ast2600-ahbc): compatible: ['aspeed,ast2600-ahbc', 'syscon'] is too long
   	from schema $id: http://devicetree.org/schemas/bus/aspeed,ast2600-ahbc.yaml#
>> arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-gb200-ut30b.dtb: syscon@1e6e2000 (aspeed,ast2600-scu): 'smp-memram@180' does not match any of the regexes: '^interrupt-controller@[0-9a-f]+$', '^p2a-control@[0-9a-f]+$', '^pinctrl(@[0-9a-f]+)?$', '^pinctrl-[0-9]+$', '^silicon-id@[0-9a-f]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/aspeed,ast2x00-scu.yaml#
>> arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-gb200-ut30b.dtb: /ahb/apb@1e6e0000/syscon@1e6e2000/smp-memram@180: failed to match any schema with compatible: ['aspeed,ast2600-smpmem']
>> arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-gb200-ut30b.dtb: /ahb/apb@1e6e0000/display@1e6e6000: failed to match any schema with compatible: ['aspeed,ast2600-gfx', 'syscon']
>> arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-gb200-ut30b.dtb: adc@1e6e9000 (aspeed,ast2600-adc0): 'interrupts' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/iio/adc/aspeed,ast2600-adc.yaml#
>> arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-gb200-ut30b.dtb: adc@1e6e9100 (aspeed,ast2600-adc1): 'interrupts' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/iio/adc/aspeed,ast2600-adc.yaml#
>> arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-gb200-ut30b.dtb: crypto@1e6fa000 (aspeed,ast2600-acry): 'aspeed,ahbc' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/crypto/aspeed,ast2600-acry.yaml#
>> arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-gb200-ut30b.dtb: sdc@1e740000 (aspeed,ast2600-sd-controller): sdhci@1e740100:compatible: ['aspeed,ast2600-sdhci', 'sdhci'] is too long
   	from schema $id: http://devicetree.org/schemas/mmc/aspeed,sdhci.yaml#
>> arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-gb200-ut30b.dtb: sdc@1e740000 (aspeed,ast2600-sd-controller): sdhci@1e740200:compatible: ['aspeed,ast2600-sdhci', 'sdhci'] is too long
   	from schema $id: http://devicetree.org/schemas/mmc/aspeed,sdhci.yaml#
>> arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-gb200-ut30b.dtb: /ahb/sdc@1e740000/sdhci@1e740100: failed to match any schema with compatible: ['aspeed,ast2600-sdhci', 'sdhci']
>> arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-gb200-ut30b.dtb: /ahb/sdc@1e740000/sdhci@1e740200: failed to match any schema with compatible: ['aspeed,ast2600-sdhci', 'sdhci']
>> arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-gb200-ut30b.dtb: /ahb/apb@1e780000/timer@1e782000: failed to match any schema with compatible: ['aspeed,ast2600-timer']
>> arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-gb200-ut30b.dtb: lpc@1e789000 (aspeed,ast2600-lpc-v2): reg-io-width: 4 is not of type 'object'
   	from schema $id: http://devicetree.org/schemas/mfd/aspeed-lpc.yaml#
>> arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-gb200-ut30b.dtb: lpc@1e789000 (aspeed,ast2600-lpc-v2): lpc-snoop@80: 'clocks' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/aspeed-lpc.yaml#
>> arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-gb200-ut30b.dtb: kcs@24 (aspeed,ast2500-kcs-bmc-v2): 'clocks' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/ipmi/aspeed,ast2400-kcs-bmc.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-gb200-ut30b.dtb: kcs@28 (aspeed,ast2500-kcs-bmc-v2): 'clocks' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/ipmi/aspeed,ast2400-kcs-bmc.yaml#
>> arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-gb200-ut30b.dtb: kcs@2c (aspeed,ast2500-kcs-bmc-v2): 'clocks' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/ipmi/aspeed,ast2400-kcs-bmc.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-gb200-ut30b.dtb: kcs@114 (aspeed,ast2500-kcs-bmc-v2): 'clocks' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/ipmi/aspeed,ast2400-kcs-bmc.yaml#
>> arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-gb200-ut30b.dtb: /ahb/apb@1e780000/lpc@1e789000/lhc@a0: failed to match any schema with compatible: ['aspeed,ast2600-lhc']
>> arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-gb200-ut30b.dtb: /ahb/apb@1e780000/lpc@1e789000/ibt@140: failed to match any schema with compatible: ['aspeed,ast2600-ibt-bmc']
>> arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-gb200-ut30b.dtb: fsi@1e79b000 (aspeed,ast2600-fsi-master): compatible: ['aspeed,ast2600-fsi-master', 'fsi-master'] is too long
   	from schema $id: http://devicetree.org/schemas/fsi/aspeed,ast2600-fsi-master.yaml#
>> arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-gb200-ut30b.dtb: /ahb/apb@1e790000/fsi@1e79b000: failed to match any schema with compatible: ['aspeed,ast2600-fsi-master', 'fsi-master']
>> arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-gb200-ut30b.dtb: fsi@1e79b100 (aspeed,ast2600-fsi-master): compatible: ['aspeed,ast2600-fsi-master', 'fsi-master'] is too long
   	from schema $id: http://devicetree.org/schemas/fsi/aspeed,ast2600-fsi-master.yaml#
>> arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-gb200-ut30b.dtb: /ahb/apb@1e790000/fsi@1e79b100: failed to match any schema with compatible: ['aspeed,ast2600-fsi-master', 'fsi-master']
>> arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-gb200-ut30b.dtb: /ahb/apb@1e790000/dma-controller@1e79e000: failed to match any schema with compatible: ['aspeed,ast2600-udma']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
