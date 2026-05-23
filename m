Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDC0B37648D
	for <oe-kbuild@lists.linux.dev>; Sat, 23 May 2026 09:16:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779527805; cv=none; b=dh5THfwVDqvY5DtZzlObTH0p+h0WqKjz7VIVZhUExKPwV+Y9o7fkFgFwaE3bKLsN+BoZektcsCsp6pYyn3JrgNsP1y37Hf94weM5U50RCFy2uNTxHAr8647bVYawSfBbF50plfDCQdGMKCgqmZzhqs+bgfLkbbp1iVQvshphzHc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779527805; c=relaxed/simple;
	bh=FlxLqEeMQmjLbeeOxdSEWXz8wKPLN0EdGHtEGwJ+xGo=;
	h=Date:From:To:Cc:Subject:Message-ID; b=PDqgF/Db8JneavF+kNoVnOmZeuH6ziqWLvshFDty9CtKgl4VhIrhkuFb95k2gluF4XbcoLv0nPbBRR6LZsLS3mm6lab3ea69kFY2J7w7vzePilk9YclLm1lARBczmMVKHnRC+a3b9BfP4UwX/69sMRGQZfJZ+5KMC2d6Fy9oJxg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Svje7yIL; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Svje7yIL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779527802; x=1811063802;
  h=date:from:to:cc:subject:message-id;
  bh=FlxLqEeMQmjLbeeOxdSEWXz8wKPLN0EdGHtEGwJ+xGo=;
  b=Svje7yIL8sWSTKEt4sbMyaUGS4bVYFmkk8w4JBE7WrbkQPdbrFU6+O7C
   3Kl/G+VFvSDXmCGQqThIIC8zjkCmvnYxEU9to8Sv9JTaLYGvvrQP2UDIm
   ppKYQA/lCpNhYbaEZ3YfTe6dqJC3oRTh8SLRwdzgb98Q76frAq4xCXZFf
   DAFjMKh6IIUfgUPmuuHRnkanL6IMyqDliF1+53UZqjZoKHx4Ksbw+bCwC
   xrlwcnnH6lEqDr+Qd9tdgarzj/GTW+8KIcpRzLTBECVHy08xfvx0nE3Gt
   Iol+0l1p4V1zi5b1FOftfCHXrl6x2QfP3a6tv0qJyhw9uKu8PAWtnWwjq
   w==;
X-CSE-ConnectionGUID: tMULnKh+SDmTJ0QER5mkyg==
X-CSE-MsgGUID: W0BinqxvQpKVoH1re5gxwA==
X-IronPort-AV: E=McAfee;i="6800,10657,11794"; a="83018447"
X-IronPort-AV: E=Sophos;i="6.24,163,1774335600"; 
   d="scan'208";a="83018447"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 May 2026 02:16:41 -0700
X-CSE-ConnectionGUID: NLUt1anRSOmbX3TW59lVWg==
X-CSE-MsgGUID: yvjRcdenTBGc/s8BZE6SPQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,163,1774335600"; 
   d="scan'208";a="264685225"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by fmviesa002.fm.intel.com with ESMTP; 23 May 2026 02:16:40 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wQiTG-00000000BYb-0IMG;
	Sat, 23 May 2026 09:16:38 +0000
Date: Sat, 23 May 2026 11:16:05 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: arch/arm64/boot/dts/intel/socfpga_agilex3_socdk.dtb:
 ethernet@10830000 (altr,socfpga-stmmac-agilex5): Unevaluated properties are
 not allowed ('dma-coherent' was unexpected)
Message-ID: <202605231101.Wvmf3NRA-lkp@intel.com>
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
TO: Nazim Amirul <muhammad.nazim.amirul.nazle.asmade@altera.com>
CC: 0day robot <lkp@intel.com>

tree:   https://github.com/intel-lab-lkp/linux/commits/muhammad-nazim-amirul-nazle-asmade-altera-com/arm64-dts-socfpga-Enable-the-SMMU-for-SoCFPGA-device-trees/20260515-010252
head:   64aae63a667af31c0c92a45c8fe551c208be6fd3
commit: 64aae63a667af31c0c92a45c8fe551c208be6fd3 arm64: dts: socfpga: Add dma-coherent to XGMAC nodes
date:   9 days ago
:::::: branch date: 9 days ago
:::::: commit date: 9 days ago
config: arm64-randconfig-2055-20260522 (https://download.01.org/0day-ci/archive/20260523/202605231101.Wvmf3NRA-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
dtschema: 2026.5.dev9+gdf9ad30c5
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260523/202605231101.Wvmf3NRA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202605231101.Wvmf3NRA-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/intel/socfpga_agilex3_socdk.dtb: ethernet@10830000 (altr,socfpga-stmmac-agilex5): Unevaluated properties are not allowed ('dma-coherent' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/altr,socfpga-stmmac.yaml
--
>> arch/arm64/boot/dts/intel/socfpga_agilex5_socdk.dtb: ethernet@10830000 (altr,socfpga-stmmac-agilex5): Unevaluated properties are not allowed ('dma-coherent' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/altr,socfpga-stmmac.yaml
--
>> arch/arm64/boot/dts/intel/socfpga_agilex5_socdk_013b.dtb: ethernet@10830000 (altr,socfpga-stmmac-agilex5): Unevaluated properties are not allowed ('dma-coherent' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/altr,socfpga-stmmac.yaml
--
>> arch/arm64/boot/dts/intel/socfpga_agilex5_socdk_modular.dtb: ethernet@10830000 (altr,socfpga-stmmac-agilex5): Unevaluated properties are not allowed ('dma-coherent' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/altr,socfpga-stmmac.yaml
--
>> arch/arm64/boot/dts/intel/socfpga_agilex5_socdk_nand.dtb: ethernet@10810000 (altr,socfpga-stmmac-agilex5): Unevaluated properties are not allowed ('dma-coherent' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/altr,socfpga-stmmac.yaml

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
