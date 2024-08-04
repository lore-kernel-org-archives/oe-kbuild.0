Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F8E4EAC6
	for <oe-kbuild@lists.linux.dev>; Sun,  4 Aug 2024 19:47:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722800879; cv=none; b=hsx7ncIRjQNKYO5zmEfNYCNtT89LYhmNhuQubM4re2J+CEH231CJzsUug9vyy69IEKE5p4UccZXy4e/Jm6H17dP62wjF+VHfkZluHkrTW9AkBqIY4qBPbn+QTnZwXhlSV2zlkkeY0JikaIaeYOZ37ugKGeBoE86OQBkL6JCHJvU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722800879; c=relaxed/simple;
	bh=T72Jy/ah6/mvy+CJVd1WutfuS6k2kmnc4g1RZLjQLXs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=fIWWib7+tfLEGaDKPK9kMxidlwH6x1v0muFrQqhLoo6x87uH3e1XRWLilc/tFzgb04wR3g88YDaZaFDNdPyXVqIt8/RZuKSdSXrbKrD7HnP+CEfSGDBJUybSf+qSLjKsF7iNeAqDDOWLhDsMj4QkbOJx1UmEF8hZnTQmraC3tgI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZNbVUQxO; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZNbVUQxO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722800878; x=1754336878;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=T72Jy/ah6/mvy+CJVd1WutfuS6k2kmnc4g1RZLjQLXs=;
  b=ZNbVUQxOJbS0dlQhoClTfOD+bjDztViskCscj2gk/3FP3wnquVCuZC4k
   43FxTmRUSGUwU0E36RZ78QF5z5llX5x9tWLkVazn7UYOFbM+w4hpgAbZi
   ZSCqkyMveDakGV/PZtbYrPTveChflmdwItzag74tiyeL24HmsaWucd03f
   1d8fTqtTnUoHrm4ubf9ayzyFiG+cgqyS4/0uKfX/fnwSFnENmr1QFrwfY
   F0NcN+Ed6Rac9a+PMxAk0uByjsm6Hqqdgjp58vJl7otaALiTH84/T6SQC
   4XHzHpWN26QHZX1d7QCiXYsDd72Szf2++RuPpNvgyqGsTm/cCc0XmmsKX
   A==;
X-CSE-ConnectionGUID: 0K2wSHtQSne7AESi9hT/ZQ==
X-CSE-MsgGUID: kV8YnosrTRC8s1K+zJnA/w==
X-IronPort-AV: E=McAfee;i="6700,10204,11154"; a="24522810"
X-IronPort-AV: E=Sophos;i="6.09,263,1716274800"; 
   d="scan'208";a="24522810"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Aug 2024 12:47:57 -0700
X-CSE-ConnectionGUID: oWY0lTyZTUWkdrTMInnCSQ==
X-CSE-MsgGUID: ggZ8o3QcTwumHhNKeMJmJg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,263,1716274800"; 
   d="scan'208";a="56701248"
Received: from unknown (HELO b6bf6c95bbab) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 04 Aug 2024 12:47:56 -0700
Received: from kbuild by b6bf6c95bbab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sahCq-0001aK-2H;
	Sun, 04 Aug 2024 19:47:52 +0000
Date: Mon, 5 Aug 2024 03:47:08 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH 6/6] ARM: dts: aspeed: mtmitchell: Add I2C FAN controllers
Message-ID: <202408050346.KHl4771h-lkp@intel.com>
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
In-Reply-To: <20240801091217.1408809-7-chanh@os.amperecomputing.com>
References: <20240801091217.1408809-7-chanh@os.amperecomputing.com>
TO: Chanh Nguyen <chanh@os.amperecomputing.com>
TO: Rob Herring <robh+dt@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
TO: Joel Stanley <joel@jms.id.au>
TO: Andrew Jeffery <andrew@aj.id.au>
TO: devicetree@vger.kernel.org
TO: linux-arm-kernel@lists.infradead.org
TO: linux-aspeed@lists.ozlabs.org
TO: linux-kernel@vger.kernel.org
TO: OpenBMC Maillist <openbmc@lists.ozlabs.org>
TO: Open Source Submission <patches@amperecomputing.com>
CC: Phong Vo <phong@os.amperecomputing.com>
CC: Thang Nguyen <thang@os.amperecomputing.com>
CC: Quan Nguyen <quan@os.amperecomputing.com>
CC: Chanh Nguyen <chanh@os.amperecomputing.com>

Hi Chanh,

kernel test robot noticed the following build warnings:

[auto build test WARNING on robh/for-next]
[also build test WARNING on krzk/for-next krzk-dt/for-next krzk-mem-ctrl/for-next linus/master v6.11-rc1 next-20240802]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Chanh-Nguyen/ARM-dts-aspeed-mtjade-mtmitchell-Add-OCP-temperature-sensors/20240802-200229
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20240801091217.1408809-7-chanh%40os.amperecomputing.com
patch subject: [PATCH 6/6] ARM: dts: aspeed: mtmitchell: Add I2C FAN controllers
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: arm-randconfig-051-20240803 (https://download.01.org/0day-ci/archive/20240805/202408050346.KHl4771h-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.1.0
dtschema version: 2024.6.dev8+gf13c181
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240805/202408050346.KHl4771h-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202408050346.KHl4771h-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm/boot/dts/aspeed/aspeed-bmc-ampere-mtmitchell.dtb: sdc@1e740000: sdhci@1e740200:compatible: ['aspeed,ast2600-sdhci', 'sdhci'] is too long
   	from schema $id: http://devicetree.org/schemas/mmc/aspeed,sdhci.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ampere-mtmitchell.dtb: /ahb/apb/sdc@1e740000/sdhci@1e740100: failed to match any schema with compatible: ['aspeed,ast2600-sdhci', 'sdhci']
   arch/arm/boot/dts/aspeed/aspeed-bmc-ampere-mtmitchell.dtb: /ahb/apb/sdc@1e740000/sdhci@1e740200: failed to match any schema with compatible: ['aspeed,ast2600-sdhci', 'sdhci']
   arch/arm/boot/dts/aspeed/aspeed-bmc-ampere-mtmitchell.dtb: /ahb/apb/bus@1e78a000/i2c@180/psu@58: failed to match any schema with compatible: ['pmbus']
   arch/arm/boot/dts/aspeed/aspeed-bmc-ampere-mtmitchell.dtb: /ahb/apb/bus@1e78a000/i2c@180/psu@59: failed to match any schema with compatible: ['pmbus']
   arch/arm/boot/dts/aspeed/aspeed-bmc-ampere-mtmitchell.dtb: /ahb/apb/bus@1e78a000/i2c@280/i2c-mux@70/i2c@3/temperature-sensor@7c: failed to match any schema with compatible: ['microchip,emc1413']
   arch/arm/boot/dts/aspeed/aspeed-bmc-ampere-mtmitchell.dtb: /ahb/apb/bus@1e78a000/i2c@280/i2c-mux@70/i2c@3/temperature-sensor@4c: failed to match any schema with compatible: ['microchip,emc1413']
   arch/arm/boot/dts/aspeed/aspeed-bmc-ampere-mtmitchell.dtb: gpio@77: '#address-cells', '#size-cells' do not match any of the regexes: '^(hog-[0-9]+|.+-hog(-[0-9]+)?)$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-pca95xx.yaml#
>> arch/arm/boot/dts/aspeed/aspeed-bmc-ampere-mtmitchell.dtb: /ahb/apb/bus@1e78a000/i2c@480/fan-controller0@20: failed to match any schema with compatible: ['maxim,max31790']
>> arch/arm/boot/dts/aspeed/aspeed-bmc-ampere-mtmitchell.dtb: /ahb/apb/bus@1e78a000/i2c@480/fan-controller1@2f: failed to match any schema with compatible: ['maxim,max31790']
   arch/arm/boot/dts/aspeed/aspeed-bmc-ampere-mtmitchell.dtb: fsi@1e79b000: compatible: ['aspeed,ast2600-fsi-master', 'fsi-master'] is too long
   	from schema $id: http://devicetree.org/schemas/fsi/aspeed,ast2600-fsi-master.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ampere-mtmitchell.dtb: /ahb/apb/fsi@1e79b000: failed to match any schema with compatible: ['aspeed,ast2600-fsi-master', 'fsi-master']
   arch/arm/boot/dts/aspeed/aspeed-bmc-ampere-mtmitchell.dtb: fsi@1e79b100: compatible: ['aspeed,ast2600-fsi-master', 'fsi-master'] is too long
   	from schema $id: http://devicetree.org/schemas/fsi/aspeed,ast2600-fsi-master.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ampere-mtmitchell.dtb: /ahb/apb/fsi@1e79b100: failed to match any schema with compatible: ['aspeed,ast2600-fsi-master', 'fsi-master']
   arch/arm/boot/dts/aspeed/aspeed-bmc-ampere-mtmitchell.dtb: /ahb/apb/dma-controller@1e79e000: failed to match any schema with compatible: ['aspeed,ast2600-udma']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
