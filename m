Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10A9227A91D
	for <oe-kbuild@lists.linux.dev>; Sun, 13 Jul 2025 17:14:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752426846; cv=none; b=lN1PYSjxPs4a5vdhoJ298VTVOkg4Zw9606pJ5HeawAqjWAoek96IrMe1q0yPF8Wnc8rD0W7R3XBlPM5RUj89DQNKm6iGTGUSNmnkbfXdLqUckUEth1P1atxQqp3GvJnu/tIWRDACP/elDl+Knq0VlsIoiHljZdYqq+qMi3bGbvk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752426846; c=relaxed/simple;
	bh=H6MwmhyUxitsmVejBMLzGmkYJtv4BdkKpdY21Yj2z4o=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=FBx7HtnEslFRuNsw6BX/U+xwq6i0AfOPNfD8RFd/LRnFxAjN0BgptAbfPe1mWxkNHlADgne3iB515hEa0sBgUf60ivokhYl8Nv5RF+ujtPpyPQy8OdsOMagEnae7CGthPklGp9sKDZ6R3fXBEwqKwM4C2JsufSpj184RPh7ifXI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Olga1RMz; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Olga1RMz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752426844; x=1783962844;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=H6MwmhyUxitsmVejBMLzGmkYJtv4BdkKpdY21Yj2z4o=;
  b=Olga1RMzx59v7bLFZW14Jwf+LliGq67EGTjyFghVGHSEpGPgtn4Ld4Im
   dnojseM1FvVAOQXqKJvnQIwKVOFJCdTynQk0R3NtZlmNAqQBaRY9ocreS
   jNPkmFHmc7rrqlXqPy+rsWum7sAT6aCA9Ou3W/+8SVZRa7rhgDbEgMjjc
   XOFO08Gv7+EsKDXhE9Ullt1RfLuqCGWJDbb4SSkjf6bU6mnRUqssWqyQh
   tG9n+JgTyZhzkIB2KMj8ptPQwUfwpJXBZWcooPOOsJ1E1L/zyFGx/RPOc
   QkBN4eZ7+t2Ompow0MDhZWOx+qfR5ZVpCnT6QHgxEjJzWQtSZb40FFCHt
   w==;
X-CSE-ConnectionGUID: ilFzbJezTMOtvmuxPpCmWw==
X-CSE-MsgGUID: Mffq8RgaQfKD07U2UseH8w==
X-IronPort-AV: E=McAfee;i="6800,10657,11491"; a="66079822"
X-IronPort-AV: E=Sophos;i="6.16,309,1744095600"; 
   d="scan'208";a="66079822"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jul 2025 10:14:03 -0700
X-CSE-ConnectionGUID: S4y0hjgDS+2vnNSphKxkFA==
X-CSE-MsgGUID: chfrCj8KROymiog/stLrTQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,309,1744095600"; 
   d="scan'208";a="187749174"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 13 Jul 2025 10:14:01 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ub0H0-0008DH-2Q;
	Sun, 13 Jul 2025 17:13:58 +0000
Date: Mon, 14 Jul 2025 01:13:04 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [shawnguo:imx/dt64 72/85]
 arch/arm64/boot/dts/freescale/imx8dx-colibri-aster.dtb:
 /bus@58000000/isi@58100000: failed to match any schema with compatible:
 ['fsl,imx8qxp-isi']
Message-ID: <202507140135.bgRACr6D-lkp@intel.com>
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
CC: linux-arm-kernel@lists.infradead.org
TO: Frank Li <Frank.Li@nxp.com>
CC: Shawn Guo <shawnguo@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git imx/dt64
head:   4f25d7f1439f12233768dce853260b8302424d16
commit: 2217f824371491ea07e0ec31022195280cddf20b [72/85] arm64: dts: imx8: add capture controller for i.MX8's img subsystem
:::::: branch date: 15 hours ago
:::::: commit date: 2 days ago
config: arm64-randconfig-054-20250712 (https://download.01.org/0day-ci/archive/20250714/202507140135.bgRACr6D-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 9.5.0
dtschema version: 2025.6.2.dev4+g8f79ddd
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250714/202507140135.bgRACr6D-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202507140135.bgRACr6D-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/freescale/imx8dx-colibri-aster.dtb: /bus@58000000/isi@58100000: failed to match any schema with compatible: ['fsl,imx8qxp-isi']
>> arch/arm64/boot/dts/freescale/imx8dx-colibri-aster.dtb: /bus@58000000/csi@58227000: failed to match any schema with compatible: ['fsl,imx8qxp-mipi-csi2']
   arch/arm64/boot/dts/freescale/imx8dx-colibri-aster.dtb: /bus@58000000/csi@58247000: failed to match any schema with compatible: ['fsl,imx8qxp-mipi-csi2']
   arch/arm64/boot/dts/freescale/imx8dx-colibri-aster.dtb: crypto@31400000 (fsl,imx8qxp-caam): 'power-domains' does not match any of the regexes: '^jr@[0-9a-f]+$', '^pinctrl-[0-9]+$', '^rtic@[0-9a-f]+$'
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec-v4.0.yaml#
   arch/arm64/boot/dts/freescale/imx8dx-colibri-aster.dtb: crypto@31400000 (fsl,imx8qxp-caam): jr@30000: 'power-domains' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec-v4.0.yaml#
   arch/arm64/boot/dts/freescale/imx8dx-colibri-aster.dtb: crypto@31400000 (fsl,imx8qxp-caam): jr@30000:compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,imx8qxp-job-ring', 'fsl,sec-v4.0-job-ring'] is too short
   	['fsl,imx8qxp-job-ring', 'fsl,sec-v4.0-job-ring'] is too long
   	'fsl,sec-v6.0-job-ring' was expected
   	'fsl,sec-v5.4-job-ring' was expected
--
>> arch/arm64/boot/dts/freescale/imx8dx-colibri-eval-v3.dtb: /bus@58000000/isi@58100000: failed to match any schema with compatible: ['fsl,imx8qxp-isi']
>> arch/arm64/boot/dts/freescale/imx8dx-colibri-eval-v3.dtb: /bus@58000000/csi@58227000: failed to match any schema with compatible: ['fsl,imx8qxp-mipi-csi2']
   arch/arm64/boot/dts/freescale/imx8dx-colibri-eval-v3.dtb: /bus@58000000/csi@58247000: failed to match any schema with compatible: ['fsl,imx8qxp-mipi-csi2']
   arch/arm64/boot/dts/freescale/imx8dx-colibri-eval-v3.dtb: crypto@31400000 (fsl,imx8qxp-caam): 'power-domains' does not match any of the regexes: '^jr@[0-9a-f]+$', '^pinctrl-[0-9]+$', '^rtic@[0-9a-f]+$'
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec-v4.0.yaml#
   arch/arm64/boot/dts/freescale/imx8dx-colibri-eval-v3.dtb: crypto@31400000 (fsl,imx8qxp-caam): jr@30000: 'power-domains' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec-v4.0.yaml#
   arch/arm64/boot/dts/freescale/imx8dx-colibri-eval-v3.dtb: crypto@31400000 (fsl,imx8qxp-caam): jr@30000:compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,imx8qxp-job-ring', 'fsl,sec-v4.0-job-ring'] is too short
   	['fsl,imx8qxp-job-ring', 'fsl,sec-v4.0-job-ring'] is too long
   	'fsl,sec-v6.0-job-ring' was expected
   	'fsl,sec-v5.4-job-ring' was expected
--
>> arch/arm64/boot/dts/freescale/imx8dx-colibri-iris-v2.dtb: /bus@58000000/isi@58100000: failed to match any schema with compatible: ['fsl,imx8qxp-isi']
>> arch/arm64/boot/dts/freescale/imx8dx-colibri-iris-v2.dtb: /bus@58000000/csi@58227000: failed to match any schema with compatible: ['fsl,imx8qxp-mipi-csi2']
   arch/arm64/boot/dts/freescale/imx8dx-colibri-iris-v2.dtb: /bus@58000000/csi@58247000: failed to match any schema with compatible: ['fsl,imx8qxp-mipi-csi2']
   arch/arm64/boot/dts/freescale/imx8dx-colibri-iris-v2.dtb: crypto@31400000 (fsl,imx8qxp-caam): 'power-domains' does not match any of the regexes: '^jr@[0-9a-f]+$', '^pinctrl-[0-9]+$', '^rtic@[0-9a-f]+$'
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec-v4.0.yaml#
   arch/arm64/boot/dts/freescale/imx8dx-colibri-iris-v2.dtb: crypto@31400000 (fsl,imx8qxp-caam): jr@30000: 'power-domains' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec-v4.0.yaml#
   arch/arm64/boot/dts/freescale/imx8dx-colibri-iris-v2.dtb: crypto@31400000 (fsl,imx8qxp-caam): jr@30000:compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,imx8qxp-job-ring', 'fsl,sec-v4.0-job-ring'] is too short
   	['fsl,imx8qxp-job-ring', 'fsl,sec-v4.0-job-ring'] is too long
   	'fsl,sec-v6.0-job-ring' was expected
   	'fsl,sec-v5.4-job-ring' was expected
--
>> arch/arm64/boot/dts/freescale/imx8dx-colibri-iris.dtb: /bus@58000000/isi@58100000: failed to match any schema with compatible: ['fsl,imx8qxp-isi']
>> arch/arm64/boot/dts/freescale/imx8dx-colibri-iris.dtb: /bus@58000000/csi@58227000: failed to match any schema with compatible: ['fsl,imx8qxp-mipi-csi2']
   arch/arm64/boot/dts/freescale/imx8dx-colibri-iris.dtb: /bus@58000000/csi@58247000: failed to match any schema with compatible: ['fsl,imx8qxp-mipi-csi2']
   arch/arm64/boot/dts/freescale/imx8dx-colibri-iris.dtb: crypto@31400000 (fsl,imx8qxp-caam): 'power-domains' does not match any of the regexes: '^jr@[0-9a-f]+$', '^pinctrl-[0-9]+$', '^rtic@[0-9a-f]+$'
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec-v4.0.yaml#
   arch/arm64/boot/dts/freescale/imx8dx-colibri-iris.dtb: crypto@31400000 (fsl,imx8qxp-caam): jr@30000: 'power-domains' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec-v4.0.yaml#
   arch/arm64/boot/dts/freescale/imx8dx-colibri-iris.dtb: crypto@31400000 (fsl,imx8qxp-caam): jr@30000:compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,imx8qxp-job-ring', 'fsl,sec-v4.0-job-ring'] is too short
   	['fsl,imx8qxp-job-ring', 'fsl,sec-v4.0-job-ring'] is too long
   	'fsl,sec-v6.0-job-ring' was expected
   	'fsl,sec-v5.4-job-ring' was expected
--
>> arch/arm64/boot/dts/freescale/imx8dxp-tqma8xdp-mba8xx.dtb: /bus@58000000/isi@58100000: failed to match any schema with compatible: ['fsl,imx8qxp-isi']
>> arch/arm64/boot/dts/freescale/imx8dxp-tqma8xdp-mba8xx.dtb: /bus@58000000/csi@58227000: failed to match any schema with compatible: ['fsl,imx8qxp-mipi-csi2']
   arch/arm64/boot/dts/freescale/imx8dxp-tqma8xdp-mba8xx.dtb: /bus@58000000/csi@58247000: failed to match any schema with compatible: ['fsl,imx8qxp-mipi-csi2']
   arch/arm64/boot/dts/freescale/imx8dxp-tqma8xdp-mba8xx.dtb: crypto@31400000 (fsl,imx8qxp-caam): 'power-domains' does not match any of the regexes: '^jr@[0-9a-f]+$', '^pinctrl-[0-9]+$', '^rtic@[0-9a-f]+$'
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec-v4.0.yaml#
   arch/arm64/boot/dts/freescale/imx8dxp-tqma8xdp-mba8xx.dtb: crypto@31400000 (fsl,imx8qxp-caam): jr@30000: 'power-domains' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec-v4.0.yaml#
   arch/arm64/boot/dts/freescale/imx8dxp-tqma8xdp-mba8xx.dtb: crypto@31400000 (fsl,imx8qxp-caam): jr@30000:compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,imx8qxp-job-ring', 'fsl,sec-v4.0-job-ring'] is too short
   	['fsl,imx8qxp-job-ring', 'fsl,sec-v4.0-job-ring'] is too long
   	'fsl,sec-v6.0-job-ring' was expected
   	'fsl,sec-v5.4-job-ring' was expected
--
>> arch/arm64/boot/dts/freescale/imx8dxp-tqma8xdps-mb-smarc-2.dtb: /bus@58000000/isi@58100000: failed to match any schema with compatible: ['fsl,imx8qxp-isi']
>> arch/arm64/boot/dts/freescale/imx8dxp-tqma8xdps-mb-smarc-2.dtb: /bus@58000000/csi@58227000: failed to match any schema with compatible: ['fsl,imx8qxp-mipi-csi2']
   arch/arm64/boot/dts/freescale/imx8dxp-tqma8xdps-mb-smarc-2.dtb: /bus@58000000/csi@58247000: failed to match any schema with compatible: ['fsl,imx8qxp-mipi-csi2']
   arch/arm64/boot/dts/freescale/imx8dxp-tqma8xdps-mb-smarc-2.dtb: crypto@31400000 (fsl,imx8qxp-caam): 'power-domains' does not match any of the regexes: '^jr@[0-9a-f]+$', '^pinctrl-[0-9]+$', '^rtic@[0-9a-f]+$'
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec-v4.0.yaml#
   arch/arm64/boot/dts/freescale/imx8dxp-tqma8xdps-mb-smarc-2.dtb: crypto@31400000 (fsl,imx8qxp-caam): jr@30000: 'power-domains' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec-v4.0.yaml#
   arch/arm64/boot/dts/freescale/imx8dxp-tqma8xdps-mb-smarc-2.dtb: crypto@31400000 (fsl,imx8qxp-caam): jr@30000:compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,imx8qxp-job-ring', 'fsl,sec-v4.0-job-ring'] is too short
   	['fsl,imx8qxp-job-ring', 'fsl,sec-v4.0-job-ring'] is too long
   	'fsl,sec-v6.0-job-ring' was expected
   	'fsl,sec-v5.4-job-ring' was expected
--
   	['fsl,imx8qm-caam', 'fsl,sec-v4.0'] is too short
   	['fsl,imx8qm-caam', 'fsl,sec-v4.0'] is too long
   	'fsl,imx8qm-caam' is not one of ['fsl,sec-v5.4', 'fsl,sec-v6.0']
   	'fsl,imx8qm-caam' is not one of ['fsl,imx6ul-caam', 'fsl,sec-v5.0']
   	'fsl,sec-v4.0' was expected
   	'fsl,sec-v5.0' was expected
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec-v4.0.yaml#
   arch/arm64/boot/dts/freescale/imx8qm-apalis-eval.dtb: /bus@31400000/crypto@31400000: failed to match any schema with compatible: ['fsl,imx8qm-caam', 'fsl,sec-v4.0']
   arch/arm64/boot/dts/freescale/imx8qm-apalis-eval.dtb: /bus@31400000/crypto@31400000/jr@30000: failed to match any schema with compatible: ['fsl,imx8qm-job-ring', 'fsl,sec-v4.0-job-ring']
   arch/arm64/boot/dts/freescale/imx8qm-apalis-eval.dtb: /bus@31400000/crypto@31400000/jr@40000: failed to match any schema with compatible: ['fsl,imx8qm-job-ring', 'fsl,sec-v4.0-job-ring']
>> arch/arm64/boot/dts/freescale/imx8qm-apalis-eval.dtb: /bus@58000000/isi@58100000: failed to match any schema with compatible: ['fsl,imx8qm-isi']
>> arch/arm64/boot/dts/freescale/imx8qm-apalis-eval.dtb: /bus@58000000/csi@58227000: failed to match any schema with compatible: ['fsl,imx8qm-mipi-csi2', 'fsl,imx8qxp-mipi-csi2']
>> arch/arm64/boot/dts/freescale/imx8qm-apalis-eval.dtb: /bus@58000000/csi@58227000: failed to match any schema with compatible: ['fsl,imx8qm-mipi-csi2', 'fsl,imx8qxp-mipi-csi2']
   arch/arm64/boot/dts/freescale/imx8qm-apalis-eval.dtb: /bus@58000000/csi@58247000: failed to match any schema with compatible: ['fsl,imx8qm-mipi-csi2', 'fsl,imx8qxp-mipi-csi2']
   arch/arm64/boot/dts/freescale/imx8qm-apalis-eval.dtb: /bus@58000000/csi@58247000: failed to match any schema with compatible: ['fsl,imx8qm-mipi-csi2', 'fsl,imx8qxp-mipi-csi2']
--
   	['fsl,imx8qm-caam', 'fsl,sec-v4.0'] is too short
   	['fsl,imx8qm-caam', 'fsl,sec-v4.0'] is too long
   	'fsl,imx8qm-caam' is not one of ['fsl,sec-v5.4', 'fsl,sec-v6.0']
   	'fsl,imx8qm-caam' is not one of ['fsl,imx6ul-caam', 'fsl,sec-v5.0']
   	'fsl,sec-v4.0' was expected
   	'fsl,sec-v5.0' was expected
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec-v4.0.yaml#
   arch/arm64/boot/dts/freescale/imx8qm-apalis-eval-v1.2.dtb: /bus@31400000/crypto@31400000: failed to match any schema with compatible: ['fsl,imx8qm-caam', 'fsl,sec-v4.0']
   arch/arm64/boot/dts/freescale/imx8qm-apalis-eval-v1.2.dtb: /bus@31400000/crypto@31400000/jr@30000: failed to match any schema with compatible: ['fsl,imx8qm-job-ring', 'fsl,sec-v4.0-job-ring']
   arch/arm64/boot/dts/freescale/imx8qm-apalis-eval-v1.2.dtb: /bus@31400000/crypto@31400000/jr@40000: failed to match any schema with compatible: ['fsl,imx8qm-job-ring', 'fsl,sec-v4.0-job-ring']
>> arch/arm64/boot/dts/freescale/imx8qm-apalis-eval-v1.2.dtb: /bus@58000000/isi@58100000: failed to match any schema with compatible: ['fsl,imx8qm-isi']
>> arch/arm64/boot/dts/freescale/imx8qm-apalis-eval-v1.2.dtb: /bus@58000000/csi@58227000: failed to match any schema with compatible: ['fsl,imx8qm-mipi-csi2', 'fsl,imx8qxp-mipi-csi2']
>> arch/arm64/boot/dts/freescale/imx8qm-apalis-eval-v1.2.dtb: /bus@58000000/csi@58227000: failed to match any schema with compatible: ['fsl,imx8qm-mipi-csi2', 'fsl,imx8qxp-mipi-csi2']
   arch/arm64/boot/dts/freescale/imx8qm-apalis-eval-v1.2.dtb: /bus@58000000/csi@58247000: failed to match any schema with compatible: ['fsl,imx8qm-mipi-csi2', 'fsl,imx8qxp-mipi-csi2']
   arch/arm64/boot/dts/freescale/imx8qm-apalis-eval-v1.2.dtb: /bus@58000000/csi@58247000: failed to match any schema with compatible: ['fsl,imx8qm-mipi-csi2', 'fsl,imx8qxp-mipi-csi2']
--
   	['fsl,imx8qm-caam', 'fsl,sec-v4.0'] is too short
   	['fsl,imx8qm-caam', 'fsl,sec-v4.0'] is too long
   	'fsl,imx8qm-caam' is not one of ['fsl,sec-v5.4', 'fsl,sec-v6.0']
   	'fsl,imx8qm-caam' is not one of ['fsl,imx6ul-caam', 'fsl,sec-v5.0']
   	'fsl,sec-v4.0' was expected
   	'fsl,sec-v5.0' was expected
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec-v4.0.yaml#
   arch/arm64/boot/dts/freescale/imx8qm-apalis-ixora-v1.1.dtb: /bus@31400000/crypto@31400000: failed to match any schema with compatible: ['fsl,imx8qm-caam', 'fsl,sec-v4.0']
   arch/arm64/boot/dts/freescale/imx8qm-apalis-ixora-v1.1.dtb: /bus@31400000/crypto@31400000/jr@30000: failed to match any schema with compatible: ['fsl,imx8qm-job-ring', 'fsl,sec-v4.0-job-ring']
   arch/arm64/boot/dts/freescale/imx8qm-apalis-ixora-v1.1.dtb: /bus@31400000/crypto@31400000/jr@40000: failed to match any schema with compatible: ['fsl,imx8qm-job-ring', 'fsl,sec-v4.0-job-ring']
>> arch/arm64/boot/dts/freescale/imx8qm-apalis-ixora-v1.1.dtb: /bus@58000000/isi@58100000: failed to match any schema with compatible: ['fsl,imx8qm-isi']
>> arch/arm64/boot/dts/freescale/imx8qm-apalis-ixora-v1.1.dtb: /bus@58000000/csi@58227000: failed to match any schema with compatible: ['fsl,imx8qm-mipi-csi2', 'fsl,imx8qxp-mipi-csi2']
>> arch/arm64/boot/dts/freescale/imx8qm-apalis-ixora-v1.1.dtb: /bus@58000000/csi@58227000: failed to match any schema with compatible: ['fsl,imx8qm-mipi-csi2', 'fsl,imx8qxp-mipi-csi2']
   arch/arm64/boot/dts/freescale/imx8qm-apalis-ixora-v1.1.dtb: /bus@58000000/csi@58247000: failed to match any schema with compatible: ['fsl,imx8qm-mipi-csi2', 'fsl,imx8qxp-mipi-csi2']
   arch/arm64/boot/dts/freescale/imx8qm-apalis-ixora-v1.1.dtb: /bus@58000000/csi@58247000: failed to match any schema with compatible: ['fsl,imx8qm-mipi-csi2', 'fsl,imx8qxp-mipi-csi2']
--
   	['fsl,imx8qm-caam', 'fsl,sec-v4.0'] is too short
   	['fsl,imx8qm-caam', 'fsl,sec-v4.0'] is too long
   	'fsl,imx8qm-caam' is not one of ['fsl,sec-v5.4', 'fsl,sec-v6.0']
   	'fsl,imx8qm-caam' is not one of ['fsl,imx6ul-caam', 'fsl,sec-v5.0']
   	'fsl,sec-v4.0' was expected
   	'fsl,sec-v5.0' was expected
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec-v4.0.yaml#
   arch/arm64/boot/dts/freescale/imx8qm-apalis-v1.1-eval.dtb: /bus@31400000/crypto@31400000: failed to match any schema with compatible: ['fsl,imx8qm-caam', 'fsl,sec-v4.0']
   arch/arm64/boot/dts/freescale/imx8qm-apalis-v1.1-eval.dtb: /bus@31400000/crypto@31400000/jr@30000: failed to match any schema with compatible: ['fsl,imx8qm-job-ring', 'fsl,sec-v4.0-job-ring']
   arch/arm64/boot/dts/freescale/imx8qm-apalis-v1.1-eval.dtb: /bus@31400000/crypto@31400000/jr@40000: failed to match any schema with compatible: ['fsl,imx8qm-job-ring', 'fsl,sec-v4.0-job-ring']
>> arch/arm64/boot/dts/freescale/imx8qm-apalis-v1.1-eval.dtb: /bus@58000000/isi@58100000: failed to match any schema with compatible: ['fsl,imx8qm-isi']
>> arch/arm64/boot/dts/freescale/imx8qm-apalis-v1.1-eval.dtb: /bus@58000000/csi@58227000: failed to match any schema with compatible: ['fsl,imx8qm-mipi-csi2', 'fsl,imx8qxp-mipi-csi2']
>> arch/arm64/boot/dts/freescale/imx8qm-apalis-v1.1-eval.dtb: /bus@58000000/csi@58227000: failed to match any schema with compatible: ['fsl,imx8qm-mipi-csi2', 'fsl,imx8qxp-mipi-csi2']
   arch/arm64/boot/dts/freescale/imx8qm-apalis-v1.1-eval.dtb: /bus@58000000/csi@58247000: failed to match any schema with compatible: ['fsl,imx8qm-mipi-csi2', 'fsl,imx8qxp-mipi-csi2']
   arch/arm64/boot/dts/freescale/imx8qm-apalis-v1.1-eval.dtb: /bus@58000000/csi@58247000: failed to match any schema with compatible: ['fsl,imx8qm-mipi-csi2', 'fsl,imx8qxp-mipi-csi2']
--
   	['fsl,imx8qm-caam', 'fsl,sec-v4.0'] is too short
   	['fsl,imx8qm-caam', 'fsl,sec-v4.0'] is too long
   	'fsl,imx8qm-caam' is not one of ['fsl,sec-v5.4', 'fsl,sec-v6.0']
   	'fsl,imx8qm-caam' is not one of ['fsl,imx6ul-caam', 'fsl,sec-v5.0']
   	'fsl,sec-v4.0' was expected
   	'fsl,sec-v5.0' was expected
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec-v4.0.yaml#
   arch/arm64/boot/dts/freescale/imx8qm-apalis-v1.1-eval-v1.2.dtb: /bus@31400000/crypto@31400000: failed to match any schema with compatible: ['fsl,imx8qm-caam', 'fsl,sec-v4.0']
   arch/arm64/boot/dts/freescale/imx8qm-apalis-v1.1-eval-v1.2.dtb: /bus@31400000/crypto@31400000/jr@30000: failed to match any schema with compatible: ['fsl,imx8qm-job-ring', 'fsl,sec-v4.0-job-ring']
   arch/arm64/boot/dts/freescale/imx8qm-apalis-v1.1-eval-v1.2.dtb: /bus@31400000/crypto@31400000/jr@40000: failed to match any schema with compatible: ['fsl,imx8qm-job-ring', 'fsl,sec-v4.0-job-ring']
>> arch/arm64/boot/dts/freescale/imx8qm-apalis-v1.1-eval-v1.2.dtb: /bus@58000000/isi@58100000: failed to match any schema with compatible: ['fsl,imx8qm-isi']
>> arch/arm64/boot/dts/freescale/imx8qm-apalis-v1.1-eval-v1.2.dtb: /bus@58000000/csi@58227000: failed to match any schema with compatible: ['fsl,imx8qm-mipi-csi2', 'fsl,imx8qxp-mipi-csi2']
>> arch/arm64/boot/dts/freescale/imx8qm-apalis-v1.1-eval-v1.2.dtb: /bus@58000000/csi@58227000: failed to match any schema with compatible: ['fsl,imx8qm-mipi-csi2', 'fsl,imx8qxp-mipi-csi2']
   arch/arm64/boot/dts/freescale/imx8qm-apalis-v1.1-eval-v1.2.dtb: /bus@58000000/csi@58247000: failed to match any schema with compatible: ['fsl,imx8qm-mipi-csi2', 'fsl,imx8qxp-mipi-csi2']
   arch/arm64/boot/dts/freescale/imx8qm-apalis-v1.1-eval-v1.2.dtb: /bus@58000000/csi@58247000: failed to match any schema with compatible: ['fsl,imx8qm-mipi-csi2', 'fsl,imx8qxp-mipi-csi2']
--
   	['fsl,imx8qm-caam', 'fsl,sec-v4.0'] is too short
   	['fsl,imx8qm-caam', 'fsl,sec-v4.0'] is too long
   	'fsl,imx8qm-caam' is not one of ['fsl,sec-v5.4', 'fsl,sec-v6.0']
   	'fsl,imx8qm-caam' is not one of ['fsl,imx6ul-caam', 'fsl,sec-v5.0']
   	'fsl,sec-v4.0' was expected
   	'fsl,sec-v5.0' was expected
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec-v4.0.yaml#
   arch/arm64/boot/dts/freescale/imx8qm-apalis-v1.1-ixora-v1.1.dtb: /bus@31400000/crypto@31400000: failed to match any schema with compatible: ['fsl,imx8qm-caam', 'fsl,sec-v4.0']
   arch/arm64/boot/dts/freescale/imx8qm-apalis-v1.1-ixora-v1.1.dtb: /bus@31400000/crypto@31400000/jr@30000: failed to match any schema with compatible: ['fsl,imx8qm-job-ring', 'fsl,sec-v4.0-job-ring']
   arch/arm64/boot/dts/freescale/imx8qm-apalis-v1.1-ixora-v1.1.dtb: /bus@31400000/crypto@31400000/jr@40000: failed to match any schema with compatible: ['fsl,imx8qm-job-ring', 'fsl,sec-v4.0-job-ring']
>> arch/arm64/boot/dts/freescale/imx8qm-apalis-v1.1-ixora-v1.1.dtb: /bus@58000000/isi@58100000: failed to match any schema with compatible: ['fsl,imx8qm-isi']
>> arch/arm64/boot/dts/freescale/imx8qm-apalis-v1.1-ixora-v1.1.dtb: /bus@58000000/csi@58227000: failed to match any schema with compatible: ['fsl,imx8qm-mipi-csi2', 'fsl,imx8qxp-mipi-csi2']
>> arch/arm64/boot/dts/freescale/imx8qm-apalis-v1.1-ixora-v1.1.dtb: /bus@58000000/csi@58227000: failed to match any schema with compatible: ['fsl,imx8qm-mipi-csi2', 'fsl,imx8qxp-mipi-csi2']
   arch/arm64/boot/dts/freescale/imx8qm-apalis-v1.1-ixora-v1.1.dtb: /bus@58000000/csi@58247000: failed to match any schema with compatible: ['fsl,imx8qm-mipi-csi2', 'fsl,imx8qxp-mipi-csi2']
   arch/arm64/boot/dts/freescale/imx8qm-apalis-v1.1-ixora-v1.1.dtb: /bus@58000000/csi@58247000: failed to match any schema with compatible: ['fsl,imx8qm-mipi-csi2', 'fsl,imx8qxp-mipi-csi2']
--
   	['fsl,imx8qm-caam', 'fsl,sec-v4.0'] is too short
   	['fsl,imx8qm-caam', 'fsl,sec-v4.0'] is too long
   	'fsl,imx8qm-caam' is not one of ['fsl,sec-v5.4', 'fsl,sec-v6.0']
   	'fsl,imx8qm-caam' is not one of ['fsl,imx6ul-caam', 'fsl,sec-v5.0']
   	'fsl,sec-v4.0' was expected
   	'fsl,sec-v5.0' was expected
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec-v4.0.yaml#
   arch/arm64/boot/dts/freescale/imx8qm-mek.dtb: /bus@31400000/crypto@31400000: failed to match any schema with compatible: ['fsl,imx8qm-caam', 'fsl,sec-v4.0']
   arch/arm64/boot/dts/freescale/imx8qm-mek.dtb: /bus@31400000/crypto@31400000/jr@30000: failed to match any schema with compatible: ['fsl,imx8qm-job-ring', 'fsl,sec-v4.0-job-ring']
   arch/arm64/boot/dts/freescale/imx8qm-mek.dtb: /bus@31400000/crypto@31400000/jr@40000: failed to match any schema with compatible: ['fsl,imx8qm-job-ring', 'fsl,sec-v4.0-job-ring']
>> arch/arm64/boot/dts/freescale/imx8qm-mek.dtb: /bus@58000000/isi@58100000: failed to match any schema with compatible: ['fsl,imx8qm-isi']
>> arch/arm64/boot/dts/freescale/imx8qm-mek.dtb: /bus@58000000/csi@58227000: failed to match any schema with compatible: ['fsl,imx8qm-mipi-csi2', 'fsl,imx8qxp-mipi-csi2']
>> arch/arm64/boot/dts/freescale/imx8qm-mek.dtb: /bus@58000000/csi@58227000: failed to match any schema with compatible: ['fsl,imx8qm-mipi-csi2', 'fsl,imx8qxp-mipi-csi2']
   arch/arm64/boot/dts/freescale/imx8qm-mek.dtb: /bus@58000000/csi@58247000: failed to match any schema with compatible: ['fsl,imx8qm-mipi-csi2', 'fsl,imx8qxp-mipi-csi2']
   arch/arm64/boot/dts/freescale/imx8qm-mek.dtb: /bus@58000000/csi@58247000: failed to match any schema with compatible: ['fsl,imx8qm-mipi-csi2', 'fsl,imx8qxp-mipi-csi2']
--
>> arch/arm64/boot/dts/freescale/imx8qxp-ai_ml.dtb: /bus@58000000/isi@58100000: failed to match any schema with compatible: ['fsl,imx8qxp-isi']
>> arch/arm64/boot/dts/freescale/imx8qxp-ai_ml.dtb: /bus@58000000/csi@58227000: failed to match any schema with compatible: ['fsl,imx8qxp-mipi-csi2']
   arch/arm64/boot/dts/freescale/imx8qxp-ai_ml.dtb: /bus@58000000/csi@58247000: failed to match any schema with compatible: ['fsl,imx8qxp-mipi-csi2']
   arch/arm64/boot/dts/freescale/imx8qxp-ai_ml.dtb: crypto@31400000 (fsl,imx8qxp-caam): 'power-domains' does not match any of the regexes: '^jr@[0-9a-f]+$', '^pinctrl-[0-9]+$', '^rtic@[0-9a-f]+$'
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec-v4.0.yaml#
   arch/arm64/boot/dts/freescale/imx8qxp-ai_ml.dtb: crypto@31400000 (fsl,imx8qxp-caam): jr@30000: 'power-domains' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec-v4.0.yaml#
   arch/arm64/boot/dts/freescale/imx8qxp-ai_ml.dtb: crypto@31400000 (fsl,imx8qxp-caam): jr@30000:compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,imx8qxp-job-ring', 'fsl,sec-v4.0-job-ring'] is too short
   	['fsl,imx8qxp-job-ring', 'fsl,sec-v4.0-job-ring'] is too long
   	'fsl,sec-v6.0-job-ring' was expected
   	'fsl,sec-v5.4-job-ring' was expected
--
>> arch/arm64/boot/dts/freescale/imx8qxp-colibri-aster.dtb: /bus@58000000/isi@58100000: failed to match any schema with compatible: ['fsl,imx8qxp-isi']
>> arch/arm64/boot/dts/freescale/imx8qxp-colibri-aster.dtb: /bus@58000000/csi@58227000: failed to match any schema with compatible: ['fsl,imx8qxp-mipi-csi2']
   arch/arm64/boot/dts/freescale/imx8qxp-colibri-aster.dtb: /bus@58000000/csi@58247000: failed to match any schema with compatible: ['fsl,imx8qxp-mipi-csi2']
   arch/arm64/boot/dts/freescale/imx8qxp-colibri-aster.dtb: crypto@31400000 (fsl,imx8qxp-caam): 'power-domains' does not match any of the regexes: '^jr@[0-9a-f]+$', '^pinctrl-[0-9]+$', '^rtic@[0-9a-f]+$'
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec-v4.0.yaml#
   arch/arm64/boot/dts/freescale/imx8qxp-colibri-aster.dtb: crypto@31400000 (fsl,imx8qxp-caam): jr@30000: 'power-domains' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec-v4.0.yaml#
   arch/arm64/boot/dts/freescale/imx8qxp-colibri-aster.dtb: crypto@31400000 (fsl,imx8qxp-caam): jr@30000:compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,imx8qxp-job-ring', 'fsl,sec-v4.0-job-ring'] is too short
   	['fsl,imx8qxp-job-ring', 'fsl,sec-v4.0-job-ring'] is too long
   	'fsl,sec-v6.0-job-ring' was expected
   	'fsl,sec-v5.4-job-ring' was expected
--
>> arch/arm64/boot/dts/freescale/imx8qxp-colibri-eval-v3.dtb: /bus@58000000/isi@58100000: failed to match any schema with compatible: ['fsl,imx8qxp-isi']
>> arch/arm64/boot/dts/freescale/imx8qxp-colibri-eval-v3.dtb: /bus@58000000/csi@58227000: failed to match any schema with compatible: ['fsl,imx8qxp-mipi-csi2']
   arch/arm64/boot/dts/freescale/imx8qxp-colibri-eval-v3.dtb: /bus@58000000/csi@58247000: failed to match any schema with compatible: ['fsl,imx8qxp-mipi-csi2']
   arch/arm64/boot/dts/freescale/imx8qxp-colibri-eval-v3.dtb: crypto@31400000 (fsl,imx8qxp-caam): 'power-domains' does not match any of the regexes: '^jr@[0-9a-f]+$', '^pinctrl-[0-9]+$', '^rtic@[0-9a-f]+$'
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec-v4.0.yaml#
   arch/arm64/boot/dts/freescale/imx8qxp-colibri-eval-v3.dtb: crypto@31400000 (fsl,imx8qxp-caam): jr@30000: 'power-domains' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec-v4.0.yaml#
   arch/arm64/boot/dts/freescale/imx8qxp-colibri-eval-v3.dtb: crypto@31400000 (fsl,imx8qxp-caam): jr@30000:compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,imx8qxp-job-ring', 'fsl,sec-v4.0-job-ring'] is too short
   	['fsl,imx8qxp-job-ring', 'fsl,sec-v4.0-job-ring'] is too long
   	'fsl,sec-v6.0-job-ring' was expected
   	'fsl,sec-v5.4-job-ring' was expected
--
>> arch/arm64/boot/dts/freescale/imx8qxp-colibri-iris.dtb: /bus@58000000/isi@58100000: failed to match any schema with compatible: ['fsl,imx8qxp-isi']
>> arch/arm64/boot/dts/freescale/imx8qxp-colibri-iris.dtb: /bus@58000000/csi@58227000: failed to match any schema with compatible: ['fsl,imx8qxp-mipi-csi2']
   arch/arm64/boot/dts/freescale/imx8qxp-colibri-iris.dtb: /bus@58000000/csi@58247000: failed to match any schema with compatible: ['fsl,imx8qxp-mipi-csi2']
   arch/arm64/boot/dts/freescale/imx8qxp-colibri-iris.dtb: crypto@31400000 (fsl,imx8qxp-caam): 'power-domains' does not match any of the regexes: '^jr@[0-9a-f]+$', '^pinctrl-[0-9]+$', '^rtic@[0-9a-f]+$'
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec-v4.0.yaml#
   arch/arm64/boot/dts/freescale/imx8qxp-colibri-iris.dtb: crypto@31400000 (fsl,imx8qxp-caam): jr@30000: 'power-domains' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec-v4.0.yaml#
   arch/arm64/boot/dts/freescale/imx8qxp-colibri-iris.dtb: crypto@31400000 (fsl,imx8qxp-caam): jr@30000:compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,imx8qxp-job-ring', 'fsl,sec-v4.0-job-ring'] is too short
   	['fsl,imx8qxp-job-ring', 'fsl,sec-v4.0-job-ring'] is too long
   	'fsl,sec-v6.0-job-ring' was expected
   	'fsl,sec-v5.4-job-ring' was expected
--
>> arch/arm64/boot/dts/freescale/imx8qxp-colibri-iris-v2.dtb: /bus@58000000/isi@58100000: failed to match any schema with compatible: ['fsl,imx8qxp-isi']
>> arch/arm64/boot/dts/freescale/imx8qxp-colibri-iris-v2.dtb: /bus@58000000/csi@58227000: failed to match any schema with compatible: ['fsl,imx8qxp-mipi-csi2']
   arch/arm64/boot/dts/freescale/imx8qxp-colibri-iris-v2.dtb: /bus@58000000/csi@58247000: failed to match any schema with compatible: ['fsl,imx8qxp-mipi-csi2']
   arch/arm64/boot/dts/freescale/imx8qxp-colibri-iris-v2.dtb: crypto@31400000 (fsl,imx8qxp-caam): 'power-domains' does not match any of the regexes: '^jr@[0-9a-f]+$', '^pinctrl-[0-9]+$', '^rtic@[0-9a-f]+$'
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec-v4.0.yaml#
   arch/arm64/boot/dts/freescale/imx8qxp-colibri-iris-v2.dtb: crypto@31400000 (fsl,imx8qxp-caam): jr@30000: 'power-domains' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec-v4.0.yaml#
   arch/arm64/boot/dts/freescale/imx8qxp-colibri-iris-v2.dtb: crypto@31400000 (fsl,imx8qxp-caam): jr@30000:compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,imx8qxp-job-ring', 'fsl,sec-v4.0-job-ring'] is too short
   	['fsl,imx8qxp-job-ring', 'fsl,sec-v4.0-job-ring'] is too long
   	'fsl,sec-v6.0-job-ring' was expected
   	'fsl,sec-v5.4-job-ring' was expected
--
>> arch/arm64/boot/dts/freescale/imx8qxp-mek.dtb: /bus@58000000/isi@58100000: failed to match any schema with compatible: ['fsl,imx8qxp-isi']
>> arch/arm64/boot/dts/freescale/imx8qxp-mek.dtb: /bus@58000000/csi@58227000: failed to match any schema with compatible: ['fsl,imx8qxp-mipi-csi2']
   arch/arm64/boot/dts/freescale/imx8qxp-mek.dtb: /bus@58000000/csi@58247000: failed to match any schema with compatible: ['fsl,imx8qxp-mipi-csi2']
   arch/arm64/boot/dts/freescale/imx8qxp-mek.dtb: crypto@31400000 (fsl,imx8qxp-caam): 'power-domains' does not match any of the regexes: '^jr@[0-9a-f]+$', '^pinctrl-[0-9]+$', '^rtic@[0-9a-f]+$'
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec-v4.0.yaml#
   arch/arm64/boot/dts/freescale/imx8qxp-mek.dtb: crypto@31400000 (fsl,imx8qxp-caam): jr@30000: 'power-domains' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec-v4.0.yaml#
   arch/arm64/boot/dts/freescale/imx8qxp-mek.dtb: crypto@31400000 (fsl,imx8qxp-caam): jr@30000:compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,imx8qxp-job-ring', 'fsl,sec-v4.0-job-ring'] is too short
   	['fsl,imx8qxp-job-ring', 'fsl,sec-v4.0-job-ring'] is too long
   	'fsl,sec-v6.0-job-ring' was expected
   	'fsl,sec-v5.4-job-ring' was expected
--
>> arch/arm64/boot/dts/freescale/imx8qxp-tqma8xqp-mba8xx.dtb: /bus@58000000/isi@58100000: failed to match any schema with compatible: ['fsl,imx8qxp-isi']
>> arch/arm64/boot/dts/freescale/imx8qxp-tqma8xqp-mba8xx.dtb: /bus@58000000/csi@58227000: failed to match any schema with compatible: ['fsl,imx8qxp-mipi-csi2']
   arch/arm64/boot/dts/freescale/imx8qxp-tqma8xqp-mba8xx.dtb: /bus@58000000/csi@58247000: failed to match any schema with compatible: ['fsl,imx8qxp-mipi-csi2']
   arch/arm64/boot/dts/freescale/imx8qxp-tqma8xqp-mba8xx.dtb: crypto@31400000 (fsl,imx8qxp-caam): 'power-domains' does not match any of the regexes: '^jr@[0-9a-f]+$', '^pinctrl-[0-9]+$', '^rtic@[0-9a-f]+$'
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec-v4.0.yaml#
   arch/arm64/boot/dts/freescale/imx8qxp-tqma8xqp-mba8xx.dtb: crypto@31400000 (fsl,imx8qxp-caam): jr@30000: 'power-domains' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec-v4.0.yaml#
   arch/arm64/boot/dts/freescale/imx8qxp-tqma8xqp-mba8xx.dtb: crypto@31400000 (fsl,imx8qxp-caam): jr@30000:compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,imx8qxp-job-ring', 'fsl,sec-v4.0-job-ring'] is too short
   	['fsl,imx8qxp-job-ring', 'fsl,sec-v4.0-job-ring'] is too long
   	'fsl,sec-v6.0-job-ring' was expected
   	'fsl,sec-v5.4-job-ring' was expected
--
>> arch/arm64/boot/dts/freescale/imx8qxp-tqma8xqps-mb-smarc-2.dtb: /bus@58000000/isi@58100000: failed to match any schema with compatible: ['fsl,imx8qxp-isi']
>> arch/arm64/boot/dts/freescale/imx8qxp-tqma8xqps-mb-smarc-2.dtb: /bus@58000000/csi@58227000: failed to match any schema with compatible: ['fsl,imx8qxp-mipi-csi2']
   arch/arm64/boot/dts/freescale/imx8qxp-tqma8xqps-mb-smarc-2.dtb: /bus@58000000/csi@58247000: failed to match any schema with compatible: ['fsl,imx8qxp-mipi-csi2']
   arch/arm64/boot/dts/freescale/imx8qxp-tqma8xqps-mb-smarc-2.dtb: crypto@31400000 (fsl,imx8qxp-caam): 'power-domains' does not match any of the regexes: '^jr@[0-9a-f]+$', '^pinctrl-[0-9]+$', '^rtic@[0-9a-f]+$'
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec-v4.0.yaml#
   arch/arm64/boot/dts/freescale/imx8qxp-tqma8xqps-mb-smarc-2.dtb: crypto@31400000 (fsl,imx8qxp-caam): jr@30000: 'power-domains' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec-v4.0.yaml#
   arch/arm64/boot/dts/freescale/imx8qxp-tqma8xqps-mb-smarc-2.dtb: crypto@31400000 (fsl,imx8qxp-caam): jr@30000:compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,imx8qxp-job-ring', 'fsl,sec-v4.0-job-ring'] is too short
   	['fsl,imx8qxp-job-ring', 'fsl,sec-v4.0-job-ring'] is too long
   	'fsl,sec-v6.0-job-ring' was expected
   	'fsl,sec-v5.4-job-ring' was expected
--
>> arch/arm64/boot/dts/freescale/imx8qxp-mek-pcie-ep.dtb: /bus@58000000/isi@58100000: failed to match any schema with compatible: ['fsl,imx8qxp-isi']
>> arch/arm64/boot/dts/freescale/imx8qxp-mek-pcie-ep.dtb: /bus@58000000/csi@58227000: failed to match any schema with compatible: ['fsl,imx8qxp-mipi-csi2']
   arch/arm64/boot/dts/freescale/imx8qxp-mek-pcie-ep.dtb: /bus@58000000/csi@58247000: failed to match any schema with compatible: ['fsl,imx8qxp-mipi-csi2']
   arch/arm64/boot/dts/freescale/imx8qxp-mek-pcie-ep.dtb: crypto@31400000 (fsl,imx8qxp-caam): 'power-domains' does not match any of the regexes: '^jr@[0-9a-f]+$', '^pinctrl-[0-9]+$', '^rtic@[0-9a-f]+$'
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec-v4.0.yaml#
   arch/arm64/boot/dts/freescale/imx8qxp-mek-pcie-ep.dtb: crypto@31400000 (fsl,imx8qxp-caam): jr@30000: 'power-domains' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec-v4.0.yaml#
   arch/arm64/boot/dts/freescale/imx8qxp-mek-pcie-ep.dtb: crypto@31400000 (fsl,imx8qxp-caam): jr@30000:compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,imx8qxp-job-ring', 'fsl,sec-v4.0-job-ring'] is too short
   	['fsl,imx8qxp-job-ring', 'fsl,sec-v4.0-job-ring'] is too long
   	'fsl,sec-v6.0-job-ring' was expected
   	'fsl,sec-v5.4-job-ring' was expected

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
