Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D66D82556E
	for <oe-kbuild@lists.linux.dev>; Sun, 29 Mar 2026 03:36:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774755376; cv=none; b=RYv6PjRWniZ586RTJ8cibf8LY8zD8hWU2v4sZA+uzGvs/urqjr5eDQ7tqzco5rEEMLEKEwbXlPj4lzDL5fyZZ1MouVfmnqn06o7Yn28OqnBfVUGJSKb0srjzuqMGjiblOjfWZITNC2mvQKJetvFSI9MLNNfEAIitA9Izwa3asnw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774755376; c=relaxed/simple;
	bh=Lku/ec6+02JGWl792c68Rj1Idg3XqSOsaqD8vCeObQg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ZbJd+qYpK5JmtssIbruwu9jX9hLLNowOFBC+rtFDy/ZbRZfTqgp6E2W6D13Cy6uVzqmCWt2exYhfe+lNDa0bKxZfqPu4QbRdT1nlgDTfxbRMGwaRTyEni16xlZLNpj5P+X6LlnEjnqiSQU/91V1WVL0zy+Ow+70XoFV7uqEsIoY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iMEQSKrN; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iMEQSKrN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774755374; x=1806291374;
  h=date:from:to:cc:subject:message-id;
  bh=Lku/ec6+02JGWl792c68Rj1Idg3XqSOsaqD8vCeObQg=;
  b=iMEQSKrNPHNW+cqtHDrzRkrB3TScxwuPoHiTYVi4r9Cx3hZSxjoyugFB
   ieNcTW0Xt9qb+KKrPVVD876c/9h2q6ScnRflfVjBD2EbDMxbxBu+rIPik
   pVLj1pklaxi1mOZVjQmk232piQkty2zKFhUybVwCKjgEFpJVzv2MWBiLp
   bT3bKFMyRb0ICQrIZs8H2CL+CfB6MPLK8U4Cnrgq9Cm1fhRm9GKcdv3bu
   5rtd0FRd2TYBuHYL1Nn39cUjtnjG1dPUYxUW8UUouB3ES6EDby/yYnGVq
   V20o490xdXy9BJoW6D9ptA8BQogi5bZ+TqSoKHqiC2XRnGCUBq+EdbqG0
   w==;
X-CSE-ConnectionGUID: Jy2AUrLxRHC09IujyasiDw==
X-CSE-MsgGUID: xeqn3UQVR7inNUAbiR3jzA==
X-IronPort-AV: E=McAfee;i="6800,10657,11742"; a="86473488"
X-IronPort-AV: E=Sophos;i="6.23,147,1770624000"; 
   d="scan'208";a="86473488"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Mar 2026 20:36:13 -0700
X-CSE-ConnectionGUID: mRKB4tPlSk6LB06sGczfAQ==
X-CSE-MsgGUID: s1BsbIqGRFiwx/HFtx91UA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,147,1770624000"; 
   d="scan'208";a="230179700"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by orviesa004.jf.intel.com with ESMTP; 28 Mar 2026 20:36:12 -0700
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w6gwb-000000007p1-3pfq;
	Sun, 29 Mar 2026 03:36:09 +0000
Date: Sun, 29 Mar 2026 05:36:05 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [soc:socfpga/dt 5/12]
 arch/arm64/boot/dts/intel/socfpga_agilex5_socdk_modular.dtb: /
 (intel,socfpga-agilex5-socdk-modular): compatible: 'oneOf' conditional
 failed, one must be fixed:
Message-ID: <202603290529.avuNHcji-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "dtcheck: binding changes may go via different trees"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-arm-kernel@lists.infradead.org
CC: arm@kernel.org
TO: Dinh Nguyen <dinguyen@kernel.org>
CC: Krzysztof Kozlowski <krzk@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git socfpga/dt
head:   4d904af4d6ce29b9240ebecd35e31458d08cd577
commit: 1cb8486ac5f3adc0a4f38e8b59962c2314fc2ca5 [5/12] dt-bindings: arm: altera: combine Intel's SoCFPGA into altera.yaml
:::::: branch date: 8 weeks ago
:::::: commit date: 8 weeks ago
config: arm64-randconfig-2055-20260328 (https://download.01.org/0day-ci/archive/20260329/202603290529.avuNHcji-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project f43d6834093b19baf79beda8c0337ab020ac5f17)
dtschema: 2025.13.dev8+g0515abdd9
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260329/202603290529.avuNHcji-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202603290529.avuNHcji-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/intel/socfpga_agilex5_socdk_modular.dtb: / (intel,socfpga-agilex5-socdk-modular): compatible: 'oneOf' conditional failed, one must be fixed:
   	['intel,socfpga-agilex5-socdk-modular', 'intel,socfpga-agilex5'] is too short
   	'intel,socfpga-agilex5-socdk-modular' is not one of ['altr,socfpga-arria5-socdk']
   	'intel,socfpga-agilex5-socdk-modular' is not one of ['altr,socfpga-arria10-socdk']
   	'intel,socfpga-agilex5-socdk-modular' is not one of ['enclustra,mercury-aa1-pe1', 'enclustra,mercury-aa1-pe3', 'enclustra,mercury-aa1-st1', 'google,chameleon-v3']
   	'intel,socfpga-agilex5-socdk-modular' is not one of ['altr,socfpga-cyclone5-socdk', 'denx,mcvevk', 'ebv,socrates', 'macnica,sodia', 'novtech,chameleon96', 'samtec,vining', 'terasic,de0-atlas', 'terasic,de10-nano', 'terasic,socfpga-cyclone5-sockit']
   	'intel,socfpga-agilex5-socdk-modular' is not one of ['enclustra,mercury-sa1-pe1', 'enclustra,mercury-sa1-pe3', 'enclustra,mercury-sa1-st1']
   	'intel,socfpga-agilex5-socdk-modular' is not one of ['enclustra,mercury-sa2-pe1', 'enclustra,mercury-sa2-pe3', 'enclustra,mercury-sa2-st1']
   	'intel,socfpga-agilex5-socdk-modular' is not one of ['altr,socfpga-stratix10-socdk', 'altr,socfpga-stratix10-swvp']
   	'intel,socfpga-agilex5-socdk-modular' is not one of ['intel,n5x-socdk', 'intel,socfpga-agilex-n6000', 'intel,socfpga-agilex-socdk']
   	'intel,socfpga-agilex5-socdk-modular' is not one of ['intel,socfpga-agilex3-socdk']
--
   	'altr,socfpga-arria10' was expected
   	'enclustra,mercury-aa1' was expected
   	'altr,socfpga-cyclone5' was expected
   	'enclustra,mercury-sa1' was expected
   	'enclustra,mercury-sa2' was expected
   	'altr,socfpga-stratix10' was expected
   	'intel,socfpga-agilex' was expected
   	'intel,socfpga-agilex3' was expected
   	'altr,socfpga' was expected
   	from schema $id: http://devicetree.org/schemas/arm/altera.yaml
>> arch/arm64/boot/dts/intel/socfpga_agilex5_socdk_modular.dtb: /: failed to match any schema with compatible: ['intel,socfpga-agilex5-socdk-modular', 'intel,socfpga-agilex5']
   arch/arm64/boot/dts/intel/socfpga_agilex5_socdk_modular.dtb: dma-controller@10db0000 (snps,axi-dma-1.01a): 'dma-coherent' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/dma/snps,dw-axi-dmac.yaml
   arch/arm64/boot/dts/intel/socfpga_agilex5_socdk_modular.dtb: dma-controller@10dc0000 (snps,axi-dma-1.01a): 'dma-coherent' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/dma/snps,dw-axi-dmac.yaml

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
