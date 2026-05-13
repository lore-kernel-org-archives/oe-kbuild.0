Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47D473FFAD2
	for <oe-kbuild@lists.linux.dev>; Wed, 13 May 2026 12:38:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778675924; cv=none; b=BgZga2Glu5iDp333K+tleD+e9SiHdBHCklpr//l4eRA9Pzh1X+whNlUKLQoLAcLkJvm51qwEY9BrEEwzYUS+cBeS9M6GmXuDCV+5GXEyvBf/0fo3cic0DlnKTaacGt1nTzZFxAFPHxJQRwwP//g05wE3fznF41oXQaNW9hAohBQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778675924; c=relaxed/simple;
	bh=OPzYh9h0zujuagGaOzAhbJdjlJaYSTuI246Rs/39Fbs=;
	h=Date:From:To:Cc:Subject:Message-ID; b=syVNAHtVDFx+sArk7MhhQX/bfBzt/mcdNxGU0a791rmP5nI1zfBeVRXBPdwHhwZXGW5352BmUfB/mMtB44hUkN9ZmDiiG8wzyHKHmc6YyuY8rAM0aNxlQCfU+QsZLvwH7wYh0df2aN9BbWaL8p9RSWc3U57AdEG+nigi6Ne3yBo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cMP1xtqZ; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cMP1xtqZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778675923; x=1810211923;
  h=date:from:to:cc:subject:message-id;
  bh=OPzYh9h0zujuagGaOzAhbJdjlJaYSTuI246Rs/39Fbs=;
  b=cMP1xtqZ/t/hgIPOPqcP6NZxbJEl/od8hGhaTYF3jbjhg8iZY2nITBKh
   b4y/TkDbRZubnavi2CTgIUQkcZQscqi02L4XS/GwVKejE9aVRmLZ/c05v
   7t7TnaeSZllQZPoy+d0Q/aIwADgaTQL1zCARV3zlI+0c7ksIJ0hUBqUbK
   /8Ah2EAN+eVS+HT5uicTOaaFa+g4yHgsMcaCvpfMS7BfCrWG3n/OW7Wr+
   2jCYGCLUReNgvngrTmRGylaQufFif9sYO3jZhNcNzrNbYsAc5WG872/BT
   8FqfLYPVgW3rnrXg1gKkN1IZMFyhuNMgZc6l0HJnLIf8dPeDEofTaOkzh
   Q==;
X-CSE-ConnectionGUID: 7sz3bDxtTrKdFDrwOOql4g==
X-CSE-MsgGUID: dM3OskFtSniMQk1f3jBHZQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11784"; a="79631330"
X-IronPort-AV: E=Sophos;i="6.23,232,1770624000"; 
   d="scan'208";a="79631330"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2026 05:38:43 -0700
X-CSE-ConnectionGUID: bXCz7BQ7SaGZ17bPwXUXXQ==
X-CSE-MsgGUID: AAmLm0HsQbKHa2sy9vr6Yg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,232,1770624000"; 
   d="scan'208";a="237218912"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by orviesa010.jf.intel.com with ESMTP; 13 May 2026 05:38:42 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wN8rI-000000008YH-0j2W;
	Wed, 13 May 2026 12:38:40 +0000
Date: Wed, 13 May 2026 14:37:47 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [frank-li:imx/dt64 52/52]
 arch/arm64/boot/dts/freescale/imx95-15x15-evk-pcie.dtb:
 dma-controller@42210000 (fsl,imx95-edma5): Unevaluated properties are not
 allowed ('iommus' was unexpected)
Message-ID: <202605131454.9dXVgemI-lkp@intel.com>
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
TO: Sherry Sun <sherry.sun@nxp.com>
CC: Frank Li <Frank.Li@nxp.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/frank.li/linux.git imx/dt64
head:   5f9e9f83aee0fa8f2124c6f192505de2cdf7c5dc
commit: 5f9e9f83aee0fa8f2124c6f192505de2cdf7c5dc [52/52] arm64: dts: imx: Add common imx-m2-pcie.dtso to enable PCIe on M.2 connector
:::::: branch date: 6 days ago
:::::: commit date: 6 days ago
config: arm64-randconfig-2055-20260512 (https://download.01.org/0day-ci/archive/20260513/202605131454.9dXVgemI-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.3.0
dtschema: 2026.5.dev9+gdf9ad30c5
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260513/202605131454.9dXVgemI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202605131454.9dXVgemI-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/freescale/imx95-15x15-evk-pcie.dtb: dma-controller@42210000 (fsl,imx95-edma5): Unevaluated properties are not allowed ('iommus' was unexpected)
   	from schema $id: http://devicetree.org/schemas/dma/fsl,edma.yaml

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
