Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 465311876
	for <oe-kbuild@lists.linux.dev>; Fri, 29 Nov 2024 04:31:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732854674; cv=none; b=Am2UOdKsKL/dqPJ3s0oarxHv5c8thcWCeMDJXqx542IIDhPpKKjO4G9gmhDT2zn6ap1wxFjvz9IHsYMf244I+9QRv3Zpbw8quslOtCtjahygZecN8Zfopao4N9hwXgPGf9IllmkccYQlrHLPYuppyKxmLJu0SKEFw02n5kPjUeM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732854674; c=relaxed/simple;
	bh=WCM4D6gbcNNci7CzdafqLyUKa1CdPmAPjpFoc8HDgRo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=al3qXVrwaOcNYuVhy5A3lGm/gLFwUYe1D5xCxJ4xQ0cy179QgCNSd589JT0MhiAoUCvdrJQOThRDpXb39/5eGvyu/kZ5hA0RIgsOT/q60WTlRl6nGg120uVTmyOBSUp+93a+CIrRiNjF74txpcQ64eWqIyriZU2reHtTJjEUtTA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=R+XxcLfG; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="R+XxcLfG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732854672; x=1764390672;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=WCM4D6gbcNNci7CzdafqLyUKa1CdPmAPjpFoc8HDgRo=;
  b=R+XxcLfGtRhd6/iV1Nf7Tx6mn1qdfIIxzVZAMCnqvj/oSVs0DSIeVVuz
   scRKkxfspD9uF3Au8j6hDc/lcYeCELPZjpQEX48jx2mE81MFfxpygmjB+
   IqHaPil89FNDE8U/46sEiAOdRhXiSiO16tTvPOxw5Dp3GVQi7R+G4Q+Wc
   v5t5dYPH80I92QDOOz1XvIigOK36tDy7SldJdSxTTXmji591JP+62Pkq4
   2hb0GtQHk9a4gF+/Ht24iIQtGqCoi47s+pZ3JCvy8JrrzGdOpOejzJOdi
   3ckoK93gokaWl0M8dYG93WNWMRWDjrkuSH46r7OE1+rniArlQqfogUhFy
   A==;
X-CSE-ConnectionGUID: G2LJZbmqSKKkjb8cmzhzTQ==
X-CSE-MsgGUID: JHj2EaH4SM+H/r03EpuXzQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11270"; a="44470511"
X-IronPort-AV: E=Sophos;i="6.12,194,1728975600"; 
   d="scan'208";a="44470511"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Nov 2024 20:31:11 -0800
X-CSE-ConnectionGUID: kVCf+enTT+2rSeIwi78O3g==
X-CSE-MsgGUID: votrN/Q9TLS+dCSSvVrKNw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,194,1728975600"; 
   d="scan'208";a="92773951"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 28 Nov 2024 20:31:11 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tGseq-000ALH-08;
	Fri, 29 Nov 2024 04:31:08 +0000
Date: Fri, 29 Nov 2024 12:30:57 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/dma/mcf-edma-main.c:116 mcf_edma_irq_init() warn:
 'res->start' from request_irq() not released on lines: 88,93,98,105,113.
Message-ID: <202411291232.sAdgRj5J-lkp@intel.com>
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
head:   7af08b57bcb9ebf78675c50069c54125c0a8b795
commit: 3f2282931f00c4c9c5057bb02f46778ba64ff625 dmaengine: fsl-edma: use _Generic to handle difference type
date:   7 months ago
:::::: branch date: 9 hours ago
:::::: commit date: 7 months ago
config: hexagon-randconfig-r071-20241119 (https://download.01.org/0day-ci/archive/20241129/202411291232.sAdgRj5J-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 592c0fe55f6d9a811028b5f3507be91458ab2713)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202411291232.sAdgRj5J-lkp@intel.com/

New smatch warnings:
drivers/dma/mcf-edma-main.c:116 mcf_edma_irq_init() warn: 'res->start' from request_irq() not released on lines: 88,93,98,105,113.

Old smatch warnings:
drivers/dma/mcf-edma-main.c:116 mcf_edma_irq_init() warn: 'res->start' from request_irq() not released on lines: 98,105,113.
drivers/dma/mcf-edma-main.c:116 mcf_edma_irq_init() warn: 'ret' from request_irq() not released on lines: 113.
drivers/dma/mcf-edma-main.c:205 mcf_edma_probe() warn: statement has no effect 31
drivers/dma/mcf-edma-main.c:205 mcf_edma_probe() warn: statement has no effect 31

vim +116 drivers/dma/mcf-edma-main.c

e7a3ff92eaf19e drivers/dma/mcf-edma.c Angelo Dureghello 2018-08-19   73  
e7a3ff92eaf19e drivers/dma/mcf-edma.c Angelo Dureghello 2018-08-19   74  static int mcf_edma_irq_init(struct platform_device *pdev,
e7a3ff92eaf19e drivers/dma/mcf-edma.c Angelo Dureghello 2018-08-19   75  				struct fsl_edma_engine *mcf_edma)
e7a3ff92eaf19e drivers/dma/mcf-edma.c Angelo Dureghello 2018-08-19   76  {
e7a3ff92eaf19e drivers/dma/mcf-edma.c Angelo Dureghello 2018-08-19   77  	int ret = 0, i;
e7a3ff92eaf19e drivers/dma/mcf-edma.c Angelo Dureghello 2018-08-19   78  	struct resource *res;
e7a3ff92eaf19e drivers/dma/mcf-edma.c Angelo Dureghello 2018-08-19   79  
e7a3ff92eaf19e drivers/dma/mcf-edma.c Angelo Dureghello 2018-08-19   80  	res = platform_get_resource_byname(pdev,
e7a3ff92eaf19e drivers/dma/mcf-edma.c Angelo Dureghello 2018-08-19   81  				IORESOURCE_IRQ, "edma-tx-00-15");
e7a3ff92eaf19e drivers/dma/mcf-edma.c Angelo Dureghello 2018-08-19   82  	if (!res)
e7a3ff92eaf19e drivers/dma/mcf-edma.c Angelo Dureghello 2018-08-19   83  		return -1;
e7a3ff92eaf19e drivers/dma/mcf-edma.c Angelo Dureghello 2018-08-19   84  
e7a3ff92eaf19e drivers/dma/mcf-edma.c Angelo Dureghello 2018-08-19   85  	for (ret = 0, i = res->start; i <= res->end; ++i)
e7a3ff92eaf19e drivers/dma/mcf-edma.c Angelo Dureghello 2018-08-19   86  		ret |= request_irq(i, mcf_edma_tx_handler, 0, "eDMA", mcf_edma);
e7a3ff92eaf19e drivers/dma/mcf-edma.c Angelo Dureghello 2018-08-19   87  	if (ret)
e7a3ff92eaf19e drivers/dma/mcf-edma.c Angelo Dureghello 2018-08-19   88  		return ret;
e7a3ff92eaf19e drivers/dma/mcf-edma.c Angelo Dureghello 2018-08-19   89  
e7a3ff92eaf19e drivers/dma/mcf-edma.c Angelo Dureghello 2018-08-19   90  	res = platform_get_resource_byname(pdev,
e7a3ff92eaf19e drivers/dma/mcf-edma.c Angelo Dureghello 2018-08-19   91  			IORESOURCE_IRQ, "edma-tx-16-55");
e7a3ff92eaf19e drivers/dma/mcf-edma.c Angelo Dureghello 2018-08-19   92  	if (!res)
e7a3ff92eaf19e drivers/dma/mcf-edma.c Angelo Dureghello 2018-08-19   93  		return -1;
e7a3ff92eaf19e drivers/dma/mcf-edma.c Angelo Dureghello 2018-08-19   94  
e7a3ff92eaf19e drivers/dma/mcf-edma.c Angelo Dureghello 2018-08-19   95  	for (ret = 0, i = res->start; i <= res->end; ++i)
e7a3ff92eaf19e drivers/dma/mcf-edma.c Angelo Dureghello 2018-08-19   96  		ret |= request_irq(i, mcf_edma_tx_handler, 0, "eDMA", mcf_edma);
e7a3ff92eaf19e drivers/dma/mcf-edma.c Angelo Dureghello 2018-08-19   97  	if (ret)
e7a3ff92eaf19e drivers/dma/mcf-edma.c Angelo Dureghello 2018-08-19   98  		return ret;
e7a3ff92eaf19e drivers/dma/mcf-edma.c Angelo Dureghello 2018-08-19   99  
e7a3ff92eaf19e drivers/dma/mcf-edma.c Angelo Dureghello 2018-08-19  100  	ret = platform_get_irq_byname(pdev, "edma-tx-56-63");
e7a3ff92eaf19e drivers/dma/mcf-edma.c Angelo Dureghello 2018-08-19  101  	if (ret != -ENXIO) {
e7a3ff92eaf19e drivers/dma/mcf-edma.c Angelo Dureghello 2018-08-19  102  		ret = request_irq(ret, mcf_edma_tx_handler,
e7a3ff92eaf19e drivers/dma/mcf-edma.c Angelo Dureghello 2018-08-19  103  				  0, "eDMA", mcf_edma);
e7a3ff92eaf19e drivers/dma/mcf-edma.c Angelo Dureghello 2018-08-19  104  		if (ret)
e7a3ff92eaf19e drivers/dma/mcf-edma.c Angelo Dureghello 2018-08-19  105  			return ret;
e7a3ff92eaf19e drivers/dma/mcf-edma.c Angelo Dureghello 2018-08-19  106  	}
e7a3ff92eaf19e drivers/dma/mcf-edma.c Angelo Dureghello 2018-08-19  107  
e7a3ff92eaf19e drivers/dma/mcf-edma.c Angelo Dureghello 2018-08-19  108  	ret = platform_get_irq_byname(pdev, "edma-err");
e7a3ff92eaf19e drivers/dma/mcf-edma.c Angelo Dureghello 2018-08-19  109  	if (ret != -ENXIO) {
e7a3ff92eaf19e drivers/dma/mcf-edma.c Angelo Dureghello 2018-08-19  110  		ret = request_irq(ret, mcf_edma_err_handler,
e7a3ff92eaf19e drivers/dma/mcf-edma.c Angelo Dureghello 2018-08-19  111  				  0, "eDMA", mcf_edma);
e7a3ff92eaf19e drivers/dma/mcf-edma.c Angelo Dureghello 2018-08-19  112  		if (ret)
e7a3ff92eaf19e drivers/dma/mcf-edma.c Angelo Dureghello 2018-08-19  113  			return ret;
e7a3ff92eaf19e drivers/dma/mcf-edma.c Angelo Dureghello 2018-08-19  114  	}
e7a3ff92eaf19e drivers/dma/mcf-edma.c Angelo Dureghello 2018-08-19  115  
e7a3ff92eaf19e drivers/dma/mcf-edma.c Angelo Dureghello 2018-08-19 @116  	return 0;
e7a3ff92eaf19e drivers/dma/mcf-edma.c Angelo Dureghello 2018-08-19  117  }
e7a3ff92eaf19e drivers/dma/mcf-edma.c Angelo Dureghello 2018-08-19  118  

:::::: The code at line 116 was first introduced by commit
:::::: e7a3ff92eaf19eab14e8149758428e680c61706b dmaengine: fsl-edma: add ColdFire mcf5441x edma support

:::::: TO: Angelo Dureghello <angelo@sysam.it>
:::::: CC: Vinod Koul <vkoul@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
