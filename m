Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 996B4AD48
	for <oe-kbuild@lists.linux.dev>; Sat,  1 Jun 2024 17:48:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717264115; cv=none; b=KNaUXuZQS2cTWZezuaDHXSzlOMh/aoCj9OXLpXgsbkx71uabqVkTF5q70F6kKorpstwMEbtyHKMOWanPgT4qLJUqQc0sso77061TwPPd1nKSu8+A2pmERFNDzcONXDdaZ3KE0MP+zb2Wh8d53b8cJs4JL/vLDeT0ZZuZ2eJx1/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717264115; c=relaxed/simple;
	bh=06UBbeOSx1b5zdlxQMsg7q3kDxdyfjQwpyY4UqrA2vU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=tKQxwsvB9lBqFARkCM2GFe+vDlS6gzvpJhArZJsQvgDQVoDUoRw1XWm2VAO1tvEGzlAOkf53PQf4htbksLrVxb+ngX76WBWKBsBWBlazFsUHFL/hsVtbe+nTRZBZOiEer37/OcaS3mtazoSva1G97e4s7R8kpRGDlctD+UJj59k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FTFIOWkp; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FTFIOWkp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717264114; x=1748800114;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=06UBbeOSx1b5zdlxQMsg7q3kDxdyfjQwpyY4UqrA2vU=;
  b=FTFIOWkp8Dfpj8WTGQRVKeVh32hfJWwjcxkyikmvDJlvMwrnkB2JhL5A
   PYLRQ6gz6CW5d/IlOo6gTGce3R9PGmfvOKsKmzs55zeT8eYW23x3/C9aY
   zCX79b9JIlXVx7rNKpc0p2Lyo9ObInIN8rzejGf4Sp3wzEzwZhDAzJu3M
   YpZNqHRYSZTRvIEzpptoM5Sb23fEznpFocNaYvrI7FjQoFY4pvUdQGoPM
   iOeaIzXkRPJBAFEFhCvT5DF2bAgeftVWqfKZFsxuImb6zSvVOLBz+o/yj
   ouSsrq7u3JggbtkhbexQtGd/dMFSJfJiKn1NWAla3qGC2ztYt6x4bSJUm
   w==;
X-CSE-ConnectionGUID: wlcgKT1wQkCRrMZV+nidHg==
X-CSE-MsgGUID: y/69kdMYRAGTPabS4iDunA==
X-IronPort-AV: E=McAfee;i="6600,9927,11090"; a="13614415"
X-IronPort-AV: E=Sophos;i="6.08,207,1712646000"; 
   d="scan'208";a="13614415"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jun 2024 10:48:33 -0700
X-CSE-ConnectionGUID: 8LhAhhFpSiqwEdDbX4BnkA==
X-CSE-MsgGUID: EGhHXSN1TLKpVbgXgz7YEw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,207,1712646000"; 
   d="scan'208";a="73943564"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 01 Jun 2024 10:48:32 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sDSpx-000JCN-10;
	Sat, 01 Jun 2024 17:48:20 +0000
Date: Sun, 2 Jun 2024 01:48:12 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH 1/2] dmaengine: fsl-edma: request per-channel IRQ only
 when channel is allocated
Message-ID: <202406020102.cYYPfac7-lkp@intel.com>
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
In-Reply-To: <20240531210152.1878443-1-Frank.Li@nxp.com>
References: <20240531210152.1878443-1-Frank.Li@nxp.com>
TO: Frank Li <Frank.Li@nxp.com>
TO: Vinod Koul <vkoul@kernel.org>
TO: "open list:FREESCALE eDMA DRIVER" <imx@lists.linux.dev>
TO: open list <linux-kernel@vger.kernel.org>

Hi Frank,

kernel test robot noticed the following build warnings:

[auto build test WARNING on vkoul-dmaengine/next]
[also build test WARNING on linus/master v6.10-rc1 next-20240531]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Frank-Li/dmaengine-fsl-edma-remove-redundant-idle-field-from-fsl_chan/20240601-050401
base:   https://git.kernel.org/pub/scm/linux/kernel/git/vkoul/dmaengine.git next
patch link:    https://lore.kernel.org/r/20240531210152.1878443-1-Frank.Li%40nxp.com
patch subject: [PATCH 1/2] dmaengine: fsl-edma: request per-channel IRQ only when channel is allocated
:::::: branch date: 21 hours ago
:::::: commit date: 21 hours ago
config: i386-randconfig-141-20240601 (https://download.01.org/0day-ci/archive/20240602/202406020102.cYYPfac7-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202406020102.cYYPfac7-lkp@intel.com/

New smatch warnings:
drivers/dma/fsl-edma-common.c:828 fsl_edma_alloc_chan_resources() warn: 'fsl_chan->clk' from clk_prepare_enable() not released on lines: 824.

Old smatch warnings:
drivers/dma/fsl-edma-common.c:439 fsl_edma_set_tcd_regs() warn: statement has no effect 31
drivers/dma/fsl-edma-common.c:439 fsl_edma_set_tcd_regs() warn: statement has no effect 31
drivers/dma/fsl-edma-common.c:441 fsl_edma_set_tcd_regs() warn: statement has no effect 31
drivers/dma/fsl-edma-common.c:441 fsl_edma_set_tcd_regs() warn: statement has no effect 31
drivers/dma/fsl-edma-common.c:442 fsl_edma_set_tcd_regs() warn: statement has no effect 31
drivers/dma/fsl-edma-common.c:442 fsl_edma_set_tcd_regs() warn: statement has no effect 31
drivers/dma/fsl-edma-common.c:444 fsl_edma_set_tcd_regs() warn: statement has no effect 31
drivers/dma/fsl-edma-common.c:444 fsl_edma_set_tcd_regs() warn: statement has no effect 31
drivers/dma/fsl-edma-common.c:445 fsl_edma_set_tcd_regs() warn: statement has no effect 31
drivers/dma/fsl-edma-common.c:445 fsl_edma_set_tcd_regs() warn: statement has no effect 31
drivers/dma/fsl-edma-common.c:447 fsl_edma_set_tcd_regs() warn: statement has no effect 31
drivers/dma/fsl-edma-common.c:447 fsl_edma_set_tcd_regs() warn: statement has no effect 31
drivers/dma/fsl-edma-common.c:448 fsl_edma_set_tcd_regs() warn: statement has no effect 31
drivers/dma/fsl-edma-common.c:448 fsl_edma_set_tcd_regs() warn: statement has no effect 31
drivers/dma/fsl-edma-common.c:450 fsl_edma_set_tcd_regs() warn: statement has no effect 31
drivers/dma/fsl-edma-common.c:450 fsl_edma_set_tcd_regs() warn: statement has no effect 31
drivers/dma/fsl-edma-common.c:451 fsl_edma_set_tcd_regs() warn: statement has no effect 31
drivers/dma/fsl-edma-common.c:451 fsl_edma_set_tcd_regs() warn: statement has no effect 31
drivers/dma/fsl-edma-common.c:452 fsl_edma_set_tcd_regs() warn: statement has no effect 31
drivers/dma/fsl-edma-common.c:452 fsl_edma_set_tcd_regs() warn: statement has no effect 31
drivers/dma/fsl-edma-common.c:454 fsl_edma_set_tcd_regs() warn: statement has no effect 31
drivers/dma/fsl-edma-common.c:454 fsl_edma_set_tcd_regs() warn: statement has no effect 31
drivers/dma/fsl-edma-common.c:460 fsl_edma_set_tcd_regs() warn: statement has no effect 31
drivers/dma/fsl-edma-common.c:460 fsl_edma_set_tcd_regs() warn: statement has no effect 31
drivers/dma/fsl-edma-common.c:475 fsl_edma_set_tcd_regs() warn: statement has no effect 31
drivers/dma/fsl-edma-common.c:475 fsl_edma_set_tcd_regs() warn: statement has no effect 31
drivers/dma/fsl-edma-common.c:495 fsl_edma_fill_tcd() warn: statement has no effect 31
drivers/dma/fsl-edma-common.c:495 fsl_edma_fill_tcd() warn: statement has no effect 31
drivers/dma/fsl-edma-common.c:496 fsl_edma_fill_tcd() warn: statement has no effect 31
drivers/dma/fsl-edma-common.c:496 fsl_edma_fill_tcd() warn: statement has no effect 31
drivers/dma/fsl-edma-common.c:498 fsl_edma_fill_tcd() warn: statement has no effect 31
drivers/dma/fsl-edma-common.c:498 fsl_edma_fill_tcd() warn: statement has no effect 31
drivers/dma/fsl-edma-common.c:500 fsl_edma_fill_tcd() warn: statement has no effect 31
drivers/dma/fsl-edma-common.c:500 fsl_edma_fill_tcd() warn: statement has no effect 31
drivers/dma/fsl-edma-common.c:517 fsl_edma_fill_tcd() warn: statement has no effect 31
drivers/dma/fsl-edma-common.c:517 fsl_edma_fill_tcd() warn: statement has no effect 31
drivers/dma/fsl-edma-common.c:518 fsl_edma_fill_tcd() warn: statement has no effect 31
drivers/dma/fsl-edma-common.c:518 fsl_edma_fill_tcd() warn: statement has no effect 31
drivers/dma/fsl-edma-common.c:520 fsl_edma_fill_tcd() warn: statement has no effect 31
drivers/dma/fsl-edma-common.c:520 fsl_edma_fill_tcd() warn: statement has no effect 31
drivers/dma/fsl-edma-common.c:521 fsl_edma_fill_tcd() warn: statement has no effect 31
drivers/dma/fsl-edma-common.c:521 fsl_edma_fill_tcd() warn: statement has no effect 31
drivers/dma/fsl-edma-common.c:523 fsl_edma_fill_tcd() warn: statement has no effect 31
drivers/dma/fsl-edma-common.c:523 fsl_edma_fill_tcd() warn: statement has no effect 31
drivers/dma/fsl-edma-common.c:525 fsl_edma_fill_tcd() warn: statement has no effect 31
drivers/dma/fsl-edma-common.c:525 fsl_edma_fill_tcd() warn: statement has no effect 31
drivers/dma/fsl-edma-common.c:542 fsl_edma_fill_tcd() warn: statement has no effect 31
drivers/dma/fsl-edma-common.c:542 fsl_edma_fill_tcd() warn: statement has no effect 31

vim +828 drivers/dma/fsl-edma-common.c

9d831528a6567d Angelo Dureghello 2018-08-19  804  
9d831528a6567d Angelo Dureghello 2018-08-19  805  int fsl_edma_alloc_chan_resources(struct dma_chan *chan)
9d831528a6567d Angelo Dureghello 2018-08-19  806  {
9d831528a6567d Angelo Dureghello 2018-08-19  807  	struct fsl_edma_chan *fsl_chan = to_fsl_edma_chan(chan);
cd750c6413ce8a Frank Li          2024-05-31  808  	int ret;
9d831528a6567d Angelo Dureghello 2018-08-19  809  
d8d4355861d874 Joy Zou           2024-03-23  810  	if (fsl_edma_drvflags(fsl_chan) & FSL_EDMA_DRV_HAS_CHCLK)
d8d4355861d874 Joy Zou           2024-03-23  811  		clk_prepare_enable(fsl_chan->clk);
d8d4355861d874 Joy Zou           2024-03-23  812  
9d831528a6567d Angelo Dureghello 2018-08-19  813  	fsl_chan->tcd_pool = dma_pool_create("tcd_pool", chan->device->dev,
de7d9cb3b064fd Frank Li          2023-12-21  814  				fsl_edma_drvflags(fsl_chan) & FSL_EDMA_DRV_TCD64 ?
de7d9cb3b064fd Frank Li          2023-12-21  815  				sizeof(struct fsl_edma_hw_tcd64) : sizeof(struct fsl_edma_hw_tcd),
9d831528a6567d Angelo Dureghello 2018-08-19  816  				32, 0);
cd750c6413ce8a Frank Li          2024-05-31  817  
cd750c6413ce8a Frank Li          2024-05-31  818  	if (fsl_chan->txirq) {
cd750c6413ce8a Frank Li          2024-05-31  819  		ret = request_irq(fsl_chan->txirq, fsl_chan->irq_handler, IRQF_SHARED,
cd750c6413ce8a Frank Li          2024-05-31  820  				 fsl_chan->chan_name, fsl_chan);
cd750c6413ce8a Frank Li          2024-05-31  821  
cd750c6413ce8a Frank Li          2024-05-31  822  		if (ret) {
cd750c6413ce8a Frank Li          2024-05-31  823  			dma_pool_destroy(fsl_chan->tcd_pool);
cd750c6413ce8a Frank Li          2024-05-31  824  			return ret;
cd750c6413ce8a Frank Li          2024-05-31  825  		}
cd750c6413ce8a Frank Li          2024-05-31  826  	}
cd750c6413ce8a Frank Li          2024-05-31  827  
9d831528a6567d Angelo Dureghello 2018-08-19 @828  	return 0;
9d831528a6567d Angelo Dureghello 2018-08-19  829  }
9d831528a6567d Angelo Dureghello 2018-08-19  830  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
