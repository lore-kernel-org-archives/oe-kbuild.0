Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A6211F63D9
	for <oe-kbuild@lists.linux.dev>; Mon, 17 Aug 2026 17:26:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786987602; cv=none; b=szzBXN1RuXj6vDlviVTmf7lo6gg5Dwps+sZYSeiC7qtHyUfBp7yyFPWKMclSVzohgJeRuCtPgqeqmoJ4FqGdhzXjErzl23UNEpoJAf68ksp7lMsLTj4yYbFXeVAcprcpPyDAcPXcxJVcey3rIX3AQSpnPuvl/8hCC9ZbLRJaH9c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786987602; c=relaxed/simple;
	bh=mlntg1Sz//hEQAN39vb8MhpXZ7RBoXzCAzW2xr57qFA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=aG2SIjUzY9wMEBqfKT73Jlbsq9JnN7jbJ/nQ1cMeYgygaMdACUnREEbhOZiJVZceZGCOG74EbiNBVZjZz7le1+MDz6ESrytTKEuXyORytsA7L20UuDLMZNbO59PYz9UYIlooU2VHqTDtFzNP5MyHD/wn9OQRkm4TNbz7m/2h9t4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HNtTanU5; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HNtTanU5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786987602; x=1818523602;
  h=date:from:to:cc:subject:message-id;
  bh=mlntg1Sz//hEQAN39vb8MhpXZ7RBoXzCAzW2xr57qFA=;
  b=HNtTanU5knsWF4HDrlknj5aa3Oj8PhK9ac5xTBHK56Q5jPVb0Lv6XSww
   aSXBZiUtiteVQZ2ZS9bbMW3DsROhrmW41pt6Qkm8B6RLEgCdmMcS1GxZq
   cYMbuxZ+llas1oWUtOMfrO1Viin4jCgmSU4GoPMfm4+K2ASNyJ8jDSKXb
   rxCDVNQjdQeioCaE9jRq0Mj34KL3tZonM7M+rWx16YgSBZJtfu3rIHf00
   JU8eQ/+l3wQBEVvc1+O/86Bu5Gg5ZRwey2ncmBIriTTaMQveFr25teUUe
   mFoLfUs6z5mC3IzshcQNSxJctnEoNPQt3/O73MKTn+IsUOEPtbzJ2mHtE
   Q==;
X-CSE-ConnectionGUID: aq2XR6tHSFWWTk6mK6rMzw==
X-CSE-MsgGUID: VKE/3kPbQI6PVTThbJYzuA==
X-IronPort-AV: E=McAfee;i="6800,10657,11878"; a="110253719"
X-IronPort-AV: E=Sophos;i="6.25,229,1779174000"; 
   d="scan'208";a="110253719"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Aug 2026 10:26:41 -0700
X-CSE-ConnectionGUID: NTpo/Dx2RM2TxNR4LJXW0A==
X-CSE-MsgGUID: UyuJKd+VR0W4P1DF+Lx7ew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,229,1779174000"; 
   d="scan'208";a="261712931"
Received: from igk-lkp-server01.igk.intel.com (HELO 3cba2a188a06) ([10.211.93.152])
  by fmviesa007.fm.intel.com with ESMTP; 17 Aug 2026 10:26:39 -0700
Received: from kbuild by 3cba2a188a06 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1ww16b-000000006wj-2CsU;
	Mon, 17 Aug 2026 17:26:37 +0000
Date: Mon, 17 Aug 2026 19:26:32 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: arch/arm64/boot/dts/freescale/imx95-var-dart-sonata.dtb:
 opp-500000000: opp-hz-real: b'\x00\x00\x00\x00\x1d\xcde\x00' is not of type
 'object', 'integer', 'array', 'boolean', 'null'
Message-ID: <202608171907.2w9TH5g4-lkp@intel.com>
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
TO: Stefano Radaelli <stefano.r@variscite.com>
CC: Frank Li <Frank.Li@nxp.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   8d3ae59288f1e7d58d76558a6ee96d533bc5019f
commit: 496d258cf339743ba7fade3c6949b0cca64af80b arm64: dts: imx95-var-dart: Add support for Variscite Sonata board
date:   5 months ago
:::::: branch date: 20 hours ago
:::::: commit date: 5 months ago
config: arm64-randconfig-2054-20260813 (https://download.01.org/0day-ci/archive/20260817/202608171907.2w9TH5g4-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.3.0
dtschema: 2026.7.dev15+g01b5073ab
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260817/202608171907.2w9TH5g4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 496d258cf339 ("arm64: dts: imx95-var-dart: Add support for Variscite Sonata board")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202608171907.2w9TH5g4-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   	'toradex,verdin-imx8mm' was expected
   	'ifm,imx8mn-vhip4' was expected
   	'avnet,sm2s-imx8mp' was expected
   	'toradex,verdin-imx8mp' was expected
   	'fsl,imx95' is not one of ['fsl,imx8qm', 'fsl,imx8qp']
   	'fsl,imx95' is not one of ['fsl,imx8qxp', 'fsl,imx8dx']
   	'fsl,vf500' was expected
   	from schema $id: http://devicetree.org/schemas/arm/fsl.yaml
   arch/arm64/boot/dts/freescale/imx95-var-dart-sonata.dtb: /: failed to match any schema with compatible: ['variscite,var-dart-mx95-sonata', 'variscite,var-dart-mx95', 'fsl,imx95']
   arch/arm64/boot/dts/freescale/imx95-var-dart-sonata.dtb: /: failed to match any schema with compatible: ['variscite,var-dart-mx95-sonata', 'variscite,var-dart-mx95', 'fsl,imx95']
>> arch/arm64/boot/dts/freescale/imx95-var-dart-sonata.dtb: opp-500000000: opp-hz-real: b'\x00\x00\x00\x00\x1d\xcde\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
>> arch/arm64/boot/dts/freescale/imx95-var-dart-sonata.dtb: opp-800000000: opp-hz-real: b'\x00\x00\x00\x00/\xaf\x08\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
>> arch/arm64/boot/dts/freescale/imx95-var-dart-sonata.dtb: opp-1000000000: opp-hz-real: b'\x00\x00\x00\x00;\x9a\xca\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
