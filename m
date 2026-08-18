Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3783D25B0B6
	for <oe-kbuild@lists.linux.dev>; Tue, 18 Aug 2026 06:47:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787035670; cv=none; b=IpVBPqSnxDB2Jd3b6nA//0ieIBc1TVvp4lkMAk9m5DFpnhQcOiAltrNsdIAhUlGTKtjAdWtROjUkrHtnZv4dqf4QurVocpmsz6BSasxfX+KyHWkO2H9y4ao4xH5NMIKDTcHgqekXdd4XTGzsjKR59gk1JKXlsD4jrOac99gfzug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787035670; c=relaxed/simple;
	bh=ywUuNnOAaQov75DdF/JwRtEHoAb5eqkf5FwTzCagshk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=biN/UjwZNUKzOa3rrFtZLgX5psRLdFJwq0dSCjtAv/Z9K3mcR6WgtzFlcz6MKfjggoVeFL/XRfKoTNEmC4sajNZzMoVXvBtNlLqsJWuQ7wZL10BuTnlFFPCaCM2rwH0bAEduFFpjqqq0Gbe7lRzwK4Z6NrnzzqKt8rDG1o/1F8g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kHzd3lF0; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kHzd3lF0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787035668; x=1818571668;
  h=date:from:to:cc:subject:message-id;
  bh=ywUuNnOAaQov75DdF/JwRtEHoAb5eqkf5FwTzCagshk=;
  b=kHzd3lF01VGrDHt3X3jqde9ZrAHvN28sMI47VYRXGeJea6A3eSlWziI+
   5dDHn6VfJCloHN1f/44uXhQKM9ANtMowbOViyxbB4Tx9WGDpDZmfl1k8z
   ZcyzBs5BJEsRf4omeyL0UhiTTZP1UIP1BPfWjm+5LweydOUDv1xSGv/NX
   hzSZsPwudYMDthmtDramiTUFmyvB2uAygs5S0CMD2FX7gcJwIPY+UX3Yn
   4ILHx5F8wBYob5/i9MdrFt7FqDLpzFUwyp7lTBg/qFJCr7HBytJCkX6XJ
   aCEWofvNQZF4lMAuRuW93pFplLyV4EzY88eaQ0R2TXhrrvChPgU5KyjjW
   A==;
X-CSE-ConnectionGUID: J7YKGGyeTMC5uPbw9C1Lbg==
X-CSE-MsgGUID: 3OfPSEVNRSmTmCsWxURc7Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11878"; a="104901065"
X-IronPort-AV: E=Sophos;i="6.25,230,1779174000"; 
   d="scan'208";a="104901065"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Aug 2026 23:47:48 -0700
X-CSE-ConnectionGUID: Jauz0E1ITLy1cTXw6kGc3A==
X-CSE-MsgGUID: YatIVDClSTW7jchUNzKwOg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,230,1779174000"; 
   d="scan'208";a="264696260"
Received: from igk-lkp-server01.igk.intel.com (HELO 3cba2a188a06) ([10.211.93.152])
  by orviesa008.jf.intel.com with ESMTP; 17 Aug 2026 23:47:47 -0700
Received: from kbuild by 3cba2a188a06 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wwDbs-0000000073V-1dRd;
	Tue, 18 Aug 2026 06:47:44 +0000
Date: Tue, 18 Aug 2026 08:47:28 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: 
 arch/arm64/boot/dts/freescale/imx95-verdin-nonwifi-mallow.dtb: opp-500000000:
 opp-hz-real: b'\x00\x00\x00\x00\x1d\xcde\x00' is not of type 'object',
 'integer', 'array', 'boolean', 'null'
Message-ID: <202608180813.qmgWW8Ez-lkp@intel.com>
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
head:   0f23d56f17fdfc7db69d51f64c8b91bbab947aa9
commit: 2f71fba0a082df525037473568743f1e5454107b arm64: dts: freescale: imx95-verdin: Add Mallow carrier board
date:   5 months ago
:::::: branch date: 3 hours ago
:::::: commit date: 5 months ago
config: arm64-randconfig-2054-20260813 (https://download.01.org/0day-ci/archive/20260818/202608180813.qmgWW8Ez-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.3.0
dtschema: 2026.7.dev15+g01b5073ab
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260818/202608180813.qmgWW8Ez-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 2f71fba0a082 ("arm64: dts: freescale: imx95-verdin: Add Mallow carrier board")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202608180813.qmgWW8Ez-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   	'ifm,imx8mn-vhip4' was expected
   	'avnet,sm2s-imx8mp' was expected
   	'toradex,verdin-imx8mp' was expected
   	'toradex,verdin-imx95' is not one of ['fsl,imx8qm', 'fsl,imx8qp']
   	'toradex,verdin-imx95' is not one of ['fsl,imx8qxp', 'fsl,imx8dx']
   	'fsl,vf500' was expected
   	from schema $id: http://devicetree.org/schemas/arm/fsl.yaml
   arch/arm64/boot/dts/freescale/imx95-verdin-nonwifi-mallow.dtb: /: failed to match any schema with compatible: ['toradex,verdin-imx95-nonwifi-mallow', 'toradex,verdin-imx95-nonwifi', 'toradex,verdin-imx95', 'fsl,imx95']
   arch/arm64/boot/dts/freescale/imx95-verdin-nonwifi-mallow.dtb: /: failed to match any schema with compatible: ['toradex,verdin-imx95-nonwifi-mallow', 'toradex,verdin-imx95-nonwifi', 'toradex,verdin-imx95', 'fsl,imx95']
   arch/arm64/boot/dts/freescale/imx95-verdin-nonwifi-mallow.dtb: /: failed to match any schema with compatible: ['toradex,verdin-imx95-nonwifi-mallow', 'toradex,verdin-imx95-nonwifi', 'toradex,verdin-imx95', 'fsl,imx95']
>> arch/arm64/boot/dts/freescale/imx95-verdin-nonwifi-mallow.dtb: opp-500000000: opp-hz-real: b'\x00\x00\x00\x00\x1d\xcde\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
>> arch/arm64/boot/dts/freescale/imx95-verdin-nonwifi-mallow.dtb: opp-800000000: opp-hz-real: b'\x00\x00\x00\x00/\xaf\x08\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
>> arch/arm64/boot/dts/freescale/imx95-verdin-nonwifi-mallow.dtb: opp-1000000000: opp-hz-real: b'\x00\x00\x00\x00;\x9a\xca\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
--
   	'ifm,imx8mn-vhip4' was expected
   	'avnet,sm2s-imx8mp' was expected
   	'toradex,verdin-imx8mp' was expected
   	'toradex,verdin-imx95' is not one of ['fsl,imx8qm', 'fsl,imx8qp']
   	'toradex,verdin-imx95' is not one of ['fsl,imx8qxp', 'fsl,imx8dx']
   	'fsl,vf500' was expected
   	from schema $id: http://devicetree.org/schemas/arm/fsl.yaml
   arch/arm64/boot/dts/freescale/imx95-verdin-wifi-mallow.dtb: /: failed to match any schema with compatible: ['toradex,verdin-imx95-wifi-mallow', 'toradex,verdin-imx95-wifi', 'toradex,verdin-imx95', 'fsl,imx95']
   arch/arm64/boot/dts/freescale/imx95-verdin-wifi-mallow.dtb: /: failed to match any schema with compatible: ['toradex,verdin-imx95-wifi-mallow', 'toradex,verdin-imx95-wifi', 'toradex,verdin-imx95', 'fsl,imx95']
   arch/arm64/boot/dts/freescale/imx95-verdin-wifi-mallow.dtb: /: failed to match any schema with compatible: ['toradex,verdin-imx95-wifi-mallow', 'toradex,verdin-imx95-wifi', 'toradex,verdin-imx95', 'fsl,imx95']
>> arch/arm64/boot/dts/freescale/imx95-verdin-wifi-mallow.dtb: opp-500000000: opp-hz-real: b'\x00\x00\x00\x00\x1d\xcde\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
>> arch/arm64/boot/dts/freescale/imx95-verdin-wifi-mallow.dtb: opp-800000000: opp-hz-real: b'\x00\x00\x00\x00/\xaf\x08\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
>> arch/arm64/boot/dts/freescale/imx95-verdin-wifi-mallow.dtb: opp-1000000000: opp-hz-real: b'\x00\x00\x00\x00;\x9a\xca\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
