Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEE483C13E6
	for <oe-kbuild@lists.linux.dev>; Mon, 17 Aug 2026 20:49:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786999788; cv=none; b=uJIbBUMsmgDt1m6hXSJsKwxkVW/OAN7kM6xTUm6ZCa+QaygntZwCeVRlqhVTOqZVFVGer3dkPc9AcSKVf49gGKvGyiYmNcbXKpQrXqGv2O92I/hjV2qjx9waLco5e0CinYXHCLqSUbo4AwDblfXMmlYHS1XdgZmhMC/F8XP9/UM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786999788; c=relaxed/simple;
	bh=CSJsqbv32+qVPQ2pCaHtmVvNsSzUwV2BfxRCMKwF4Kg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=jvT0Jy+baKKOR6/SnbVqo3DdTyNkoAojygVTAjTiobEb9tMU38uH27JNwOf4FCf+zVBJVVYK/aeh7k+FIg3PdNk8yIHcEybeGgcAeFk366N+01or+ELiSlGKfYXlUi8/+xolIaqcdmyBnOmrt/mvPEiCYz+ze932u+eJHgLdOAo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fJbdtZQL; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fJbdtZQL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786999785; x=1818535785;
  h=date:from:to:cc:subject:message-id;
  bh=CSJsqbv32+qVPQ2pCaHtmVvNsSzUwV2BfxRCMKwF4Kg=;
  b=fJbdtZQLcPzjrOJfwNnaFCL3f/2wltlbjd9QTRY5+YF8B2pCwYAs/zZZ
   gKKV/JVcqzV6fcg1Q10vNTVB8Ic494qzi5bbTF20CMvFJ6NSaNJL4Nvvt
   KG6WEhKipVGxw9q2RwRTcuHPP3wB5057uxB3YjD2d+BWfmB9oYifkfbMz
   4AKzqLk0JtDZxwjJTFfAZFwwlIWT8sVo/C+fkMIHlMM5SYwKv4hLSd6J1
   0Youy3P1igM9gElPr41CzbMC60/F/2tQ0/qHDkgg/FmhIsbWgCO4Ih1CY
   WvDG6SFmnqdfSeZWNEMAVMHFE8BaYURRrLg7j8NNMdGyBYJyxtaxXsri8
   Q==;
X-CSE-ConnectionGUID: Uq3zsLawSJ6FVccZY1oOHA==
X-CSE-MsgGUID: 5rZs1EQvTBu+mSsDj6viBQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11878"; a="98076267"
X-IronPort-AV: E=Sophos;i="6.25,229,1779174000"; 
   d="scan'208";a="98076267"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Aug 2026 13:49:42 -0700
X-CSE-ConnectionGUID: +M0tn3ogR9CiAul9dz40qQ==
X-CSE-MsgGUID: ldAmy/KsRnOofmX7FgKRtw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,229,1779174000"; 
   d="scan'208";a="262387643"
Received: from igk-lkp-server01.igk.intel.com (HELO 3cba2a188a06) ([10.211.93.152])
  by fmviesa008.fm.intel.com with ESMTP; 17 Aug 2026 13:49:40 -0700
Received: from kbuild by 3cba2a188a06 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1ww4H4-000000006xl-2tSC;
	Mon, 17 Aug 2026 20:49:38 +0000
Date: Mon, 17 Aug 2026 22:49:19 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: arch/arm64/boot/dts/freescale/imx95-verdin-nonwifi-dev.dtb:
 opp-500000000: opp-hz-real: b'\x00\x00\x00\x00\x1d\xcde\x00' is not of type
 'object', 'integer', 'array', 'boolean', 'null'
Message-ID: <202608172232.wWaSpUZu-lkp@intel.com>
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
TO: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
CC: Frank Li <Frank.Li@nxp.com>
CC: Emanuele Ghidoli <emanuele.ghidoli@toradex.com>
CC: Francesco Dolcini <francesco.dolcini@toradex.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   8d3ae59288f1e7d58d76558a6ee96d533bc5019f
commit: 676d7ce22f002685ae624d922357fddbd2288cfe arm64: dts: freescale: Add Verdin iMX95 support
date:   5 months ago
:::::: branch date: 23 hours ago
:::::: commit date: 5 months ago
config: arm64-randconfig-2054-20260813 (https://download.01.org/0day-ci/archive/20260817/202608172232.wWaSpUZu-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.3.0
dtschema: 2026.7.dev15+g01b5073ab
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260817/202608172232.wWaSpUZu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 676d7ce22f00 ("arm64: dts: freescale: Add Verdin iMX95 support")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202608172232.wWaSpUZu-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   	'ifm,imx8mn-vhip4' was expected
   	'avnet,sm2s-imx8mp' was expected
   	'toradex,verdin-imx8mp' was expected
   	'toradex,verdin-imx95' is not one of ['fsl,imx8qm', 'fsl,imx8qp']
   	'toradex,verdin-imx95' is not one of ['fsl,imx8qxp', 'fsl,imx8dx']
   	'fsl,vf500' was expected
   	from schema $id: http://devicetree.org/schemas/arm/fsl.yaml
   arch/arm64/boot/dts/freescale/imx95-verdin-nonwifi-dev.dtb: /: failed to match any schema with compatible: ['toradex,verdin-imx95-nonwifi-dev', 'toradex,verdin-imx95-nonwifi', 'toradex,verdin-imx95', 'fsl,imx95']
   arch/arm64/boot/dts/freescale/imx95-verdin-nonwifi-dev.dtb: /: failed to match any schema with compatible: ['toradex,verdin-imx95-nonwifi-dev', 'toradex,verdin-imx95-nonwifi', 'toradex,verdin-imx95', 'fsl,imx95']
   arch/arm64/boot/dts/freescale/imx95-verdin-nonwifi-dev.dtb: /: failed to match any schema with compatible: ['toradex,verdin-imx95-nonwifi-dev', 'toradex,verdin-imx95-nonwifi', 'toradex,verdin-imx95', 'fsl,imx95']
>> arch/arm64/boot/dts/freescale/imx95-verdin-nonwifi-dev.dtb: opp-500000000: opp-hz-real: b'\x00\x00\x00\x00\x1d\xcde\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
>> arch/arm64/boot/dts/freescale/imx95-verdin-nonwifi-dev.dtb: opp-800000000: opp-hz-real: b'\x00\x00\x00\x00/\xaf\x08\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
>> arch/arm64/boot/dts/freescale/imx95-verdin-nonwifi-dev.dtb: opp-1000000000: opp-hz-real: b'\x00\x00\x00\x00;\x9a\xca\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
--
   	'ifm,imx8mn-vhip4' was expected
   	'avnet,sm2s-imx8mp' was expected
   	'toradex,verdin-imx8mp' was expected
   	'toradex,verdin-imx95' is not one of ['fsl,imx8qm', 'fsl,imx8qp']
   	'toradex,verdin-imx95' is not one of ['fsl,imx8qxp', 'fsl,imx8dx']
   	'fsl,vf500' was expected
   	from schema $id: http://devicetree.org/schemas/arm/fsl.yaml
   arch/arm64/boot/dts/freescale/imx95-verdin-wifi-dev.dtb: /: failed to match any schema with compatible: ['toradex,verdin-imx95-wifi-dev', 'toradex,verdin-imx95-wifi', 'toradex,verdin-imx95', 'fsl,imx95']
   arch/arm64/boot/dts/freescale/imx95-verdin-wifi-dev.dtb: /: failed to match any schema with compatible: ['toradex,verdin-imx95-wifi-dev', 'toradex,verdin-imx95-wifi', 'toradex,verdin-imx95', 'fsl,imx95']
   arch/arm64/boot/dts/freescale/imx95-verdin-wifi-dev.dtb: /: failed to match any schema with compatible: ['toradex,verdin-imx95-wifi-dev', 'toradex,verdin-imx95-wifi', 'toradex,verdin-imx95', 'fsl,imx95']
>> arch/arm64/boot/dts/freescale/imx95-verdin-wifi-dev.dtb: opp-500000000: opp-hz-real: b'\x00\x00\x00\x00\x1d\xcde\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
>> arch/arm64/boot/dts/freescale/imx95-verdin-wifi-dev.dtb: opp-800000000: opp-hz-real: b'\x00\x00\x00\x00/\xaf\x08\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
>> arch/arm64/boot/dts/freescale/imx95-verdin-wifi-dev.dtb: opp-1000000000: opp-hz-real: b'\x00\x00\x00\x00;\x9a\xca\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
