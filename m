Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DAA92F2F
	for <oe-kbuild@lists.linux.dev>; Sun, 19 Jan 2025 11:32:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737286356; cv=none; b=kqtrj0bSXNEd+2EDw19ZMeHUfWpPzpHEkbMwXA7SQC2Lm4/uDw76C/bbC1MqSeZbNc7Kj/hOAJj11YnzAuYX956SjXtzLgO1Z/0UGd9XYN4RErC4PeWgxqzqEH/VnTrUOLYSKcuzNMs3MEuVCuVxASPfF6D70VSsI4i4Zdv+iJM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737286356; c=relaxed/simple;
	bh=tFJz9mDwBhN0jJnduydqs/JVaOCVWJrWoEUtJLz/q4c=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=l44nc0Yi1lavNZker1vEM10Avc6sG9Xlpj8n4hF4WK2i40w4MI2qVB8nrruq6q5xPPVW49VswiqLr3KFQgsgFqbSNlnumpe7U1j+Qo6TawVLB005Q7TvJ9Egi+Ta+MdCfkPe0orokMSXBcUvmIiGN10FOR1aUZDcdYQFsRL/3Oo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XM3Q9LGo; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XM3Q9LGo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737286355; x=1768822355;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=tFJz9mDwBhN0jJnduydqs/JVaOCVWJrWoEUtJLz/q4c=;
  b=XM3Q9LGoLC5f+2rZnW+PXNCiKjqp3QsIq2gUxRW8K36maTLOOc7S0pUt
   JtC33xNiFT2jhtYKUlArnRMpa8PZeytA42nmO8Emtu3XwGS8mX4U3nfd1
   4askkofqlyLQmy3Y+JkcQkNNvP0COkZcWB/XTus+DcEx74QygueeguMxT
   fR5Rp+lOgkdbV5P/GhEfV9h2iraYGJt5GZHpQw4pvCDy6CN0yIJtv40yK
   N7oc7b68B2SIttTYHe1Gxa9SmehvMt4Fzm0J07vyfGEXRf5X/Ey5c/n5y
   XAQ00No8VX5rJoWH2oW4eCVQcJvhiWqFoqmPg+Xu17vp1tF1gTBLj6uRK
   A==;
X-CSE-ConnectionGUID: wA4uPPKlTHOsv71gw7zB9A==
X-CSE-MsgGUID: MV+mbtJeSqS4fw77kLm/uA==
X-IronPort-AV: E=McAfee;i="6700,10204,11319"; a="55072411"
X-IronPort-AV: E=Sophos;i="6.13,217,1732608000"; 
   d="scan'208";a="55072411"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jan 2025 03:32:34 -0800
X-CSE-ConnectionGUID: ZtY0z/oRQkC9B6JeXUu8rA==
X-CSE-MsgGUID: YrxCctF6TpSrVPO0YDpksg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="143497377"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 19 Jan 2025 03:32:33 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tZTXa-000VOl-1I;
	Sun, 19 Jan 2025 11:32:30 +0000
Date: Sun, 19 Jan 2025 19:31:30 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [soc:aspeed/dt 54/55]
 arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-system1.dtb:
 /ahb/apb/bus@1e78a000/i2c@180/power-supply@58: failed to match any schema
 with compatible: ['intel,crps185']
Message-ID: <202501191946.FV83aKTo-lkp@intel.com>
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
TO: Ninad Palsule <ninad@linux.ibm.com>
CC: Andrew Jeffery <andrew@codeconstruct.com.au>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git aspeed/dt
head:   3540adcccc7179d243216bf488532a62c37d9007
commit: a80d1ad44487eb2e1e5a71cd7a2d1ccf8200d091 [54/55] ARM: dts: aspeed: system1: Use crps PSU driver
:::::: branch date: 11 days ago
:::::: commit date: 12 days ago
config: arm-randconfig-051-20250118 (https://download.01.org/0day-ci/archive/20250119/202501191946.FV83aKTo-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.2.0
dtschema version: 2024.12.dev6+gc4da38d
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250119/202501191946.FV83aKTo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202501191946.FV83aKTo-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-system1.dtb: /ahb/apb/lpc@1e789000/lhc@a0: failed to match any schema with compatible: ['aspeed,ast2600-lhc']
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-system1.dtb: /ahb/apb/lpc@1e789000/ibt@140: failed to match any schema with compatible: ['aspeed,ast2600-ibt-bmc']
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-system1.dtb: sdc@1e740000: sdhci@1e740100:compatible: ['aspeed,ast2600-sdhci', 'sdhci'] is too long
   	from schema $id: http://devicetree.org/schemas/mmc/aspeed,sdhci.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-system1.dtb: sdc@1e740000: sdhci@1e740200:compatible: ['aspeed,ast2600-sdhci', 'sdhci'] is too long
   	from schema $id: http://devicetree.org/schemas/mmc/aspeed,sdhci.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-system1.dtb: /ahb/apb/sdc@1e740000/sdhci@1e740100: failed to match any schema with compatible: ['aspeed,ast2600-sdhci', 'sdhci']
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-system1.dtb: /ahb/apb/sdc@1e740000/sdhci@1e740200: failed to match any schema with compatible: ['aspeed,ast2600-sdhci', 'sdhci']
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-system1.dtb: led-controller@60: 'led@10', 'led@11', 'led@12', 'led@13', 'led@14', 'led@15' do not match any of the regexes: '^led@[0-9a-f]$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/leds/nxp,pca955x.yaml#
>> arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-system1.dtb: /ahb/apb/bus@1e78a000/i2c@180/power-supply@58: failed to match any schema with compatible: ['intel,crps185']
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-system1.dtb: /ahb/apb/bus@1e78a000/i2c@180/power-supply@59: failed to match any schema with compatible: ['intel,crps185']
>> arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-system1.dtb: /ahb/apb/bus@1e78a000/i2c@180/power-supply@5a: failed to match any schema with compatible: ['intel,crps185']
>> arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-system1.dtb: /ahb/apb/bus@1e78a000/i2c@180/power-supply@5b: failed to match any schema with compatible: ['intel,crps185']
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-system1.dtb: /ahb/apb/bus@1e78a000/i2c@380/fan-controller@52: failed to match any schema with compatible: ['maxim,max31785a']
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-system1.dtb: /ahb/apb/bus@1e78a000/i2c@380/fan-controller@54: failed to match any schema with compatible: ['maxim,max31785a']
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-system1.dtb: tpm@2e: compatible: 'oneOf' conditional failed, one must be fixed:
   	['tcg,tpm-tis-i2c'] is too short
   	'tcg,tpm-tis-i2c' is not one of ['infineon,slb9673', 'nuvoton,npct75x', 'st,st33ktpm2xi2c']
   	'tcg,tpm-tis-i2c' is not one of ['atmel,at97sc3204t', 'infineon,slb9635tt', 'infineon,slb9645tt', 'infineon,tpm_i2c_infineon', 'nuvoton,npct501', 'nuvoton,npct601', 'st,st33zp24-i2c', 'winbond,wpct301']
   	from schema $id: http://devicetree.org/schemas/tpm/tcg,tpm-tis-i2c.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-system1.dtb: tpm@2e: Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/tpm/tcg,tpm-tis-i2c.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-system1.dtb: led-controller@61: 'led@10', 'led@11', 'led@12', 'led@13', 'led@14', 'led@15' do not match any of the regexes: '^led@[0-9a-f]$', 'pinctrl-[0-9]+'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
