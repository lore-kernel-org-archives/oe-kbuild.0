Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E5A627380A
	for <oe-kbuild@lists.linux.dev>; Sat, 27 Sep 2025 16:06:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758989165; cv=none; b=b7BIyNoLAlZseIIzQrb2oWmXuECddScrwvKh4w86fy6MZHisUuszaVshzeGo62MrT2yDFzMAHNHeNpsgDqZnfaKdo+WmS5th0M/RR0RBv1eKi48mtOzNWHMLLZJavXbAMEQsEVZlg9TqhJqXKu8DZ6R/0ylq1JtqOonbG1TS6G8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758989165; c=relaxed/simple;
	bh=camDmyVrD62Zaz1CkuoW3AD7bJHfJkqZOPRrA5MklnE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jI4pc4rs+qbYcFaer4o7RHs+3SRVV95bHCFxWk2fMoh3hpcORmjcpPzL0+0AiKUHPu6m8MWZzOKcEIACaNyXsL94LKhs96isoLjAYg1tLIt3VC14T4JSivQ/wBneuzR9ou41LcFIuG+NyCufr8pEM2VGT4Jh1s1tf80FAziC/20=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mHaEr6er; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mHaEr6er"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758989162; x=1790525162;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=camDmyVrD62Zaz1CkuoW3AD7bJHfJkqZOPRrA5MklnE=;
  b=mHaEr6erRLeqs2Xexd67+nMPLTooCz1YnVbkSnQLrkKRTXSys7JQ8i4x
   t7n7EEa8qFCuspTKvT3GM3ET2jbe8t1bfVaX2jNOmqLyuPOj5fjI9Zj/a
   WR6rGdOg+Hskpj+D4kUOgiXI4GVSCVbNfiGoqe3o/WoW5eoIUvs8wugK8
   dDoMtqCWuZ/wPH0ZL0/XWhhW/cmy+UTBHejZNYspZ3S+WdMRIC5aN/q+K
   IX8hOYtHeXLCpTCaIae3EeWXUZzJBZm6q3XbQGOvXspcKYiJEP4n3zzBW
   zx/X38MNIMIHbe/nqKeQXvsa+bEOeZo6hIZITcphNmTSPnmAIeWNzI1pO
   Q==;
X-CSE-ConnectionGUID: GJEpcxiwQYqPWizwgrVfhQ==
X-CSE-MsgGUID: NQjVicprQOKaPcgQvTEqhw==
X-IronPort-AV: E=McAfee;i="6800,10657,11566"; a="71974786"
X-IronPort-AV: E=Sophos;i="6.18,297,1751266800"; 
   d="scan'208";a="71974786"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Sep 2025 09:06:01 -0700
X-CSE-ConnectionGUID: Cyrwqv0rRx+F8GFAePIg1g==
X-CSE-MsgGUID: OCZV6tYYTNGUvsJxsPwKgQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,297,1751266800"; 
   d="scan'208";a="183028613"
Received: from igk-lkp-server01.igk.intel.com (HELO 0e586ad5e7f7) ([10.91.175.65])
  by orviesa005.jf.intel.com with ESMTP; 27 Sep 2025 09:06:00 -0700
Received: from kbuild by 0e586ad5e7f7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1v2XQr-000000005Wv-0BID;
	Sat, 27 Sep 2025 16:05:57 +0000
Date: Sat, 27 Sep 2025 18:05:47 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH 2/2] dts: aspeed: Add a dts for the nvidia msx4 hpm
Message-ID: <202509271834.cMuDna3H-lkp@intel.com>
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
In-Reply-To: <20250918-msx1_devicetree-v1-2-18dc07e02118@nvidia.com>
References: <20250918-msx1_devicetree-v1-2-18dc07e02118@nvidia.com>
TO: Marc Olberding <molberding@nvidia.com>
TO: Rob Herring <robh@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
TO: Joel Stanley <joel@jms.id.au>
TO: Andrew Jeffery <andrew@codeconstruct.com.au>
CC: devicetree@vger.kernel.org
CC: linux-arm-kernel@lists.infradead.org
CC: linux-aspeed@lists.ozlabs.org
CC: linux-kernel@vger.kernel.org
CC: Marc Olberding <molberding@nvidia.com>

Hi Marc,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 8f5ae30d69d7543eee0d70083daf4de8fe15d585]

url:    https://github.com/intel-lab-lkp/linux/commits/Marc-Olberding/dt-bindings-arm-aspeed-Add-Nvidia-msx4-board/20250919-071432
base:   8f5ae30d69d7543eee0d70083daf4de8fe15d585
patch link:    https://lore.kernel.org/r/20250918-msx1_devicetree-v1-2-18dc07e02118%40nvidia.com
patch subject: [PATCH 2/2] dts: aspeed: Add a dts for the nvidia msx4 hpm
:::::: branch date: 9 days ago
:::::: commit date: 9 days ago
config: arm-randconfig-2051-20250925 (https://download.01.org/0day-ci/archive/20250927/202509271834.cMuDna3H-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 10.5.0
dtschema version: 2025.8
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250927/202509271834.cMuDna3H-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202509271834.cMuDna3H-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   	from schema $id: http://devicetree.org/schemas/mfd/aspeed,ast2x00-scu.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-msx4-bmc.dtb: /ahb/apb/syscon@1e6e2000/smp-memram@180: failed to match any schema with compatible: ['aspeed,ast2600-smpmem']
   arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-msx4-bmc.dtb: /ahb/apb/display@1e6e6000: failed to match any schema with compatible: ['aspeed,ast2600-gfx', 'syscon']
   arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-msx4-bmc.dtb: adc@1e6e9000 (aspeed,ast2600-adc0): 'interrupts' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/iio/adc/aspeed,ast2600-adc.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-msx4-bmc.dtb: adc@1e6e9100 (aspeed,ast2600-adc1): 'interrupts' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/iio/adc/aspeed,ast2600-adc.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-msx4-bmc.dtb: crypto@1e6fa000 (aspeed,ast2600-acry): 'aspeed,ahbc' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/crypto/aspeed,ast2600-acry.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-msx4-bmc.dtb: /ahb/apb/timer@1e782000: failed to match any schema with compatible: ['aspeed,ast2600-timer']
>> arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-msx4-bmc.dtb: lpc@1e789000 (aspeed,ast2600-lpc-v2): reg-io-width: 4 is not of type 'object'
   	from schema $id: http://devicetree.org/schemas/mfd/aspeed-lpc.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-msx4-bmc.dtb: lpc@1e789000 (aspeed,ast2600-lpc-v2): lpc-snoop@80: 'clocks' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/aspeed-lpc.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-msx4-bmc.dtb: kcs@24 (aspeed,ast2500-kcs-bmc-v2): 'clocks' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/ipmi/aspeed,ast2400-kcs-bmc.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-msx4-bmc.dtb: kcs@28 (aspeed,ast2500-kcs-bmc-v2): 'clocks' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/ipmi/aspeed,ast2400-kcs-bmc.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-msx4-bmc.dtb: kcs@2c (aspeed,ast2500-kcs-bmc-v2): 'clocks' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/ipmi/aspeed,ast2400-kcs-bmc.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-msx4-bmc.dtb: kcs@114 (aspeed,ast2500-kcs-bmc-v2): 'clocks' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/ipmi/aspeed,ast2400-kcs-bmc.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-msx4-bmc.dtb: /ahb/apb/lpc@1e789000/lhc@a0: failed to match any schema with compatible: ['aspeed,ast2600-lhc']
   arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-msx4-bmc.dtb: /ahb/apb/lpc@1e789000/ibt@140: failed to match any schema with compatible: ['aspeed,ast2600-ibt-bmc']
>> arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-msx4-bmc.dtb: sdc@1e740000 (aspeed,ast2600-sd-controller): sdhci@1e740100:compatible: ['aspeed,ast2600-sdhci', 'sdhci'] is too long
   	from schema $id: http://devicetree.org/schemas/mmc/aspeed,sdhci.yaml#
>> arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-msx4-bmc.dtb: sdc@1e740000 (aspeed,ast2600-sd-controller): sdhci@1e740200:compatible: ['aspeed,ast2600-sdhci', 'sdhci'] is too long
   	from schema $id: http://devicetree.org/schemas/mmc/aspeed,sdhci.yaml#
>> arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-msx4-bmc.dtb: /ahb/apb/sdc@1e740000/sdhci@1e740100: failed to match any schema with compatible: ['aspeed,ast2600-sdhci', 'sdhci']
>> arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-msx4-bmc.dtb: /ahb/apb/sdc@1e740000/sdhci@1e740200: failed to match any schema with compatible: ['aspeed,ast2600-sdhci', 'sdhci']
>> arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-msx4-bmc.dtb: fsi@1e79b000 (aspeed,ast2600-fsi-master): compatible: ['aspeed,ast2600-fsi-master', 'fsi-master'] is too long
   	from schema $id: http://devicetree.org/schemas/fsi/aspeed,ast2600-fsi-master.yaml#
>> arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-msx4-bmc.dtb: /ahb/apb/fsi@1e79b000: failed to match any schema with compatible: ['aspeed,ast2600-fsi-master', 'fsi-master']
>> arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-msx4-bmc.dtb: fsi@1e79b100 (aspeed,ast2600-fsi-master): compatible: ['aspeed,ast2600-fsi-master', 'fsi-master'] is too long
   	from schema $id: http://devicetree.org/schemas/fsi/aspeed,ast2600-fsi-master.yaml#
>> arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-msx4-bmc.dtb: /ahb/apb/fsi@1e79b100: failed to match any schema with compatible: ['aspeed,ast2600-fsi-master', 'fsi-master']
   arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-msx4-bmc.dtb: /ahb/apb/dma-controller@1e79e000: failed to match any schema with compatible: ['aspeed,ast2600-udma']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
