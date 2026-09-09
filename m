Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FD451A680B
	for <oe-kbuild@lists.linux.dev>; Wed,  9 Sep 2026 05:28:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788931709; cv=none; b=q9RSz3fey9L7x3sZaT3d9tFUa9WOe48ooKUhPielHYFLXqZRFIEeVs3/9QdFL7bl7/HMCEyjN09+saHkw3i+OzP7V9t0Yt9CUecOkr8O5YCqChd+mCFCevlgh4IxnQTf++CzHKBHVmYcCZMDPPxMb7bNu0trjPQaguZrh+aoL+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788931709; c=relaxed/simple;
	bh=oD28iC7s8JyTiaar5b29PgiYSq/uibQZBP2abggIsco=;
	h=Date:From:To:Cc:Subject:Message-ID; b=QX7NyFjzkGMpwPRrmCFc7dFbvvpY8pxM1sQ3VADk/GMoTDYZNZ5tLCmEHwVhylAtA2jeFKYPZXBFEpV2ZUDqEzKu625jl7dF4fcCMgSEdZRvCdOCPv9g0O/ydWvnnbbk2DbotiS0znivFK1/IA84W+Lpyjhf3THPOVGHihSvLSg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UOLKuRW+; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UOLKuRW+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788931706; x=1820467706;
  h=date:from:to:cc:subject:message-id;
  bh=oD28iC7s8JyTiaar5b29PgiYSq/uibQZBP2abggIsco=;
  b=UOLKuRW+XJsOJZNZR6ETcqIZHyEajw/cjosLyvWe82AZ1Mb5ghi1aX+G
   Ze3bHXQXStwkAsVI/Nza27LparC5PwGv2sE7Cr4ho9G+YmtQ63plusSi0
   XaCBcKASK0kH6ge/gPnmvysn1gtCdkNmgpnCAnBxNDRYuiu0xCjjl0YLC
   4v62eWa2+4B3/jKQNislIssTxiwBbLDHQOpBKZ08nluEVzViId/PxntNx
   OOZXN/2ljWdiDAAuR4bGn8mGXqHOCi6xo2O2AGHtqy7wrRtzKOWG0EYmL
   Kkt8nCaNwVnAXvDIOrmYc0Fel/oa2FGtiJNRVaW/TmYvyiDpsLKcyU/WF
   g==;
X-CSE-ConnectionGUID: KZXjy9NWS7qW7bhE9x3XBQ==
X-CSE-MsgGUID: mb3jtCbNRcmLMUCrkSORRg==
X-IronPort-AV: E=McAfee;i="6800,10657,11900"; a="89184376"
X-IronPort-AV: E=Sophos;i="6.25,270,1779174000"; 
   d="scan'208";a="89184376"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Sep 2026 22:28:25 -0700
X-CSE-ConnectionGUID: 03GQUVUXQYSBs27RaQpE8A==
X-CSE-MsgGUID: pbrv47PiSw2tXvLI/SeNNQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,270,1779174000"; 
   d="scan'208";a="269871789"
Received: from igk-lkp-server01.igk.intel.com (HELO cc074f2a4298) ([10.211.93.152])
  by orviesa010.jf.intel.com with ESMTP; 08 Sep 2026 22:28:25 -0700
Received: from kbuild by cc074f2a4298 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x4Ar8-0000000016A-1KMS;
	Wed, 09 Sep 2026 05:28:22 +0000
Date: Wed, 09 Sep 2026 07:28:19 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [frank-li:imx/dt64 52/52]
 arch/arm64/boot/dts/freescale/imx952-evk-mqs.dtb: opp-500000000: opp-hz-real:
 b'\x00\x00\x00\x00\x1d\xcde\x00' is not of type 'object', 'integer', 'array',
 'boolean', 'null'
Message-ID: <202609090725.oCZ9PQuy-lkp@intel.com>
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
TO: Chancel Liu <chancel.liu@nxp.com>
CC: Frank Li <Frank.Li@nxp.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/frank.li/linux.git imx/dt64
head:   153a8f4b71cee0e6ade27d7765de730af530653b
commit: 153a8f4b71cee0e6ade27d7765de730af530653b [52/52] arm64: dts: fsl: Add DT overlay to build MQS1 sound cards on i.MX9 platforms
:::::: branch date: 5 days ago
:::::: commit date: 5 days ago
config: arm64-randconfig-2053-20260908 (https://download.01.org/0day-ci/archive/20260909/202609090725.oCZ9PQuy-lkp@intel.com/config)
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
rustc: rustc 1.96.0 (ac68faa20 2026-05-25)
dtschema: 2026.7.dev16+g39602f98e
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260909/202609090725.oCZ9PQuy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202609090725.oCZ9PQuy-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/freescale/imx952-evk-mqs.dtb: opp-500000000: opp-hz-real: b'\x00\x00\x00\x00\x1d\xcde\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
>> arch/arm64/boot/dts/freescale/imx952-evk-mqs.dtb: opp-800000000: opp-hz-real: b'\x00\x00\x00\x00/\xaf\x08\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
>> arch/arm64/boot/dts/freescale/imx952-evk-mqs.dtb: opp-1000000000: opp-hz-real: b'\x00\x00\x00\x00;\x9a\xca\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
--
>> arch/arm64/boot/dts/freescale/imx95-15x15-evk-mqs.dtb: opp-500000000: opp-hz-real: b'\x00\x00\x00\x00\x1d\xcde\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
>> arch/arm64/boot/dts/freescale/imx95-15x15-evk-mqs.dtb: opp-800000000: opp-hz-real: b'\x00\x00\x00\x00/\xaf\x08\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
>> arch/arm64/boot/dts/freescale/imx95-15x15-evk-mqs.dtb: opp-1000000000: opp-hz-real: b'\x00\x00\x00\x00;\x9a\xca\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
