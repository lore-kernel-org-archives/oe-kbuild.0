Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0767335963
	for <oe-kbuild@lists.linux.dev>; Wed, 18 Jun 2025 08:52:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750236752; cv=none; b=FezQMYNyvrvf0w/j483P7HNbm8I/aORi6AggsWEmlSwag+dRjfsKhDw2VcDaHRdPMFfII/VQpMZRHGljCKActXxDA1jSOlt8JSAwWToCCNkErTZVSz2miPLAETG+nhjyR9jzhQiUAaogH5eCTSaRN9MfMNkiG/GWLs1c7m98zuE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750236752; c=relaxed/simple;
	bh=nWBrBkN3Ht94er4OyTapWoF1AEvq+7EChkRPMUs22+U=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jXv7Tp2JV95elBtAi1I3Ap67Kfr1RTEgtRE05tcKC0vPDkNwLIgTvN4iN76zDTxpq8he90/wbwz9QCk/23gJJe5NBicqqErp/TVmuXe0/2q6Ow5ec5qHoU3Tm2mA1sB/WO0b8g5D8fsRSnyiMQcZ95aQGTaR2iFPDD1M8Ut+C2M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=f+nS6FJg; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="f+nS6FJg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750236751; x=1781772751;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=nWBrBkN3Ht94er4OyTapWoF1AEvq+7EChkRPMUs22+U=;
  b=f+nS6FJg2bTQAhErG1O6AxBQlq8oIJMZzzbjwmuQgdeLUXFHUTJ1irz7
   lZAA1St6tk3Nbj+Rw38IKZ5F19TI/7+hNk5p9QtHvguiMqaDHMaWD9dNa
   K20pPa+EeTqmz28FxRCPv2PrWSnOuT14jWh8Ofej4N+ME1QPZXAsRafa0
   Jm+hJewqP4PHhlCW9wX613CVMN5+Oc1PXBOcv6kGHixJLBGj5DbwxEEBY
   6WKliJBhmtpEU/ATkdNznogyaGCUkSVB2Dl//8bckKQX8QZK8FhnJIhi8
   I5ZnvkS5NXILXfAvwG2K8vlWVsU6tCgesNVrGvfoeojAS9nlsrNuJTpBO
   w==;
X-CSE-ConnectionGUID: hWFBwTBVRtSX6wUHgD14qg==
X-CSE-MsgGUID: cc8Lgd24QFKRLq19swu5xQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11467"; a="69886111"
X-IronPort-AV: E=Sophos;i="6.16,245,1744095600"; 
   d="scan'208";a="69886111"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jun 2025 01:51:23 -0700
X-CSE-ConnectionGUID: ONPbq09TSCCjFHGFFQrMog==
X-CSE-MsgGUID: UtYgz8vwRa2r2uK+CNAzKg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,245,1744095600"; 
   d="scan'208";a="180360123"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 18 Jun 2025 01:51:21 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uRoVq-000Ja0-2Z;
	Wed, 18 Jun 2025 08:51:18 +0000
Date: Wed, 18 Jun 2025 16:51:03 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [sverdlin:snps-trng 14/23]
 arch/arm64/boot/dts/sophgo/sg2000-milkv-duo-module-01-evb.dtb:
 /soc/syscon@3000000: failed to match any schema with compatible:
 ['sophgo,cv1800b-top-syscon', 'syscon', 'simple-mfd']
Message-ID: <202506181642.28WfZuNn-lkp@intel.com>
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
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: arm64-randconfig-052-20250617 (https://download.01.org/0day-ci/archive/20250618/202506181642.28WfZuNn-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
dtschema version: 2025.3.dev28+g49451a5
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250618/202506181642.28WfZuNn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202506181642.28WfZuNn-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/sophgo/sg2000-milkv-duo-module-01-evb.dtb: /soc/syscon@3000000: failed to match any schema with compatible: ['sophgo,cv1800b-top-syscon', 'syscon', 'simple-mfd']
>> arch/arm64/boot/dts/sophgo/sg2000-milkv-duo-module-01-evb.dtb: /soc/syscon@3000000/phy@48: failed to match any schema with compatible: ['sophgo,cv1800b-usb2-phy']
>> arch/arm64/boot/dts/sophgo/sg2000-milkv-duo-module-01-evb.dtb: /soc/syscon@3000000/dma-router@154: failed to match any schema with compatible: ['sophgo,cv1800b-dmamux']
>> arch/arm64/boot/dts/sophgo/sg2000-milkv-duo-module-01-evb.dtb: dma-router@154 (sophgo,cv1800b-dmamux): dma-masters: 4 is not of type 'array'
   	from schema $id: http://devicetree.org/schemas/dma/dma-router.yaml#
>> arch/arm64/boot/dts/sophgo/sg2000-milkv-duo-module-01-evb.dtb: dma-router@154 (sophgo,cv1800b-dmamux): dma-masters: 4 is not of type 'array'
   	from schema $id: http://devicetree.org/schemas/dma/dma-router.yaml#
   arch/arm64/boot/dts/sophgo/sg2000-milkv-duo-module-01-evb.dtb: /soc/reset-controller@3003000: failed to match any schema with compatible: ['sophgo,cv1800b-reset']
   arch/arm64/boot/dts/sophgo/sg2000-milkv-duo-module-01-evb.dtb: /soc/mdio@3009000: failed to match any schema with compatible: ['sophgo,cv1800b-mdio-mux']
   arch/arm64/boot/dts/sophgo/sg2000-milkv-duo-module-01-evb.dtb: /soc/ethernet@4070000: failed to match any schema with compatible: ['sophgo,cv1800b-dwmac', 'snps,dwmac-3.70a']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
