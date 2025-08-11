Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5894A27E07A
	for <oe-kbuild@lists.linux.dev>; Mon, 11 Aug 2025 13:12:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754917937; cv=none; b=Wx6dxQbex+aLqc260WoNJQjTEg4aMURPwELd7XQFCuEC9dlyThIpSF4H+eFREfCRTRdV+blcVc9Oky8Es5QdiecRaegMq0dhL5nIrfEQ5kpHFOERp2T5JuagzZWcm1DGQhjH7nJ+KQURs1ba2s6eWGiS6PHUO3KArm/ISS16DK8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754917937; c=relaxed/simple;
	bh=1DwOaM9KWpefgB1laAzRnVMiJ6y8DTf8ydEEV7gx2Ew=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=daI8g5EseoJB1GktKFCNyyVySPhYBBUolUNXGjX15Gn/smjXVd8QfaHYIVRniuynPV5PenSAgvMjNSa4vNVL5ElNVTDDrvdvXESFvBv2SGcMfjH/jTNfjUxAQTL0p5KXqVF77YaiMV+JCjhVsmaCXyWab1rCjaVDS5je1jrG81E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iU4Bqqe7; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iU4Bqqe7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754917936; x=1786453936;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1DwOaM9KWpefgB1laAzRnVMiJ6y8DTf8ydEEV7gx2Ew=;
  b=iU4Bqqe7UCCdzrq+fMCuBMWBdER5O/QJMHcTEu18Hpfa85t0cLJ5wB/k
   sBkwQr+oNa/QzvyTpdKEPvO2FXxuSS5mqGU5w+I7+dRpYp1nrDMu/MG7a
   wg+1r+Vj0pKZnclU++DgJF897Q+jgmT3Q5Ie0sFA0bOo/vxmH3ckgyqyb
   bsg1rOXRs6OQ0E84uaTeXCZPWMc8JisTv9X6RazTOy4bx7xxncN+6KyIY
   dXy7qRDQTvePCSwL6uEJyZei6p71E4GAQW8ywWN2Nus1uy0NgW4Y8oKU+
   d3COB0NBPa0J8GzDpUuWlKcgVQKAUdGUuWShqgNoA2rpSiw3Vv//zNJXq
   g==;
X-CSE-ConnectionGUID: cSI4gUQMStWZb0SwN/OAFg==
X-CSE-MsgGUID: ca80lwD4Q2+7F+WpVXiauw==
X-IronPort-AV: E=McAfee;i="6800,10657,11518"; a="68624265"
X-IronPort-AV: E=Sophos;i="6.17,278,1747724400"; 
   d="scan'208";a="68624265"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Aug 2025 06:12:15 -0700
X-CSE-ConnectionGUID: RUotuG30ShmxvfVRA4/j5A==
X-CSE-MsgGUID: Xgrl3BALStigCsCav2W7mw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,278,1747724400"; 
   d="scan'208";a="196756130"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 11 Aug 2025 06:12:11 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ulSJt-0005sa-22;
	Mon, 11 Aug 2025 13:12:09 +0000
Date: Mon, 11 Aug 2025 21:11:47 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v3 4/4] ARM: dts: aspeed: Add Balcones system
Message-ID: <202508112007.7934l3lp-lkp@intel.com>
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
In-Reply-To: <20250806184711.1882725-5-eajames@linux.ibm.com>
References: <20250806184711.1882725-5-eajames@linux.ibm.com>
TO: Eddie James <eajames@linux.ibm.com>
TO: linux-aspeed@lists.ozlabs.org
CC: devicetree@vger.kernel.org
CC: andrew@codeconstruct.com.au
CC: conor+dt@kernel.org
CC: krzk+dt@kernel.org
CC: robh@kernel.org
CC: eajames@linux.ibm.com

Hi Eddie,

kernel test robot noticed the following build warnings:

[auto build test WARNING on linus/master]
[also build test WARNING on v6.16 next-20250808]
[cannot apply to robh/for-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Eddie-James/dt-bindings-arm-aspeed-add-IBM-Balcones-board/20250807-024911
base:   linus/master
patch link:    https://lore.kernel.org/r/20250806184711.1882725-5-eajames%40linux.ibm.com
patch subject: [PATCH v3 4/4] ARM: dts: aspeed: Add Balcones system
:::::: branch date: 5 days ago
:::::: commit date: 5 days ago
config: arm-randconfig-052-20250807 (https://download.01.org/0day-ci/archive/20250811/202508112007.7934l3lp-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 7b8dea265e72c3037b6b1e54d5ab51b7e14f328b)
dtschema version: 2025.6.2.dev4+g8f79ddd
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250811/202508112007.7934l3lp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202508112007.7934l3lp-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-balcones.dtb: timer (arm,armv7-timer): 'clocks' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/timer/arm,arch_timer.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-balcones.dtb: /sdram@1e6e0000: failed to match any schema with compatible: ['aspeed,ast2600-sdram-edac', 'syscon']
>> arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-balcones.dtb: bus@1e600000 (aspeed,ast2600-ahbc): compatible: ['aspeed,ast2600-ahbc', 'syscon'] is too long
   	from schema $id: http://devicetree.org/schemas/bus/aspeed,ast2600-ahbc.yaml#
>> arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-balcones.dtb: syscon@1e6e2000 (aspeed,ast2600-scu): 'smp-memram@180' does not match any of the regexes: '^interrupt-controller@[0-9a-f]+$', '^p2a-control@[0-9a-f]+$', '^pinctrl(@[0-9a-f]+)?$', '^pinctrl-[0-9]+$', '^silicon-id@[0-9a-f]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/aspeed,ast2x00-scu.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-balcones.dtb: /ahb/apb/syscon@1e6e2000/smp-memram@180: failed to match any schema with compatible: ['aspeed,ast2600-smpmem']
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-balcones.dtb: /ahb/apb/display@1e6e6000: failed to match any schema with compatible: ['aspeed,ast2600-gfx', 'syscon']
>> arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-balcones.dtb: adc@1e6e9000 (aspeed,ast2600-adc0): 'interrupts' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/iio/adc/aspeed,ast2600-adc.yaml#
>> arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-balcones.dtb: adc@1e6e9100 (aspeed,ast2600-adc1): 'interrupts' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/iio/adc/aspeed,ast2600-adc.yaml#
>> arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-balcones.dtb: crypto@1e6fa000 (aspeed,ast2600-acry): 'aspeed,ahbc' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/crypto/aspeed,ast2600-acry.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-balcones.dtb: /ahb/apb/timer@1e782000: failed to match any schema with compatible: ['aspeed,ast2600-timer']
>> arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-balcones.dtb: lpc@1e789000 (aspeed,ast2600-lpc-v2): reg-io-width: 4 is not of type 'object'
   	from schema $id: http://devicetree.org/schemas/mfd/aspeed-lpc.yaml#
>> arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-balcones.dtb: lpc@1e789000 (aspeed,ast2600-lpc-v2): lpc-snoop@80: 'clocks' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/aspeed-lpc.yaml#
>> arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-balcones.dtb: kcs@24 (aspeed,ast2500-kcs-bmc-v2): 'clocks' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/ipmi/aspeed,ast2400-kcs-bmc.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-balcones.dtb: kcs@28 (aspeed,ast2500-kcs-bmc-v2): 'clocks' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/ipmi/aspeed,ast2400-kcs-bmc.yaml#
>> arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-balcones.dtb: kcs@2c (aspeed,ast2500-kcs-bmc-v2): 'clocks' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/ipmi/aspeed,ast2400-kcs-bmc.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-balcones.dtb: kcs@114 (aspeed,ast2500-kcs-bmc-v2): 'clocks' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/ipmi/aspeed,ast2400-kcs-bmc.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-balcones.dtb: /ahb/apb/lpc@1e789000/lhc@a0: failed to match any schema with compatible: ['aspeed,ast2600-lhc']
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-balcones.dtb: /ahb/apb/lpc@1e789000/ibt@140: failed to match any schema with compatible: ['aspeed,ast2600-ibt-bmc']
>> arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-balcones.dtb: sdc@1e740000 (aspeed,ast2600-sd-controller): sdhci@1e740100:compatible: ['aspeed,ast2600-sdhci', 'sdhci'] is too long
   	from schema $id: http://devicetree.org/schemas/mmc/aspeed,sdhci.yaml#
>> arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-balcones.dtb: sdc@1e740000 (aspeed,ast2600-sd-controller): sdhci@1e740200:compatible: ['aspeed,ast2600-sdhci', 'sdhci'] is too long
   	from schema $id: http://devicetree.org/schemas/mmc/aspeed,sdhci.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-balcones.dtb: /ahb/apb/sdc@1e740000/sdhci@1e740100: failed to match any schema with compatible: ['aspeed,ast2600-sdhci', 'sdhci']
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-balcones.dtb: /ahb/apb/sdc@1e740000/sdhci@1e740200: failed to match any schema with compatible: ['aspeed,ast2600-sdhci', 'sdhci']
>> arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-balcones.dtb: fsi@1e79b000 (aspeed,ast2600-fsi-master): compatible: ['aspeed,ast2600-fsi-master', 'fsi-master'] is too long
   	from schema $id: http://devicetree.org/schemas/fsi/aspeed,ast2600-fsi-master.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-balcones.dtb: /ahb/apb/fsi@1e79b000: failed to match any schema with compatible: ['aspeed,ast2600-fsi-master', 'fsi-master']
>> arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-balcones.dtb: fsi@1e79b100 (aspeed,ast2600-fsi-master): compatible: ['aspeed,ast2600-fsi-master', 'fsi-master'] is too long
   	from schema $id: http://devicetree.org/schemas/fsi/aspeed,ast2600-fsi-master.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-balcones.dtb: /ahb/apb/fsi@1e79b100: failed to match any schema with compatible: ['aspeed,ast2600-fsi-master', 'fsi-master']
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-balcones.dtb: /ahb/apb/dma-controller@1e79e000: failed to match any schema with compatible: ['aspeed,ast2600-udma']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
