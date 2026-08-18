Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EBB31F4611
	for <oe-kbuild@lists.linux.dev>; Tue, 18 Aug 2026 03:34:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787024089; cv=none; b=mcVuV0fdRHJTzQLRy823hPbJcZXhAwbwq/uMXGCNJcJiooYOARdqsgCiAexU1j0PHAV/3+6PFbjaUETpuG3L+SS3Jfp94eQFuwkhCWw9uRv2Dzg6Ssk/sDIrxnLTQvOVnfQGuewhPR2ZDxU4pHioWoQAN2HE6AKGxkw1X6wPNYc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787024089; c=relaxed/simple;
	bh=4t/VCRSE7o2jspAqFl+34cajh5/mX7tnRhsEH5cVQYk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=P0RRyERRfsFfC3p8jQ9jbwiQejBdghJeLME9yhN/WULZ2rrdA7+J9IJjgriBYIxa4JwGyASGcv6UkAE+Be8Zh46UlpXBpKuXp0nD7mzqGht+jyTWb8pWzdmffxtBbIbQ764U5Rarl2ZNP9gW9ioeepaBPEb7Z7vPdfxIr4Mk5pU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dnKzdzZM; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dnKzdzZM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787024088; x=1818560088;
  h=date:from:to:cc:subject:message-id;
  bh=4t/VCRSE7o2jspAqFl+34cajh5/mX7tnRhsEH5cVQYk=;
  b=dnKzdzZMs2sZC6YywfhjzVlGDKfIev8fbVhzDadu16HWyQOvdJN0K3H4
   t4FSgg8g6ECRkZ38eyovzpMQI0Apx4wlycS3Q//aZePrN7n8Q2YTNwLfM
   y2dWG3OSVU3O5UeVT0700CR35AWG7VzgcLOw0b1W+nkSNcf7G2szDmdi+
   aSiEb1/3sIPs3JRf2KiKon/JA8EiN+2zkG+9akGK10QdzXvc7DJRULnX3
   mS5ZcWZzuJdrt2pa3yQu8PsoY8gW37tjzZF5ztSxCf9Amw1/AtxPGbpaN
   vqboSvk0rb+ogeQOX48JXNSTWK0iqCJ4SqdAAh1Awc8L9FutV5fCNfFkr
   A==;
X-CSE-ConnectionGUID: Y0PI/z3TTjymzDUfTWUvmg==
X-CSE-MsgGUID: GjLLP7raQGWW+2Gqghl0Aw==
X-IronPort-AV: E=McAfee;i="6800,10657,11878"; a="87714229"
X-IronPort-AV: E=Sophos;i="6.25,230,1779174000"; 
   d="scan'208";a="87714229"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Aug 2026 20:34:47 -0700
X-CSE-ConnectionGUID: LOfF/ffRSEqsuCXQSj6HNQ==
X-CSE-MsgGUID: RITN4cxxTIuC/HAstPyGFw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,230,1779174000"; 
   d="scan'208";a="261818781"
Received: from igk-lkp-server01.igk.intel.com (HELO 3cba2a188a06) ([10.211.93.152])
  by fmviesa007.fm.intel.com with ESMTP; 17 Aug 2026 20:34:45 -0700
Received: from kbuild by 3cba2a188a06 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wwAb5-0000000072T-1i8u;
	Tue, 18 Aug 2026 03:34:43 +0000
Date: Tue, 18 Aug 2026 05:34:09 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: arch/arm64/boot/dts/freescale/imx95-verdin-nonwifi-ivy.dtb:
 opp-500000000: opp-hz-real: b'\x00\x00\x00\x00\x1d\xcde\x00' is not of type
 'object', 'integer', 'array', 'boolean', 'null'
Message-ID: <202608180545.Cbiv3Asy-lkp@intel.com>
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

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   ff68e5f557f69a08fdcfa4ce8b1b809d63bd4f45
commit: f33a1f9a942cba6c7454c5c2290395961a986f6f arm64: dts: freescale: imx95-verdin: Add Ivy carrier board
date:   5 months ago
:::::: branch date: 6 hours ago
:::::: commit date: 5 months ago
config: arm64-randconfig-2054-20260813 (https://download.01.org/0day-ci/archive/20260818/202608180545.Cbiv3Asy-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.3.0
dtschema: 2026.7.dev15+g01b5073ab
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260818/202608180545.Cbiv3Asy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: f33a1f9a942c ("arm64: dts: freescale: imx95-verdin: Add Ivy carrier board")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202608180545.Cbiv3Asy-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   	'ifm,imx8mn-vhip4' was expected
   	'avnet,sm2s-imx8mp' was expected
   	'toradex,verdin-imx8mp' was expected
   	'toradex,verdin-imx95' is not one of ['fsl,imx8qm', 'fsl,imx8qp']
   	'toradex,verdin-imx95' is not one of ['fsl,imx8qxp', 'fsl,imx8dx']
   	'fsl,vf500' was expected
   	from schema $id: http://devicetree.org/schemas/arm/fsl.yaml
   arch/arm64/boot/dts/freescale/imx95-verdin-nonwifi-ivy.dtb: /: failed to match any schema with compatible: ['toradex,verdin-imx95-nonwifi-ivy', 'toradex,verdin-imx95-nonwifi', 'toradex,verdin-imx95', 'fsl,imx95']
   arch/arm64/boot/dts/freescale/imx95-verdin-nonwifi-ivy.dtb: /: failed to match any schema with compatible: ['toradex,verdin-imx95-nonwifi-ivy', 'toradex,verdin-imx95-nonwifi', 'toradex,verdin-imx95', 'fsl,imx95']
   arch/arm64/boot/dts/freescale/imx95-verdin-nonwifi-ivy.dtb: /: failed to match any schema with compatible: ['toradex,verdin-imx95-nonwifi-ivy', 'toradex,verdin-imx95-nonwifi', 'toradex,verdin-imx95', 'fsl,imx95']
>> arch/arm64/boot/dts/freescale/imx95-verdin-nonwifi-ivy.dtb: opp-500000000: opp-hz-real: b'\x00\x00\x00\x00\x1d\xcde\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
>> arch/arm64/boot/dts/freescale/imx95-verdin-nonwifi-ivy.dtb: opp-800000000: opp-hz-real: b'\x00\x00\x00\x00/\xaf\x08\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
>> arch/arm64/boot/dts/freescale/imx95-verdin-nonwifi-ivy.dtb: opp-1000000000: opp-hz-real: b'\x00\x00\x00\x00;\x9a\xca\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
--
   	'ifm,imx8mn-vhip4' was expected
   	'avnet,sm2s-imx8mp' was expected
   	'toradex,verdin-imx8mp' was expected
   	'toradex,verdin-imx95' is not one of ['fsl,imx8qm', 'fsl,imx8qp']
   	'toradex,verdin-imx95' is not one of ['fsl,imx8qxp', 'fsl,imx8dx']
   	'fsl,vf500' was expected
   	from schema $id: http://devicetree.org/schemas/arm/fsl.yaml
   arch/arm64/boot/dts/freescale/imx95-verdin-wifi-ivy.dtb: /: failed to match any schema with compatible: ['toradex,verdin-imx95-wifi-ivy', 'toradex,verdin-imx95-wifi', 'toradex,verdin-imx95', 'fsl,imx95']
   arch/arm64/boot/dts/freescale/imx95-verdin-wifi-ivy.dtb: /: failed to match any schema with compatible: ['toradex,verdin-imx95-wifi-ivy', 'toradex,verdin-imx95-wifi', 'toradex,verdin-imx95', 'fsl,imx95']
   arch/arm64/boot/dts/freescale/imx95-verdin-wifi-ivy.dtb: /: failed to match any schema with compatible: ['toradex,verdin-imx95-wifi-ivy', 'toradex,verdin-imx95-wifi', 'toradex,verdin-imx95', 'fsl,imx95']
>> arch/arm64/boot/dts/freescale/imx95-verdin-wifi-ivy.dtb: opp-500000000: opp-hz-real: b'\x00\x00\x00\x00\x1d\xcde\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
>> arch/arm64/boot/dts/freescale/imx95-verdin-wifi-ivy.dtb: opp-800000000: opp-hz-real: b'\x00\x00\x00\x00/\xaf\x08\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
>> arch/arm64/boot/dts/freescale/imx95-verdin-wifi-ivy.dtb: opp-1000000000: opp-hz-real: b'\x00\x00\x00\x00;\x9a\xca\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
