Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 912D42ED170
	for <oe-kbuild@lists.linux.dev>; Tue, 17 Jun 2025 14:14:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750169681; cv=none; b=g9yYMyMgH3C5OETt39SN8vQjuWcqFJMZDSKYJ8JkbsTQSz1xrDdmH9G1YM6WB3Mp6SLcwYnmlxYlTJNoB4ak8zo1LW+kSVhMnoDXzLAbwQJRTqxwVTgmmcznDZQOGFKDuHHapKpeSRYof9EcTOlerJoktH2bIX0zlgvxt+qYfxs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750169681; c=relaxed/simple;
	bh=4nFmxW+ssAWC7A9pgXcRyWec/oMazyIybCnBjfpiPA0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=EkADLVxnyiAP7ktK2vXp/yhpqoa7nQrn9SkhDGEiD241Z/wfns2wxMVaeDa3pwZJlbYayQiD7u7mWSj7aCx6QqM61gKj1CFG1XZmGRLcXY7H2ZpojZCtgwaYgn9LI3dx5YAqMhSc51jpu7HJcVRzm7MaYLuRom+HuTlettRRoE4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=m7dXxbFL; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="m7dXxbFL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750169680; x=1781705680;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=4nFmxW+ssAWC7A9pgXcRyWec/oMazyIybCnBjfpiPA0=;
  b=m7dXxbFLKPjNismmHKef0NPKdJ0+xrekWcsIcUJ8L7hHuXH7c77yrLkf
   IfM2Ddz6JEUoxyFb8RwQocjOeau1+NBvc+dQXt4TnBozMPNaDjWJoEv03
   7EwsB7qBrwrTlQRBuJSY8OTl78N4hmKJc8xU0syjgPpM6VQ9TT74Z0fUo
   W7mu93KOx7EHFxq2Vnmu7fymhbu+INS2ne/i3/+taavaJkqJTsCB0KPO+
   zrrpTMFdmOe76r12BA/MbL5BYp7tH2Gf0QnVChgj0M/IuPLy174Uf7294
   XEZc9/FBCWy5vhsi9secPmnEOCMGbJ6UeUDbjJlQE3c6plEmKDZn6DS+a
   A==;
X-CSE-ConnectionGUID: ZzknV0XkSFGX2bHiYB0yQA==
X-CSE-MsgGUID: zoS+1wIsQzWfJBcGXW7/bQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11467"; a="63763667"
X-IronPort-AV: E=Sophos;i="6.16,243,1744095600"; 
   d="scan'208";a="63763667"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jun 2025 07:14:40 -0700
X-CSE-ConnectionGUID: vwTi2eLuQfuTMoJiZkWNVQ==
X-CSE-MsgGUID: 17lrjCZuS5yizOUTlWuyPA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,243,1744095600"; 
   d="scan'208";a="148785165"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 17 Jun 2025 07:14:37 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uRX59-000G4A-28;
	Tue, 17 Jun 2025 14:14:35 +0000
Date: Tue, 17 Jun 2025 22:14:15 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [sverdlin:snps-trng 14/23]
 arch/riscv/boot/dts/sophgo/cv1800b-milkv-duo.dtb: /soc/syscon@3000000:
 failed to match any schema with compatible: ['sophgo,cv1800b-top-syscon',
 'syscon', 'simple-mfd']
Message-ID: <202506172228.NtxjtR1o-lkp@intel.com>
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
TO: Inochi Amaoto <inochiama@gmail.com>
CC: Alexander Sverdlin <alexander.sverdlin@gmail.com>

tree:   https://github.com/sverdlin/linux snps-trng
head:   21e232768cb64142db24034d3dceffbc48c2447e
commit: 97d7c3f7db50e21e32c2f2c43fa88fda0d145b00 [14/23] riscv: dts: sophgo: Add syscon node for cv18xx
:::::: branch date: 32 hours ago
:::::: commit date: 32 hours ago
config: riscv-randconfig-051-20250617 (https://download.01.org/0day-ci/archive/20250617/202506172228.NtxjtR1o-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
dtschema version: 2025.3.dev28+g49451a5
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250617/202506172228.NtxjtR1o-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202506172228.NtxjtR1o-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/riscv/boot/dts/sophgo/cv1800b-milkv-duo.dtb: /soc/syscon@3000000: failed to match any schema with compatible: ['sophgo,cv1800b-top-syscon', 'syscon', 'simple-mfd']
>> arch/riscv/boot/dts/sophgo/cv1800b-milkv-duo.dtb: /soc/syscon@3000000/phy@48: failed to match any schema with compatible: ['sophgo,cv1800b-usb2-phy']
>> arch/riscv/boot/dts/sophgo/cv1800b-milkv-duo.dtb: /soc/syscon@3000000/dma-router@154: failed to match any schema with compatible: ['sophgo,cv1800b-dmamux']
>> arch/riscv/boot/dts/sophgo/cv1800b-milkv-duo.dtb: dma-router@154 (sophgo,cv1800b-dmamux): dma-masters: 4 is not of type 'array'
   	from schema $id: http://devicetree.org/schemas/dma/dma-router.yaml#
>> arch/riscv/boot/dts/sophgo/cv1800b-milkv-duo.dtb: dma-router@154 (sophgo,cv1800b-dmamux): dma-masters: 4 is not of type 'array'
   	from schema $id: http://devicetree.org/schemas/dma/dma-router.yaml#
   arch/riscv/boot/dts/sophgo/cv1800b-milkv-duo.dtb: /soc/reset-controller@3003000: failed to match any schema with compatible: ['sophgo,cv1800b-reset']
   arch/riscv/boot/dts/sophgo/cv1800b-milkv-duo.dtb: /soc/mdio@3009000: failed to match any schema with compatible: ['sophgo,cv1800b-mdio-mux']
   arch/riscv/boot/dts/sophgo/cv1800b-milkv-duo.dtb: /soc/ethernet@4070000: failed to match any schema with compatible: ['sophgo,cv1800b-dwmac', 'snps,dwmac-3.70a']
--
>> arch/riscv/boot/dts/sophgo/cv1812h-huashan-pi.dtb: /soc/syscon@3000000: failed to match any schema with compatible: ['sophgo,cv1800b-top-syscon', 'syscon', 'simple-mfd']
>> arch/riscv/boot/dts/sophgo/cv1812h-huashan-pi.dtb: /soc/syscon@3000000/phy@48: failed to match any schema with compatible: ['sophgo,cv1800b-usb2-phy']
>> arch/riscv/boot/dts/sophgo/cv1812h-huashan-pi.dtb: /soc/syscon@3000000/dma-router@154: failed to match any schema with compatible: ['sophgo,cv1800b-dmamux']
>> arch/riscv/boot/dts/sophgo/cv1812h-huashan-pi.dtb: dma-router@154 (sophgo,cv1800b-dmamux): dma-masters: 4 is not of type 'array'
   	from schema $id: http://devicetree.org/schemas/dma/dma-router.yaml#
>> arch/riscv/boot/dts/sophgo/cv1812h-huashan-pi.dtb: dma-router@154 (sophgo,cv1800b-dmamux): dma-masters: 4 is not of type 'array'
   	from schema $id: http://devicetree.org/schemas/dma/dma-router.yaml#
   arch/riscv/boot/dts/sophgo/cv1812h-huashan-pi.dtb: /soc/reset-controller@3003000: failed to match any schema with compatible: ['sophgo,cv1800b-reset']
   arch/riscv/boot/dts/sophgo/cv1812h-huashan-pi.dtb: /soc/mdio@3009000: failed to match any schema with compatible: ['sophgo,cv1800b-mdio-mux']
   arch/riscv/boot/dts/sophgo/cv1812h-huashan-pi.dtb: /soc/ethernet@4070000: failed to match any schema with compatible: ['sophgo,cv1800b-dwmac', 'snps,dwmac-3.70a']
--
>> arch/riscv/boot/dts/sophgo/sg2002-licheerv-nano-b.dtb: /soc/syscon@3000000: failed to match any schema with compatible: ['sophgo,cv1800b-top-syscon', 'syscon', 'simple-mfd']
>> arch/riscv/boot/dts/sophgo/sg2002-licheerv-nano-b.dtb: /soc/syscon@3000000/phy@48: failed to match any schema with compatible: ['sophgo,cv1800b-usb2-phy']
>> arch/riscv/boot/dts/sophgo/sg2002-licheerv-nano-b.dtb: /soc/syscon@3000000/dma-router@154: failed to match any schema with compatible: ['sophgo,cv1800b-dmamux']
>> arch/riscv/boot/dts/sophgo/sg2002-licheerv-nano-b.dtb: dma-router@154 (sophgo,cv1800b-dmamux): dma-masters: 4 is not of type 'array'
   	from schema $id: http://devicetree.org/schemas/dma/dma-router.yaml#
>> arch/riscv/boot/dts/sophgo/sg2002-licheerv-nano-b.dtb: dma-router@154 (sophgo,cv1800b-dmamux): dma-masters: 4 is not of type 'array'
   	from schema $id: http://devicetree.org/schemas/dma/dma-router.yaml#
   arch/riscv/boot/dts/sophgo/sg2002-licheerv-nano-b.dtb: /soc/reset-controller@3003000: failed to match any schema with compatible: ['sophgo,cv1800b-reset']
   arch/riscv/boot/dts/sophgo/sg2002-licheerv-nano-b.dtb: /soc/mdio@3009000: failed to match any schema with compatible: ['sophgo,cv1800b-mdio-mux']
   arch/riscv/boot/dts/sophgo/sg2002-licheerv-nano-b.dtb: /soc/ethernet@4070000: failed to match any schema with compatible: ['sophgo,cv1800b-dwmac', 'snps,dwmac-3.70a']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
