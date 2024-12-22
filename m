Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAA8FA2D
	for <oe-kbuild@lists.linux.dev>; Sun, 22 Dec 2024 09:33:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734860029; cv=none; b=SKlbRbnLQr5erpFwtXRJXLlrMkkG8WuderaaK1ufVVDgGIhK2D91NNesLryHWvVSgAGWVRVaGnl9MWPp9e7JoUCroJQF1YdeuDKUXQXdrz1lG5q6EkfgcdmR/isAR2lKnLei+m+0oIarqWZX6uWM71MvBioy+VWKvlgTzErKXrA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734860029; c=relaxed/simple;
	bh=vovvxDCcZAR9GQ0wx3fHz5ZvfdDqChG0wIVEPoSiR1k=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HrJhjKnM0lPIVHOKF+IEml9xweE3F+Nli/S9zVOD9LeClGuJ7F1xCZZhNYEeCLrS0wHpF59ifFaQLck7JQ2+zfXTYYYReokGKZZoG+0K90DbHPUpF6PmT2mye6R6hPL2syeSezPJPtgllmkK2nuUs/075p1qOe8ksHFwYW+ogGo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LZI+B+yI; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LZI+B+yI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734860026; x=1766396026;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=vovvxDCcZAR9GQ0wx3fHz5ZvfdDqChG0wIVEPoSiR1k=;
  b=LZI+B+yIGG1mLWT0oQ4lg539D/mqU/dX1BMBX6PkiAGol5KOmC7iMVvB
   YcMdK6Bdjf0yeu7ksdc2JTWN8J21zrg3O/0Ew/AtYSPf1B1RNHQDWarMa
   jLxtitwWYrtclk+6VBJJrdw+tTj2L9SvERdNANLxFEpaR9NTsZc4405aD
   ZQWORJtgVwUYGwlBDxHGAiEOvkZ1VuBcRyX0tipwFuzkYr9QE7QRrgm16
   3D05uFJZH2Bpq4GBjiLHXp+3WoRV1FnTIyk7AhEsywJI7dIHU6pHdhOLG
   qXNVJJVpohnpn64clt2Qcf+kYam1PhForZu7qMyak6mSwMg/VLA+JVzH3
   w==;
X-CSE-ConnectionGUID: 7tW2kJL/TIWT2SU9pFjQ6A==
X-CSE-MsgGUID: ezOSZP0YSnuXd8OlMrEZhA==
X-IronPort-AV: E=McAfee;i="6700,10204,11293"; a="60734809"
X-IronPort-AV: E=Sophos;i="6.12,254,1728975600"; 
   d="scan'208";a="60734809"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Dec 2024 01:33:46 -0800
X-CSE-ConnectionGUID: q+8XvE3CR8GCJTyjOc2eyg==
X-CSE-MsgGUID: +V8MA1osSRm276wc4LEwFg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="103917090"
Received: from lkp-server01.sh.intel.com (HELO a46f226878e0) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 22 Dec 2024 01:33:44 -0800
Received: from kbuild by a46f226878e0 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tPILG-0002p1-1o;
	Sun, 22 Dec 2024 09:33:42 +0000
Date: Sun, 22 Dec 2024 17:33:16 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/dma/mcf-edma-main.c:116 mcf_edma_irq_init() warn:
 'res->start' from request_irq() not released on lines: 88,93,98,105,113.
Message-ID: <202412221759.vdIKGIK4-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Frank Li <Frank.Li@nxp.com>
CC: Vinod Koul <vkoul@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   48f506ad0b683d3e7e794efa60c5785c4fdc86fa
commit: 3f2282931f00c4c9c5057bb02f46778ba64ff625 dmaengine: fsl-edma: use _Generic to handle difference type
date:   8 months ago
:::::: branch date: 10 hours ago
:::::: commit date: 8 months ago
config: nios2-randconfig-r072-20241222 (https://download.01.org/0day-ci/archive/20241222/202412221759.vdIKGIK4-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202412221759.vdIKGIK4-lkp@intel.com/

New smatch warnings:
drivers/dma/mcf-edma-main.c:116 mcf_edma_irq_init() warn: 'res->start' from request_irq() not released on lines: 88,93,98,105,113.

Old smatch warnings:
drivers/dma/mcf-edma-main.c:116 mcf_edma_irq_init() warn: 'res->start' from request_irq() not released on lines: 98,105,113.
drivers/dma/mcf-edma-main.c:116 mcf_edma_irq_init() warn: 'ret' from request_irq() not released on lines: 113.
drivers/dma/mcf-edma-main.c:205 mcf_edma_probe() warn: statement has no effect 31
drivers/dma/mcf-edma-main.c:205 mcf_edma_probe() warn: statement has no effect 31

vim +116 drivers/dma/mcf-edma-main.c

e7a3ff92eaf19ea drivers/dma/mcf-edma.c Angelo Dureghello 2018-08-19   73  
e7a3ff92eaf19ea drivers/dma/mcf-edma.c Angelo Dureghello 2018-08-19   74  static int mcf_edma_irq_init(struct platform_device *pdev,
e7a3ff92eaf19ea drivers/dma/mcf-edma.c Angelo Dureghello 2018-08-19   75  				struct fsl_edma_engine *mcf_edma)
e7a3ff92eaf19ea drivers/dma/mcf-edma.c Angelo Dureghello 2018-08-19   76  {
e7a3ff92eaf19ea drivers/dma/mcf-edma.c Angelo Dureghello 2018-08-19   77  	int ret = 0, i;
e7a3ff92eaf19ea drivers/dma/mcf-edma.c Angelo Dureghello 2018-08-19   78  	struct resource *res;
e7a3ff92eaf19ea drivers/dma/mcf-edma.c Angelo Dureghello 2018-08-19   79  
e7a3ff92eaf19ea drivers/dma/mcf-edma.c Angelo Dureghello 2018-08-19   80  	res = platform_get_resource_byname(pdev,
e7a3ff92eaf19ea drivers/dma/mcf-edma.c Angelo Dureghello 2018-08-19   81  				IORESOURCE_IRQ, "edma-tx-00-15");
e7a3ff92eaf19ea drivers/dma/mcf-edma.c Angelo Dureghello 2018-08-19   82  	if (!res)
e7a3ff92eaf19ea drivers/dma/mcf-edma.c Angelo Dureghello 2018-08-19   83  		return -1;
e7a3ff92eaf19ea drivers/dma/mcf-edma.c Angelo Dureghello 2018-08-19   84  
e7a3ff92eaf19ea drivers/dma/mcf-edma.c Angelo Dureghello 2018-08-19   85  	for (ret = 0, i = res->start; i <= res->end; ++i)
e7a3ff92eaf19ea drivers/dma/mcf-edma.c Angelo Dureghello 2018-08-19   86  		ret |= request_irq(i, mcf_edma_tx_handler, 0, "eDMA", mcf_edma);
e7a3ff92eaf19ea drivers/dma/mcf-edma.c Angelo Dureghello 2018-08-19   87  	if (ret)
e7a3ff92eaf19ea drivers/dma/mcf-edma.c Angelo Dureghello 2018-08-19   88  		return ret;
e7a3ff92eaf19ea drivers/dma/mcf-edma.c Angelo Dureghello 2018-08-19   89  
e7a3ff92eaf19ea drivers/dma/mcf-edma.c Angelo Dureghello 2018-08-19   90  	res = platform_get_resource_byname(pdev,
e7a3ff92eaf19ea drivers/dma/mcf-edma.c Angelo Dureghello 2018-08-19   91  			IORESOURCE_IRQ, "edma-tx-16-55");
e7a3ff92eaf19ea drivers/dma/mcf-edma.c Angelo Dureghello 2018-08-19   92  	if (!res)
e7a3ff92eaf19ea drivers/dma/mcf-edma.c Angelo Dureghello 2018-08-19   93  		return -1;
e7a3ff92eaf19ea drivers/dma/mcf-edma.c Angelo Dureghello 2018-08-19   94  
e7a3ff92eaf19ea drivers/dma/mcf-edma.c Angelo Dureghello 2018-08-19   95  	for (ret = 0, i = res->start; i <= res->end; ++i)
e7a3ff92eaf19ea drivers/dma/mcf-edma.c Angelo Dureghello 2018-08-19   96  		ret |= request_irq(i, mcf_edma_tx_handler, 0, "eDMA", mcf_edma);
e7a3ff92eaf19ea drivers/dma/mcf-edma.c Angelo Dureghello 2018-08-19   97  	if (ret)
e7a3ff92eaf19ea drivers/dma/mcf-edma.c Angelo Dureghello 2018-08-19   98  		return ret;
e7a3ff92eaf19ea drivers/dma/mcf-edma.c Angelo Dureghello 2018-08-19   99  
e7a3ff92eaf19ea drivers/dma/mcf-edma.c Angelo Dureghello 2018-08-19  100  	ret = platform_get_irq_byname(pdev, "edma-tx-56-63");
e7a3ff92eaf19ea drivers/dma/mcf-edma.c Angelo Dureghello 2018-08-19  101  	if (ret != -ENXIO) {
e7a3ff92eaf19ea drivers/dma/mcf-edma.c Angelo Dureghello 2018-08-19  102  		ret = request_irq(ret, mcf_edma_tx_handler,
e7a3ff92eaf19ea drivers/dma/mcf-edma.c Angelo Dureghello 2018-08-19  103  				  0, "eDMA", mcf_edma);
e7a3ff92eaf19ea drivers/dma/mcf-edma.c Angelo Dureghello 2018-08-19  104  		if (ret)
e7a3ff92eaf19ea drivers/dma/mcf-edma.c Angelo Dureghello 2018-08-19  105  			return ret;
e7a3ff92eaf19ea drivers/dma/mcf-edma.c Angelo Dureghello 2018-08-19  106  	}
e7a3ff92eaf19ea drivers/dma/mcf-edma.c Angelo Dureghello 2018-08-19  107  
e7a3ff92eaf19ea drivers/dma/mcf-edma.c Angelo Dureghello 2018-08-19  108  	ret = platform_get_irq_byname(pdev, "edma-err");
e7a3ff92eaf19ea drivers/dma/mcf-edma.c Angelo Dureghello 2018-08-19  109  	if (ret != -ENXIO) {
e7a3ff92eaf19ea drivers/dma/mcf-edma.c Angelo Dureghello 2018-08-19  110  		ret = request_irq(ret, mcf_edma_err_handler,
e7a3ff92eaf19ea drivers/dma/mcf-edma.c Angelo Dureghello 2018-08-19  111  				  0, "eDMA", mcf_edma);
e7a3ff92eaf19ea drivers/dma/mcf-edma.c Angelo Dureghello 2018-08-19  112  		if (ret)
e7a3ff92eaf19ea drivers/dma/mcf-edma.c Angelo Dureghello 2018-08-19  113  			return ret;
e7a3ff92eaf19ea drivers/dma/mcf-edma.c Angelo Dureghello 2018-08-19  114  	}
e7a3ff92eaf19ea drivers/dma/mcf-edma.c Angelo Dureghello 2018-08-19  115  
e7a3ff92eaf19ea drivers/dma/mcf-edma.c Angelo Dureghello 2018-08-19 @116  	return 0;
e7a3ff92eaf19ea drivers/dma/mcf-edma.c Angelo Dureghello 2018-08-19  117  }
e7a3ff92eaf19ea drivers/dma/mcf-edma.c Angelo Dureghello 2018-08-19  118  

:::::: The code at line 116 was first introduced by commit
:::::: e7a3ff92eaf19eab14e8149758428e680c61706b dmaengine: fsl-edma: add ColdFire mcf5441x edma support

:::::: TO: Angelo Dureghello <angelo@sysam.it>
:::::: CC: Vinod Koul <vkoul@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
