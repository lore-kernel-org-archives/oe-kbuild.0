Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 956A51991DB
	for <oe-kbuild@lists.linux.dev>; Mon,  9 Dec 2024 04:57:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733720264; cv=none; b=a8qb70EttMJmHUErRaNZ7LjSfgiUo8LKM7oAeN5y8cVuOhLcd1pspfz7ddVoTkfS7IXvzSoo6C+ErfivfkJRS7eeetnsaK2PIyxkI0+CKWggAaD6WtDr2rC5EqTr7IDIcuoc71QpKqvpTOZERi1UFAPnc3n+3zGKknhp4r1boDQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733720264; c=relaxed/simple;
	bh=X9JL55Y7JnZFCSMEULYKwH3f0iDmQ0yXqqPJTch5V5U=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=FbtLkCBj4ZwTGXqOwdugAYrN6tsJrBKa3pY7TJe/tR91EcZusRD2UfgZkerDZcNsbIBrOG5drjlHczVjeL12FpV06JU2+v8YFZFJIENn9yuo6GSvdz6t3PM/Je5azKCKMsmyviXmYGr+yJLXN8E+mL4E977NIgBC3qpaZ3irHu4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nPun6WQX; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nPun6WQX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733720262; x=1765256262;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=X9JL55Y7JnZFCSMEULYKwH3f0iDmQ0yXqqPJTch5V5U=;
  b=nPun6WQXEI5+MxfbbWzpI29Nl3takD+QZ271JFAst5kpo4Pjh+D3uHjP
   rV286zgYLfmFN52rT81VRD/mzhtqk709XwWDezQ/H11xsYfASGFK/Jytk
   8ucSDobkzyKbvwChTSFjOyzVt0a720s4QO0aU31atTdh9dWFrbbbRzO2r
   abxW62oCoCCqy61DLbVjZAyogiXaFlCUfqavZPtyyXVvvgv5ACAc9YCfL
   2DcxNYtHx16IhYaRLE2FRiEAHsoPcBhugIggnZk3Mbt7wIS8uIWTuj/p0
   NzUtm2mIMlSngLBy13oPj9ZHD8EjVGVzUihqkB/lcUfpaRCgWOAPeCvp5
   g==;
X-CSE-ConnectionGUID: CU7QJ2MPQ4KXtba4/BmAeA==
X-CSE-MsgGUID: P6BH7SeSQGSPC7xXpp94Hw==
X-IronPort-AV: E=McAfee;i="6700,10204,11280"; a="45016259"
X-IronPort-AV: E=Sophos;i="6.12,218,1728975600"; 
   d="scan'208";a="45016259"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Dec 2024 20:57:42 -0800
X-CSE-ConnectionGUID: NV9OLPAvSb6T+pjBUG96gg==
X-CSE-MsgGUID: ayrLJ8c3TNalAIXkmmQLWA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,218,1728975600"; 
   d="scan'208";a="94830413"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 08 Dec 2024 20:57:40 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tKVpy-0003wj-1G;
	Mon, 09 Dec 2024 04:57:38 +0000
Date: Mon, 9 Dec 2024 12:56:46 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/misc/mrvl_cn10k_dpi.c:231 dpi_queue_init() error:
 uninitialized symbol 'reg'.
Message-ID: <202412090848.aNybV8pK-lkp@intel.com>
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
TO: Vamsi Attunuru <vattunuru@marvell.com>
CC: Srujana Challa <schalla@marvell.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   fac04efc5c793dccbd07e2d59af9f90b7fc0dca4
commit: 5f67eef6dff39421215e9134f1eaae51b67a73b7 misc: mrvl-cn10k-dpi: add Octeon CN10K DPI administrative driver
date:   5 months ago
:::::: branch date: 2 hours ago
:::::: commit date: 5 months ago
config: s390-randconfig-r071-20241208 (https://download.01.org/0day-ci/archive/20241209/202412090848.aNybV8pK-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202412090848.aNybV8pK-lkp@intel.com/

smatch warnings:
drivers/misc/mrvl_cn10k_dpi.c:231 dpi_queue_init() error: uninitialized symbol 'reg'.

vim +/reg +231 drivers/misc/mrvl_cn10k_dpi.c

5f67eef6dff3942 Vamsi Attunuru 2024-07-06  208  
5f67eef6dff3942 Vamsi Attunuru 2024-07-06  209  static int dpi_queue_init(struct dpipf *dpi, struct dpipf_vf *dpivf, u8 vf)
5f67eef6dff3942 Vamsi Attunuru 2024-07-06  210  {
5f67eef6dff3942 Vamsi Attunuru 2024-07-06  211  	u16 sso_pf_func = dpivf->vf_config.sso_pf_func;
5f67eef6dff3942 Vamsi Attunuru 2024-07-06  212  	u16 npa_pf_func = dpivf->vf_config.npa_pf_func;
5f67eef6dff3942 Vamsi Attunuru 2024-07-06  213  	u16 csize = dpivf->vf_config.csize;
5f67eef6dff3942 Vamsi Attunuru 2024-07-06  214  	u32 aura = dpivf->vf_config.aura;
5f67eef6dff3942 Vamsi Attunuru 2024-07-06  215  	unsigned long timeout;
5f67eef6dff3942 Vamsi Attunuru 2024-07-06  216  	u64 reg;
5f67eef6dff3942 Vamsi Attunuru 2024-07-06  217  
5f67eef6dff3942 Vamsi Attunuru 2024-07-06  218  	dpi_reg_write(dpi, DPI_DMAX_QRST(vf), DPI_DMA_QRST);
5f67eef6dff3942 Vamsi Attunuru 2024-07-06  219  
5f67eef6dff3942 Vamsi Attunuru 2024-07-06  220  	/* Wait for a maximum of 3 sec */
5f67eef6dff3942 Vamsi Attunuru 2024-07-06  221  	timeout = jiffies + msecs_to_jiffies(3000);
5f67eef6dff3942 Vamsi Attunuru 2024-07-06  222  	while (!time_after(jiffies, timeout)) {
5f67eef6dff3942 Vamsi Attunuru 2024-07-06  223  		reg = dpi_reg_read(dpi, DPI_DMAX_QRST(vf));
5f67eef6dff3942 Vamsi Attunuru 2024-07-06  224  		if (!(reg & DPI_DMA_QRST))
5f67eef6dff3942 Vamsi Attunuru 2024-07-06  225  			break;
5f67eef6dff3942 Vamsi Attunuru 2024-07-06  226  
5f67eef6dff3942 Vamsi Attunuru 2024-07-06  227  		/* Reset would take time for the request cache to drain */
5f67eef6dff3942 Vamsi Attunuru 2024-07-06  228  		usleep_range(500, 1000);
5f67eef6dff3942 Vamsi Attunuru 2024-07-06  229  	}
5f67eef6dff3942 Vamsi Attunuru 2024-07-06  230  
5f67eef6dff3942 Vamsi Attunuru 2024-07-06 @231  	if (reg & DPI_DMA_QRST) {
5f67eef6dff3942 Vamsi Attunuru 2024-07-06  232  		dev_err(&dpi->pdev->dev, "Queue reset failed\n");
5f67eef6dff3942 Vamsi Attunuru 2024-07-06  233  		return -EBUSY;
5f67eef6dff3942 Vamsi Attunuru 2024-07-06  234  	}
5f67eef6dff3942 Vamsi Attunuru 2024-07-06  235  
5f67eef6dff3942 Vamsi Attunuru 2024-07-06  236  	dpi_reg_write(dpi, DPI_DMAX_IDS2(vf), 0);
5f67eef6dff3942 Vamsi Attunuru 2024-07-06  237  	dpi_reg_write(dpi, DPI_DMAX_IDS(vf), 0);
5f67eef6dff3942 Vamsi Attunuru 2024-07-06  238  
5f67eef6dff3942 Vamsi Attunuru 2024-07-06  239  	reg = DPI_DMA_IBUFF_CSIZE_CSIZE(csize) | DPI_DMA_IBUFF_CSIZE_NPA_FREE;
5f67eef6dff3942 Vamsi Attunuru 2024-07-06  240  	dpi_reg_write(dpi, DPI_DMAX_IBUFF_CSIZE(vf), reg);
5f67eef6dff3942 Vamsi Attunuru 2024-07-06  241  
5f67eef6dff3942 Vamsi Attunuru 2024-07-06  242  	reg = dpi_reg_read(dpi, DPI_DMAX_IDS2(vf));
5f67eef6dff3942 Vamsi Attunuru 2024-07-06  243  	reg |= DPI_DMA_IDS2_INST_AURA(aura);
5f67eef6dff3942 Vamsi Attunuru 2024-07-06  244  	dpi_reg_write(dpi, DPI_DMAX_IDS2(vf), reg);
5f67eef6dff3942 Vamsi Attunuru 2024-07-06  245  
5f67eef6dff3942 Vamsi Attunuru 2024-07-06  246  	reg = dpi_reg_read(dpi, DPI_DMAX_IDS(vf));
5f67eef6dff3942 Vamsi Attunuru 2024-07-06  247  	reg |= DPI_DMA_IDS_DMA_NPA_PF_FUNC(npa_pf_func);
5f67eef6dff3942 Vamsi Attunuru 2024-07-06  248  	reg |= DPI_DMA_IDS_DMA_SSO_PF_FUNC(sso_pf_func);
5f67eef6dff3942 Vamsi Attunuru 2024-07-06  249  	reg |= DPI_DMA_IDS_DMA_STRM(vf + 1);
5f67eef6dff3942 Vamsi Attunuru 2024-07-06  250  	reg |= DPI_DMA_IDS_INST_STRM(vf + 1);
5f67eef6dff3942 Vamsi Attunuru 2024-07-06  251  	dpi_reg_write(dpi, DPI_DMAX_IDS(vf), reg);
5f67eef6dff3942 Vamsi Attunuru 2024-07-06  252  
5f67eef6dff3942 Vamsi Attunuru 2024-07-06  253  	return 0;
5f67eef6dff3942 Vamsi Attunuru 2024-07-06  254  }
5f67eef6dff3942 Vamsi Attunuru 2024-07-06  255  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
