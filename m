Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B00B18953F
	for <oe-kbuild@lists.linux.dev>; Mon, 12 Aug 2024 18:51:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723488713; cv=none; b=kAGT0m0jKpXP4VY1/Olt+udoLTIypHScVRRA8C66LK/GqfK2g8kmlJe4w/9PUcu7RryY2PWIsQ34g/BRKF1s2bT7+cVf60NJo8oiPFp3KyJj0bfGUPZKXKjG9wiJsTRRBEzhd0VeM7a8+GN+j5ArEEpvj8qqH10zO7gWMjYLn7c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723488713; c=relaxed/simple;
	bh=YInAwC14QQlY/IgdMJJmjYKPArXKu1y5IAsTPaldncU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=UWIoPrTiOh86xHwHM79NGJIP1/MgD1idlWFHorR/xPia+xNpsQUJxIfcvQCZd4oonyb7XAv9x4z368vycJsofCkCdABgtGMJLGUWNjFUZM2U64fLjQU5/jsrQRR/VVtszAcnf87uO5BZ+r+5LRtZ9BuefkMna02qruWkA7heDaY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Mmb2iAzx; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Mmb2iAzx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723488711; x=1755024711;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=YInAwC14QQlY/IgdMJJmjYKPArXKu1y5IAsTPaldncU=;
  b=Mmb2iAzxo0jH5psYiDvEitP4mcTnQKZivTH3XuWrK+LQlM/0Nv/5EiAb
   jcXp4y8HgsTUQtiTwOEL6sor5hOE9Asw3DhfL4DPrJ4ioCmhDrCGO/ySa
   q4Ir5SlhNwUEENOMgN5LJBi+9h91ETy0y+oawtTrRJv5QNzVNxxR49Co4
   pQRZeEnc9RU/jzdrMhGYwZ79pslcMqnAd+lKUmTemN679AEHdtmKDZQty
   xWtvIDV/f0NWqM1++q3ZWqOtxzvKr83PCuzJUevxklCwz9V0I4Qwab2BM
   gIr9WNFZZw+IHqh0loni8rp+Re6qxHBsypezKHLVuVmzPT0mmEoNyJklB
   A==;
X-CSE-ConnectionGUID: 0rXVYaW3RdWtEML7tBj9Rw==
X-CSE-MsgGUID: gBgJGCeaS/ipH/D7n/AkcQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11162"; a="21181335"
X-IronPort-AV: E=Sophos;i="6.09,283,1716274800"; 
   d="scan'208";a="21181335"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Aug 2024 11:51:50 -0700
X-CSE-ConnectionGUID: EIiCNXhSRvqET+WaxF5Tow==
X-CSE-MsgGUID: s8SSk3CERSufeIh5Eph/Cg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,283,1716274800"; 
   d="scan'208";a="58601542"
Received: from unknown (HELO b6bf6c95bbab) ([10.239.97.151])
  by orviesa006.jf.intel.com with ESMTP; 12 Aug 2024 11:51:50 -0700
Received: from kbuild by b6bf6c95bbab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sda8x-000C4n-08;
	Mon, 12 Aug 2024 18:51:47 +0000
Date: Tue, 13 Aug 2024 02:51:02 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/misc/mrvl_cn10k_dpi.c:231 dpi_queue_init() error:
 uninitialized symbol 'reg'.
Message-ID: <202408130248.lLDrBrk0-lkp@intel.com>
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
head:   d74da846046aeec9333e802f5918bd3261fb5509
commit: 5f67eef6dff39421215e9134f1eaae51b67a73b7 misc: mrvl-cn10k-dpi: add Octeon CN10K DPI administrative driver
date:   5 weeks ago
:::::: branch date: 3 hours ago
:::::: commit date: 5 weeks ago
config: alpha-randconfig-r072-20240812 (https://download.01.org/0day-ci/archive/20240813/202408130248.lLDrBrk0-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.3.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202408130248.lLDrBrk0-lkp@intel.com/

smatch warnings:
drivers/misc/mrvl_cn10k_dpi.c:231 dpi_queue_init() error: uninitialized symbol 'reg'.

vim +/reg +231 drivers/misc/mrvl_cn10k_dpi.c

5f67eef6dff394 Vamsi Attunuru 2024-07-06  208  
5f67eef6dff394 Vamsi Attunuru 2024-07-06  209  static int dpi_queue_init(struct dpipf *dpi, struct dpipf_vf *dpivf, u8 vf)
5f67eef6dff394 Vamsi Attunuru 2024-07-06  210  {
5f67eef6dff394 Vamsi Attunuru 2024-07-06  211  	u16 sso_pf_func = dpivf->vf_config.sso_pf_func;
5f67eef6dff394 Vamsi Attunuru 2024-07-06  212  	u16 npa_pf_func = dpivf->vf_config.npa_pf_func;
5f67eef6dff394 Vamsi Attunuru 2024-07-06  213  	u16 csize = dpivf->vf_config.csize;
5f67eef6dff394 Vamsi Attunuru 2024-07-06  214  	u32 aura = dpivf->vf_config.aura;
5f67eef6dff394 Vamsi Attunuru 2024-07-06  215  	unsigned long timeout;
5f67eef6dff394 Vamsi Attunuru 2024-07-06  216  	u64 reg;
5f67eef6dff394 Vamsi Attunuru 2024-07-06  217  
5f67eef6dff394 Vamsi Attunuru 2024-07-06  218  	dpi_reg_write(dpi, DPI_DMAX_QRST(vf), DPI_DMA_QRST);
5f67eef6dff394 Vamsi Attunuru 2024-07-06  219  
5f67eef6dff394 Vamsi Attunuru 2024-07-06  220  	/* Wait for a maximum of 3 sec */
5f67eef6dff394 Vamsi Attunuru 2024-07-06  221  	timeout = jiffies + msecs_to_jiffies(3000);
5f67eef6dff394 Vamsi Attunuru 2024-07-06  222  	while (!time_after(jiffies, timeout)) {
5f67eef6dff394 Vamsi Attunuru 2024-07-06  223  		reg = dpi_reg_read(dpi, DPI_DMAX_QRST(vf));
5f67eef6dff394 Vamsi Attunuru 2024-07-06  224  		if (!(reg & DPI_DMA_QRST))
5f67eef6dff394 Vamsi Attunuru 2024-07-06  225  			break;
5f67eef6dff394 Vamsi Attunuru 2024-07-06  226  
5f67eef6dff394 Vamsi Attunuru 2024-07-06  227  		/* Reset would take time for the request cache to drain */
5f67eef6dff394 Vamsi Attunuru 2024-07-06  228  		usleep_range(500, 1000);
5f67eef6dff394 Vamsi Attunuru 2024-07-06  229  	}
5f67eef6dff394 Vamsi Attunuru 2024-07-06  230  
5f67eef6dff394 Vamsi Attunuru 2024-07-06 @231  	if (reg & DPI_DMA_QRST) {
5f67eef6dff394 Vamsi Attunuru 2024-07-06  232  		dev_err(&dpi->pdev->dev, "Queue reset failed\n");
5f67eef6dff394 Vamsi Attunuru 2024-07-06  233  		return -EBUSY;
5f67eef6dff394 Vamsi Attunuru 2024-07-06  234  	}
5f67eef6dff394 Vamsi Attunuru 2024-07-06  235  
5f67eef6dff394 Vamsi Attunuru 2024-07-06  236  	dpi_reg_write(dpi, DPI_DMAX_IDS2(vf), 0);
5f67eef6dff394 Vamsi Attunuru 2024-07-06  237  	dpi_reg_write(dpi, DPI_DMAX_IDS(vf), 0);
5f67eef6dff394 Vamsi Attunuru 2024-07-06  238  
5f67eef6dff394 Vamsi Attunuru 2024-07-06  239  	reg = DPI_DMA_IBUFF_CSIZE_CSIZE(csize) | DPI_DMA_IBUFF_CSIZE_NPA_FREE;
5f67eef6dff394 Vamsi Attunuru 2024-07-06  240  	dpi_reg_write(dpi, DPI_DMAX_IBUFF_CSIZE(vf), reg);
5f67eef6dff394 Vamsi Attunuru 2024-07-06  241  
5f67eef6dff394 Vamsi Attunuru 2024-07-06  242  	reg = dpi_reg_read(dpi, DPI_DMAX_IDS2(vf));
5f67eef6dff394 Vamsi Attunuru 2024-07-06  243  	reg |= DPI_DMA_IDS2_INST_AURA(aura);
5f67eef6dff394 Vamsi Attunuru 2024-07-06  244  	dpi_reg_write(dpi, DPI_DMAX_IDS2(vf), reg);
5f67eef6dff394 Vamsi Attunuru 2024-07-06  245  
5f67eef6dff394 Vamsi Attunuru 2024-07-06  246  	reg = dpi_reg_read(dpi, DPI_DMAX_IDS(vf));
5f67eef6dff394 Vamsi Attunuru 2024-07-06  247  	reg |= DPI_DMA_IDS_DMA_NPA_PF_FUNC(npa_pf_func);
5f67eef6dff394 Vamsi Attunuru 2024-07-06  248  	reg |= DPI_DMA_IDS_DMA_SSO_PF_FUNC(sso_pf_func);
5f67eef6dff394 Vamsi Attunuru 2024-07-06  249  	reg |= DPI_DMA_IDS_DMA_STRM(vf + 1);
5f67eef6dff394 Vamsi Attunuru 2024-07-06  250  	reg |= DPI_DMA_IDS_INST_STRM(vf + 1);
5f67eef6dff394 Vamsi Attunuru 2024-07-06  251  	dpi_reg_write(dpi, DPI_DMAX_IDS(vf), reg);
5f67eef6dff394 Vamsi Attunuru 2024-07-06  252  
5f67eef6dff394 Vamsi Attunuru 2024-07-06  253  	return 0;
5f67eef6dff394 Vamsi Attunuru 2024-07-06  254  }
5f67eef6dff394 Vamsi Attunuru 2024-07-06  255  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
