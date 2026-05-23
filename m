Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5D6E13B7AE
	for <oe-kbuild@lists.linux.dev>; Sat, 23 May 2026 18:22:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779560575; cv=none; b=X0/lJz8/aO7zPL750c5TTbVJn50DvKf97btzBSRB4qs+MKHmRLSErrdPZ58i4pihLcCQ4hA2R9j9ifb2aoabFeN3/KlsKGmUWvB7pYJbL99MT1xZwKmMgPlDurRORI+8meIrpr76zaxT7Bi0Gi3jvZtUJRnciBIR56QZ+Rg0/Og=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779560575; c=relaxed/simple;
	bh=UDW7d4IQfBsjCOeqGFDsemKV5ArKjiqe4f8bhJ1RzTM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=WPwYqjY8dN5sZmP6pL1J6xzOU1VxY2+yrQxEP9Z6LA2TqpH7hHu0wuxKjgCAtByU2D1SfnCRQa7KE/eiv2al/kCUwbvfCEJuZDRzMjW5vSwPxmtJMH73VkNb4WvYh25FHiuvHKdG4mSE+ZPiOkKxv2m5Ecgcp+fiKGH8PqxAzH4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PlLzZ+O4; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PlLzZ+O4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779560574; x=1811096574;
  h=date:from:to:cc:subject:message-id;
  bh=UDW7d4IQfBsjCOeqGFDsemKV5ArKjiqe4f8bhJ1RzTM=;
  b=PlLzZ+O4cod43uGsgA//EVM/ykO/kkVYCieFff0SzTG+SK3MUH1eHWto
   xcauf6aPW77s4bP3RIy0PFD5rVjGC4L8Ohl7WdlCAVE1L8004Grpk7GAV
   x8awB6s/Z54j3aw63uj1KPaNZlGkFjGq6vf2l+3ermHD/KgXP0Stp7zu8
   gMbeDmri8RuP781uQUOuxfdFdv2jCIwQHub5dp/nQfg56TK+z7U8yROC6
   2tozJyZzxyxIYOOQ7IUn+WgeP5Uq6nhBniiATwA20yLSoYQB46ptrtfYM
   6NnVx2rYsKZ6xohhe+bh0EuzWfayPkXbG90XSww5y/sHSdHBQb32ftkR4
   w==;
X-CSE-ConnectionGUID: E+dk30UMTcaW+i/OEN2K4g==
X-CSE-MsgGUID: fkM279xfSOu7QiiHJYAEGg==
X-IronPort-AV: E=McAfee;i="6800,10657,11795"; a="67978697"
X-IronPort-AV: E=Sophos;i="6.24,164,1774335600"; 
   d="scan'208";a="67978697"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 May 2026 11:22:53 -0700
X-CSE-ConnectionGUID: 42sbSJ1KRimh+kbBuZ4vog==
X-CSE-MsgGUID: gnGlVveKQMCRtKI53Pc0Cg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,164,1774335600"; 
   d="scan'208";a="240365896"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by orviesa010.jf.intel.com with ESMTP; 23 May 2026 11:22:52 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wQqzp-00000000Bjl-1a5j;
	Sat, 23 May 2026 18:22:49 +0000
Date: Sat, 23 May 2026 20:21:50 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: arch/powerpc/boot/dts/fsl/t1023rdb.dtb: sdhc@114000
 (fsl,t1023-esdhc): Unevaluated properties are not allowed
 ('fsl,iommu-parent', 'fsl,liodn-reg' were unexpected)
Message-ID: <202605232051.s8cdSySk-lkp@intel.com>
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
TO: Alexander Stein <alexander.stein@ew.tq-group.com>
CC: Ulf Hansson <ulf.hansson@linaro.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   79bd2dded182b1d458b18e62684b7f82ffc682e5
commit: 0caebd1658bbb3796bec4e3449876742d29701ab dt-bindings: mmc: fsl,esdhc: Add explicit reference to mmc-controller-common
date:   9 months ago
:::::: branch date: 19 hours ago
:::::: commit date: 9 months ago
config: powerpc-randconfig-2051-20260521 (https://download.01.org/0day-ci/archive/20260523/202605232051.s8cdSySk-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project f43d6834093b19baf79beda8c0337ab020ac5f17)
dtschema: 2026.5.dev9+gdf9ad30c5
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260523/202605232051.s8cdSySk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 0caebd1658bb ("dt-bindings: mmc: fsl,esdhc: Add explicit reference to mmc-controller-common")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202605232051.s8cdSySk-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   	'fsl,qoriq-rcpm-2.0' was expected
   	'fsl,qoriq-rcpm-2.1+' was expected
   	from schema $id: http://devicetree.org/schemas/soc/fsl/fsl,rcpm.yaml
   arch/powerpc/boot/dts/fsl/t1023rdb.dtb: /soc@ffe000000/global-utilities@e2000: failed to match any schema with compatible: ['fsl,t1023-rcpm', 'fsl,qoriq-rcpm-2.1']
   arch/powerpc/boot/dts/fsl/t1023rdb.dtb: /soc@ffe000000/serdes@ea000: failed to match any schema with compatible: ['fsl,t1023-serdes']
   arch/powerpc/boot/dts/fsl/t1023rdb.dtb: /soc@ffe000000/global-utilities@fc000: failed to match any schema with compatible: ['fsl,t1023-scfg']
   arch/powerpc/boot/dts/fsl/t1023rdb.dtb: sdhc@114000 (fsl,t1023-esdhc): $nodename:0: 'sdhc@114000' does not match '^mmc(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml
   arch/powerpc/boot/dts/fsl/t1023rdb.dtb: sdhc@114000 (fsl,t1023-esdhc): compatible:0: 'fsl,t1023-esdhc' is not one of ['fsl,mpc8536-esdhc', 'fsl,mpc8378-esdhc', 'fsl,p2020-esdhc', 'fsl,p4080-esdhc', 'fsl,t1040-esdhc', 'fsl,t4240-esdhc', 'fsl,ls1012a-esdhc', 'fsl,ls1021a-esdhc', 'fsl,ls1028a-esdhc', 'fsl,ls1088a-esdhc', 'fsl,ls1043a-esdhc', 'fsl,ls1046a-esdhc', 'fsl,ls2080a-esdhc']
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml
>> arch/powerpc/boot/dts/fsl/t1023rdb.dtb: sdhc@114000 (fsl,t1023-esdhc): Unevaluated properties are not allowed ('fsl,iommu-parent', 'fsl,liodn-reg' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml
   arch/powerpc/boot/dts/fsl/t1023rdb.dtb: /soc@ffe000000/sdhc@114000: failed to match any schema with compatible: ['fsl,t1023-esdhc', 'fsl,esdhc']
   arch/powerpc/boot/dts/fsl/t1023rdb.dtb: i2c@119000 (fsl-i2c): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl-i2c'] is too short
   	'fsl-i2c' is not one of ['mpc5200-i2c', 'fsl,mpc5200-i2c', 'fsl,mpc5121-i2c', 'fsl,mpc8313-i2c', 'fsl,mpc8543-i2c', 'fsl,mpc8544-i2c']
   	'fsl,mpc5200b-i2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml
   arch/powerpc/boot/dts/fsl/t1023rdb.dtb: i2c@119000 (fsl-i2c): Unevaluated properties are not allowed ('cell-index', 'dfsrr' were unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml
   arch/powerpc/boot/dts/fsl/t1023rdb.dtb: i2c@119100 (fsl-i2c): compatible: 'oneOf' conditional failed, one must be fixed:
--
   	'fsl,qoriq-rcpm-2.0' was expected
   	'fsl,qoriq-rcpm-2.1+' was expected
   	from schema $id: http://devicetree.org/schemas/soc/fsl/fsl,rcpm.yaml
   arch/powerpc/boot/dts/fsl/t1024qds.dtb: /soc@ffe000000/global-utilities@e2000: failed to match any schema with compatible: ['fsl,t1023-rcpm', 'fsl,qoriq-rcpm-2.1']
   arch/powerpc/boot/dts/fsl/t1024qds.dtb: /soc@ffe000000/serdes@ea000: failed to match any schema with compatible: ['fsl,t1023-serdes']
   arch/powerpc/boot/dts/fsl/t1024qds.dtb: /soc@ffe000000/global-utilities@fc000: failed to match any schema with compatible: ['fsl,t1023-scfg']
   arch/powerpc/boot/dts/fsl/t1024qds.dtb: sdhc@114000 (fsl,t1023-esdhc): $nodename:0: 'sdhc@114000' does not match '^mmc(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml
   arch/powerpc/boot/dts/fsl/t1024qds.dtb: sdhc@114000 (fsl,t1023-esdhc): compatible:0: 'fsl,t1023-esdhc' is not one of ['fsl,mpc8536-esdhc', 'fsl,mpc8378-esdhc', 'fsl,p2020-esdhc', 'fsl,p4080-esdhc', 'fsl,t1040-esdhc', 'fsl,t4240-esdhc', 'fsl,ls1012a-esdhc', 'fsl,ls1021a-esdhc', 'fsl,ls1028a-esdhc', 'fsl,ls1088a-esdhc', 'fsl,ls1043a-esdhc', 'fsl,ls1046a-esdhc', 'fsl,ls2080a-esdhc']
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml
>> arch/powerpc/boot/dts/fsl/t1024qds.dtb: sdhc@114000 (fsl,t1023-esdhc): Unevaluated properties are not allowed ('fsl,iommu-parent', 'fsl,liodn-reg' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml
   arch/powerpc/boot/dts/fsl/t1024qds.dtb: /soc@ffe000000/sdhc@114000: failed to match any schema with compatible: ['fsl,t1023-esdhc', 'fsl,esdhc']
   arch/powerpc/boot/dts/fsl/t1024qds.dtb: i2c@118100 (fsl-i2c): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl-i2c'] is too short
   	'fsl-i2c' is not one of ['mpc5200-i2c', 'fsl,mpc5200-i2c', 'fsl,mpc5121-i2c', 'fsl,mpc8313-i2c', 'fsl,mpc8543-i2c', 'fsl,mpc8544-i2c']
   	'fsl,mpc5200b-i2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml
   arch/powerpc/boot/dts/fsl/t1024qds.dtb: i2c@118100 (fsl-i2c): Unevaluated properties are not allowed ('cell-index', 'dfsrr' were unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml
   arch/powerpc/boot/dts/fsl/t1024qds.dtb: i2c@119000 (fsl-i2c): compatible: 'oneOf' conditional failed, one must be fixed:
--
   	'fsl,qoriq-rcpm-2.0' was expected
   	'fsl,qoriq-rcpm-2.1+' was expected
   	from schema $id: http://devicetree.org/schemas/soc/fsl/fsl,rcpm.yaml
   arch/powerpc/boot/dts/fsl/t1024rdb.dtb: /soc@ffe000000/global-utilities@e2000: failed to match any schema with compatible: ['fsl,t1023-rcpm', 'fsl,qoriq-rcpm-2.1']
   arch/powerpc/boot/dts/fsl/t1024rdb.dtb: /soc@ffe000000/serdes@ea000: failed to match any schema with compatible: ['fsl,t1023-serdes']
   arch/powerpc/boot/dts/fsl/t1024rdb.dtb: /soc@ffe000000/global-utilities@fc000: failed to match any schema with compatible: ['fsl,t1023-scfg']
   arch/powerpc/boot/dts/fsl/t1024rdb.dtb: sdhc@114000 (fsl,t1023-esdhc): $nodename:0: 'sdhc@114000' does not match '^mmc(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml
   arch/powerpc/boot/dts/fsl/t1024rdb.dtb: sdhc@114000 (fsl,t1023-esdhc): compatible:0: 'fsl,t1023-esdhc' is not one of ['fsl,mpc8536-esdhc', 'fsl,mpc8378-esdhc', 'fsl,p2020-esdhc', 'fsl,p4080-esdhc', 'fsl,t1040-esdhc', 'fsl,t4240-esdhc', 'fsl,ls1012a-esdhc', 'fsl,ls1021a-esdhc', 'fsl,ls1028a-esdhc', 'fsl,ls1088a-esdhc', 'fsl,ls1043a-esdhc', 'fsl,ls1046a-esdhc', 'fsl,ls2080a-esdhc']
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml
>> arch/powerpc/boot/dts/fsl/t1024rdb.dtb: sdhc@114000 (fsl,t1023-esdhc): Unevaluated properties are not allowed ('fsl,iommu-parent', 'fsl,liodn-reg' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml
   arch/powerpc/boot/dts/fsl/t1024rdb.dtb: /soc@ffe000000/sdhc@114000: failed to match any schema with compatible: ['fsl,t1023-esdhc', 'fsl,esdhc']
   arch/powerpc/boot/dts/fsl/t1024rdb.dtb: i2c@119000 (fsl-i2c): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl-i2c'] is too short
   	'fsl-i2c' is not one of ['mpc5200-i2c', 'fsl,mpc5200-i2c', 'fsl,mpc5121-i2c', 'fsl,mpc8313-i2c', 'fsl,mpc8543-i2c', 'fsl,mpc8544-i2c']
   	'fsl,mpc5200b-i2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml
   arch/powerpc/boot/dts/fsl/t1024rdb.dtb: i2c@119000 (fsl-i2c): Unevaluated properties are not allowed ('cell-index', 'dfsrr' were unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml
   arch/powerpc/boot/dts/fsl/t1024rdb.dtb: i2c@119100 (fsl-i2c): compatible: 'oneOf' conditional failed, one must be fixed:

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
