Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE09E14A4D6
	for <oe-kbuild@lists.linux.dev>; Fri, 27 Sep 2024 04:57:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727413080; cv=none; b=Zi4GQxow25WgQZJjahCFFwz990OVlCIhbJXh738pm8LyYPO62xcUd8bQbyu2nkp7vMVQd8quiU2Nj5Wr9ThAcvaE5I/qHwHsxAborL4n2ZmeLPrQuFl6Ez9FHvDtlyoXei+ePTc5X2UspMDoZGa4XnqN0jKxDzuZ0x3G4JJ5wXM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727413080; c=relaxed/simple;
	bh=XQ7AvM39mmVA+aZ1tNdT2EM5VDU+0BgbHOj1LanpHYQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=hMMQuXytyHNVe8q+xg6IeZ0qGS3W9J0Gx2Jngxs5KewT1GUErvZ1lL2zvl1FB/bZaK3dZtErzKr1qmKOfLU1lIDaZSvcu47DFHTkauFf7k0Khc3FzVA63sUR5n0XqHNebCVCGFmP6yNt30OVoWTR0SQt3AprJK6NF/xfeym+jck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=k6rdZhEN; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="k6rdZhEN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727413078; x=1758949078;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=XQ7AvM39mmVA+aZ1tNdT2EM5VDU+0BgbHOj1LanpHYQ=;
  b=k6rdZhENYru7kfv/XLfu8BnFq7Tq2gN+fpmXSylhyzBVUGmFnIjqcWTq
   Z+CavUgHxFCHeAiwzM5gp//aOktl1XktZXeCiwpkrDzP2yHWgbFcT2MMh
   76iO6H0stBsuwzbWq1dETIyuSacLleWW4T4ljDH5OMCMqZHaq4ZURF5Yk
   1QfeOSSzPWF8rWKFlX7GSFEn82JsojIztx3iJvmF5aU1zG/4AQ+uKlLty
   SFTQXATigyPnw4VWdsF3/twpDgTNZk95E20fcbiZKRLqdaVrN88wQNzWk
   haaaFX/kE6I3wrhDw+dSFjPvamTESPCwLMc7/Nt9gXZg9uQaMmQBab7FO
   Q==;
X-CSE-ConnectionGUID: EEsb6YqHQTuXUQQpX3peYQ==
X-CSE-MsgGUID: kv3IG+dGQWiXZfD1Z+4UFg==
X-IronPort-AV: E=McAfee;i="6700,10204,11207"; a="37126754"
X-IronPort-AV: E=Sophos;i="6.11,157,1725346800"; 
   d="scan'208";a="37126754"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Sep 2024 21:57:57 -0700
X-CSE-ConnectionGUID: 9Zb3iA7jQ5qk4QtoIwFmow==
X-CSE-MsgGUID: DkYPlobWSQ2WtMNOLXQDjg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,157,1725346800"; 
   d="scan'208";a="103214637"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 26 Sep 2024 21:57:56 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1su33B-000LUl-31;
	Fri, 27 Sep 2024 04:57:53 +0000
Date: Fri, 27 Sep 2024 12:57:34 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/misc/mrvl_cn10k_dpi.c:231 dpi_queue_init() error:
 uninitialized symbol 'reg'.
Message-ID: <202409271221.3LDHDPch-lkp@intel.com>
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
head:   075dbe9f6e3c21596c5245826a4ee1f1c1676eb8
commit: 5f67eef6dff39421215e9134f1eaae51b67a73b7 misc: mrvl-cn10k-dpi: add Octeon CN10K DPI administrative driver
date:   3 months ago
:::::: branch date: 10 hours ago
:::::: commit date: 3 months ago
config: arm64-randconfig-r072-20240925 (https://download.01.org/0day-ci/archive/20240927/202409271221.3LDHDPch-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202409271221.3LDHDPch-lkp@intel.com/

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
