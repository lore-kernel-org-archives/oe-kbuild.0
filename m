Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 897322D9EDB
	for <oe-kbuild@lists.linux.dev>; Thu,  7 May 2026 17:55:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778176543; cv=none; b=X2FkvhlEjX/t646AJbaRQatyRA+aOEw5p3o53hynM2VVIrrA+GrlD8UBxsTHp3Ie/VutRMSALbzDAhlC9QtPBH9JghjzcN9Jxvq2t9Y2LJzh+/mkfmiUxfmQ763OaIyPioHMFQLbtsL7ISuxSbX3JlVuy8Vbym2M4rpaCImcX3g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778176543; c=relaxed/simple;
	bh=FGR1NlWy70OyXvD+ccHtMvTgFs1Atd6qpvrm6FiM8kQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=nGxki7MQztz+AfvLN84m8o13uNzeEcdBOw1FuPhWFS3S8byvsRlA6KuLy8z5JYI9NUViQA5uHuWXZh7OolLFFiiixq02gHcKzkOW0aFM/73BEBAIt7Xu5PvEBnTqT7oo5V0nerZoSS5abc0x38mmCTgDbsyRrKqtWevoSyaOsLs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iS3znsWz; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iS3znsWz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778176541; x=1809712541;
  h=date:from:to:cc:subject:message-id;
  bh=FGR1NlWy70OyXvD+ccHtMvTgFs1Atd6qpvrm6FiM8kQ=;
  b=iS3znsWzzN81XKl//0Yi8z9cxyzk8mp/Uy0lnoF7Q+gqhDKOXQO1b2wF
   TzXaCmQNqEy0q4BcvCPgxUa8NGI2NaU/UMU0wpdkGaZy5s/ZTsFYUoyy6
   tFS3vdyn+Yac5q1hxLY5N7qABG4anHyUitYNZrpWFm3Evm2PkvGviqRbE
   33caQRg046hhtNXsu5h3bmNMOVVl7ShZg7b/50azeXuLrtLuT9BlnUR/f
   qo7KwAQ25iu0ZLXaB5jL80KwfZAAhaWmqCACzQkfi0o+Cl8tRlc3wC+D7
   CrZSkrM7xyQweXE/2zKrNJ8VyLOZJJ/mVR+1xezxSEHBkx17neQvl9csI
   w==;
X-CSE-ConnectionGUID: 8YhmFoiJQQ6k23uBWnO9hA==
X-CSE-MsgGUID: PBmF/Ms1Si2b1zCfhPWQPg==
X-IronPort-AV: E=McAfee;i="6800,10657,11779"; a="104597788"
X-IronPort-AV: E=Sophos;i="6.23,221,1770624000"; 
   d="scan'208";a="104597788"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2026 10:55:41 -0700
X-CSE-ConnectionGUID: L2jP6GySSvet469WUzj/Dg==
X-CSE-MsgGUID: Bz8Vb4zKTNWy7eL88CG72w==
X-ExtLoop1: 1
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by fmviesa003.fm.intel.com with ESMTP; 07 May 2026 10:55:40 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wL2wk-000000006uj-03Z3;
	Thu, 07 May 2026 17:55:38 +0000
Date: Thu, 07 May 2026 19:55:07 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [frank-li:imx/dt64 36/49]
 arch/arm64/boot/dts/freescale/imx95-15x15-ab2.dtb: dma-controller@42210000
 (fsl,imx95-edma5): Unevaluated properties are not allowed ('iommus' was
 unexpected)
Message-ID: <202605071904.XptrcUdH-lkp@intel.com>
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
TO: Peng Fan <peng.fan@nxp.com>
CC: Frank Li <Frank.Li@nxp.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/frank.li/linux.git imx/dt64
head:   d570a0d019a3d84832bfc6867647d3581b0052f3
commit: 81fb7735768b1fbfb8b53cbebd7f81427f5660e8 [36/49] arm64: dts: imx95: Add iommus property and enable SMMU
:::::: branch date: 27 hours ago
:::::: commit date: 2 days ago
config: arm64-randconfig-2055-20260506 (https://download.01.org/0day-ci/archive/20260507/202605071904.XptrcUdH-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project f43d6834093b19baf79beda8c0337ab020ac5f17)
dtschema: 2026.5.dev4+g4ccc1997d
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260507/202605071904.XptrcUdH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202605071904.XptrcUdH-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/freescale/imx95-15x15-ab2.dtb: dma-controller@42210000 (fsl,imx95-edma5): Unevaluated properties are not allowed ('iommus' was unexpected)
   	from schema $id: http://devicetree.org/schemas/dma/fsl,edma.yaml
--
>> arch/arm64/boot/dts/freescale/imx95-15x15-evk.dtb: dma-controller@42210000 (fsl,imx95-edma5): Unevaluated properties are not allowed ('iommus' was unexpected)
   	from schema $id: http://devicetree.org/schemas/dma/fsl,edma.yaml
--
>> arch/arm64/boot/dts/freescale/imx95-15x15-frdm.dtb: dma-controller@42210000 (fsl,imx95-edma5): Unevaluated properties are not allowed ('iommus' was unexpected)
   	from schema $id: http://devicetree.org/schemas/dma/fsl,edma.yaml
--
>> arch/arm64/boot/dts/freescale/imx95-19x19-evk.dtb: dma-controller@42210000 (fsl,imx95-edma5): Unevaluated properties are not allowed ('iommus' was unexpected)
   	from schema $id: http://devicetree.org/schemas/dma/fsl,edma.yaml
--
   arch/arm64/boot/dts/freescale/imx95-19x19-evk.dts:55.18-58.4: Warning (unique_unit_address_if_enabled): /memory@80000000: duplicate unit-address (also used in node /cm7-cpu@80000000)
>> arch/arm64/boot/dts/freescale/imx95-19x19-evk-sof.dtb: dma-controller@42210000 (fsl,imx95-edma5): Unevaluated properties are not allowed ('iommus' was unexpected)
   	from schema $id: http://devicetree.org/schemas/dma/fsl,edma.yaml
--
>> arch/arm64/boot/dts/freescale/imx95-toradex-smarc-dev.dtb: dma-controller@42210000 (fsl,imx95-edma5): Unevaluated properties are not allowed ('iommus' was unexpected)
   	from schema $id: http://devicetree.org/schemas/dma/fsl,edma.yaml
--
>> arch/arm64/boot/dts/freescale/imx95-tqma9596sa-mb-smarc-2.dtb: dma-controller@42210000 (fsl,imx95-edma5): Unevaluated properties are not allowed ('iommus' was unexpected)
   	from schema $id: http://devicetree.org/schemas/dma/fsl,edma.yaml
--
>> arch/arm64/boot/dts/freescale/imx95-var-dart-sonata.dtb: dma-controller@42210000 (fsl,imx95-edma5): Unevaluated properties are not allowed ('iommus' was unexpected)
   	from schema $id: http://devicetree.org/schemas/dma/fsl,edma.yaml
--
>> arch/arm64/boot/dts/freescale/imx95-verdin-nonwifi-dahlia.dtb: dma-controller@42210000 (fsl,imx95-edma5): Unevaluated properties are not allowed ('iommus' was unexpected)
   	from schema $id: http://devicetree.org/schemas/dma/fsl,edma.yaml
--
>> arch/arm64/boot/dts/freescale/imx95-verdin-nonwifi-dev.dtb: dma-controller@42210000 (fsl,imx95-edma5): Unevaluated properties are not allowed ('iommus' was unexpected)
   	from schema $id: http://devicetree.org/schemas/dma/fsl,edma.yaml
--
>> arch/arm64/boot/dts/freescale/imx95-verdin-nonwifi-ivy.dtb: dma-controller@42210000 (fsl,imx95-edma5): Unevaluated properties are not allowed ('iommus' was unexpected)
   	from schema $id: http://devicetree.org/schemas/dma/fsl,edma.yaml
--
>> arch/arm64/boot/dts/freescale/imx95-verdin-nonwifi-mallow.dtb: dma-controller@42210000 (fsl,imx95-edma5): Unevaluated properties are not allowed ('iommus' was unexpected)
   	from schema $id: http://devicetree.org/schemas/dma/fsl,edma.yaml
--
>> arch/arm64/boot/dts/freescale/imx95-verdin-nonwifi-yavia.dtb: dma-controller@42210000 (fsl,imx95-edma5): Unevaluated properties are not allowed ('iommus' was unexpected)
   	from schema $id: http://devicetree.org/schemas/dma/fsl,edma.yaml
--
>> arch/arm64/boot/dts/freescale/imx95-verdin-wifi-dahlia.dtb: dma-controller@42210000 (fsl,imx95-edma5): Unevaluated properties are not allowed ('iommus' was unexpected)
   	from schema $id: http://devicetree.org/schemas/dma/fsl,edma.yaml
--
>> arch/arm64/boot/dts/freescale/imx95-verdin-wifi-dev.dtb: dma-controller@42210000 (fsl,imx95-edma5): Unevaluated properties are not allowed ('iommus' was unexpected)
   	from schema $id: http://devicetree.org/schemas/dma/fsl,edma.yaml
--
>> arch/arm64/boot/dts/freescale/imx95-verdin-wifi-ivy.dtb: dma-controller@42210000 (fsl,imx95-edma5): Unevaluated properties are not allowed ('iommus' was unexpected)
   	from schema $id: http://devicetree.org/schemas/dma/fsl,edma.yaml
--
>> arch/arm64/boot/dts/freescale/imx95-verdin-wifi-mallow.dtb: dma-controller@42210000 (fsl,imx95-edma5): Unevaluated properties are not allowed ('iommus' was unexpected)
   	from schema $id: http://devicetree.org/schemas/dma/fsl,edma.yaml
--
>> arch/arm64/boot/dts/freescale/imx95-verdin-wifi-yavia.dtb: dma-controller@42210000 (fsl,imx95-edma5): Unevaluated properties are not allowed ('iommus' was unexpected)
   	from schema $id: http://devicetree.org/schemas/dma/fsl,edma.yaml
--
>> arch/arm64/boot/dts/freescale/imx95-libra-rdk-fpsc.dtb: dma-controller@42210000 (fsl,imx95-edma5): Unevaluated properties are not allowed ('iommus' was unexpected)
   	from schema $id: http://devicetree.org/schemas/dma/fsl,edma.yaml
--
>> arch/arm64/boot/dts/freescale/imx95-19x19-verdin-evk.dtb: dma-controller@42210000 (fsl,imx95-edma5): Unevaluated properties are not allowed ('iommus' was unexpected)
   	from schema $id: http://devicetree.org/schemas/dma/fsl,edma.yaml
--
>> arch/arm64/boot/dts/freescale/imx95-19x19-evk-pcie0-ep.dtb: dma-controller@42210000 (fsl,imx95-edma5): Unevaluated properties are not allowed ('iommus' was unexpected)
   	from schema $id: http://devicetree.org/schemas/dma/fsl,edma.yaml
--
>> arch/arm64/boot/dts/freescale/imx95-19x19-evk-pcie1-ep.dtb: dma-controller@42210000 (fsl,imx95-edma5): Unevaluated properties are not allowed ('iommus' was unexpected)
   	from schema $id: http://devicetree.org/schemas/dma/fsl,edma.yaml
--
>> arch/arm64/boot/dts/freescale/imx95-15x15-evk-pcie0-ep.dtb: dma-controller@42210000 (fsl,imx95-edma5): Unevaluated properties are not allowed ('iommus' was unexpected)
   	from schema $id: http://devicetree.org/schemas/dma/fsl,edma.yaml

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
