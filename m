Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 806801DF754
	for <oe-kbuild@lists.linux.dev>; Sun, 17 Aug 2025 15:09:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755443375; cv=none; b=sPVOgOMKQrUcPRnbia4lw4cztoyy3KrTszftPIjZjneURPUWu8uc32HVCC5wwWGtj3BLAzByFZ7/HCqPxLq/Ez3bNM4STgrfcyPB8DgDX4fPDYz0TvSRbuajrmvkJ0JD/cTAIM44DFw6dIcKkElqNfXE8LTd/2b1q9rvGkFOFS8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755443375; c=relaxed/simple;
	bh=OIC/K4EJWZxgLkNiHk9jTRSVKgrtPbdVyYakVgTrwBs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=sIZaWgFp+X8T3M3dlJHDZMFS591zWDMWO1Eiw/QffU61jjhUFAus7ecTO/PNAKq8dMC9QzMarnsyv9fjqLIDiMUxJbMHnHsIP/Zyc2HcvA21zWuqECv5EnLFgZENLeqZ6QtRBKVVug2nlRQ6mr9Ri9YjNUHfaklHuf2hDiBKiCw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Q+00Yf2Y; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Q+00Yf2Y"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755443372; x=1786979372;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=OIC/K4EJWZxgLkNiHk9jTRSVKgrtPbdVyYakVgTrwBs=;
  b=Q+00Yf2Y4cLxoTn9qY40afiblsLZJfH45C2+FY1nAEZfde35Uc23S0wR
   oDwfXA5esXVCrDWHiYB4iiiZfDMgAY91ajBc+BUQLQI+Cc7YhoBqQDY8w
   M2ywfLdkY3pmFaYexfmkOz0TdE6pnVINtMKJKOeZ6N10etpWy6eYZ4GsE
   11e8LCcjXaxHDV7BACi/Vy3MA78xuHfXmMtKeOR6pgmezafIFLJdhkPYv
   p1wmBAsBLe9LnDtHGaXrwi9o7EYjEMuYtyOBCk9YdfRgiLUOF8pWGqsVV
   h70Ppt5VmVQw7pweDMeMntEukQdmEdKFC1l76upWbeRLUjID3kd4CmmB8
   g==;
X-CSE-ConnectionGUID: VlCIlxX5TN+Of1KdQn65xA==
X-CSE-MsgGUID: /aOXu2B/R3qZmlAKE6G/Iw==
X-IronPort-AV: E=McAfee;i="6800,10657,11524"; a="45254684"
X-IronPort-AV: E=Sophos;i="6.17,293,1747724400"; 
   d="scan'208";a="45254684"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Aug 2025 08:09:32 -0700
X-CSE-ConnectionGUID: pLTecWCeS0GbjeoIO1FyTA==
X-CSE-MsgGUID: KU4RV574TXyU1Dtma4L4LQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,293,1747724400"; 
   d="scan'208";a="166881855"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by fmviesa007.fm.intel.com with ESMTP; 17 Aug 2025 08:09:30 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1unf0g-000DZX-1H;
	Sun, 17 Aug 2025 15:09:26 +0000
Date: Sun, 17 Aug 2025 23:09:25 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v4 3/4] dt-bindings: hwmon: Move max31785 compatibles to
 max31790 document
Message-ID: <202508172243.9dmmYpJP-lkp@intel.com>
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
In-Reply-To: <20250815194730.41695-4-eajames@linux.ibm.com>
References: <20250815194730.41695-4-eajames@linux.ibm.com>
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

[auto build test WARNING on robh/for-next]
[also build test WARNING on groeck-staging/hwmon-next jic23-iio/togreg linus/master v6.17-rc1 next-20250815]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Eddie-James/dt-bindings-arm-aspeed-add-IBM-Balcones-board/20250816-035100
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20250815194730.41695-4-eajames%40linux.ibm.com
patch subject: [PATCH v4 3/4] dt-bindings: hwmon: Move max31785 compatibles to max31790 document
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: arm-randconfig-051-20250816 (https://download.01.org/0day-ci/archive/20250817/202508172243.9dmmYpJP-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 8.5.0
dtschema version: 2025.6.2.dev4+g8f79ddd
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250817/202508172243.9dmmYpJP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202508172243.9dmmYpJP-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-bonnell.dtb: /ahb/apb/lpc@1e789000/lhc@a0: failed to match any schema with compatible: ['aspeed,ast2600-lhc']
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-bonnell.dtb: /ahb/apb/lpc@1e789000/ibt@140: failed to match any schema with compatible: ['aspeed,ast2600-ibt-bmc']
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-bonnell.dtb: sdc@1e740000 (aspeed,ast2600-sd-controller): sdhci@1e740100:compatible: ['aspeed,ast2600-sdhci', 'sdhci'] is too long
   	from schema $id: http://devicetree.org/schemas/mmc/aspeed,sdhci.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-bonnell.dtb: sdc@1e740000 (aspeed,ast2600-sd-controller): sdhci@1e740200:compatible: ['aspeed,ast2600-sdhci', 'sdhci'] is too long
   	from schema $id: http://devicetree.org/schemas/mmc/aspeed,sdhci.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-bonnell.dtb: /ahb/apb/sdc@1e740000/sdhci@1e740100: failed to match any schema with compatible: ['aspeed,ast2600-sdhci', 'sdhci']
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-bonnell.dtb: /ahb/apb/sdc@1e740000/sdhci@1e740200: failed to match any schema with compatible: ['aspeed,ast2600-sdhci', 'sdhci']
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-bonnell.dtb: tca9554@20 (ti,tca9554): '#address-cells', '#size-cells' do not match any of the regexes: '^(hog-[0-9]+|.+-hog(-[0-9]+)?)$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-pca95xx.yaml#
>> arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-bonnell.dtb: max31785@52 (maxim,max31785a): '#address-cells', '#size-cells', 'fan@0', 'fan@1' do not match any of the regexes: '^fan-[0-9]+$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/hwmon/maxim,max31790.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-bonnell.dtb: /ahb/apb/bus@1e78a000/i2c@400/max31785@52/fan@0: failed to match any schema with compatible: ['pmbus-fan']
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-bonnell.dtb: /ahb/apb/bus@1e78a000/i2c@400/max31785@52/fan@1: failed to match any schema with compatible: ['pmbus-fan']
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-bonnell.dtb: tca9554@20 (ti,tca9554): '#address-cells', '#size-cells' do not match any of the regexes: '^(hog-[0-9]+|.+-hog(-[0-9]+)?)$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-pca95xx.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-bonnell.dtb: pca9849@75 (nxp,pca9849): $nodename:0: 'pca9849@75' does not match '^(i2c-?)?mux'
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mux-pca954x.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-bonnell.dtb: pca9849@75 (nxp,pca9849): Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'i2c@0', 'i2c@1', 'i2c@2', 'i2c@3' were unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mux-pca954x.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-bonnell.dtb: fsi@1e79b000 (aspeed,ast2600-fsi-master): compatible: ['aspeed,ast2600-fsi-master', 'fsi-master'] is too long
--
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-everest.dtb: pca9552@32 (ibm,pca9552): 'led@10', 'led@11', 'led@12', 'led@13', 'led@14', 'led@15' do not match any of the regexes: '^led@[0-9a-f]$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/leds/nxp,pca955x.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-everest.dtb: pca9552@33 (ibm,pca9552): 'led@10', 'led@11', 'led@12', 'led@13', 'led@14', 'led@15' do not match any of the regexes: '^led@[0-9a-f]$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/leds/nxp,pca955x.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-everest.dtb: pca9552@30 (ibm,pca9552): 'led@10', 'led@11', 'led@12', 'led@13', 'led@14', 'led@15' do not match any of the regexes: '^led@[0-9a-f]$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/leds/nxp,pca955x.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-everest.dtb: pca9552@34 (ibm,pca9552): 'led@10', 'led@11', 'led@12', 'led@13', 'led@14', 'led@15' do not match any of the regexes: '^led@[0-9a-f]$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/leds/nxp,pca955x.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-everest.dtb: pca9552@35 (ibm,pca9552): 'led@10', 'led@11', 'led@12', 'led@13', 'led@14', 'led@15' do not match any of the regexes: '^led@[0-9a-f]$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/leds/nxp,pca955x.yaml#
>> arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-everest.dtb: max31785@52 (maxim,max31785a): '#address-cells', '#size-cells', 'fan@0', 'fan@1', 'fan@2', 'fan@3' do not match any of the regexes: '^fan-[0-9]+$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/hwmon/maxim,max31790.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-everest.dtb: /ahb/apb/bus@1e78a000/i2c@780/i2c-mux@70/i2c@3/max31785@52/fan@0: failed to match any schema with compatible: ['pmbus-fan']
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-everest.dtb: /ahb/apb/bus@1e78a000/i2c@780/i2c-mux@70/i2c@3/max31785@52/fan@1: failed to match any schema with compatible: ['pmbus-fan']
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-everest.dtb: /ahb/apb/bus@1e78a000/i2c@780/i2c-mux@70/i2c@3/max31785@52/fan@2: failed to match any schema with compatible: ['pmbus-fan']
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-everest.dtb: /ahb/apb/bus@1e78a000/i2c@780/i2c-mux@70/i2c@3/max31785@52/fan@3: failed to match any schema with compatible: ['pmbus-fan']
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-everest.dtb: pca9552@60 (nxp,pca9552): 'led@10', 'led@11', 'led@12', 'led@13' do not match any of the regexes: '^led@[0-9a-f]$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/leds/nxp,pca955x.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-everest.dtb: fsi@1e79b000 (aspeed,ast2600-fsi-master): compatible: ['aspeed,ast2600-fsi-master', 'fsi-master'] is too long
   	from schema $id: http://devicetree.org/schemas/fsi/aspeed,ast2600-fsi-master.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-everest.dtb: /ahb/apb/fsi@1e79b000: failed to match any schema with compatible: ['aspeed,ast2600-fsi-master', 'fsi-master']
--
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-fuji.dtb: /ahb/apb/lpc@1e789000/lhc@a0: failed to match any schema with compatible: ['aspeed,ast2600-lhc']
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-fuji.dtb: /ahb/apb/lpc@1e789000/ibt@140: failed to match any schema with compatible: ['aspeed,ast2600-ibt-bmc']
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-fuji.dtb: sdc@1e740000 (aspeed,ast2600-sd-controller): sdhci@1e740100:compatible: ['aspeed,ast2600-sdhci', 'sdhci'] is too long
   	from schema $id: http://devicetree.org/schemas/mmc/aspeed,sdhci.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-fuji.dtb: sdc@1e740000 (aspeed,ast2600-sd-controller): sdhci@1e740200:compatible: ['aspeed,ast2600-sdhci', 'sdhci'] is too long
   	from schema $id: http://devicetree.org/schemas/mmc/aspeed,sdhci.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-fuji.dtb: /ahb/apb/sdc@1e740000/sdhci@1e740100: failed to match any schema with compatible: ['aspeed,ast2600-sdhci', 'sdhci']
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-fuji.dtb: /ahb/apb/sdc@1e740000/sdhci@1e740200: failed to match any schema with compatible: ['aspeed,ast2600-sdhci', 'sdhci']
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-fuji.dtb: i2c-mux@70 (nxp,pca9546): Unevaluated properties are not allowed ('reset-gpio' was unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mux-pca954x.yaml#
>> arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-fuji.dtb: pwm@52 (maxim,max31785a): '#address-cells', '#size-cells' do not match any of the regexes: '^fan-[0-9]+$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/hwmon/maxim,max31790.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-fuji.dtb: fsi@1e79b000 (aspeed,ast2600-fsi-master): compatible: ['aspeed,ast2600-fsi-master', 'fsi-master'] is too long
   	from schema $id: http://devicetree.org/schemas/fsi/aspeed,ast2600-fsi-master.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-fuji.dtb: /ahb/apb/fsi@1e79b000: failed to match any schema with compatible: ['aspeed,ast2600-fsi-master', 'fsi-master']
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-fuji.dtb: fsi@1e79b100 (aspeed,ast2600-fsi-master): compatible: ['aspeed,ast2600-fsi-master', 'fsi-master'] is too long
   	from schema $id: http://devicetree.org/schemas/fsi/aspeed,ast2600-fsi-master.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-fuji.dtb: /ahb/apb/fsi@1e79b100: failed to match any schema with compatible: ['aspeed,ast2600-fsi-master', 'fsi-master']
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-fuji.dtb: /ahb/apb/dma-controller@1e79e000: failed to match any schema with compatible: ['aspeed,ast2600-udma']
--
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier.dtb: /ahb/apb/sdc@1e740000/sdhci@1e740100: failed to match any schema with compatible: ['aspeed,ast2600-sdhci', 'sdhci']
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier.dtb: /ahb/apb/sdc@1e740000/sdhci@1e740200: failed to match any schema with compatible: ['aspeed,ast2600-sdhci', 'sdhci']
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier.dtb: tca9554@20 (ti,tca9554): '#address-cells', '#size-cells' do not match any of the regexes: '^(hog-[0-9]+|.+-hog(-[0-9]+)?)$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-pca95xx.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier.dtb: pca9552@31 (ibm,pca9552): 'led@10', 'led@11', 'led@12', 'led@13', 'led@14', 'led@15' do not match any of the regexes: '^led@[0-9a-f]$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/leds/nxp,pca955x.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier.dtb: pca9552@32 (ibm,pca9552): 'led@10', 'led@11', 'led@12', 'led@13', 'led@14', 'led@15' do not match any of the regexes: '^led@[0-9a-f]$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/leds/nxp,pca955x.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier.dtb: pca9552@33 (ibm,pca9552): 'led@10', 'led@11', 'led@12', 'led@13', 'led@14', 'led@15' do not match any of the regexes: '^led@[0-9a-f]$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/leds/nxp,pca955x.yaml#
>> arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier.dtb: max31785@52 (maxim,max31785a): '#address-cells', '#size-cells', 'fan@0', 'fan@1', 'fan@2', 'fan@3', 'fan@4', 'fan@5' do not match any of the regexes: '^fan-[0-9]+$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/hwmon/maxim,max31790.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier.dtb: /ahb/apb/bus@1e78a000/i2c@400/max31785@52/fan@0: failed to match any schema with compatible: ['pmbus-fan']
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier.dtb: /ahb/apb/bus@1e78a000/i2c@400/max31785@52/fan@1: failed to match any schema with compatible: ['pmbus-fan']
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier.dtb: /ahb/apb/bus@1e78a000/i2c@400/max31785@52/fan@2: failed to match any schema with compatible: ['pmbus-fan']
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier.dtb: /ahb/apb/bus@1e78a000/i2c@400/max31785@52/fan@3: failed to match any schema with compatible: ['pmbus-fan']
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier.dtb: /ahb/apb/bus@1e78a000/i2c@400/max31785@52/fan@4: failed to match any schema with compatible: ['pmbus-fan']
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier.dtb: /ahb/apb/bus@1e78a000/i2c@400/max31785@52/fan@5: failed to match any schema with compatible: ['pmbus-fan']
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier.dtb: fsi@1e79b000 (aspeed,ast2600-fsi-master): compatible: ['aspeed,ast2600-fsi-master', 'fsi-master'] is too long
   	from schema $id: http://devicetree.org/schemas/fsi/aspeed,ast2600-fsi-master.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier.dtb: /ahb/apb/fsi@1e79b000: failed to match any schema with compatible: ['aspeed,ast2600-fsi-master', 'fsi-master']
--
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier-1s4u.dtb: /ahb/apb/sdc@1e740000/sdhci@1e740100: failed to match any schema with compatible: ['aspeed,ast2600-sdhci', 'sdhci']
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier-1s4u.dtb: /ahb/apb/sdc@1e740000/sdhci@1e740200: failed to match any schema with compatible: ['aspeed,ast2600-sdhci', 'sdhci']
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier-1s4u.dtb: tca9554@20 (ti,tca9554): '#address-cells', '#size-cells' do not match any of the regexes: '^(hog-[0-9]+|.+-hog(-[0-9]+)?)$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-pca95xx.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier-1s4u.dtb: pca9552@31 (ibm,pca9552): 'led@10', 'led@11', 'led@12', 'led@13', 'led@14', 'led@15' do not match any of the regexes: '^led@[0-9a-f]$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/leds/nxp,pca955x.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier-1s4u.dtb: pca9552@32 (ibm,pca9552): 'led@10', 'led@11', 'led@12', 'led@13', 'led@14', 'led@15' do not match any of the regexes: '^led@[0-9a-f]$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/leds/nxp,pca955x.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier-1s4u.dtb: pca9552@33 (ibm,pca9552): 'led@10', 'led@11', 'led@12', 'led@13', 'led@14', 'led@15' do not match any of the regexes: '^led@[0-9a-f]$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/leds/nxp,pca955x.yaml#
>> arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier-1s4u.dtb: max31785@52 (maxim,max31785a): '#address-cells', '#size-cells', 'fan@0', 'fan@1', 'fan@2', 'fan@3', 'fan@4', 'fan@5' do not match any of the regexes: '^fan-[0-9]+$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/hwmon/maxim,max31790.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier-1s4u.dtb: /ahb/apb/bus@1e78a000/i2c@400/max31785@52/fan@0: failed to match any schema with compatible: ['pmbus-fan']
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier-1s4u.dtb: /ahb/apb/bus@1e78a000/i2c@400/max31785@52/fan@1: failed to match any schema with compatible: ['pmbus-fan']
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier-1s4u.dtb: /ahb/apb/bus@1e78a000/i2c@400/max31785@52/fan@2: failed to match any schema with compatible: ['pmbus-fan']
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier-1s4u.dtb: /ahb/apb/bus@1e78a000/i2c@400/max31785@52/fan@3: failed to match any schema with compatible: ['pmbus-fan']
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier-1s4u.dtb: /ahb/apb/bus@1e78a000/i2c@400/max31785@52/fan@4: failed to match any schema with compatible: ['pmbus-fan']
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier-1s4u.dtb: /ahb/apb/bus@1e78a000/i2c@400/max31785@52/fan@5: failed to match any schema with compatible: ['pmbus-fan']
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier-1s4u.dtb: fsi@1e79b000 (aspeed,ast2600-fsi-master): compatible: ['aspeed,ast2600-fsi-master', 'fsi-master'] is too long
   	from schema $id: http://devicetree.org/schemas/fsi/aspeed,ast2600-fsi-master.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier-1s4u.dtb: /ahb/apb/fsi@1e79b000: failed to match any schema with compatible: ['aspeed,ast2600-fsi-master', 'fsi-master']
--
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier-4u.dtb: /ahb/apb/sdc@1e740000/sdhci@1e740100: failed to match any schema with compatible: ['aspeed,ast2600-sdhci', 'sdhci']
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier-4u.dtb: /ahb/apb/sdc@1e740000/sdhci@1e740200: failed to match any schema with compatible: ['aspeed,ast2600-sdhci', 'sdhci']
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier-4u.dtb: tca9554@20 (ti,tca9554): '#address-cells', '#size-cells' do not match any of the regexes: '^(hog-[0-9]+|.+-hog(-[0-9]+)?)$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-pca95xx.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier-4u.dtb: pca9552@31 (ibm,pca9552): 'led@10', 'led@11', 'led@12', 'led@13', 'led@14', 'led@15' do not match any of the regexes: '^led@[0-9a-f]$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/leds/nxp,pca955x.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier-4u.dtb: pca9552@32 (ibm,pca9552): 'led@10', 'led@11', 'led@12', 'led@13', 'led@14', 'led@15' do not match any of the regexes: '^led@[0-9a-f]$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/leds/nxp,pca955x.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier-4u.dtb: pca9552@33 (ibm,pca9552): 'led@10', 'led@11', 'led@12', 'led@13', 'led@14', 'led@15' do not match any of the regexes: '^led@[0-9a-f]$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/leds/nxp,pca955x.yaml#
>> arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier-4u.dtb: max31785@52 (maxim,max31785a): '#address-cells', '#size-cells', 'fan@0', 'fan@1', 'fan@2', 'fan@3', 'fan@4', 'fan@5' do not match any of the regexes: '^fan-[0-9]+$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/hwmon/maxim,max31790.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier-4u.dtb: /ahb/apb/bus@1e78a000/i2c@400/max31785@52/fan@0: failed to match any schema with compatible: ['pmbus-fan']
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier-4u.dtb: /ahb/apb/bus@1e78a000/i2c@400/max31785@52/fan@1: failed to match any schema with compatible: ['pmbus-fan']
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier-4u.dtb: /ahb/apb/bus@1e78a000/i2c@400/max31785@52/fan@2: failed to match any schema with compatible: ['pmbus-fan']
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier-4u.dtb: /ahb/apb/bus@1e78a000/i2c@400/max31785@52/fan@3: failed to match any schema with compatible: ['pmbus-fan']
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier-4u.dtb: /ahb/apb/bus@1e78a000/i2c@400/max31785@52/fan@4: failed to match any schema with compatible: ['pmbus-fan']
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier-4u.dtb: /ahb/apb/bus@1e78a000/i2c@400/max31785@52/fan@5: failed to match any schema with compatible: ['pmbus-fan']
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier-4u.dtb: fsi@1e79b000 (aspeed,ast2600-fsi-master): compatible: ['aspeed,ast2600-fsi-master', 'fsi-master'] is too long
   	from schema $id: http://devicetree.org/schemas/fsi/aspeed,ast2600-fsi-master.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier-4u.dtb: /ahb/apb/fsi@1e79b000: failed to match any schema with compatible: ['aspeed,ast2600-fsi-master', 'fsi-master']
--
   arch/arm/boot/dts/aspeed/aspeed-bmc-opp-tacoma.dtb: sdc@1e740000 (aspeed,ast2600-sd-controller): sdhci@1e740200:compatible: ['aspeed,ast2600-sdhci', 'sdhci'] is too long
   	from schema $id: http://devicetree.org/schemas/mmc/aspeed,sdhci.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-opp-tacoma.dtb: /ahb/apb/sdc@1e740000/sdhci@1e740100: failed to match any schema with compatible: ['aspeed,ast2600-sdhci', 'sdhci']
   arch/arm/boot/dts/aspeed/aspeed-bmc-opp-tacoma.dtb: /ahb/apb/sdc@1e740000/sdhci@1e740200: failed to match any schema with compatible: ['aspeed,ast2600-sdhci', 'sdhci']
   arch/arm/boot/dts/aspeed/aspeed-bmc-opp-tacoma.dtb: bmp280@77 (bosch,bmp280): '#io-channel-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/iio/pressure/bmp085.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-opp-tacoma.dtb: bmp280@77 (bosch,bmp280): 'vddd-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/iio/pressure/bmp085.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-opp-tacoma.dtb: bmp280@77 (bosch,bmp280): 'vdda-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/iio/pressure/bmp085.yaml#
>> arch/arm/boot/dts/aspeed/aspeed-bmc-opp-tacoma.dtb: max31785@52 (maxim,max31785a): '#address-cells', '#size-cells', 'fan@0', 'fan@1', 'fan@2', 'fan@3' do not match any of the regexes: '^fan-[0-9]+$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/hwmon/maxim,max31790.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-opp-tacoma.dtb: /ahb/apb/bus@1e78a000/i2c@200/max31785@52/fan@0: failed to match any schema with compatible: ['pmbus-fan']
   arch/arm/boot/dts/aspeed/aspeed-bmc-opp-tacoma.dtb: /ahb/apb/bus@1e78a000/i2c@200/max31785@52/fan@1: failed to match any schema with compatible: ['pmbus-fan']
   arch/arm/boot/dts/aspeed/aspeed-bmc-opp-tacoma.dtb: /ahb/apb/bus@1e78a000/i2c@200/max31785@52/fan@2: failed to match any schema with compatible: ['pmbus-fan']
   arch/arm/boot/dts/aspeed/aspeed-bmc-opp-tacoma.dtb: /ahb/apb/bus@1e78a000/i2c@200/max31785@52/fan@3: failed to match any schema with compatible: ['pmbus-fan']
   arch/arm/boot/dts/aspeed/aspeed-bmc-opp-tacoma.dtb: pca9552@60 (nxp,pca9552): 'gpio@0', 'gpio@1', 'gpio@10', 'gpio@11', 'gpio@12', 'gpio@13', 'gpio@14', 'gpio@15', 'gpio@2', 'gpio@3', 'gpio@4', 'gpio@5', 'gpio@6', 'gpio@7', 'gpio@8', 'gpio@9' do not match any of the regexes: '^led@[0-9a-f]$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/leds/nxp,pca955x.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-opp-tacoma.dtb: /ahb/apb/bus@1e78a000/i2c@280/ir35221@70: failed to match any schema with compatible: ['infineon,ir35221']
   arch/arm/boot/dts/aspeed/aspeed-bmc-opp-tacoma.dtb: /ahb/apb/bus@1e78a000/i2c@280/ir35221@71: failed to match any schema with compatible: ['infineon,ir35221']
   arch/arm/boot/dts/aspeed/aspeed-bmc-opp-tacoma.dtb: /ahb/apb/bus@1e78a000/i2c@300/ir35221@70: failed to match any schema with compatible: ['infineon,ir35221']
--
   arch/arm/boot/dts/aspeed/aspeed-bmc-opp-witherspoon.dtb: kcs@114 (aspeed,ast2500-kcs-bmc-v2): 'clocks' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/ipmi/aspeed,ast2400-kcs-bmc.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-opp-witherspoon.dtb: /ahb/apb/lpc@1e789000/lhc@a0: failed to match any schema with compatible: ['aspeed,ast2500-lhc']
   arch/arm/boot/dts/aspeed/aspeed-bmc-opp-witherspoon.dtb: /ahb/apb/lpc@1e789000/ibt@140: failed to match any schema with compatible: ['aspeed,ast2500-ibt-bmc']
   arch/arm/boot/dts/aspeed/aspeed-bmc-opp-witherspoon.dtb: bmp280@77 (bosch,bmp280): '#io-channel-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/iio/pressure/bmp085.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-opp-witherspoon.dtb: bmp280@77 (bosch,bmp280): 'vddd-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/iio/pressure/bmp085.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-opp-witherspoon.dtb: bmp280@77 (bosch,bmp280): 'vdda-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/iio/pressure/bmp085.yaml#
>> arch/arm/boot/dts/aspeed/aspeed-bmc-opp-witherspoon.dtb: max31785@52 (maxim,max31785a): '#address-cells', '#size-cells' do not match any of the regexes: '^fan-[0-9]+$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/hwmon/maxim,max31790.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-opp-witherspoon.dtb: pca9552@60 (nxp,pca9552): 'gpio@0', 'gpio@1', 'gpio@10', 'gpio@11', 'gpio@12', 'gpio@13', 'gpio@14', 'gpio@15', 'gpio@2', 'gpio@3', 'gpio@4', 'gpio@5', 'gpio@6', 'gpio@7', 'gpio@8', 'gpio@9' do not match any of the regexes: '^led@[0-9a-f]$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/leds/nxp,pca955x.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-opp-witherspoon.dtb: /ahb/apb/bus@1e78a000/i2c@140/ir35221@70: failed to match any schema with compatible: ['infineon,ir35221']
   arch/arm/boot/dts/aspeed/aspeed-bmc-opp-witherspoon.dtb: /ahb/apb/bus@1e78a000/i2c@140/ir35221@71: failed to match any schema with compatible: ['infineon,ir35221']
   arch/arm/boot/dts/aspeed/aspeed-bmc-opp-witherspoon.dtb: /ahb/apb/bus@1e78a000/i2c@180/ir35221@70: failed to match any schema with compatible: ['infineon,ir35221']
   arch/arm/boot/dts/aspeed/aspeed-bmc-opp-witherspoon.dtb: /ahb/apb/bus@1e78a000/i2c@180/ir35221@71: failed to match any schema with compatible: ['infineon,ir35221']
   arch/arm/boot/dts/aspeed/aspeed-bmc-opp-witherspoon.dtb: pca9552@60 (nxp,pca9552): 'gpio@0', 'gpio@1', 'gpio@10', 'gpio@11', 'gpio@12', 'gpio@13', 'gpio@14', 'gpio@15', 'gpio@2', 'gpio@3', 'gpio@4', 'gpio@5', 'gpio@6', 'gpio@7', 'gpio@8', 'gpio@9' do not match any of the regexes: '^led@[0-9a-f]$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/leds/nxp,pca955x.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-opp-witherspoon.dtb: leds (gpio-leds): 'fan0', 'fan1', 'fan2', 'fan3', 'front-fault', 'front-id', 'front-power', 'power-button', 'rear-fault', 'rear-id', 'rear-power' do not match any of the regexes: '(^led-[0-9a-f]$|led)', '^pinctrl-[0-9]+$'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
