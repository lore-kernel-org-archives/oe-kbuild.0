Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74EFE1ADFE4
	for <oe-kbuild@lists.linux.dev>; Sun, 16 Aug 2026 13:28:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786886902; cv=none; b=aCo8E+PyogvsuUOFhMCwuHSfgfOJ6BdC6vTpbJOr8xI0z9B4tgMOZf/PEEPUy5sJHUD8bYx7bNJi6dxX1d6pGzlxJ5nxObSMxMAMltz4nUpwBTSweTN+rqw1tXjW/+7miu4phosUD88ar1eJLwkOxihI+0V3W1lXc8e+b6Irhtg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786886902; c=relaxed/simple;
	bh=bUy1s2oNoIVjrEc1gwzfMb5wfJ9paCHXMpxKucNGi10=;
	h=Date:From:To:Cc:Subject:Message-ID; b=S+9XBkFK/4nMJVa5NyIvC2K6cbeIxoCnEjHgQgcgWL+1AkL5tlMevnz86xgldOPyO2dEHR07Z+iCnsORBPCGk3dgn1Q6mO6Ocl8XI0k6PDYsOOdhJ6vfxqzy7851h/dsrhSO9z9eEKQmaTLuwvYBcDsihtEblF+wZL0eVZLVu7Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Wa25pSWE; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Wa25pSWE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786886901; x=1818422901;
  h=date:from:to:cc:subject:message-id;
  bh=bUy1s2oNoIVjrEc1gwzfMb5wfJ9paCHXMpxKucNGi10=;
  b=Wa25pSWEhgOZq6ftcm1Zw9lqmD3hXiPEUJ7HRQNr2lOhN+lm28Jqgw6H
   Qivhb+QCzNw5LU8sArULDHBN2vYRssC0HJ7qwlsIV5nzAmamLm6wLuEJD
   ARFEDSffKvjXVrpRxxcdyfUlVYxC4OOTXhnlzQN46AlZE1IhPvtYiFE1x
   LW3UI5FxOMSPJj1nXkeJ1muVSLR17zY+T5jNS+cwGce9ALoYaHLAcssOJ
   kDRJqZ3W+UZva0epeQ8Cx+6ZBT0Nfa4O01741/tZ4995cYyHJiwboH5/x
   uJv7uV2GE64N9u9yWcpcIZ67S5gKWVzaQxuylunEaM0DZSH8JT5THSGCR
   Q==;
X-CSE-ConnectionGUID: JKYmUyy2SiCcBIHA8ceYyA==
X-CSE-MsgGUID: 2tsubrcyQIanfl0e7J2DNQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11876"; a="91256560"
X-IronPort-AV: E=Sophos;i="6.25,227,1779174000"; 
   d="scan'208";a="91256560"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Aug 2026 06:28:20 -0700
X-CSE-ConnectionGUID: HyYXhjxOSmCWI0xH8OAvBg==
X-CSE-MsgGUID: mVvX7eu3Qhq/a8M4/TPnwg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,227,1779174000"; 
   d="scan'208";a="265281185"
Received: from igk-lkp-server01.igk.intel.com (HELO 3cba2a188a06) ([10.211.93.152])
  by orviesa009.jf.intel.com with ESMTP; 16 Aug 2026 06:28:20 -0700
Received: from kbuild by 3cba2a188a06 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wvauO-000000006am-49ev;
	Sun, 16 Aug 2026 13:28:16 +0000
Date: Sun, 16 Aug 2026 15:27:49 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: arch/arm64/boot/dts/freescale/imx95-15x15-frdm-rpmsg.dtb:
 opp-500000000: opp-hz-real: b'\x00\x00\x00\x00\x1d\xcde\x00' is not of type
 'object', 'integer', 'array', 'boolean', 'null'
Message-ID: <202608161517.WBsFKDAp-lkp@intel.com>
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
TO: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
CC: 0day robot <lkp@intel.com>
CC: Daniel Baluta <daniel.baluta@nxp.com>

tree:   https://github.com/intel-lab-lkp/linux/commits/Laurentiu-Mihalcea/dt-bindings-remoteproc-imx_rproc-document-optional-memory-region-names/20260807-134232
head:   649a5679cf4937afa3b694ec2068dfefd0d1e6c7
commit: 649a5679cf4937afa3b694ec2068dfefd0d1e6c7 arm64: dts: freescale: add DT overlay for MX95-15x15-FRDM RPMSG usage
date:   9 days ago
:::::: branch date: 9 days ago
:::::: commit date: 9 days ago
config: arm64-randconfig-2052-20260815 (https://download.01.org/0day-ci/archive/20260816/202608161517.WBsFKDAp-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 16.1.0
dtschema: 2026.7.dev15+g01b5073ab
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260816/202608161517.WBsFKDAp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202608161517.WBsFKDAp-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/freescale/imx95-15x15-frdm-rpmsg.dtb: opp-500000000: opp-hz-real: b'\x00\x00\x00\x00\x1d\xcde\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
>> arch/arm64/boot/dts/freescale/imx95-15x15-frdm-rpmsg.dtb: opp-800000000: opp-hz-real: b'\x00\x00\x00\x00/\xaf\x08\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
>> arch/arm64/boot/dts/freescale/imx95-15x15-frdm-rpmsg.dtb: opp-1000000000: opp-hz-real: b'\x00\x00\x00\x00;\x9a\xca\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
