Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C5372907
	for <oe-kbuild@lists.linux.dev>; Mon, 18 Nov 2024 09:08:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731920925; cv=none; b=oF6i1l3xWU4Iv2XSCEhE1xq2wwRkcDWRtGOrZ6T2Mbt/R2CpXua3QEsulHKa1mgJWhmj87j2cLPT4+Xb84D410sXLXKyXbcu4j21EYnz4R8w8+2xYfbVqbP9aHV1CB2Sn4jlRyuRPpnDmgJQeIbLsxBl6uFouJXrHT5vFqITEI8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731920925; c=relaxed/simple;
	bh=6XK7/q7wtgrdMCtm5YJN+KDG8udZNvA90lhUAJ+CfPw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ei5vL1XHBEA1offn8eqIJiFYGU1yU1J6M4XLqioQtfYFYnWG+3tGWU0oHzzXsHg49O2L19815I+zlXSXJsVjmPX2WeUc5/R6JWL6h1RqjwOfbzp4gCRASQMUfz2OE5WEpf79Y3Ay3vqUlDj1l9p87hl4KWSoTU8ZE3xqliMiJ8A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OV9wMErA; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OV9wMErA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731920923; x=1763456923;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6XK7/q7wtgrdMCtm5YJN+KDG8udZNvA90lhUAJ+CfPw=;
  b=OV9wMErAPCazifA7hcrR4V44NIcW880yTId2pczJnvB+wpxRlqKDlIDs
   AMGmI791VS22PQk81rrnXobxekhzier80USo+oj9QdxJOU6AB7Z76RBOc
   DhlWHtH3pEeA8TPIs/D55GSRTYoQ5MoTVRaTBAHawcKGJ8m3nM4WGK1hi
   5xhNG/11SUlPz5RIjHwwVONX8CaLvPgtESU4qhSZY6Guta6x8PyI42QPx
   ovarqDyKH2w0ayxECd0DVgByMdeAAvf9LZufWbqGYbAZeFebf+12msXP1
   93uwR2HSOD7FTADRIn+UnwbqfbOUdEtzOfCof646s7tWS3lxJDPGF+dOp
   g==;
X-CSE-ConnectionGUID: RxQGvu1nS32YFOPLCtVbiA==
X-CSE-MsgGUID: yKXMMaedT7OCburlCPVB2g==
X-IronPort-AV: E=McAfee;i="6700,10204,11259"; a="54365542"
X-IronPort-AV: E=Sophos;i="6.12,163,1728975600"; 
   d="scan'208";a="54365542"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2024 01:08:42 -0800
X-CSE-ConnectionGUID: znyTJds/SJ21tULG5I47LQ==
X-CSE-MsgGUID: VbWNPBDJRKiGQDf8iBFxEg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,163,1728975600"; 
   d="scan'208";a="120021318"
Received: from lkp-server01.sh.intel.com (HELO 1e3cc1889ffb) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 18 Nov 2024 01:08:41 -0800
Received: from kbuild by 1e3cc1889ffb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tCxkM-0002LF-03;
	Mon, 18 Nov 2024 09:08:38 +0000
Date: Mon, 18 Nov 2024 17:08:31 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH] arm64: dts: hisilicon: Remove unused and undocumented
 "enable-dma" property
Message-ID: <202411181644.mCtSqVgZ-lkp@intel.com>
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
In-Reply-To: <20241115193454.3619297-1-robh@kernel.org>
References: <20241115193454.3619297-1-robh@kernel.org>
TO: "Rob Herring (Arm)" <robh@kernel.org>
TO: Wei Xu <xuwei5@hisilicon.com>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
CC: linux-arm-kernel@lists.infradead.org
CC: devicetree@vger.kernel.org
CC: linux-kernel@vger.kernel.org

Hi Rob,

kernel test robot noticed the following build warnings:

[auto build test WARNING on robh/for-next]
[also build test WARNING on krzk/for-next krzk-dt/for-next linus/master v6.12 next-20241115]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Rob-Herring-Arm/arm64-dts-hisilicon-Remove-unused-and-undocumented-enable-dma-property/20241117-004937
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20241115193454.3619297-1-robh%40kernel.org
patch subject: [PATCH] arm64: dts: hisilicon: Remove unused and undocumented "enable-dma" property
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: arm64-randconfig-051-20241117 (https://download.01.org/0day-ci/archive/20241118/202411181644.mCtSqVgZ-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 592c0fe55f6d9a811028b5f3507be91458ab2713)
dtschema version: 2024.12.dev1+gcabb5b9
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241118/202411181644.mCtSqVgZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202411181644.mCtSqVgZ-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm64/boot/dts/hisilicon/hi6220-hikey.dtb: soc: replicator: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm64/boot/dts/hisilicon/hi6220-hikey.dtb: soc: thermal-zones: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm64/boot/dts/hisilicon/hi6220-hikey.dtb: /soc/acpu_sctrl@f6504000: failed to match any schema with compatible: ['hisilicon,hi6220-acpu-sctrl', 'syscon']
   arch/arm64/boot/dts/hisilicon/hi6220-hikey.dtb: medianoc_ade@f4520000: compatible: ['syscon'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
   arch/arm64/boot/dts/hisilicon/hi6220-hikey.dtb: /soc/stub_clock: failed to match any schema with compatible: ['hisilicon,hi6220-stub-clk']
   arch/arm64/boot/dts/hisilicon/hi6220-hikey.dtb: /soc/dma@f7370000: failed to match any schema with compatible: ['hisilicon,k3-dma-1.0']
>> arch/arm64/boot/dts/hisilicon/hi6220-hikey.dtb: spi@f7106000: Unevaluated properties are not allowed ('bus-id' was unexpected)
   	from schema $id: http://devicetree.org/schemas/spi/spi-pl022.yaml#
   arch/arm64/boot/dts/hisilicon/hi6220-hikey.dtb: adv7533@39: 'avdd-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/display/bridge/adi,adv7533.yaml#
   arch/arm64/boot/dts/hisilicon/hi6220-hikey.dtb: adv7533@39: 'dvdd-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/display/bridge/adi,adv7533.yaml#
   arch/arm64/boot/dts/hisilicon/hi6220-hikey.dtb: adv7533@39: 'pvdd-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/display/bridge/adi,adv7533.yaml#
   arch/arm64/boot/dts/hisilicon/hi6220-hikey.dtb: adv7533@39: 'a2vdd-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/display/bridge/adi,adv7533.yaml#
   arch/arm64/boot/dts/hisilicon/hi6220-hikey.dtb: adv7533@39: 'v3p3-supply' is a required property

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
