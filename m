Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C6B91F936
	for <oe-kbuild@lists.linux.dev>; Sun,  1 Feb 2026 08:02:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769932950; cv=none; b=tjDebxxSs5gLYvps/Zy9TI08n+xEplI5UyqgtZuTF1YBliyuen4Aj2lX6os3Bg/VTy4cVgHLip56yxs4K4Xx4FF8wGAcNVki2MvKOiOBcs5SoI08sjaNVbAbXxfUbWA84Nhc3IBdpb1N/EsnDoV+6u/96jMIYlfRUVxkXQ7oWK0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769932950; c=relaxed/simple;
	bh=5g5xB9Tcs95ke27sjeAyVQ0dEe04or3GNBmoLCtR2tM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=rRSv7A6xht7NWL9a1FVnohwhO5KwKtxrGx+KczxgRfBta0mW5q77E6WwSWF0J+aimnikXduMOwNXc27uwUjH2U0k2WDltbQwaSO8C8LCO28Nhhv9P1ZQ9KmwukPJSWtmwKx1nJw9Ozm1zRkQSEPfXuPDpwRtVdI1M8kbxdEsZrQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=grHUeeXT; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="grHUeeXT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769932949; x=1801468949;
  h=date:from:to:cc:subject:message-id;
  bh=5g5xB9Tcs95ke27sjeAyVQ0dEe04or3GNBmoLCtR2tM=;
  b=grHUeeXTHIBC0gsXPMvBSoqnOXVK26bZ+zQB57iz2ij1YeTfyuh1raN+
   sO1DTv65Bh0fiRaWsdAF6WgGNLy3W5o4DasxarMpYIY4n4+SpUoaDyduF
   lz/tPwXJjpF99lpSSLw1U1j24GAnpqgej6CtggoFwEotMq2e/lp1OYy/4
   vtGi4+oLo1qDGNZZGGQ7uCsqFlFWXJYqoAZe6tzuGC1vIHW6xNUYbCg5g
   JZnomZZjucWiK+xnLcL0I2OeE6zLPZRuO6JI1bd6Be8g3oMtCe5C+HyC2
   XeGixXiHY0hP0Ev3xuMn8xI7B+qcVAMfEUN8fRHy1hOp89MIoCFJsBxOI
   w==;
X-CSE-ConnectionGUID: hfKqeiJoQqmZtgt0xrXe/g==
X-CSE-MsgGUID: lssyi4A4QsmyG1iLIoxbEw==
X-IronPort-AV: E=McAfee;i="6800,10657,11688"; a="71021004"
X-IronPort-AV: E=Sophos;i="6.21,266,1763452800"; 
   d="scan'208";a="71021004"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Feb 2026 00:02:28 -0800
X-CSE-ConnectionGUID: /aMv3/YhT7qrH+pNI899xA==
X-CSE-MsgGUID: SwBK2FryQpiDWg1OqK+Ppg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,266,1763452800"; 
   d="scan'208";a="213710541"
Received: from igk-lkp-server01.igk.intel.com (HELO afc5bfd7f602) ([10.211.93.152])
  by fmviesa005.fm.intel.com with ESMTP; 01 Feb 2026 00:02:26 -0800
Received: from kbuild by afc5bfd7f602 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vmSPY-000000002vd-11NR;
	Sun, 01 Feb 2026 08:02:24 +0000
Date: Sun, 01 Feb 2026 09:01:32 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [dinguyen:socfpga_dts_for_v6.20_v2 10/12]
 arch/arm64/boot/dts/intel/socfpga_agilex3_socdk.dtb: dma-controller@0
 (altr,agilex5-axi-dma): compatible:0: 'altr,agilex5-axi-dma' is not one of
 ['snps,axi-dma-1.01a', 'intel,kmb-axi-dma', 'starfive,jh7110-axi-dma',
 'starfive,jh8100-axi-dma']
Message-ID: <202602010901.YZMGyROG-lkp@intel.com>
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
TO: Khairul Anuar Romli <khairul.anuar.romli@altera.com>
CC: Dinh Nguyen <dinguyen@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dinguyen/linux.git socfpga_dts_for_v6.20_v2
head:   42a8d7d72185247c0bbada1d2c44bef743ee6a5d
commit: 4e6e93dfd501a16650806e7a39aa7b5203867276 [10/12] arm64: dts: intel: agilex5: Add simple-bus node on top of dma controller node
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: arm64-randconfig-2051-20260131 (https://download.01.org/0day-ci/archive/20260201/202602010901.YZMGyROG-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
dtschema version: 2025.13.dev4+g85cec3155
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260201/202602010901.YZMGyROG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202602010901.YZMGyROG-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/intel/socfpga_agilex3_socdk.dtb: dma-controller@0 (altr,agilex5-axi-dma): compatible:0: 'altr,agilex5-axi-dma' is not one of ['snps,axi-dma-1.01a', 'intel,kmb-axi-dma', 'starfive,jh7110-axi-dma', 'starfive,jh8100-axi-dma']
   	from schema $id: http://devicetree.org/schemas/dma/snps,dw-axi-dmac.yaml
>> arch/arm64/boot/dts/intel/socfpga_agilex3_socdk.dtb: dma-controller@0 (altr,agilex5-axi-dma): compatible: ['altr,agilex5-axi-dma', 'snps,axi-dma-1.01a'] is too long
   	from schema $id: http://devicetree.org/schemas/dma/snps,dw-axi-dmac.yaml
>> arch/arm64/boot/dts/intel/socfpga_agilex3_socdk.dtb: /soc@0/dma-bus@10db0000/dma-controller@0: failed to match any schema with compatible: ['altr,agilex5-axi-dma', 'snps,axi-dma-1.01a']
   arch/arm64/boot/dts/intel/socfpga_agilex3_socdk.dtb: dma-controller@10000 (altr,agilex5-axi-dma): compatible:0: 'altr,agilex5-axi-dma' is not one of ['snps,axi-dma-1.01a', 'intel,kmb-axi-dma', 'starfive,jh7110-axi-dma', 'starfive,jh8100-axi-dma']
   	from schema $id: http://devicetree.org/schemas/dma/snps,dw-axi-dmac.yaml
   arch/arm64/boot/dts/intel/socfpga_agilex3_socdk.dtb: dma-controller@10000 (altr,agilex5-axi-dma): compatible: ['altr,agilex5-axi-dma', 'snps,axi-dma-1.01a'] is too long
   	from schema $id: http://devicetree.org/schemas/dma/snps,dw-axi-dmac.yaml
   arch/arm64/boot/dts/intel/socfpga_agilex3_socdk.dtb: /soc@0/dma-bus@10db0000/dma-controller@10000: failed to match any schema with compatible: ['altr,agilex5-axi-dma', 'snps,axi-dma-1.01a']
--
>> arch/arm64/boot/dts/intel/socfpga_agilex5_socdk.dtb: dma-controller@0 (altr,agilex5-axi-dma): compatible:0: 'altr,agilex5-axi-dma' is not one of ['snps,axi-dma-1.01a', 'intel,kmb-axi-dma', 'starfive,jh7110-axi-dma', 'starfive,jh8100-axi-dma']
   	from schema $id: http://devicetree.org/schemas/dma/snps,dw-axi-dmac.yaml
>> arch/arm64/boot/dts/intel/socfpga_agilex5_socdk.dtb: dma-controller@0 (altr,agilex5-axi-dma): compatible: ['altr,agilex5-axi-dma', 'snps,axi-dma-1.01a'] is too long
   	from schema $id: http://devicetree.org/schemas/dma/snps,dw-axi-dmac.yaml
>> arch/arm64/boot/dts/intel/socfpga_agilex5_socdk.dtb: /soc@0/dma-bus@10db0000/dma-controller@0: failed to match any schema with compatible: ['altr,agilex5-axi-dma', 'snps,axi-dma-1.01a']
   arch/arm64/boot/dts/intel/socfpga_agilex5_socdk.dtb: dma-controller@10000 (altr,agilex5-axi-dma): compatible:0: 'altr,agilex5-axi-dma' is not one of ['snps,axi-dma-1.01a', 'intel,kmb-axi-dma', 'starfive,jh7110-axi-dma', 'starfive,jh8100-axi-dma']
   	from schema $id: http://devicetree.org/schemas/dma/snps,dw-axi-dmac.yaml
   arch/arm64/boot/dts/intel/socfpga_agilex5_socdk.dtb: dma-controller@10000 (altr,agilex5-axi-dma): compatible: ['altr,agilex5-axi-dma', 'snps,axi-dma-1.01a'] is too long
   	from schema $id: http://devicetree.org/schemas/dma/snps,dw-axi-dmac.yaml
   arch/arm64/boot/dts/intel/socfpga_agilex5_socdk.dtb: /soc@0/dma-bus@10db0000/dma-controller@10000: failed to match any schema with compatible: ['altr,agilex5-axi-dma', 'snps,axi-dma-1.01a']
--
>> arch/arm64/boot/dts/intel/socfpga_agilex5_socdk_013b.dtb: dma-controller@0 (altr,agilex5-axi-dma): compatible:0: 'altr,agilex5-axi-dma' is not one of ['snps,axi-dma-1.01a', 'intel,kmb-axi-dma', 'starfive,jh7110-axi-dma', 'starfive,jh8100-axi-dma']
   	from schema $id: http://devicetree.org/schemas/dma/snps,dw-axi-dmac.yaml
>> arch/arm64/boot/dts/intel/socfpga_agilex5_socdk_013b.dtb: dma-controller@0 (altr,agilex5-axi-dma): compatible: ['altr,agilex5-axi-dma', 'snps,axi-dma-1.01a'] is too long
   	from schema $id: http://devicetree.org/schemas/dma/snps,dw-axi-dmac.yaml
>> arch/arm64/boot/dts/intel/socfpga_agilex5_socdk_013b.dtb: /soc@0/dma-bus@10db0000/dma-controller@0: failed to match any schema with compatible: ['altr,agilex5-axi-dma', 'snps,axi-dma-1.01a']
   arch/arm64/boot/dts/intel/socfpga_agilex5_socdk_013b.dtb: dma-controller@10000 (altr,agilex5-axi-dma): compatible:0: 'altr,agilex5-axi-dma' is not one of ['snps,axi-dma-1.01a', 'intel,kmb-axi-dma', 'starfive,jh7110-axi-dma', 'starfive,jh8100-axi-dma']
   	from schema $id: http://devicetree.org/schemas/dma/snps,dw-axi-dmac.yaml
   arch/arm64/boot/dts/intel/socfpga_agilex5_socdk_013b.dtb: dma-controller@10000 (altr,agilex5-axi-dma): compatible: ['altr,agilex5-axi-dma', 'snps,axi-dma-1.01a'] is too long
   	from schema $id: http://devicetree.org/schemas/dma/snps,dw-axi-dmac.yaml
   arch/arm64/boot/dts/intel/socfpga_agilex5_socdk_013b.dtb: /soc@0/dma-bus@10db0000/dma-controller@10000: failed to match any schema with compatible: ['altr,agilex5-axi-dma', 'snps,axi-dma-1.01a']
--
   	'enclustra,mercury-aa1' was expected
   	'altr,socfpga-cyclone5' was expected
   	'enclustra,mercury-sa1' was expected
   	'enclustra,mercury-sa2' was expected
   	'altr,socfpga-stratix10' was expected
   	'intel,socfpga-agilex' was expected
   	'intel,socfpga-agilex3' was expected
   	'altr,socfpga' was expected
   	from schema $id: http://devicetree.org/schemas/arm/altera.yaml
   arch/arm64/boot/dts/intel/socfpga_agilex5_socdk_modular.dtb: /: failed to match any schema with compatible: ['intel,socfpga-agilex5-socdk-modular', 'intel,socfpga-agilex5']
>> arch/arm64/boot/dts/intel/socfpga_agilex5_socdk_modular.dtb: dma-controller@0 (altr,agilex5-axi-dma): compatible:0: 'altr,agilex5-axi-dma' is not one of ['snps,axi-dma-1.01a', 'intel,kmb-axi-dma', 'starfive,jh7110-axi-dma', 'starfive,jh8100-axi-dma']
   	from schema $id: http://devicetree.org/schemas/dma/snps,dw-axi-dmac.yaml
>> arch/arm64/boot/dts/intel/socfpga_agilex5_socdk_modular.dtb: dma-controller@0 (altr,agilex5-axi-dma): compatible: ['altr,agilex5-axi-dma', 'snps,axi-dma-1.01a'] is too long
   	from schema $id: http://devicetree.org/schemas/dma/snps,dw-axi-dmac.yaml
>> arch/arm64/boot/dts/intel/socfpga_agilex5_socdk_modular.dtb: /soc@0/dma-bus@10db0000/dma-controller@0: failed to match any schema with compatible: ['altr,agilex5-axi-dma', 'snps,axi-dma-1.01a']
   arch/arm64/boot/dts/intel/socfpga_agilex5_socdk_modular.dtb: dma-controller@10000 (altr,agilex5-axi-dma): compatible:0: 'altr,agilex5-axi-dma' is not one of ['snps,axi-dma-1.01a', 'intel,kmb-axi-dma', 'starfive,jh7110-axi-dma', 'starfive,jh8100-axi-dma']
   	from schema $id: http://devicetree.org/schemas/dma/snps,dw-axi-dmac.yaml
   arch/arm64/boot/dts/intel/socfpga_agilex5_socdk_modular.dtb: dma-controller@10000 (altr,agilex5-axi-dma): compatible: ['altr,agilex5-axi-dma', 'snps,axi-dma-1.01a'] is too long
   	from schema $id: http://devicetree.org/schemas/dma/snps,dw-axi-dmac.yaml
   arch/arm64/boot/dts/intel/socfpga_agilex5_socdk_modular.dtb: /soc@0/dma-bus@10db0000/dma-controller@10000: failed to match any schema with compatible: ['altr,agilex5-axi-dma', 'snps,axi-dma-1.01a']
--
   arch/arm64/boot/dts/intel/socfpga_agilex5_socdk_nand.dtb: nand-controller@10b80000 (cdns,hp-nfc): Unevaluated properties are not allowed ('dma-coherent' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mtd/cdns,hp-nfc.yaml
>> arch/arm64/boot/dts/intel/socfpga_agilex5_socdk_nand.dtb: dma-controller@0 (altr,agilex5-axi-dma): compatible:0: 'altr,agilex5-axi-dma' is not one of ['snps,axi-dma-1.01a', 'intel,kmb-axi-dma', 'starfive,jh7110-axi-dma', 'starfive,jh8100-axi-dma']
   	from schema $id: http://devicetree.org/schemas/dma/snps,dw-axi-dmac.yaml
>> arch/arm64/boot/dts/intel/socfpga_agilex5_socdk_nand.dtb: dma-controller@0 (altr,agilex5-axi-dma): compatible: ['altr,agilex5-axi-dma', 'snps,axi-dma-1.01a'] is too long
   	from schema $id: http://devicetree.org/schemas/dma/snps,dw-axi-dmac.yaml
>> arch/arm64/boot/dts/intel/socfpga_agilex5_socdk_nand.dtb: /soc@0/dma-bus@10db0000/dma-controller@0: failed to match any schema with compatible: ['altr,agilex5-axi-dma', 'snps,axi-dma-1.01a']
   arch/arm64/boot/dts/intel/socfpga_agilex5_socdk_nand.dtb: dma-controller@10000 (altr,agilex5-axi-dma): compatible:0: 'altr,agilex5-axi-dma' is not one of ['snps,axi-dma-1.01a', 'intel,kmb-axi-dma', 'starfive,jh7110-axi-dma', 'starfive,jh8100-axi-dma']
   	from schema $id: http://devicetree.org/schemas/dma/snps,dw-axi-dmac.yaml
   arch/arm64/boot/dts/intel/socfpga_agilex5_socdk_nand.dtb: dma-controller@10000 (altr,agilex5-axi-dma): compatible: ['altr,agilex5-axi-dma', 'snps,axi-dma-1.01a'] is too long
   	from schema $id: http://devicetree.org/schemas/dma/snps,dw-axi-dmac.yaml
   arch/arm64/boot/dts/intel/socfpga_agilex5_socdk_nand.dtb: /soc@0/dma-bus@10db0000/dma-controller@10000: failed to match any schema with compatible: ['altr,agilex5-axi-dma', 'snps,axi-dma-1.01a']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
