Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EEBF355F47
	for <oe-kbuild@lists.linux.dev>; Thu,  7 May 2026 20:07:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778184464; cv=none; b=Xer8aIr06ghbPvuP1JZg7KcpVpJ467kWHH8cqBTQsyNkdTca7/ZDYG0zsZhdsaG4/fntUt9saYgbuiqrfPrNm/QmSfBdG1plr6rhtkqFAFWMQ6pM21f+nr4e+ne6G2odFyxRmDRwUBGbUeGvyar3NSd0eXDl4a9IY5O59dgDEcE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778184464; c=relaxed/simple;
	bh=aikkN2uB/JBwPtI0pzOcUCJS1/y1y6vR76B7a6Hwn4c=;
	h=Date:From:To:Cc:Subject:Message-ID; b=LEdJBVaIr32l/N8fnZqIqd9unxHBl5mYLmKADjt6MzCifnuyLigDlOAo//Z1mhPl+8o89RifTC+W1hZWkN+5TdMo93SWdaIgv57JphCMvGM5TmkOK2lE4qM3FXmh5/LztE27ynCd+iAgA4ZnHYBHY5BzWSE5I+PXvnZW3o9jfVw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MslhjZte; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MslhjZte"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778184463; x=1809720463;
  h=date:from:to:cc:subject:message-id;
  bh=aikkN2uB/JBwPtI0pzOcUCJS1/y1y6vR76B7a6Hwn4c=;
  b=MslhjZteleVUg7rdiIbvV5ZCSPOT0NRn1h1wUL755oT6YC/1XyPUz9eu
   6RRpjsteicPMxLkUbTSuaFJdd8Savbt9N5k2O7QCOFCx3rBsfq8zWmZqu
   52nQWS5EeWfROEkaXkoRXmpnQubIdorX49ZF31ujfIyppeU2Sn7bx/0Ja
   8HLKAYG077RtBcKsENYUrCCdKSQBBz6BH4OHUWg+QMOoZW2wO3mDi0d7N
   4zc0zodQ3HHnB5QkhTbQhhxEYmq9I7KYtNLmnTD1dJMopBl32giYFxLc6
   x3PtrMBVVyWI4LpZrfNCBdpMn63x6iKlncY3pFnEP18vS4BGaI3BEHazH
   A==;
X-CSE-ConnectionGUID: WeRM1REfSqmkWwUUZaaiIg==
X-CSE-MsgGUID: sdBPOwhTTqaq2RXty2s1Aw==
X-IronPort-AV: E=McAfee;i="6800,10657,11779"; a="78998742"
X-IronPort-AV: E=Sophos;i="6.23,222,1770624000"; 
   d="scan'208";a="78998742"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2026 13:07:43 -0700
X-CSE-ConnectionGUID: n1smuay4TCqVraiWLC2ShQ==
X-CSE-MsgGUID: UswCRvIiT8G75TNhO1m5TQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,222,1770624000"; 
   d="scan'208";a="238353097"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by fmviesa004.fm.intel.com with ESMTP; 07 May 2026 13:07:41 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wL50V-000000006wH-2K3O;
	Thu, 07 May 2026 20:07:39 +0000
Date: Thu, 07 May 2026 22:07:27 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [frank-li:imx/dt64 44/49]
 arch/arm64/boot/dts/freescale/imx95-verdin-nonwifi-zinnia.dtb:
 dma-controller@42210000 (fsl,imx95-edma5): Unevaluated properties are not
 allowed ('iommus' was unexpected)
Message-ID: <202605072219.Y7ZU1QZY-lkp@intel.com>
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
TO: Francesco Dolcini <francesco.dolcini@toradex.com>
CC: Frank Li <Frank.Li@nxp.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/frank.li/linux.git imx/dt64
head:   d570a0d019a3d84832bfc6867647d3581b0052f3
commit: 76182019a4c41c1f187694f1c3db48a0112854c0 [44/49] arm64: dts: freescale: imx95-verdin: Add Zinnia
:::::: branch date: 29 hours ago
:::::: commit date: 2 days ago
config: arm64-randconfig-2055-20260506 (https://download.01.org/0day-ci/archive/20260507/202605072219.Y7ZU1QZY-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project f43d6834093b19baf79beda8c0337ab020ac5f17)
dtschema: 2026.5.dev4+g4ccc1997d
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260507/202605072219.Y7ZU1QZY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202605072219.Y7ZU1QZY-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/freescale/imx95-verdin-nonwifi-zinnia.dtb: dma-controller@42210000 (fsl,imx95-edma5): Unevaluated properties are not allowed ('iommus' was unexpected)
   	from schema $id: http://devicetree.org/schemas/dma/fsl,edma.yaml
--
>> arch/arm64/boot/dts/freescale/imx95-verdin-wifi-zinnia.dtb: dma-controller@42210000 (fsl,imx95-edma5): Unevaluated properties are not allowed ('iommus' was unexpected)
   	from schema $id: http://devicetree.org/schemas/dma/fsl,edma.yaml

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
