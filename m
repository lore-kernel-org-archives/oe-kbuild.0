Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAF15151991
	for <oe-kbuild@lists.linux.dev>; Wed,  2 Jul 2025 02:05:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751421934; cv=none; b=bxI6gpc7DdX+ECHyxUXgG3/2x25ekBwDJaVCNqgVi+DJQm3QTvfLeunG1gO7qp8WNMSNyV2px9FYDg0wnseFJrM6YzDt/GCb/PmGL9V491Fu1QvUfzwfstB3T5Fbp25WE6LJTj3/XeT0JB/Q+0Uim9GEgdzpLVtoD+hx3sIzB7Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751421934; c=relaxed/simple;
	bh=iSZEYTCZCD2oxXVNJo8PAC4YrmFPrOCyJGpRwY4K04w=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=FXIHUmtF1PUgHnpfYL6aw6x8uvv8iVFCaM1lf7sJExVvVsTynaF2WBKBypFa0+Pgj71YF+rAbOI0rQa+cE4tqI73COO0nDzKK9TNBrczwBZvZ/Wccd6XjWjE9hZ+rUGSUZ2SmPJtSG2mdrT5yI9QK7Obt8M2V/7x1tXnMnldkMs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CMzPeAr5; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CMzPeAr5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751421933; x=1782957933;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=iSZEYTCZCD2oxXVNJo8PAC4YrmFPrOCyJGpRwY4K04w=;
  b=CMzPeAr5OM05vQltq0BoNh0T3Ux8ICdrnHdbgTpaHcNo/mdvvUREoFVU
   bNQse4RYbx8DAyReICp71cFEvMf/k++hWRj38lO2Xr04LlkxlvJ/vEyyN
   FPUoAfNLzHVshdoI/ta9KDEAiM7+QIHqlgnBqUWvZkgsRc684gxTVLZIG
   8t3fjXLzVktniLbChrSQ2TaPX8vzuW+og9ZSs549vNafwAXYurVS+P+7S
   woYyA5D32qxck6SfQLvWQDBwSx5wm4RsVndVZY3H4flzJ4DuO04M8c9hQ
   box88eyOWip/AK9ibJkMu2snyK//kT1oEJyVDr3WFnYT3rGpafw2G1swG
   g==;
X-CSE-ConnectionGUID: pubO4e85TCK6d9DBJAEdAA==
X-CSE-MsgGUID: ZROqfQDdRfqCs2sh4NTBYQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11481"; a="53848716"
X-IronPort-AV: E=Sophos;i="6.16,280,1744095600"; 
   d="scan'208";a="53848716"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jul 2025 19:05:32 -0700
X-CSE-ConnectionGUID: sGq1JFiNQqiCdIgCDLGaCw==
X-CSE-MsgGUID: h26+i9qUSranIx94LpOfWQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,280,1744095600"; 
   d="scan'208";a="154259379"
Received: from igk-lkp-server01.igk.intel.com (HELO 030a839a1121) ([10.91.175.65])
  by fmviesa009.fm.intel.com with ESMTP; 01 Jul 2025 19:05:31 -0700
Received: from kbuild by 030a839a1121 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uWmqn-0000CP-14;
	Wed, 02 Jul 2025 02:05:29 +0000
Date: Wed, 2 Jul 2025 04:05:14 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [shawnguo:imx/fixes 7/8]
 arch/arm64/boot/dts/freescale/fsl-ls1046a-frwy.dtb: watchdog@2ad0000
 (fsl,ls1046a-wdt): big-endian: False schema does not allow True
Message-ID: <202507020457.Jdl8zIyW-lkp@intel.com>
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
TO: Meng Li <Meng.Li@windriver.com>
CC: Shawn Guo <shawnguo@kernel.org>
CC: Ahmad Fatoum <a.fatoum@pengutronix.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git imx/fixes
head:   61f1065272ea3721c20c4c0a6877d346b0e237c3
commit: 720fd1cbc0a0f3acdb26aedb3092ab10fe05e7ae [7/8] arm64: dts: add big-endian property back into watchdog node
:::::: branch date: 12 hours ago
:::::: commit date: 2 days ago
config: arm64-randconfig-2051-20250701 (https://download.01.org/0day-ci/archive/20250702/202507020457.Jdl8zIyW-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project 84c849e85b0f8ab2d8bbeb2d9c46349f019f4e8e)
dtschema version: 2025.6.1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250702/202507020457.Jdl8zIyW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202507020457.Jdl8zIyW-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/freescale/fsl-ls1046a-frwy.dtb: watchdog@2ad0000 (fsl,ls1046a-wdt): big-endian: False schema does not allow True
   	from schema $id: http://devicetree.org/schemas/watchdog/fsl-imx-wdt.yaml#
>> arch/arm64/boot/dts/freescale/fsl-ls1046a-frwy.dtb: watchdog@2ad0000 (fsl,ls1046a-wdt): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,ls1046a-wdt', 'fsl,imx21-wdt'] is too long
   	'fsl,imx21-wdt' was expected
   	'fsl,ls1046a-wdt' is not one of ['fsl,imx25-wdt', 'fsl,imx27-wdt', 'fsl,imx31-wdt', 'fsl,imx35-wdt', 'fsl,imx50-wdt', 'fsl,imx51-wdt', 'fsl,imx53-wdt', 'fsl,imx6q-wdt', 'fsl,imx6sl-wdt', 'fsl,imx6sll-wdt', 'fsl,imx6sx-wdt', 'fsl,imx6ul-wdt', 'fsl,imx7d-wdt', 'fsl,imx8mm-wdt', 'fsl,imx8mn-wdt', 'fsl,imx8mp-wdt', 'fsl,imx8mq-wdt', 'fsl,ls1012a-wdt', 'fsl,ls1021a-wdt', 'fsl,ls1043a-wdt', 'fsl,vf610-wdt']
   	from schema $id: http://devicetree.org/schemas/watchdog/fsl-imx-wdt.yaml#
>> arch/arm64/boot/dts/freescale/fsl-ls1046a-frwy.dtb: watchdog@2ad0000 (fsl,ls1046a-wdt): Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/watchdog/fsl-imx-wdt.yaml#
>> arch/arm64/boot/dts/freescale/fsl-ls1046a-frwy.dtb: /soc/watchdog@2ad0000: failed to match any schema with compatible: ['fsl,ls1046a-wdt', 'fsl,imx21-wdt']
--
>> arch/arm64/boot/dts/freescale/fsl-ls1046a-qds.dtb: watchdog@2ad0000 (fsl,ls1046a-wdt): big-endian: False schema does not allow True
   	from schema $id: http://devicetree.org/schemas/watchdog/fsl-imx-wdt.yaml#
>> arch/arm64/boot/dts/freescale/fsl-ls1046a-qds.dtb: watchdog@2ad0000 (fsl,ls1046a-wdt): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,ls1046a-wdt', 'fsl,imx21-wdt'] is too long
   	'fsl,imx21-wdt' was expected
   	'fsl,ls1046a-wdt' is not one of ['fsl,imx25-wdt', 'fsl,imx27-wdt', 'fsl,imx31-wdt', 'fsl,imx35-wdt', 'fsl,imx50-wdt', 'fsl,imx51-wdt', 'fsl,imx53-wdt', 'fsl,imx6q-wdt', 'fsl,imx6sl-wdt', 'fsl,imx6sll-wdt', 'fsl,imx6sx-wdt', 'fsl,imx6ul-wdt', 'fsl,imx7d-wdt', 'fsl,imx8mm-wdt', 'fsl,imx8mn-wdt', 'fsl,imx8mp-wdt', 'fsl,imx8mq-wdt', 'fsl,ls1012a-wdt', 'fsl,ls1021a-wdt', 'fsl,ls1043a-wdt', 'fsl,vf610-wdt']
   	from schema $id: http://devicetree.org/schemas/watchdog/fsl-imx-wdt.yaml#
>> arch/arm64/boot/dts/freescale/fsl-ls1046a-qds.dtb: watchdog@2ad0000 (fsl,ls1046a-wdt): Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/watchdog/fsl-imx-wdt.yaml#
>> arch/arm64/boot/dts/freescale/fsl-ls1046a-qds.dtb: /soc/watchdog@2ad0000: failed to match any schema with compatible: ['fsl,ls1046a-wdt', 'fsl,imx21-wdt']
--
>> arch/arm64/boot/dts/freescale/fsl-ls1046a-rdb.dtb: watchdog@2ad0000 (fsl,ls1046a-wdt): big-endian: False schema does not allow True
   	from schema $id: http://devicetree.org/schemas/watchdog/fsl-imx-wdt.yaml#
>> arch/arm64/boot/dts/freescale/fsl-ls1046a-rdb.dtb: watchdog@2ad0000 (fsl,ls1046a-wdt): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,ls1046a-wdt', 'fsl,imx21-wdt'] is too long
   	'fsl,imx21-wdt' was expected
   	'fsl,ls1046a-wdt' is not one of ['fsl,imx25-wdt', 'fsl,imx27-wdt', 'fsl,imx31-wdt', 'fsl,imx35-wdt', 'fsl,imx50-wdt', 'fsl,imx51-wdt', 'fsl,imx53-wdt', 'fsl,imx6q-wdt', 'fsl,imx6sl-wdt', 'fsl,imx6sll-wdt', 'fsl,imx6sx-wdt', 'fsl,imx6ul-wdt', 'fsl,imx7d-wdt', 'fsl,imx8mm-wdt', 'fsl,imx8mn-wdt', 'fsl,imx8mp-wdt', 'fsl,imx8mq-wdt', 'fsl,ls1012a-wdt', 'fsl,ls1021a-wdt', 'fsl,ls1043a-wdt', 'fsl,vf610-wdt']
   	from schema $id: http://devicetree.org/schemas/watchdog/fsl-imx-wdt.yaml#
>> arch/arm64/boot/dts/freescale/fsl-ls1046a-rdb.dtb: watchdog@2ad0000 (fsl,ls1046a-wdt): Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/watchdog/fsl-imx-wdt.yaml#
>> arch/arm64/boot/dts/freescale/fsl-ls1046a-rdb.dtb: /soc/watchdog@2ad0000: failed to match any schema with compatible: ['fsl,ls1046a-wdt', 'fsl,imx21-wdt']
--
   arch/arm64/boot/dts/freescale/fsl-ls1046a-tqmls1046a.dtsi:17.19-31.4: Warning (avoid_unnecessary_addr_size): /soc/spi@1550000/flash@0: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>> arch/arm64/boot/dts/freescale/fsl-ls1046a-tqmls1046a-mbls10xxa.dtb: watchdog@2ad0000 (fsl,ls1046a-wdt): big-endian: False schema does not allow True
   	from schema $id: http://devicetree.org/schemas/watchdog/fsl-imx-wdt.yaml#
>> arch/arm64/boot/dts/freescale/fsl-ls1046a-tqmls1046a-mbls10xxa.dtb: watchdog@2ad0000 (fsl,ls1046a-wdt): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,ls1046a-wdt', 'fsl,imx21-wdt'] is too long
   	'fsl,imx21-wdt' was expected
   	'fsl,ls1046a-wdt' is not one of ['fsl,imx25-wdt', 'fsl,imx27-wdt', 'fsl,imx31-wdt', 'fsl,imx35-wdt', 'fsl,imx50-wdt', 'fsl,imx51-wdt', 'fsl,imx53-wdt', 'fsl,imx6q-wdt', 'fsl,imx6sl-wdt', 'fsl,imx6sll-wdt', 'fsl,imx6sx-wdt', 'fsl,imx6ul-wdt', 'fsl,imx7d-wdt', 'fsl,imx8mm-wdt', 'fsl,imx8mn-wdt', 'fsl,imx8mp-wdt', 'fsl,imx8mq-wdt', 'fsl,ls1012a-wdt', 'fsl,ls1021a-wdt', 'fsl,ls1043a-wdt', 'fsl,vf610-wdt']
   	from schema $id: http://devicetree.org/schemas/watchdog/fsl-imx-wdt.yaml#
>> arch/arm64/boot/dts/freescale/fsl-ls1046a-tqmls1046a-mbls10xxa.dtb: watchdog@2ad0000 (fsl,ls1046a-wdt): Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/watchdog/fsl-imx-wdt.yaml#
>> arch/arm64/boot/dts/freescale/fsl-ls1046a-tqmls1046a-mbls10xxa.dtb: /soc/watchdog@2ad0000: failed to match any schema with compatible: ['fsl,ls1046a-wdt', 'fsl,imx21-wdt']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
