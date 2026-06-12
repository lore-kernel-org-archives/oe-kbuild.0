Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7A0713B58A
	for <oe-kbuild@lists.linux.dev>; Fri, 12 Jun 2026 16:01:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781280071; cv=none; b=cR6Oyv0sMfsSlojhG7uSOzb9lY9wWP/LJPYClhqbrVEIynazGIvC7rjUtChm1/DYVrWgQowqchp5lpSN86NUaeoVD/WFro/CrKceQjbosQym4PHvDnVV8XrBaFINeYIeS3ujcx8KdKKg4+5PBPXCMNlf61+eMESM0jHmXqPbSbs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781280071; c=relaxed/simple;
	bh=gDei6xm4MLNcqE+Rnc/dC0UMcP3Mc0SxjoGK40RNZmg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=T9UbBJskczYb3TeUm370xLaLxvfMY6bMKMybD5nUp7egxsO9X2+NvxsqZHpGHeU39zCR+BvGg32A8VVjGsNo8atn+KbcXTSDhsrBD4C8tU/UC++X1KmGwhZFqfUp1xkyy+XOTGSP5Xvw15HMUid8315MEBnTUJdvquQamJ7iGRA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aRUUXGWS; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aRUUXGWS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781280068; x=1812816068;
  h=date:from:to:cc:subject:message-id;
  bh=gDei6xm4MLNcqE+Rnc/dC0UMcP3Mc0SxjoGK40RNZmg=;
  b=aRUUXGWSxW8WN0f7TvmLSExV4dSbsjpYIs2Bq+5kqJrLOGXTkg3CYkXd
   ElKknSG63cOgold09RhpdIZS3DWa/NvP3s85BwLMM5eZbGwqWy1YUVYvI
   HgdL9lXbcA723sbFdvSh9TA/FBjr15Z7PnHbioNjkVoPlI45nYBWkQS8F
   XVsx8DYUE4KXB2v/tVIEnv4Zewqsr6KcareumeHsp9bwlYh6znY64mz30
   Z8qavDXwQMOc088oqHevpYxBPRkSydKxyTFce3nKpT1ZLp7Qr5YYHGm55
   UiCZ3JIGcalK4GN7kaPk1DF5BU7tr9LEpTXLlBGpwyo6zTJdmwnwhr6j9
   g==;
X-CSE-ConnectionGUID: awNoODXNQja2zoIhbfByCg==
X-CSE-MsgGUID: yq4kBtdgTbi3+ilws6RhGA==
X-IronPort-AV: E=McAfee;i="6800,10657,11815"; a="84681830"
X-IronPort-AV: E=Sophos;i="6.24,200,1774335600"; 
   d="scan'208";a="84681830"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jun 2026 09:01:08 -0700
X-CSE-ConnectionGUID: yGiZ6uOVTqqwVD0T2NU9nA==
X-CSE-MsgGUID: KH4evDd/RbeU0/6wJimCLQ==
X-ExtLoop1: 1
Received: from igk-lkp-server01.igk.intel.com (HELO 892db79562d4) ([10.211.93.152])
  by fmviesa003.fm.intel.com with ESMTP; 12 Jun 2026 09:01:08 -0700
Received: from kbuild by 892db79562d4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wY4Je-000000004HZ-0cn0;
	Fri, 12 Jun 2026 16:01:06 +0000
Date: Fri, 12 Jun 2026 18:00:11 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: arch/arm/boot/dts/nxp/imx/imx53-qsb.dtb: dialog@48
 (dlg,da9053-aa): compatible: ['dlg,da9053-aa', 'dlg,da9052'] is too long
Message-ID: <202606121734.2zG7tOga-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "dtcheck: too old problem, older than 3 months"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Frank Li <Frank.Li@nxp.com>
CC: Lee Jones <lee@kernel.org>
CC: "Rob Herring (Arm)" <robh@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   2b414a95b8f7307d42173ba9e580d6d3e2bcbfce
commit: d2b240f9a180ebd63477d0534633f22e16fe41ad dt-bindings: mfd: Convert dlg,da9052-i2c.txt to yaml format
date:   7 months ago
:::::: branch date: 22 hours ago
:::::: commit date: 7 months ago
config: arm-randconfig-2052-20260610 (https://download.01.org/0day-ci/archive/20260612/202606121734.2zG7tOga-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 8.5.0
dtschema: 2026.5.dev10+g5d839523d
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260612/202606121734.2zG7tOga-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: d2b240f9a180 ("dt-bindings: mfd: Convert dlg,da9052-i2c.txt to yaml format")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202606121734.2zG7tOga-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm/boot/dts/nxp/imx/imx53.dtsi:461.29-464.6: Warning (unique_unit_address_if_enabled): /soc/bus@50000000/pinctrl@53fa8000: duplicate unit-address (also used in node /soc/bus@50000000/iomuxc-gpr@53fa8000)
>> arch/arm/boot/dts/nxp/imx/imx53-qsb.dtb: dialog@48 (dlg,da9053-aa): compatible: ['dlg,da9053-aa', 'dlg,da9052'] is too long
   	from schema $id: http://devicetree.org/schemas/mfd/dlg,da9052.yaml
   arch/arm/boot/dts/nxp/imx/imx53-qsb.dtb: /soc/bus@60000000/nand-controller@63fdb000: failed to match any schema with compatible: ['fsl,imx53-nand']
   arch/arm/boot/dts/nxp/imx/imx53-qsb.dtb: /soc/bus@60000000/tve@63ff0000: failed to match any schema with compatible: ['fsl,imx53-tve']
   arch/arm/boot/dts/nxp/imx/imx53-qsb.dtb: panel (sii,43wvf1g): 'dvdd-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/display/panel/seiko,43wvf1g.yaml
   arch/arm/boot/dts/nxp/imx/imx53-qsb.dtb: panel (sii,43wvf1g): 'avdd-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/display/panel/seiko,43wvf1g.yaml
--
   arch/arm/boot/dts/nxp/imx/imx53.dtsi:461.29-464.6: Warning (unique_unit_address_if_enabled): /soc/bus@50000000/pinctrl@53fa8000: duplicate unit-address (also used in node /soc/bus@50000000/iomuxc-gpr@53fa8000)
>> arch/arm/boot/dts/nxp/imx/imx53-voipac-bsb.dtb: dialog@48 (dlg,da9053-aa): compatible: ['dlg,da9053-aa', 'dlg,da9052'] is too long
   	from schema $id: http://devicetree.org/schemas/mfd/dlg,da9052.yaml
   arch/arm/boot/dts/nxp/imx/imx53-voipac-bsb.dtb: /soc/bus@60000000/nand-controller@63fdb000: failed to match any schema with compatible: ['fsl,imx53-nand']
   arch/arm/boot/dts/nxp/imx/imx53-voipac-bsb.dtb: nand-controller@63fdb000 (fsl,imx53-nand): '#address-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/mtd/nand-controller.yaml
   arch/arm/boot/dts/nxp/imx/imx53-voipac-bsb.dtb: nand-controller@63fdb000 (fsl,imx53-nand): '#size-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/mtd/nand-controller.yaml
   arch/arm/boot/dts/nxp/imx/imx53-voipac-bsb.dtb: /soc/bus@60000000/tve@63ff0000: failed to match any schema with compatible: ['fsl,imx53-tve']
--
>> arch/arm/boot/dts/nxp/imx/imx53-qsb-hdmi.dtb: dialog@48 (dlg,da9053-aa): compatible: ['dlg,da9053-aa', 'dlg,da9052'] is too long
   	from schema $id: http://devicetree.org/schemas/mfd/dlg,da9052.yaml
   arch/arm/boot/dts/nxp/imx/imx53-qsb-hdmi.dtb: /soc/bus@60000000/nand-controller@63fdb000: failed to match any schema with compatible: ['fsl,imx53-nand']
   arch/arm/boot/dts/nxp/imx/imx53-qsb-hdmi.dtb: /soc/bus@60000000/tve@63ff0000: failed to match any schema with compatible: ['fsl,imx53-tve']

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
