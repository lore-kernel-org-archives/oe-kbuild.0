Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 295154400
	for <oe-kbuild@lists.linux.dev>; Sun, 13 Jul 2025 05:32:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752384729; cv=none; b=qpRb6GcN5PQFCNEySoUn/E0YnOs2PlPIVbjAu4wb7qCxn6bkEdnrNVM7Pafwq0pb7sxagcNFbEUTiVYQ6kmi1m/aXWAuxTS//XIAvlFxLTe/vplEsIZuRvRp3uHjI1LBIa3ESUSjQtnUngRxPdY4HPEzLQahM9S0CGBPh7S9zII=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752384729; c=relaxed/simple;
	bh=n0WkeNPzHpK7xEPNnX04oRzfFbZhNDvTtlrgLTtY02Y=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Rq5mkH/VxWiO+Sb78uaMla5WP5DiSRa4hS248pJc5uuaMm6S1He8RxlqnXqgNihYNRB8UatKdSPK2lNA51YsKVtBGVvSLQ0tcKHL/sdINUq7l7QWOonYXtl+eJ3xSaFqw38vcFtoYeEdsETlt1B+rBrb4YCdrMqX5jBfr8dInrM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BsWlOdzg; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BsWlOdzg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752384726; x=1783920726;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=n0WkeNPzHpK7xEPNnX04oRzfFbZhNDvTtlrgLTtY02Y=;
  b=BsWlOdzg3V3kK1cN+/o7vD9le22eLWzBMb3x3czNFoCcZapIiviGGlqt
   sCtBMLFDUiu91RTGibkfh5nAeuCwVQTstD97Tu9gAbobRG0KcjEZvzzJd
   ECcaCKuN8ZV3zyd/gGDOkqxHFFZuPC2TxowyiENFoHNpTXKudBOwnTSrT
   m8llcX+BGJBShDZGn1pvBeN40W8PY8Ut/SGZsNcrys9cGf+5o1htg42R1
   hfZYQY9nZmOzUlYEuJ3jfgFqpi8+zZihpzNmYxGoBj/f0IrPwmjIYn98p
   8Cgm0CXsNSIn+L+B2ycTam48AqxVYEE3ZeeHFaErKBGhMGhlWiLJx8t4B
   Q==;
X-CSE-ConnectionGUID: qPdfKtqPQDyVHRUqI2YdIQ==
X-CSE-MsgGUID: 7qwYVgh6QQix8NDlr1en4Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11491"; a="65681459"
X-IronPort-AV: E=Sophos;i="6.16,308,1744095600"; 
   d="scan'208";a="65681459"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jul 2025 22:32:05 -0700
X-CSE-ConnectionGUID: IAqjoS+HR2qtwGiWzQlCQw==
X-CSE-MsgGUID: 5tD7p48ERBui37dq76Iomg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,308,1744095600"; 
   d="scan'208";a="187655659"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 12 Jul 2025 22:32:03 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uapJg-0007uF-1t;
	Sun, 13 Jul 2025 05:32:00 +0000
Date: Sun, 13 Jul 2025 13:31:15 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [shawnguo:imx/dt64 40/84]
 arch/arm64/boot/dts/freescale/imx8dx-colibri-aster.dtb: crypto@31400000
 (fsl,imx8qxp-caam): 'power-domains' does not match any of the regexes:
 '^jr@[0-9a-f]+$', '^pinctrl-[0-9]+$', '^rtic@[0-9a-f]+$'
Message-ID: <202507131342.VgCNgjDQ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

:::::: 
:::::: Manual check reason: "dtcheck: binding changes may go via different trees"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-arm-kernel@lists.infradead.org
TO: "Horia Geantă" <horia.geanta@nxp.com>
CC: Shawn Guo <shawnguo@kernel.org>
CC: John Ernberg <john.ernberg@actia.se>
CC: Peng Fan <peng.fan@nxp.com>
CC: Frank Li <Frank.Li@nxp.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git imx/dt64
head:   440bd77d25a61985358404bc578598817ff475c3
commit: 5da259600d307f061aa34e56ded106d052a9d98a [40/84] arm64: dts: freescale: imx8qxp/imx8qm: Add CAAM support
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: arm64-randconfig-054-20250712 (https://download.01.org/0day-ci/archive/20250713/202507131342.VgCNgjDQ-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 9.5.0
dtschema version: 2025.6.2.dev4+g8f79ddd
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250713/202507131342.VgCNgjDQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202507131342.VgCNgjDQ-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/freescale/imx8dx-colibri-aster.dtb: crypto@31400000 (fsl,imx8qxp-caam): 'power-domains' does not match any of the regexes: '^jr@[0-9a-f]+$', '^pinctrl-[0-9]+$', '^rtic@[0-9a-f]+$'
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec-v4.0.yaml#
>> arch/arm64/boot/dts/freescale/imx8dx-colibri-aster.dtb: crypto@31400000 (fsl,imx8qxp-caam): jr@30000: 'power-domains' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec-v4.0.yaml#
>> arch/arm64/boot/dts/freescale/imx8dx-colibri-aster.dtb: crypto@31400000 (fsl,imx8qxp-caam): jr@30000:compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,imx8qxp-job-ring', 'fsl,sec-v4.0-job-ring'] is too short
   	['fsl,imx8qxp-job-ring', 'fsl,sec-v4.0-job-ring'] is too long
   	'fsl,sec-v6.0-job-ring' was expected
   	'fsl,sec-v5.4-job-ring' was expected
   	'fsl,sec-v5.0-job-ring' was expected
   	'fsl,sec-v4.0-job-ring' was expected
   	'fsl,sec-v5.2-job-ring' was expected
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec-v4.0.yaml#
   arch/arm64/boot/dts/freescale/imx8dx-colibri-aster.dtb: crypto@31400000 (fsl,imx8qxp-caam): jr@40000: 'power-domains' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec-v4.0.yaml#
   arch/arm64/boot/dts/freescale/imx8dx-colibri-aster.dtb: crypto@31400000 (fsl,imx8qxp-caam): jr@40000:compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,imx8qxp-job-ring', 'fsl,sec-v4.0-job-ring'] is too short
   	['fsl,imx8qxp-job-ring', 'fsl,sec-v4.0-job-ring'] is too long
   	'fsl,sec-v6.0-job-ring' was expected
   	'fsl,sec-v5.4-job-ring' was expected
   	'fsl,sec-v5.0-job-ring' was expected
   	'fsl,sec-v4.0-job-ring' was expected
   	'fsl,sec-v5.2-job-ring' was expected
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec-v4.0.yaml#
>> arch/arm64/boot/dts/freescale/imx8dx-colibri-aster.dtb: crypto@31400000 (fsl,imx8qxp-caam): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,imx8qxp-caam', 'fsl,sec-v4.0'] is too short
   	['fsl,imx8qxp-caam', 'fsl,sec-v4.0'] is too long
   	'fsl,imx8qxp-caam' is not one of ['fsl,sec-v5.4', 'fsl,sec-v6.0']
   	'fsl,imx8qxp-caam' is not one of ['fsl,imx6ul-caam', 'fsl,sec-v5.0']
   	'fsl,sec-v4.0' was expected
   	'fsl,sec-v5.0' was expected
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec-v4.0.yaml#
>> arch/arm64/boot/dts/freescale/imx8dx-colibri-aster.dtb: /bus@31400000/crypto@31400000: failed to match any schema with compatible: ['fsl,imx8qxp-caam', 'fsl,sec-v4.0']
>> arch/arm64/boot/dts/freescale/imx8dx-colibri-aster.dtb: /bus@31400000/crypto@31400000/jr@30000: failed to match any schema with compatible: ['fsl,imx8qxp-job-ring', 'fsl,sec-v4.0-job-ring']
   arch/arm64/boot/dts/freescale/imx8dx-colibri-aster.dtb: /bus@31400000/crypto@31400000/jr@40000: failed to match any schema with compatible: ['fsl,imx8qxp-job-ring', 'fsl,sec-v4.0-job-ring']
--
>> arch/arm64/boot/dts/freescale/imx8dx-colibri-eval-v3.dtb: crypto@31400000 (fsl,imx8qxp-caam): 'power-domains' does not match any of the regexes: '^jr@[0-9a-f]+$', '^pinctrl-[0-9]+$', '^rtic@[0-9a-f]+$'
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec-v4.0.yaml#
>> arch/arm64/boot/dts/freescale/imx8dx-colibri-eval-v3.dtb: crypto@31400000 (fsl,imx8qxp-caam): jr@30000: 'power-domains' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec-v4.0.yaml#
>> arch/arm64/boot/dts/freescale/imx8dx-colibri-eval-v3.dtb: crypto@31400000 (fsl,imx8qxp-caam): jr@30000:compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,imx8qxp-job-ring', 'fsl,sec-v4.0-job-ring'] is too short
   	['fsl,imx8qxp-job-ring', 'fsl,sec-v4.0-job-ring'] is too long
   	'fsl,sec-v6.0-job-ring' was expected
   	'fsl,sec-v5.4-job-ring' was expected
   	'fsl,sec-v5.0-job-ring' was expected
   	'fsl,sec-v4.0-job-ring' was expected
   	'fsl,sec-v5.2-job-ring' was expected
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec-v4.0.yaml#
   arch/arm64/boot/dts/freescale/imx8dx-colibri-eval-v3.dtb: crypto@31400000 (fsl,imx8qxp-caam): jr@40000: 'power-domains' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec-v4.0.yaml#
   arch/arm64/boot/dts/freescale/imx8dx-colibri-eval-v3.dtb: crypto@31400000 (fsl,imx8qxp-caam): jr@40000:compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,imx8qxp-job-ring', 'fsl,sec-v4.0-job-ring'] is too short
   	['fsl,imx8qxp-job-ring', 'fsl,sec-v4.0-job-ring'] is too long
   	'fsl,sec-v6.0-job-ring' was expected
   	'fsl,sec-v5.4-job-ring' was expected
   	'fsl,sec-v5.0-job-ring' was expected
   	'fsl,sec-v4.0-job-ring' was expected
   	'fsl,sec-v5.2-job-ring' was expected
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec-v4.0.yaml#
>> arch/arm64/boot/dts/freescale/imx8dx-colibri-eval-v3.dtb: crypto@31400000 (fsl,imx8qxp-caam): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,imx8qxp-caam', 'fsl,sec-v4.0'] is too short
   	['fsl,imx8qxp-caam', 'fsl,sec-v4.0'] is too long
   	'fsl,imx8qxp-caam' is not one of ['fsl,sec-v5.4', 'fsl,sec-v6.0']
   	'fsl,imx8qxp-caam' is not one of ['fsl,imx6ul-caam', 'fsl,sec-v5.0']
   	'fsl,sec-v4.0' was expected
   	'fsl,sec-v5.0' was expected
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec-v4.0.yaml#
>> arch/arm64/boot/dts/freescale/imx8dx-colibri-eval-v3.dtb: /bus@31400000/crypto@31400000: failed to match any schema with compatible: ['fsl,imx8qxp-caam', 'fsl,sec-v4.0']
>> arch/arm64/boot/dts/freescale/imx8dx-colibri-eval-v3.dtb: /bus@31400000/crypto@31400000/jr@30000: failed to match any schema with compatible: ['fsl,imx8qxp-job-ring', 'fsl,sec-v4.0-job-ring']
   arch/arm64/boot/dts/freescale/imx8dx-colibri-eval-v3.dtb: /bus@31400000/crypto@31400000/jr@40000: failed to match any schema with compatible: ['fsl,imx8qxp-job-ring', 'fsl,sec-v4.0-job-ring']
--
>> arch/arm64/boot/dts/freescale/imx8dx-colibri-iris-v2.dtb: crypto@31400000 (fsl,imx8qxp-caam): 'power-domains' does not match any of the regexes: '^jr@[0-9a-f]+$', '^pinctrl-[0-9]+$', '^rtic@[0-9a-f]+$'
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec-v4.0.yaml#
>> arch/arm64/boot/dts/freescale/imx8dx-colibri-iris-v2.dtb: crypto@31400000 (fsl,imx8qxp-caam): jr@30000: 'power-domains' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec-v4.0.yaml#
>> arch/arm64/boot/dts/freescale/imx8dx-colibri-iris-v2.dtb: crypto@31400000 (fsl,imx8qxp-caam): jr@30000:compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,imx8qxp-job-ring', 'fsl,sec-v4.0-job-ring'] is too short
   	['fsl,imx8qxp-job-ring', 'fsl,sec-v4.0-job-ring'] is too long
   	'fsl,sec-v6.0-job-ring' was expected
   	'fsl,sec-v5.4-job-ring' was expected
   	'fsl,sec-v5.0-job-ring' was expected
   	'fsl,sec-v4.0-job-ring' was expected
   	'fsl,sec-v5.2-job-ring' was expected
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec-v4.0.yaml#
   arch/arm64/boot/dts/freescale/imx8dx-colibri-iris-v2.dtb: crypto@31400000 (fsl,imx8qxp-caam): jr@40000: 'power-domains' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec-v4.0.yaml#
   arch/arm64/boot/dts/freescale/imx8dx-colibri-iris-v2.dtb: crypto@31400000 (fsl,imx8qxp-caam): jr@40000:compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,imx8qxp-job-ring', 'fsl,sec-v4.0-job-ring'] is too short
   	['fsl,imx8qxp-job-ring', 'fsl,sec-v4.0-job-ring'] is too long
   	'fsl,sec-v6.0-job-ring' was expected
   	'fsl,sec-v5.4-job-ring' was expected
   	'fsl,sec-v5.0-job-ring' was expected
   	'fsl,sec-v4.0-job-ring' was expected
   	'fsl,sec-v5.2-job-ring' was expected
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec-v4.0.yaml#
>> arch/arm64/boot/dts/freescale/imx8dx-colibri-iris-v2.dtb: crypto@31400000 (fsl,imx8qxp-caam): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,imx8qxp-caam', 'fsl,sec-v4.0'] is too short
   	['fsl,imx8qxp-caam', 'fsl,sec-v4.0'] is too long
   	'fsl,imx8qxp-caam' is not one of ['fsl,sec-v5.4', 'fsl,sec-v6.0']
   	'fsl,imx8qxp-caam' is not one of ['fsl,imx6ul-caam', 'fsl,sec-v5.0']
   	'fsl,sec-v4.0' was expected
   	'fsl,sec-v5.0' was expected
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec-v4.0.yaml#
>> arch/arm64/boot/dts/freescale/imx8dx-colibri-iris-v2.dtb: /bus@31400000/crypto@31400000: failed to match any schema with compatible: ['fsl,imx8qxp-caam', 'fsl,sec-v4.0']
>> arch/arm64/boot/dts/freescale/imx8dx-colibri-iris-v2.dtb: /bus@31400000/crypto@31400000/jr@30000: failed to match any schema with compatible: ['fsl,imx8qxp-job-ring', 'fsl,sec-v4.0-job-ring']
   arch/arm64/boot/dts/freescale/imx8dx-colibri-iris-v2.dtb: /bus@31400000/crypto@31400000/jr@40000: failed to match any schema with compatible: ['fsl,imx8qxp-job-ring', 'fsl,sec-v4.0-job-ring']
--
>> arch/arm64/boot/dts/freescale/imx8dx-colibri-iris.dtb: crypto@31400000 (fsl,imx8qxp-caam): 'power-domains' does not match any of the regexes: '^jr@[0-9a-f]+$', '^pinctrl-[0-9]+$', '^rtic@[0-9a-f]+$'
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec-v4.0.yaml#
>> arch/arm64/boot/dts/freescale/imx8dx-colibri-iris.dtb: crypto@31400000 (fsl,imx8qxp-caam): jr@30000: 'power-domains' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec-v4.0.yaml#
>> arch/arm64/boot/dts/freescale/imx8dx-colibri-iris.dtb: crypto@31400000 (fsl,imx8qxp-caam): jr@30000:compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,imx8qxp-job-ring', 'fsl,sec-v4.0-job-ring'] is too short
   	['fsl,imx8qxp-job-ring', 'fsl,sec-v4.0-job-ring'] is too long
   	'fsl,sec-v6.0-job-ring' was expected
   	'fsl,sec-v5.4-job-ring' was expected
   	'fsl,sec-v5.0-job-ring' was expected
   	'fsl,sec-v4.0-job-ring' was expected
   	'fsl,sec-v5.2-job-ring' was expected
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec-v4.0.yaml#
   arch/arm64/boot/dts/freescale/imx8dx-colibri-iris.dtb: crypto@31400000 (fsl,imx8qxp-caam): jr@40000: 'power-domains' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec-v4.0.yaml#
   arch/arm64/boot/dts/freescale/imx8dx-colibri-iris.dtb: crypto@31400000 (fsl,imx8qxp-caam): jr@40000:compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,imx8qxp-job-ring', 'fsl,sec-v4.0-job-ring'] is too short
   	['fsl,imx8qxp-job-ring', 'fsl,sec-v4.0-job-ring'] is too long
   	'fsl,sec-v6.0-job-ring' was expected
   	'fsl,sec-v5.4-job-ring' was expected
   	'fsl,sec-v5.0-job-ring' was expected
   	'fsl,sec-v4.0-job-ring' was expected
   	'fsl,sec-v5.2-job-ring' was expected
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec-v4.0.yaml#
>> arch/arm64/boot/dts/freescale/imx8dx-colibri-iris.dtb: crypto@31400000 (fsl,imx8qxp-caam): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,imx8qxp-caam', 'fsl,sec-v4.0'] is too short
   	['fsl,imx8qxp-caam', 'fsl,sec-v4.0'] is too long
   	'fsl,imx8qxp-caam' is not one of ['fsl,sec-v5.4', 'fsl,sec-v6.0']
   	'fsl,imx8qxp-caam' is not one of ['fsl,imx6ul-caam', 'fsl,sec-v5.0']
   	'fsl,sec-v4.0' was expected
   	'fsl,sec-v5.0' was expected
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec-v4.0.yaml#
>> arch/arm64/boot/dts/freescale/imx8dx-colibri-iris.dtb: /bus@31400000/crypto@31400000: failed to match any schema with compatible: ['fsl,imx8qxp-caam', 'fsl,sec-v4.0']
>> arch/arm64/boot/dts/freescale/imx8dx-colibri-iris.dtb: /bus@31400000/crypto@31400000/jr@30000: failed to match any schema with compatible: ['fsl,imx8qxp-job-ring', 'fsl,sec-v4.0-job-ring']
   arch/arm64/boot/dts/freescale/imx8dx-colibri-iris.dtb: /bus@31400000/crypto@31400000/jr@40000: failed to match any schema with compatible: ['fsl,imx8qxp-job-ring', 'fsl,sec-v4.0-job-ring']
--
>> arch/arm64/boot/dts/freescale/imx8dxp-tqma8xdp-mba8xx.dtb: crypto@31400000 (fsl,imx8qxp-caam): 'power-domains' does not match any of the regexes: '^jr@[0-9a-f]+$', '^pinctrl-[0-9]+$', '^rtic@[0-9a-f]+$'
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec-v4.0.yaml#
>> arch/arm64/boot/dts/freescale/imx8dxp-tqma8xdp-mba8xx.dtb: crypto@31400000 (fsl,imx8qxp-caam): jr@30000: 'power-domains' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec-v4.0.yaml#
>> arch/arm64/boot/dts/freescale/imx8dxp-tqma8xdp-mba8xx.dtb: crypto@31400000 (fsl,imx8qxp-caam): jr@30000:compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,imx8qxp-job-ring', 'fsl,sec-v4.0-job-ring'] is too short
   	['fsl,imx8qxp-job-ring', 'fsl,sec-v4.0-job-ring'] is too long
   	'fsl,sec-v6.0-job-ring' was expected
   	'fsl,sec-v5.4-job-ring' was expected
   	'fsl,sec-v5.0-job-ring' was expected
   	'fsl,sec-v4.0-job-ring' was expected
   	'fsl,sec-v5.2-job-ring' was expected
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec-v4.0.yaml#
   arch/arm64/boot/dts/freescale/imx8dxp-tqma8xdp-mba8xx.dtb: crypto@31400000 (fsl,imx8qxp-caam): jr@40000: 'power-domains' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec-v4.0.yaml#
   arch/arm64/boot/dts/freescale/imx8dxp-tqma8xdp-mba8xx.dtb: crypto@31400000 (fsl,imx8qxp-caam): jr@40000:compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,imx8qxp-job-ring', 'fsl,sec-v4.0-job-ring'] is too short
   	['fsl,imx8qxp-job-ring', 'fsl,sec-v4.0-job-ring'] is too long
   	'fsl,sec-v6.0-job-ring' was expected
   	'fsl,sec-v5.4-job-ring' was expected
   	'fsl,sec-v5.0-job-ring' was expected
   	'fsl,sec-v4.0-job-ring' was expected
   	'fsl,sec-v5.2-job-ring' was expected
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec-v4.0.yaml#
>> arch/arm64/boot/dts/freescale/imx8dxp-tqma8xdp-mba8xx.dtb: crypto@31400000 (fsl,imx8qxp-caam): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,imx8qxp-caam', 'fsl,sec-v4.0'] is too short
   	['fsl,imx8qxp-caam', 'fsl,sec-v4.0'] is too long
   	'fsl,imx8qxp-caam' is not one of ['fsl,sec-v5.4', 'fsl,sec-v6.0']
   	'fsl,imx8qxp-caam' is not one of ['fsl,imx6ul-caam', 'fsl,sec-v5.0']
   	'fsl,sec-v4.0' was expected
   	'fsl,sec-v5.0' was expected
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec-v4.0.yaml#
>> arch/arm64/boot/dts/freescale/imx8dxp-tqma8xdp-mba8xx.dtb: /bus@31400000/crypto@31400000: failed to match any schema with compatible: ['fsl,imx8qxp-caam', 'fsl,sec-v4.0']
>> arch/arm64/boot/dts/freescale/imx8dxp-tqma8xdp-mba8xx.dtb: /bus@31400000/crypto@31400000/jr@30000: failed to match any schema with compatible: ['fsl,imx8qxp-job-ring', 'fsl,sec-v4.0-job-ring']
   arch/arm64/boot/dts/freescale/imx8dxp-tqma8xdp-mba8xx.dtb: /bus@31400000/crypto@31400000/jr@40000: failed to match any schema with compatible: ['fsl,imx8qxp-job-ring', 'fsl,sec-v4.0-job-ring']
--
>> arch/arm64/boot/dts/freescale/imx8dxp-tqma8xdps-mb-smarc-2.dtb: crypto@31400000 (fsl,imx8qxp-caam): 'power-domains' does not match any of the regexes: '^jr@[0-9a-f]+$', '^pinctrl-[0-9]+$', '^rtic@[0-9a-f]+$'
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec-v4.0.yaml#
>> arch/arm64/boot/dts/freescale/imx8dxp-tqma8xdps-mb-smarc-2.dtb: crypto@31400000 (fsl,imx8qxp-caam): jr@30000: 'power-domains' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec-v4.0.yaml#
>> arch/arm64/boot/dts/freescale/imx8dxp-tqma8xdps-mb-smarc-2.dtb: crypto@31400000 (fsl,imx8qxp-caam): jr@30000:compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,imx8qxp-job-ring', 'fsl,sec-v4.0-job-ring'] is too short
   	['fsl,imx8qxp-job-ring', 'fsl,sec-v4.0-job-ring'] is too long
   	'fsl,sec-v6.0-job-ring' was expected
   	'fsl,sec-v5.4-job-ring' was expected
   	'fsl,sec-v5.0-job-ring' was expected
   	'fsl,sec-v4.0-job-ring' was expected
   	'fsl,sec-v5.2-job-ring' was expected
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec-v4.0.yaml#
   arch/arm64/boot/dts/freescale/imx8dxp-tqma8xdps-mb-smarc-2.dtb: crypto@31400000 (fsl,imx8qxp-caam): jr@40000: 'power-domains' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec-v4.0.yaml#
   arch/arm64/boot/dts/freescale/imx8dxp-tqma8xdps-mb-smarc-2.dtb: crypto@31400000 (fsl,imx8qxp-caam): jr@40000:compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,imx8qxp-job-ring', 'fsl,sec-v4.0-job-ring'] is too short
   	['fsl,imx8qxp-job-ring', 'fsl,sec-v4.0-job-ring'] is too long
   	'fsl,sec-v6.0-job-ring' was expected
   	'fsl,sec-v5.4-job-ring' was expected
   	'fsl,sec-v5.0-job-ring' was expected
   	'fsl,sec-v4.0-job-ring' was expected
   	'fsl,sec-v5.2-job-ring' was expected
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec-v4.0.yaml#
>> arch/arm64/boot/dts/freescale/imx8dxp-tqma8xdps-mb-smarc-2.dtb: crypto@31400000 (fsl,imx8qxp-caam): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,imx8qxp-caam', 'fsl,sec-v4.0'] is too short
   	['fsl,imx8qxp-caam', 'fsl,sec-v4.0'] is too long
   	'fsl,imx8qxp-caam' is not one of ['fsl,sec-v5.4', 'fsl,sec-v6.0']
   	'fsl,imx8qxp-caam' is not one of ['fsl,imx6ul-caam', 'fsl,sec-v5.0']
   	'fsl,sec-v4.0' was expected
   	'fsl,sec-v5.0' was expected
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec-v4.0.yaml#
>> arch/arm64/boot/dts/freescale/imx8dxp-tqma8xdps-mb-smarc-2.dtb: /bus@31400000/crypto@31400000: failed to match any schema with compatible: ['fsl,imx8qxp-caam', 'fsl,sec-v4.0']
>> arch/arm64/boot/dts/freescale/imx8dxp-tqma8xdps-mb-smarc-2.dtb: /bus@31400000/crypto@31400000/jr@30000: failed to match any schema with compatible: ['fsl,imx8qxp-job-ring', 'fsl,sec-v4.0-job-ring']
   arch/arm64/boot/dts/freescale/imx8dxp-tqma8xdps-mb-smarc-2.dtb: /bus@31400000/crypto@31400000/jr@40000: failed to match any schema with compatible: ['fsl,imx8qxp-job-ring', 'fsl,sec-v4.0-job-ring']
--
>> arch/arm64/boot/dts/freescale/imx8qm-apalis-eval.dtb: crypto@31400000 (fsl,imx8qm-caam): 'power-domains' does not match any of the regexes: '^jr@[0-9a-f]+$', '^pinctrl-[0-9]+$', '^rtic@[0-9a-f]+$'
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec-v4.0.yaml#
>> arch/arm64/boot/dts/freescale/imx8qm-apalis-eval.dtb: crypto@31400000 (fsl,imx8qm-caam): jr@30000: 'power-domains' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec-v4.0.yaml#
>> arch/arm64/boot/dts/freescale/imx8qm-apalis-eval.dtb: crypto@31400000 (fsl,imx8qm-caam): jr@30000:compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,imx8qm-job-ring', 'fsl,sec-v4.0-job-ring'] is too short
   	['fsl,imx8qm-job-ring', 'fsl,sec-v4.0-job-ring'] is too long
   	'fsl,sec-v6.0-job-ring' was expected
   	'fsl,sec-v5.4-job-ring' was expected
   	'fsl,sec-v5.0-job-ring' was expected
   	'fsl,sec-v4.0-job-ring' was expected
   	'fsl,sec-v5.2-job-ring' was expected
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec-v4.0.yaml#
   arch/arm64/boot/dts/freescale/imx8qm-apalis-eval.dtb: crypto@31400000 (fsl,imx8qm-caam): jr@40000: 'power-domains' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec-v4.0.yaml#
   arch/arm64/boot/dts/freescale/imx8qm-apalis-eval.dtb: crypto@31400000 (fsl,imx8qm-caam): jr@40000:compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,imx8qm-job-ring', 'fsl,sec-v4.0-job-ring'] is too short
   	['fsl,imx8qm-job-ring', 'fsl,sec-v4.0-job-ring'] is too long
   	'fsl,sec-v6.0-job-ring' was expected
   	'fsl,sec-v5.4-job-ring' was expected
   	'fsl,sec-v5.0-job-ring' was expected
   	'fsl,sec-v4.0-job-ring' was expected
   	'fsl,sec-v5.2-job-ring' was expected
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec-v4.0.yaml#
>> arch/arm64/boot/dts/freescale/imx8qm-apalis-eval.dtb: crypto@31400000 (fsl,imx8qm-caam): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,imx8qm-caam', 'fsl,sec-v4.0'] is too short
   	['fsl,imx8qm-caam', 'fsl,sec-v4.0'] is too long
   	'fsl,imx8qm-caam' is not one of ['fsl,sec-v5.4', 'fsl,sec-v6.0']
   	'fsl,imx8qm-caam' is not one of ['fsl,imx6ul-caam', 'fsl,sec-v5.0']
   	'fsl,sec-v4.0' was expected
   	'fsl,sec-v5.0' was expected
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec-v4.0.yaml#
>> arch/arm64/boot/dts/freescale/imx8qm-apalis-eval.dtb: /bus@31400000/crypto@31400000: failed to match any schema with compatible: ['fsl,imx8qm-caam', 'fsl,sec-v4.0']
>> arch/arm64/boot/dts/freescale/imx8qm-apalis-eval.dtb: /bus@31400000/crypto@31400000/jr@30000: failed to match any schema with compatible: ['fsl,imx8qm-job-ring', 'fsl,sec-v4.0-job-ring']
   arch/arm64/boot/dts/freescale/imx8qm-apalis-eval.dtb: /bus@31400000/crypto@31400000/jr@40000: failed to match any schema with compatible: ['fsl,imx8qm-job-ring', 'fsl,sec-v4.0-job-ring']
--
>> arch/arm64/boot/dts/freescale/imx8qm-apalis-eval-v1.2.dtb: crypto@31400000 (fsl,imx8qm-caam): 'power-domains' does not match any of the regexes: '^jr@[0-9a-f]+$', '^pinctrl-[0-9]+$', '^rtic@[0-9a-f]+$'
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec-v4.0.yaml#
>> arch/arm64/boot/dts/freescale/imx8qm-apalis-eval-v1.2.dtb: crypto@31400000 (fsl,imx8qm-caam): jr@30000: 'power-domains' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec-v4.0.yaml#
>> arch/arm64/boot/dts/freescale/imx8qm-apalis-eval-v1.2.dtb: crypto@31400000 (fsl,imx8qm-caam): jr@30000:compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,imx8qm-job-ring', 'fsl,sec-v4.0-job-ring'] is too short
   	['fsl,imx8qm-job-ring', 'fsl,sec-v4.0-job-ring'] is too long
   	'fsl,sec-v6.0-job-ring' was expected
   	'fsl,sec-v5.4-job-ring' was expected
   	'fsl,sec-v5.0-job-ring' was expected
   	'fsl,sec-v4.0-job-ring' was expected
   	'fsl,sec-v5.2-job-ring' was expected
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec-v4.0.yaml#
   arch/arm64/boot/dts/freescale/imx8qm-apalis-eval-v1.2.dtb: crypto@31400000 (fsl,imx8qm-caam): jr@40000: 'power-domains' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec-v4.0.yaml#
   arch/arm64/boot/dts/freescale/imx8qm-apalis-eval-v1.2.dtb: crypto@31400000 (fsl,imx8qm-caam): jr@40000:compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,imx8qm-job-ring', 'fsl,sec-v4.0-job-ring'] is too short
   	['fsl,imx8qm-job-ring', 'fsl,sec-v4.0-job-ring'] is too long
   	'fsl,sec-v6.0-job-ring' was expected
   	'fsl,sec-v5.4-job-ring' was expected
   	'fsl,sec-v5.0-job-ring' was expected
   	'fsl,sec-v4.0-job-ring' was expected
   	'fsl,sec-v5.2-job-ring' was expected
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec-v4.0.yaml#
>> arch/arm64/boot/dts/freescale/imx8qm-apalis-eval-v1.2.dtb: crypto@31400000 (fsl,imx8qm-caam): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,imx8qm-caam', 'fsl,sec-v4.0'] is too short
   	['fsl,imx8qm-caam', 'fsl,sec-v4.0'] is too long
   	'fsl,imx8qm-caam' is not one of ['fsl,sec-v5.4', 'fsl,sec-v6.0']
   	'fsl,imx8qm-caam' is not one of ['fsl,imx6ul-caam', 'fsl,sec-v5.0']
   	'fsl,sec-v4.0' was expected
   	'fsl,sec-v5.0' was expected
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec-v4.0.yaml#
>> arch/arm64/boot/dts/freescale/imx8qm-apalis-eval-v1.2.dtb: /bus@31400000/crypto@31400000: failed to match any schema with compatible: ['fsl,imx8qm-caam', 'fsl,sec-v4.0']
>> arch/arm64/boot/dts/freescale/imx8qm-apalis-eval-v1.2.dtb: /bus@31400000/crypto@31400000/jr@30000: failed to match any schema with compatible: ['fsl,imx8qm-job-ring', 'fsl,sec-v4.0-job-ring']
   arch/arm64/boot/dts/freescale/imx8qm-apalis-eval-v1.2.dtb: /bus@31400000/crypto@31400000/jr@40000: failed to match any schema with compatible: ['fsl,imx8qm-job-ring', 'fsl,sec-v4.0-job-ring']
--
>> arch/arm64/boot/dts/freescale/imx8qm-apalis-ixora-v1.1.dtb: crypto@31400000 (fsl,imx8qm-caam): 'power-domains' does not match any of the regexes: '^jr@[0-9a-f]+$', '^pinctrl-[0-9]+$', '^rtic@[0-9a-f]+$'
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec-v4.0.yaml#
>> arch/arm64/boot/dts/freescale/imx8qm-apalis-ixora-v1.1.dtb: crypto@31400000 (fsl,imx8qm-caam): jr@30000: 'power-domains' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec-v4.0.yaml#
>> arch/arm64/boot/dts/freescale/imx8qm-apalis-ixora-v1.1.dtb: crypto@31400000 (fsl,imx8qm-caam): jr@30000:compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,imx8qm-job-ring', 'fsl,sec-v4.0-job-ring'] is too short
   	['fsl,imx8qm-job-ring', 'fsl,sec-v4.0-job-ring'] is too long
   	'fsl,sec-v6.0-job-ring' was expected
   	'fsl,sec-v5.4-job-ring' was expected
   	'fsl,sec-v5.0-job-ring' was expected
   	'fsl,sec-v4.0-job-ring' was expected
   	'fsl,sec-v5.2-job-ring' was expected
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec-v4.0.yaml#
   arch/arm64/boot/dts/freescale/imx8qm-apalis-ixora-v1.1.dtb: crypto@31400000 (fsl,imx8qm-caam): jr@40000: 'power-domains' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec-v4.0.yaml#
   arch/arm64/boot/dts/freescale/imx8qm-apalis-ixora-v1.1.dtb: crypto@31400000 (fsl,imx8qm-caam): jr@40000:compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,imx8qm-job-ring', 'fsl,sec-v4.0-job-ring'] is too short
   	['fsl,imx8qm-job-ring', 'fsl,sec-v4.0-job-ring'] is too long
   	'fsl,sec-v6.0-job-ring' was expected
   	'fsl,sec-v5.4-job-ring' was expected
   	'fsl,sec-v5.0-job-ring' was expected
   	'fsl,sec-v4.0-job-ring' was expected
   	'fsl,sec-v5.2-job-ring' was expected
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec-v4.0.yaml#
>> arch/arm64/boot/dts/freescale/imx8qm-apalis-ixora-v1.1.dtb: crypto@31400000 (fsl,imx8qm-caam): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,imx8qm-caam', 'fsl,sec-v4.0'] is too short
   	['fsl,imx8qm-caam', 'fsl,sec-v4.0'] is too long
   	'fsl,imx8qm-caam' is not one of ['fsl,sec-v5.4', 'fsl,sec-v6.0']
   	'fsl,imx8qm-caam' is not one of ['fsl,imx6ul-caam', 'fsl,sec-v5.0']
   	'fsl,sec-v4.0' was expected
   	'fsl,sec-v5.0' was expected
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec-v4.0.yaml#
>> arch/arm64/boot/dts/freescale/imx8qm-apalis-ixora-v1.1.dtb: /bus@31400000/crypto@31400000: failed to match any schema with compatible: ['fsl,imx8qm-caam', 'fsl,sec-v4.0']
>> arch/arm64/boot/dts/freescale/imx8qm-apalis-ixora-v1.1.dtb: /bus@31400000/crypto@31400000/jr@30000: failed to match any schema with compatible: ['fsl,imx8qm-job-ring', 'fsl,sec-v4.0-job-ring']
   arch/arm64/boot/dts/freescale/imx8qm-apalis-ixora-v1.1.dtb: /bus@31400000/crypto@31400000/jr@40000: failed to match any schema with compatible: ['fsl,imx8qm-job-ring', 'fsl,sec-v4.0-job-ring']
--
>> arch/arm64/boot/dts/freescale/imx8qm-apalis-v1.1-eval.dtb: crypto@31400000 (fsl,imx8qm-caam): 'power-domains' does not match any of the regexes: '^jr@[0-9a-f]+$', '^pinctrl-[0-9]+$', '^rtic@[0-9a-f]+$'
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec-v4.0.yaml#
>> arch/arm64/boot/dts/freescale/imx8qm-apalis-v1.1-eval.dtb: crypto@31400000 (fsl,imx8qm-caam): jr@30000: 'power-domains' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec-v4.0.yaml#
>> arch/arm64/boot/dts/freescale/imx8qm-apalis-v1.1-eval.dtb: crypto@31400000 (fsl,imx8qm-caam): jr@30000:compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,imx8qm-job-ring', 'fsl,sec-v4.0-job-ring'] is too short
   	['fsl,imx8qm-job-ring', 'fsl,sec-v4.0-job-ring'] is too long
   	'fsl,sec-v6.0-job-ring' was expected
   	'fsl,sec-v5.4-job-ring' was expected
   	'fsl,sec-v5.0-job-ring' was expected
   	'fsl,sec-v4.0-job-ring' was expected
   	'fsl,sec-v5.2-job-ring' was expected
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec-v4.0.yaml#
   arch/arm64/boot/dts/freescale/imx8qm-apalis-v1.1-eval.dtb: crypto@31400000 (fsl,imx8qm-caam): jr@40000: 'power-domains' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec-v4.0.yaml#
   arch/arm64/boot/dts/freescale/imx8qm-apalis-v1.1-eval.dtb: crypto@31400000 (fsl,imx8qm-caam): jr@40000:compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,imx8qm-job-ring', 'fsl,sec-v4.0-job-ring'] is too short
   	['fsl,imx8qm-job-ring', 'fsl,sec-v4.0-job-ring'] is too long
   	'fsl,sec-v6.0-job-ring' was expected
   	'fsl,sec-v5.4-job-ring' was expected
   	'fsl,sec-v5.0-job-ring' was expected
   	'fsl,sec-v4.0-job-ring' was expected
   	'fsl,sec-v5.2-job-ring' was expected
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec-v4.0.yaml#
>> arch/arm64/boot/dts/freescale/imx8qm-apalis-v1.1-eval.dtb: crypto@31400000 (fsl,imx8qm-caam): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,imx8qm-caam', 'fsl,sec-v4.0'] is too short
   	['fsl,imx8qm-caam', 'fsl,sec-v4.0'] is too long
   	'fsl,imx8qm-caam' is not one of ['fsl,sec-v5.4', 'fsl,sec-v6.0']
   	'fsl,imx8qm-caam' is not one of ['fsl,imx6ul-caam', 'fsl,sec-v5.0']
   	'fsl,sec-v4.0' was expected
   	'fsl,sec-v5.0' was expected
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec-v4.0.yaml#
>> arch/arm64/boot/dts/freescale/imx8qm-apalis-v1.1-eval.dtb: /bus@31400000/crypto@31400000: failed to match any schema with compatible: ['fsl,imx8qm-caam', 'fsl,sec-v4.0']
>> arch/arm64/boot/dts/freescale/imx8qm-apalis-v1.1-eval.dtb: /bus@31400000/crypto@31400000/jr@30000: failed to match any schema with compatible: ['fsl,imx8qm-job-ring', 'fsl,sec-v4.0-job-ring']
   arch/arm64/boot/dts/freescale/imx8qm-apalis-v1.1-eval.dtb: /bus@31400000/crypto@31400000/jr@40000: failed to match any schema with compatible: ['fsl,imx8qm-job-ring', 'fsl,sec-v4.0-job-ring']
--
>> arch/arm64/boot/dts/freescale/imx8qm-apalis-v1.1-eval-v1.2.dtb: crypto@31400000 (fsl,imx8qm-caam): 'power-domains' does not match any of the regexes: '^jr@[0-9a-f]+$', '^pinctrl-[0-9]+$', '^rtic@[0-9a-f]+$'
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec-v4.0.yaml#
>> arch/arm64/boot/dts/freescale/imx8qm-apalis-v1.1-eval-v1.2.dtb: crypto@31400000 (fsl,imx8qm-caam): jr@30000: 'power-domains' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec-v4.0.yaml#
>> arch/arm64/boot/dts/freescale/imx8qm-apalis-v1.1-eval-v1.2.dtb: crypto@31400000 (fsl,imx8qm-caam): jr@30000:compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,imx8qm-job-ring', 'fsl,sec-v4.0-job-ring'] is too short
   	['fsl,imx8qm-job-ring', 'fsl,sec-v4.0-job-ring'] is too long
   	'fsl,sec-v6.0-job-ring' was expected
   	'fsl,sec-v5.4-job-ring' was expected
   	'fsl,sec-v5.0-job-ring' was expected
   	'fsl,sec-v4.0-job-ring' was expected
   	'fsl,sec-v5.2-job-ring' was expected
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec-v4.0.yaml#
   arch/arm64/boot/dts/freescale/imx8qm-apalis-v1.1-eval-v1.2.dtb: crypto@31400000 (fsl,imx8qm-caam): jr@40000: 'power-domains' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec-v4.0.yaml#
   arch/arm64/boot/dts/freescale/imx8qm-apalis-v1.1-eval-v1.2.dtb: crypto@31400000 (fsl,imx8qm-caam): jr@40000:compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,imx8qm-job-ring', 'fsl,sec-v4.0-job-ring'] is too short
   	['fsl,imx8qm-job-ring', 'fsl,sec-v4.0-job-ring'] is too long
   	'fsl,sec-v6.0-job-ring' was expected
   	'fsl,sec-v5.4-job-ring' was expected
   	'fsl,sec-v5.0-job-ring' was expected
   	'fsl,sec-v4.0-job-ring' was expected
   	'fsl,sec-v5.2-job-ring' was expected
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec-v4.0.yaml#
>> arch/arm64/boot/dts/freescale/imx8qm-apalis-v1.1-eval-v1.2.dtb: crypto@31400000 (fsl,imx8qm-caam): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,imx8qm-caam', 'fsl,sec-v4.0'] is too short
   	['fsl,imx8qm-caam', 'fsl,sec-v4.0'] is too long
   	'fsl,imx8qm-caam' is not one of ['fsl,sec-v5.4', 'fsl,sec-v6.0']
   	'fsl,imx8qm-caam' is not one of ['fsl,imx6ul-caam', 'fsl,sec-v5.0']
   	'fsl,sec-v4.0' was expected
   	'fsl,sec-v5.0' was expected
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec-v4.0.yaml#
>> arch/arm64/boot/dts/freescale/imx8qm-apalis-v1.1-eval-v1.2.dtb: /bus@31400000/crypto@31400000: failed to match any schema with compatible: ['fsl,imx8qm-caam', 'fsl,sec-v4.0']
>> arch/arm64/boot/dts/freescale/imx8qm-apalis-v1.1-eval-v1.2.dtb: /bus@31400000/crypto@31400000/jr@30000: failed to match any schema with compatible: ['fsl,imx8qm-job-ring', 'fsl,sec-v4.0-job-ring']
   arch/arm64/boot/dts/freescale/imx8qm-apalis-v1.1-eval-v1.2.dtb: /bus@31400000/crypto@31400000/jr@40000: failed to match any schema with compatible: ['fsl,imx8qm-job-ring', 'fsl,sec-v4.0-job-ring']
--
>> arch/arm64/boot/dts/freescale/imx8qm-apalis-v1.1-ixora-v1.1.dtb: crypto@31400000 (fsl,imx8qm-caam): 'power-domains' does not match any of the regexes: '^jr@[0-9a-f]+$', '^pinctrl-[0-9]+$', '^rtic@[0-9a-f]+$'
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec-v4.0.yaml#
>> arch/arm64/boot/dts/freescale/imx8qm-apalis-v1.1-ixora-v1.1.dtb: crypto@31400000 (fsl,imx8qm-caam): jr@30000: 'power-domains' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec-v4.0.yaml#
>> arch/arm64/boot/dts/freescale/imx8qm-apalis-v1.1-ixora-v1.1.dtb: crypto@31400000 (fsl,imx8qm-caam): jr@30000:compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,imx8qm-job-ring', 'fsl,sec-v4.0-job-ring'] is too short
   	['fsl,imx8qm-job-ring', 'fsl,sec-v4.0-job-ring'] is too long
   	'fsl,sec-v6.0-job-ring' was expected
   	'fsl,sec-v5.4-job-ring' was expected
   	'fsl,sec-v5.0-job-ring' was expected
   	'fsl,sec-v4.0-job-ring' was expected
   	'fsl,sec-v5.2-job-ring' was expected
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec-v4.0.yaml#
   arch/arm64/boot/dts/freescale/imx8qm-apalis-v1.1-ixora-v1.1.dtb: crypto@31400000 (fsl,imx8qm-caam): jr@40000: 'power-domains' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec-v4.0.yaml#
   arch/arm64/boot/dts/freescale/imx8qm-apalis-v1.1-ixora-v1.1.dtb: crypto@31400000 (fsl,imx8qm-caam): jr@40000:compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,imx8qm-job-ring', 'fsl,sec-v4.0-job-ring'] is too short
   	['fsl,imx8qm-job-ring', 'fsl,sec-v4.0-job-ring'] is too long
   	'fsl,sec-v6.0-job-ring' was expected
   	'fsl,sec-v5.4-job-ring' was expected
   	'fsl,sec-v5.0-job-ring' was expected
   	'fsl,sec-v4.0-job-ring' was expected
   	'fsl,sec-v5.2-job-ring' was expected
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec-v4.0.yaml#
>> arch/arm64/boot/dts/freescale/imx8qm-apalis-v1.1-ixora-v1.1.dtb: crypto@31400000 (fsl,imx8qm-caam): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,imx8qm-caam', 'fsl,sec-v4.0'] is too short
   	['fsl,imx8qm-caam', 'fsl,sec-v4.0'] is too long
   	'fsl,imx8qm-caam' is not one of ['fsl,sec-v5.4', 'fsl,sec-v6.0']
   	'fsl,imx8qm-caam' is not one of ['fsl,imx6ul-caam', 'fsl,sec-v5.0']
   	'fsl,sec-v4.0' was expected
   	'fsl,sec-v5.0' was expected
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec-v4.0.yaml#
>> arch/arm64/boot/dts/freescale/imx8qm-apalis-v1.1-ixora-v1.1.dtb: /bus@31400000/crypto@31400000: failed to match any schema with compatible: ['fsl,imx8qm-caam', 'fsl,sec-v4.0']
>> arch/arm64/boot/dts/freescale/imx8qm-apalis-v1.1-ixora-v1.1.dtb: /bus@31400000/crypto@31400000/jr@30000: failed to match any schema with compatible: ['fsl,imx8qm-job-ring', 'fsl,sec-v4.0-job-ring']
   arch/arm64/boot/dts/freescale/imx8qm-apalis-v1.1-ixora-v1.1.dtb: /bus@31400000/crypto@31400000/jr@40000: failed to match any schema with compatible: ['fsl,imx8qm-job-ring', 'fsl,sec-v4.0-job-ring']
--
>> arch/arm64/boot/dts/freescale/imx8qm-mek.dtb: crypto@31400000 (fsl,imx8qm-caam): 'power-domains' does not match any of the regexes: '^jr@[0-9a-f]+$', '^pinctrl-[0-9]+$', '^rtic@[0-9a-f]+$'
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec-v4.0.yaml#
>> arch/arm64/boot/dts/freescale/imx8qm-mek.dtb: crypto@31400000 (fsl,imx8qm-caam): jr@30000: 'power-domains' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec-v4.0.yaml#
>> arch/arm64/boot/dts/freescale/imx8qm-mek.dtb: crypto@31400000 (fsl,imx8qm-caam): jr@30000:compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,imx8qm-job-ring', 'fsl,sec-v4.0-job-ring'] is too short
   	['fsl,imx8qm-job-ring', 'fsl,sec-v4.0-job-ring'] is too long
   	'fsl,sec-v6.0-job-ring' was expected
   	'fsl,sec-v5.4-job-ring' was expected
   	'fsl,sec-v5.0-job-ring' was expected
   	'fsl,sec-v4.0-job-ring' was expected
   	'fsl,sec-v5.2-job-ring' was expected
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec-v4.0.yaml#
   arch/arm64/boot/dts/freescale/imx8qm-mek.dtb: crypto@31400000 (fsl,imx8qm-caam): jr@40000: 'power-domains' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec-v4.0.yaml#
   arch/arm64/boot/dts/freescale/imx8qm-mek.dtb: crypto@31400000 (fsl,imx8qm-caam): jr@40000:compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,imx8qm-job-ring', 'fsl,sec-v4.0-job-ring'] is too short
   	['fsl,imx8qm-job-ring', 'fsl,sec-v4.0-job-ring'] is too long
   	'fsl,sec-v6.0-job-ring' was expected
   	'fsl,sec-v5.4-job-ring' was expected
   	'fsl,sec-v5.0-job-ring' was expected
   	'fsl,sec-v4.0-job-ring' was expected
   	'fsl,sec-v5.2-job-ring' was expected
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec-v4.0.yaml#
>> arch/arm64/boot/dts/freescale/imx8qm-mek.dtb: crypto@31400000 (fsl,imx8qm-caam): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,imx8qm-caam', 'fsl,sec-v4.0'] is too short
   	['fsl,imx8qm-caam', 'fsl,sec-v4.0'] is too long
   	'fsl,imx8qm-caam' is not one of ['fsl,sec-v5.4', 'fsl,sec-v6.0']
   	'fsl,imx8qm-caam' is not one of ['fsl,imx6ul-caam', 'fsl,sec-v5.0']
   	'fsl,sec-v4.0' was expected
   	'fsl,sec-v5.0' was expected
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec-v4.0.yaml#
>> arch/arm64/boot/dts/freescale/imx8qm-mek.dtb: /bus@31400000/crypto@31400000: failed to match any schema with compatible: ['fsl,imx8qm-caam', 'fsl,sec-v4.0']
>> arch/arm64/boot/dts/freescale/imx8qm-mek.dtb: /bus@31400000/crypto@31400000/jr@30000: failed to match any schema with compatible: ['fsl,imx8qm-job-ring', 'fsl,sec-v4.0-job-ring']
   arch/arm64/boot/dts/freescale/imx8qm-mek.dtb: /bus@31400000/crypto@31400000/jr@40000: failed to match any schema with compatible: ['fsl,imx8qm-job-ring', 'fsl,sec-v4.0-job-ring']
--
>> arch/arm64/boot/dts/freescale/imx8qxp-ai_ml.dtb: crypto@31400000 (fsl,imx8qxp-caam): 'power-domains' does not match any of the regexes: '^jr@[0-9a-f]+$', '^pinctrl-[0-9]+$', '^rtic@[0-9a-f]+$'
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec-v4.0.yaml#
>> arch/arm64/boot/dts/freescale/imx8qxp-ai_ml.dtb: crypto@31400000 (fsl,imx8qxp-caam): jr@30000: 'power-domains' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec-v4.0.yaml#
>> arch/arm64/boot/dts/freescale/imx8qxp-ai_ml.dtb: crypto@31400000 (fsl,imx8qxp-caam): jr@30000:compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,imx8qxp-job-ring', 'fsl,sec-v4.0-job-ring'] is too short
   	['fsl,imx8qxp-job-ring', 'fsl,sec-v4.0-job-ring'] is too long
   	'fsl,sec-v6.0-job-ring' was expected
   	'fsl,sec-v5.4-job-ring' was expected
   	'fsl,sec-v5.0-job-ring' was expected
   	'fsl,sec-v4.0-job-ring' was expected
   	'fsl,sec-v5.2-job-ring' was expected
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec-v4.0.yaml#
   arch/arm64/boot/dts/freescale/imx8qxp-ai_ml.dtb: crypto@31400000 (fsl,imx8qxp-caam): jr@40000: 'power-domains' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec-v4.0.yaml#
   arch/arm64/boot/dts/freescale/imx8qxp-ai_ml.dtb: crypto@31400000 (fsl,imx8qxp-caam): jr@40000:compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,imx8qxp-job-ring', 'fsl,sec-v4.0-job-ring'] is too short
   	['fsl,imx8qxp-job-ring', 'fsl,sec-v4.0-job-ring'] is too long
   	'fsl,sec-v6.0-job-ring' was expected
   	'fsl,sec-v5.4-job-ring' was expected
   	'fsl,sec-v5.0-job-ring' was expected
   	'fsl,sec-v4.0-job-ring' was expected
   	'fsl,sec-v5.2-job-ring' was expected
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec-v4.0.yaml#
>> arch/arm64/boot/dts/freescale/imx8qxp-ai_ml.dtb: crypto@31400000 (fsl,imx8qxp-caam): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,imx8qxp-caam', 'fsl,sec-v4.0'] is too short
   	['fsl,imx8qxp-caam', 'fsl,sec-v4.0'] is too long
   	'fsl,imx8qxp-caam' is not one of ['fsl,sec-v5.4', 'fsl,sec-v6.0']
   	'fsl,imx8qxp-caam' is not one of ['fsl,imx6ul-caam', 'fsl,sec-v5.0']
   	'fsl,sec-v4.0' was expected
   	'fsl,sec-v5.0' was expected
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec-v4.0.yaml#
>> arch/arm64/boot/dts/freescale/imx8qxp-ai_ml.dtb: /bus@31400000/crypto@31400000: failed to match any schema with compatible: ['fsl,imx8qxp-caam', 'fsl,sec-v4.0']
>> arch/arm64/boot/dts/freescale/imx8qxp-ai_ml.dtb: /bus@31400000/crypto@31400000/jr@30000: failed to match any schema with compatible: ['fsl,imx8qxp-job-ring', 'fsl,sec-v4.0-job-ring']
   arch/arm64/boot/dts/freescale/imx8qxp-ai_ml.dtb: /bus@31400000/crypto@31400000/jr@40000: failed to match any schema with compatible: ['fsl,imx8qxp-job-ring', 'fsl,sec-v4.0-job-ring']
--
>> arch/arm64/boot/dts/freescale/imx8qxp-colibri-aster.dtb: crypto@31400000 (fsl,imx8qxp-caam): 'power-domains' does not match any of the regexes: '^jr@[0-9a-f]+$', '^pinctrl-[0-9]+$', '^rtic@[0-9a-f]+$'
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec-v4.0.yaml#
>> arch/arm64/boot/dts/freescale/imx8qxp-colibri-aster.dtb: crypto@31400000 (fsl,imx8qxp-caam): jr@30000: 'power-domains' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec-v4.0.yaml#
>> arch/arm64/boot/dts/freescale/imx8qxp-colibri-aster.dtb: crypto@31400000 (fsl,imx8qxp-caam): jr@30000:compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,imx8qxp-job-ring', 'fsl,sec-v4.0-job-ring'] is too short
   	['fsl,imx8qxp-job-ring', 'fsl,sec-v4.0-job-ring'] is too long
   	'fsl,sec-v6.0-job-ring' was expected
   	'fsl,sec-v5.4-job-ring' was expected
   	'fsl,sec-v5.0-job-ring' was expected
   	'fsl,sec-v4.0-job-ring' was expected
   	'fsl,sec-v5.2-job-ring' was expected
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec-v4.0.yaml#
   arch/arm64/boot/dts/freescale/imx8qxp-colibri-aster.dtb: crypto@31400000 (fsl,imx8qxp-caam): jr@40000: 'power-domains' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec-v4.0.yaml#
   arch/arm64/boot/dts/freescale/imx8qxp-colibri-aster.dtb: crypto@31400000 (fsl,imx8qxp-caam): jr@40000:compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,imx8qxp-job-ring', 'fsl,sec-v4.0-job-ring'] is too short
   	['fsl,imx8qxp-job-ring', 'fsl,sec-v4.0-job-ring'] is too long
   	'fsl,sec-v6.0-job-ring' was expected
   	'fsl,sec-v5.4-job-ring' was expected
   	'fsl,sec-v5.0-job-ring' was expected
   	'fsl,sec-v4.0-job-ring' was expected
   	'fsl,sec-v5.2-job-ring' was expected
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec-v4.0.yaml#
>> arch/arm64/boot/dts/freescale/imx8qxp-colibri-aster.dtb: crypto@31400000 (fsl,imx8qxp-caam): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,imx8qxp-caam', 'fsl,sec-v4.0'] is too short
   	['fsl,imx8qxp-caam', 'fsl,sec-v4.0'] is too long
   	'fsl,imx8qxp-caam' is not one of ['fsl,sec-v5.4', 'fsl,sec-v6.0']
   	'fsl,imx8qxp-caam' is not one of ['fsl,imx6ul-caam', 'fsl,sec-v5.0']
   	'fsl,sec-v4.0' was expected
   	'fsl,sec-v5.0' was expected
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec-v4.0.yaml#
>> arch/arm64/boot/dts/freescale/imx8qxp-colibri-aster.dtb: /bus@31400000/crypto@31400000: failed to match any schema with compatible: ['fsl,imx8qxp-caam', 'fsl,sec-v4.0']
>> arch/arm64/boot/dts/freescale/imx8qxp-colibri-aster.dtb: /bus@31400000/crypto@31400000/jr@30000: failed to match any schema with compatible: ['fsl,imx8qxp-job-ring', 'fsl,sec-v4.0-job-ring']
   arch/arm64/boot/dts/freescale/imx8qxp-colibri-aster.dtb: /bus@31400000/crypto@31400000/jr@40000: failed to match any schema with compatible: ['fsl,imx8qxp-job-ring', 'fsl,sec-v4.0-job-ring']
--
>> arch/arm64/boot/dts/freescale/imx8qxp-colibri-eval-v3.dtb: crypto@31400000 (fsl,imx8qxp-caam): 'power-domains' does not match any of the regexes: '^jr@[0-9a-f]+$', '^pinctrl-[0-9]+$', '^rtic@[0-9a-f]+$'
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec-v4.0.yaml#
>> arch/arm64/boot/dts/freescale/imx8qxp-colibri-eval-v3.dtb: crypto@31400000 (fsl,imx8qxp-caam): jr@30000: 'power-domains' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec-v4.0.yaml#
>> arch/arm64/boot/dts/freescale/imx8qxp-colibri-eval-v3.dtb: crypto@31400000 (fsl,imx8qxp-caam): jr@30000:compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,imx8qxp-job-ring', 'fsl,sec-v4.0-job-ring'] is too short
   	['fsl,imx8qxp-job-ring', 'fsl,sec-v4.0-job-ring'] is too long
   	'fsl,sec-v6.0-job-ring' was expected
   	'fsl,sec-v5.4-job-ring' was expected
   	'fsl,sec-v5.0-job-ring' was expected
   	'fsl,sec-v4.0-job-ring' was expected
   	'fsl,sec-v5.2-job-ring' was expected
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec-v4.0.yaml#
   arch/arm64/boot/dts/freescale/imx8qxp-colibri-eval-v3.dtb: crypto@31400000 (fsl,imx8qxp-caam): jr@40000: 'power-domains' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec-v4.0.yaml#
   arch/arm64/boot/dts/freescale/imx8qxp-colibri-eval-v3.dtb: crypto@31400000 (fsl,imx8qxp-caam): jr@40000:compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,imx8qxp-job-ring', 'fsl,sec-v4.0-job-ring'] is too short
   	['fsl,imx8qxp-job-ring', 'fsl,sec-v4.0-job-ring'] is too long
   	'fsl,sec-v6.0-job-ring' was expected
   	'fsl,sec-v5.4-job-ring' was expected
   	'fsl,sec-v5.0-job-ring' was expected
   	'fsl,sec-v4.0-job-ring' was expected
   	'fsl,sec-v5.2-job-ring' was expected
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec-v4.0.yaml#
>> arch/arm64/boot/dts/freescale/imx8qxp-colibri-eval-v3.dtb: crypto@31400000 (fsl,imx8qxp-caam): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,imx8qxp-caam', 'fsl,sec-v4.0'] is too short
   	['fsl,imx8qxp-caam', 'fsl,sec-v4.0'] is too long
   	'fsl,imx8qxp-caam' is not one of ['fsl,sec-v5.4', 'fsl,sec-v6.0']
   	'fsl,imx8qxp-caam' is not one of ['fsl,imx6ul-caam', 'fsl,sec-v5.0']
   	'fsl,sec-v4.0' was expected
   	'fsl,sec-v5.0' was expected
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec-v4.0.yaml#
>> arch/arm64/boot/dts/freescale/imx8qxp-colibri-eval-v3.dtb: /bus@31400000/crypto@31400000: failed to match any schema with compatible: ['fsl,imx8qxp-caam', 'fsl,sec-v4.0']
>> arch/arm64/boot/dts/freescale/imx8qxp-colibri-eval-v3.dtb: /bus@31400000/crypto@31400000/jr@30000: failed to match any schema with compatible: ['fsl,imx8qxp-job-ring', 'fsl,sec-v4.0-job-ring']
   arch/arm64/boot/dts/freescale/imx8qxp-colibri-eval-v3.dtb: /bus@31400000/crypto@31400000/jr@40000: failed to match any schema with compatible: ['fsl,imx8qxp-job-ring', 'fsl,sec-v4.0-job-ring']
--
>> arch/arm64/boot/dts/freescale/imx8qxp-colibri-iris.dtb: crypto@31400000 (fsl,imx8qxp-caam): 'power-domains' does not match any of the regexes: '^jr@[0-9a-f]+$', '^pinctrl-[0-9]+$', '^rtic@[0-9a-f]+$'
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec-v4.0.yaml#
>> arch/arm64/boot/dts/freescale/imx8qxp-colibri-iris.dtb: crypto@31400000 (fsl,imx8qxp-caam): jr@30000: 'power-domains' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec-v4.0.yaml#
>> arch/arm64/boot/dts/freescale/imx8qxp-colibri-iris.dtb: crypto@31400000 (fsl,imx8qxp-caam): jr@30000:compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,imx8qxp-job-ring', 'fsl,sec-v4.0-job-ring'] is too short
   	['fsl,imx8qxp-job-ring', 'fsl,sec-v4.0-job-ring'] is too long
   	'fsl,sec-v6.0-job-ring' was expected
   	'fsl,sec-v5.4-job-ring' was expected
   	'fsl,sec-v5.0-job-ring' was expected
   	'fsl,sec-v4.0-job-ring' was expected
   	'fsl,sec-v5.2-job-ring' was expected
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec-v4.0.yaml#
   arch/arm64/boot/dts/freescale/imx8qxp-colibri-iris.dtb: crypto@31400000 (fsl,imx8qxp-caam): jr@40000: 'power-domains' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec-v4.0.yaml#
   arch/arm64/boot/dts/freescale/imx8qxp-colibri-iris.dtb: crypto@31400000 (fsl,imx8qxp-caam): jr@40000:compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,imx8qxp-job-ring', 'fsl,sec-v4.0-job-ring'] is too short
   	['fsl,imx8qxp-job-ring', 'fsl,sec-v4.0-job-ring'] is too long
   	'fsl,sec-v6.0-job-ring' was expected
   	'fsl,sec-v5.4-job-ring' was expected
   	'fsl,sec-v5.0-job-ring' was expected
   	'fsl,sec-v4.0-job-ring' was expected
   	'fsl,sec-v5.2-job-ring' was expected
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec-v4.0.yaml#
>> arch/arm64/boot/dts/freescale/imx8qxp-colibri-iris.dtb: crypto@31400000 (fsl,imx8qxp-caam): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,imx8qxp-caam', 'fsl,sec-v4.0'] is too short
   	['fsl,imx8qxp-caam', 'fsl,sec-v4.0'] is too long
   	'fsl,imx8qxp-caam' is not one of ['fsl,sec-v5.4', 'fsl,sec-v6.0']
   	'fsl,imx8qxp-caam' is not one of ['fsl,imx6ul-caam', 'fsl,sec-v5.0']
   	'fsl,sec-v4.0' was expected
   	'fsl,sec-v5.0' was expected
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec-v4.0.yaml#
>> arch/arm64/boot/dts/freescale/imx8qxp-colibri-iris.dtb: /bus@31400000/crypto@31400000: failed to match any schema with compatible: ['fsl,imx8qxp-caam', 'fsl,sec-v4.0']
>> arch/arm64/boot/dts/freescale/imx8qxp-colibri-iris.dtb: /bus@31400000/crypto@31400000/jr@30000: failed to match any schema with compatible: ['fsl,imx8qxp-job-ring', 'fsl,sec-v4.0-job-ring']
   arch/arm64/boot/dts/freescale/imx8qxp-colibri-iris.dtb: /bus@31400000/crypto@31400000/jr@40000: failed to match any schema with compatible: ['fsl,imx8qxp-job-ring', 'fsl,sec-v4.0-job-ring']
--
>> arch/arm64/boot/dts/freescale/imx8qxp-colibri-iris-v2.dtb: crypto@31400000 (fsl,imx8qxp-caam): 'power-domains' does not match any of the regexes: '^jr@[0-9a-f]+$', '^pinctrl-[0-9]+$', '^rtic@[0-9a-f]+$'
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec-v4.0.yaml#
>> arch/arm64/boot/dts/freescale/imx8qxp-colibri-iris-v2.dtb: crypto@31400000 (fsl,imx8qxp-caam): jr@30000: 'power-domains' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec-v4.0.yaml#
>> arch/arm64/boot/dts/freescale/imx8qxp-colibri-iris-v2.dtb: crypto@31400000 (fsl,imx8qxp-caam): jr@30000:compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,imx8qxp-job-ring', 'fsl,sec-v4.0-job-ring'] is too short
   	['fsl,imx8qxp-job-ring', 'fsl,sec-v4.0-job-ring'] is too long
   	'fsl,sec-v6.0-job-ring' was expected
   	'fsl,sec-v5.4-job-ring' was expected
   	'fsl,sec-v5.0-job-ring' was expected
   	'fsl,sec-v4.0-job-ring' was expected
   	'fsl,sec-v5.2-job-ring' was expected
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec-v4.0.yaml#
   arch/arm64/boot/dts/freescale/imx8qxp-colibri-iris-v2.dtb: crypto@31400000 (fsl,imx8qxp-caam): jr@40000: 'power-domains' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec-v4.0.yaml#
   arch/arm64/boot/dts/freescale/imx8qxp-colibri-iris-v2.dtb: crypto@31400000 (fsl,imx8qxp-caam): jr@40000:compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,imx8qxp-job-ring', 'fsl,sec-v4.0-job-ring'] is too short
   	['fsl,imx8qxp-job-ring', 'fsl,sec-v4.0-job-ring'] is too long
   	'fsl,sec-v6.0-job-ring' was expected
   	'fsl,sec-v5.4-job-ring' was expected
   	'fsl,sec-v5.0-job-ring' was expected
   	'fsl,sec-v4.0-job-ring' was expected
   	'fsl,sec-v5.2-job-ring' was expected
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec-v4.0.yaml#
>> arch/arm64/boot/dts/freescale/imx8qxp-colibri-iris-v2.dtb: crypto@31400000 (fsl,imx8qxp-caam): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,imx8qxp-caam', 'fsl,sec-v4.0'] is too short
   	['fsl,imx8qxp-caam', 'fsl,sec-v4.0'] is too long
   	'fsl,imx8qxp-caam' is not one of ['fsl,sec-v5.4', 'fsl,sec-v6.0']
   	'fsl,imx8qxp-caam' is not one of ['fsl,imx6ul-caam', 'fsl,sec-v5.0']
   	'fsl,sec-v4.0' was expected
   	'fsl,sec-v5.0' was expected
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec-v4.0.yaml#
>> arch/arm64/boot/dts/freescale/imx8qxp-colibri-iris-v2.dtb: /bus@31400000/crypto@31400000: failed to match any schema with compatible: ['fsl,imx8qxp-caam', 'fsl,sec-v4.0']
>> arch/arm64/boot/dts/freescale/imx8qxp-colibri-iris-v2.dtb: /bus@31400000/crypto@31400000/jr@30000: failed to match any schema with compatible: ['fsl,imx8qxp-job-ring', 'fsl,sec-v4.0-job-ring']
   arch/arm64/boot/dts/freescale/imx8qxp-colibri-iris-v2.dtb: /bus@31400000/crypto@31400000/jr@40000: failed to match any schema with compatible: ['fsl,imx8qxp-job-ring', 'fsl,sec-v4.0-job-ring']
--
>> arch/arm64/boot/dts/freescale/imx8qxp-mek.dtb: crypto@31400000 (fsl,imx8qxp-caam): 'power-domains' does not match any of the regexes: '^jr@[0-9a-f]+$', '^pinctrl-[0-9]+$', '^rtic@[0-9a-f]+$'
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec-v4.0.yaml#
>> arch/arm64/boot/dts/freescale/imx8qxp-mek.dtb: crypto@31400000 (fsl,imx8qxp-caam): jr@30000: 'power-domains' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec-v4.0.yaml#
>> arch/arm64/boot/dts/freescale/imx8qxp-mek.dtb: crypto@31400000 (fsl,imx8qxp-caam): jr@30000:compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,imx8qxp-job-ring', 'fsl,sec-v4.0-job-ring'] is too short
   	['fsl,imx8qxp-job-ring', 'fsl,sec-v4.0-job-ring'] is too long
   	'fsl,sec-v6.0-job-ring' was expected
   	'fsl,sec-v5.4-job-ring' was expected
   	'fsl,sec-v5.0-job-ring' was expected
   	'fsl,sec-v4.0-job-ring' was expected
   	'fsl,sec-v5.2-job-ring' was expected
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec-v4.0.yaml#
   arch/arm64/boot/dts/freescale/imx8qxp-mek.dtb: crypto@31400000 (fsl,imx8qxp-caam): jr@40000: 'power-domains' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec-v4.0.yaml#
   arch/arm64/boot/dts/freescale/imx8qxp-mek.dtb: crypto@31400000 (fsl,imx8qxp-caam): jr@40000:compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,imx8qxp-job-ring', 'fsl,sec-v4.0-job-ring'] is too short
   	['fsl,imx8qxp-job-ring', 'fsl,sec-v4.0-job-ring'] is too long
   	'fsl,sec-v6.0-job-ring' was expected
   	'fsl,sec-v5.4-job-ring' was expected
   	'fsl,sec-v5.0-job-ring' was expected
   	'fsl,sec-v4.0-job-ring' was expected
   	'fsl,sec-v5.2-job-ring' was expected
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec-v4.0.yaml#
>> arch/arm64/boot/dts/freescale/imx8qxp-mek.dtb: crypto@31400000 (fsl,imx8qxp-caam): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,imx8qxp-caam', 'fsl,sec-v4.0'] is too short
   	['fsl,imx8qxp-caam', 'fsl,sec-v4.0'] is too long
   	'fsl,imx8qxp-caam' is not one of ['fsl,sec-v5.4', 'fsl,sec-v6.0']
   	'fsl,imx8qxp-caam' is not one of ['fsl,imx6ul-caam', 'fsl,sec-v5.0']
   	'fsl,sec-v4.0' was expected
   	'fsl,sec-v5.0' was expected
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec-v4.0.yaml#
>> arch/arm64/boot/dts/freescale/imx8qxp-mek.dtb: /bus@31400000/crypto@31400000: failed to match any schema with compatible: ['fsl,imx8qxp-caam', 'fsl,sec-v4.0']
>> arch/arm64/boot/dts/freescale/imx8qxp-mek.dtb: /bus@31400000/crypto@31400000/jr@30000: failed to match any schema with compatible: ['fsl,imx8qxp-job-ring', 'fsl,sec-v4.0-job-ring']
   arch/arm64/boot/dts/freescale/imx8qxp-mek.dtb: /bus@31400000/crypto@31400000/jr@40000: failed to match any schema with compatible: ['fsl,imx8qxp-job-ring', 'fsl,sec-v4.0-job-ring']
--
>> arch/arm64/boot/dts/freescale/imx8qxp-tqma8xqp-mba8xx.dtb: crypto@31400000 (fsl,imx8qxp-caam): 'power-domains' does not match any of the regexes: '^jr@[0-9a-f]+$', '^pinctrl-[0-9]+$', '^rtic@[0-9a-f]+$'
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec-v4.0.yaml#
>> arch/arm64/boot/dts/freescale/imx8qxp-tqma8xqp-mba8xx.dtb: crypto@31400000 (fsl,imx8qxp-caam): jr@30000: 'power-domains' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec-v4.0.yaml#
>> arch/arm64/boot/dts/freescale/imx8qxp-tqma8xqp-mba8xx.dtb: crypto@31400000 (fsl,imx8qxp-caam): jr@30000:compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,imx8qxp-job-ring', 'fsl,sec-v4.0-job-ring'] is too short
   	['fsl,imx8qxp-job-ring', 'fsl,sec-v4.0-job-ring'] is too long
   	'fsl,sec-v6.0-job-ring' was expected
   	'fsl,sec-v5.4-job-ring' was expected
   	'fsl,sec-v5.0-job-ring' was expected
   	'fsl,sec-v4.0-job-ring' was expected
   	'fsl,sec-v5.2-job-ring' was expected
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec-v4.0.yaml#
   arch/arm64/boot/dts/freescale/imx8qxp-tqma8xqp-mba8xx.dtb: crypto@31400000 (fsl,imx8qxp-caam): jr@40000: 'power-domains' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec-v4.0.yaml#
   arch/arm64/boot/dts/freescale/imx8qxp-tqma8xqp-mba8xx.dtb: crypto@31400000 (fsl,imx8qxp-caam): jr@40000:compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,imx8qxp-job-ring', 'fsl,sec-v4.0-job-ring'] is too short
   	['fsl,imx8qxp-job-ring', 'fsl,sec-v4.0-job-ring'] is too long
   	'fsl,sec-v6.0-job-ring' was expected
   	'fsl,sec-v5.4-job-ring' was expected
   	'fsl,sec-v5.0-job-ring' was expected
   	'fsl,sec-v4.0-job-ring' was expected
   	'fsl,sec-v5.2-job-ring' was expected
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec-v4.0.yaml#
>> arch/arm64/boot/dts/freescale/imx8qxp-tqma8xqp-mba8xx.dtb: crypto@31400000 (fsl,imx8qxp-caam): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,imx8qxp-caam', 'fsl,sec-v4.0'] is too short
   	['fsl,imx8qxp-caam', 'fsl,sec-v4.0'] is too long
   	'fsl,imx8qxp-caam' is not one of ['fsl,sec-v5.4', 'fsl,sec-v6.0']
   	'fsl,imx8qxp-caam' is not one of ['fsl,imx6ul-caam', 'fsl,sec-v5.0']
   	'fsl,sec-v4.0' was expected
   	'fsl,sec-v5.0' was expected
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec-v4.0.yaml#
>> arch/arm64/boot/dts/freescale/imx8qxp-tqma8xqp-mba8xx.dtb: /bus@31400000/crypto@31400000: failed to match any schema with compatible: ['fsl,imx8qxp-caam', 'fsl,sec-v4.0']
>> arch/arm64/boot/dts/freescale/imx8qxp-tqma8xqp-mba8xx.dtb: /bus@31400000/crypto@31400000/jr@30000: failed to match any schema with compatible: ['fsl,imx8qxp-job-ring', 'fsl,sec-v4.0-job-ring']
   arch/arm64/boot/dts/freescale/imx8qxp-tqma8xqp-mba8xx.dtb: /bus@31400000/crypto@31400000/jr@40000: failed to match any schema with compatible: ['fsl,imx8qxp-job-ring', 'fsl,sec-v4.0-job-ring']
--
>> arch/arm64/boot/dts/freescale/imx8qxp-tqma8xqps-mb-smarc-2.dtb: crypto@31400000 (fsl,imx8qxp-caam): 'power-domains' does not match any of the regexes: '^jr@[0-9a-f]+$', '^pinctrl-[0-9]+$', '^rtic@[0-9a-f]+$'
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec-v4.0.yaml#
>> arch/arm64/boot/dts/freescale/imx8qxp-tqma8xqps-mb-smarc-2.dtb: crypto@31400000 (fsl,imx8qxp-caam): jr@30000: 'power-domains' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec-v4.0.yaml#
>> arch/arm64/boot/dts/freescale/imx8qxp-tqma8xqps-mb-smarc-2.dtb: crypto@31400000 (fsl,imx8qxp-caam): jr@30000:compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,imx8qxp-job-ring', 'fsl,sec-v4.0-job-ring'] is too short
   	['fsl,imx8qxp-job-ring', 'fsl,sec-v4.0-job-ring'] is too long
   	'fsl,sec-v6.0-job-ring' was expected
   	'fsl,sec-v5.4-job-ring' was expected
   	'fsl,sec-v5.0-job-ring' was expected
   	'fsl,sec-v4.0-job-ring' was expected
   	'fsl,sec-v5.2-job-ring' was expected
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec-v4.0.yaml#
   arch/arm64/boot/dts/freescale/imx8qxp-tqma8xqps-mb-smarc-2.dtb: crypto@31400000 (fsl,imx8qxp-caam): jr@40000: 'power-domains' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec-v4.0.yaml#
   arch/arm64/boot/dts/freescale/imx8qxp-tqma8xqps-mb-smarc-2.dtb: crypto@31400000 (fsl,imx8qxp-caam): jr@40000:compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,imx8qxp-job-ring', 'fsl,sec-v4.0-job-ring'] is too short
   	['fsl,imx8qxp-job-ring', 'fsl,sec-v4.0-job-ring'] is too long
   	'fsl,sec-v6.0-job-ring' was expected
   	'fsl,sec-v5.4-job-ring' was expected
   	'fsl,sec-v5.0-job-ring' was expected
   	'fsl,sec-v4.0-job-ring' was expected
   	'fsl,sec-v5.2-job-ring' was expected
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec-v4.0.yaml#
>> arch/arm64/boot/dts/freescale/imx8qxp-tqma8xqps-mb-smarc-2.dtb: crypto@31400000 (fsl,imx8qxp-caam): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,imx8qxp-caam', 'fsl,sec-v4.0'] is too short
   	['fsl,imx8qxp-caam', 'fsl,sec-v4.0'] is too long
   	'fsl,imx8qxp-caam' is not one of ['fsl,sec-v5.4', 'fsl,sec-v6.0']
   	'fsl,imx8qxp-caam' is not one of ['fsl,imx6ul-caam', 'fsl,sec-v5.0']
   	'fsl,sec-v4.0' was expected
   	'fsl,sec-v5.0' was expected
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec-v4.0.yaml#
>> arch/arm64/boot/dts/freescale/imx8qxp-tqma8xqps-mb-smarc-2.dtb: /bus@31400000/crypto@31400000: failed to match any schema with compatible: ['fsl,imx8qxp-caam', 'fsl,sec-v4.0']
>> arch/arm64/boot/dts/freescale/imx8qxp-tqma8xqps-mb-smarc-2.dtb: /bus@31400000/crypto@31400000/jr@30000: failed to match any schema with compatible: ['fsl,imx8qxp-job-ring', 'fsl,sec-v4.0-job-ring']
   arch/arm64/boot/dts/freescale/imx8qxp-tqma8xqps-mb-smarc-2.dtb: /bus@31400000/crypto@31400000/jr@40000: failed to match any schema with compatible: ['fsl,imx8qxp-job-ring', 'fsl,sec-v4.0-job-ring']
--
>> arch/arm64/boot/dts/freescale/imx8qxp-mek-pcie-ep.dtb: crypto@31400000 (fsl,imx8qxp-caam): 'power-domains' does not match any of the regexes: '^jr@[0-9a-f]+$', '^pinctrl-[0-9]+$', '^rtic@[0-9a-f]+$'
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec-v4.0.yaml#
>> arch/arm64/boot/dts/freescale/imx8qxp-mek-pcie-ep.dtb: crypto@31400000 (fsl,imx8qxp-caam): jr@30000: 'power-domains' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec-v4.0.yaml#
>> arch/arm64/boot/dts/freescale/imx8qxp-mek-pcie-ep.dtb: crypto@31400000 (fsl,imx8qxp-caam): jr@30000:compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,imx8qxp-job-ring', 'fsl,sec-v4.0-job-ring'] is too short
   	['fsl,imx8qxp-job-ring', 'fsl,sec-v4.0-job-ring'] is too long
   	'fsl,sec-v6.0-job-ring' was expected
   	'fsl,sec-v5.4-job-ring' was expected
   	'fsl,sec-v5.0-job-ring' was expected
   	'fsl,sec-v4.0-job-ring' was expected
   	'fsl,sec-v5.2-job-ring' was expected
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec-v4.0.yaml#
   arch/arm64/boot/dts/freescale/imx8qxp-mek-pcie-ep.dtb: crypto@31400000 (fsl,imx8qxp-caam): jr@40000: 'power-domains' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec-v4.0.yaml#
   arch/arm64/boot/dts/freescale/imx8qxp-mek-pcie-ep.dtb: crypto@31400000 (fsl,imx8qxp-caam): jr@40000:compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,imx8qxp-job-ring', 'fsl,sec-v4.0-job-ring'] is too short
   	['fsl,imx8qxp-job-ring', 'fsl,sec-v4.0-job-ring'] is too long
   	'fsl,sec-v6.0-job-ring' was expected
   	'fsl,sec-v5.4-job-ring' was expected
   	'fsl,sec-v5.0-job-ring' was expected
   	'fsl,sec-v4.0-job-ring' was expected
   	'fsl,sec-v5.2-job-ring' was expected
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec-v4.0.yaml#
>> arch/arm64/boot/dts/freescale/imx8qxp-mek-pcie-ep.dtb: crypto@31400000 (fsl,imx8qxp-caam): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,imx8qxp-caam', 'fsl,sec-v4.0'] is too short
   	['fsl,imx8qxp-caam', 'fsl,sec-v4.0'] is too long
   	'fsl,imx8qxp-caam' is not one of ['fsl,sec-v5.4', 'fsl,sec-v6.0']
   	'fsl,imx8qxp-caam' is not one of ['fsl,imx6ul-caam', 'fsl,sec-v5.0']
   	'fsl,sec-v4.0' was expected
   	'fsl,sec-v5.0' was expected
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec-v4.0.yaml#
>> arch/arm64/boot/dts/freescale/imx8qxp-mek-pcie-ep.dtb: /bus@31400000/crypto@31400000: failed to match any schema with compatible: ['fsl,imx8qxp-caam', 'fsl,sec-v4.0']
>> arch/arm64/boot/dts/freescale/imx8qxp-mek-pcie-ep.dtb: /bus@31400000/crypto@31400000/jr@30000: failed to match any schema with compatible: ['fsl,imx8qxp-job-ring', 'fsl,sec-v4.0-job-ring']
   arch/arm64/boot/dts/freescale/imx8qxp-mek-pcie-ep.dtb: /bus@31400000/crypto@31400000/jr@40000: failed to match any schema with compatible: ['fsl,imx8qxp-job-ring', 'fsl,sec-v4.0-job-ring']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
