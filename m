Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52DA72798FE
	for <oe-kbuild@lists.linux.dev>; Wed, 20 Aug 2025 09:57:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755683831; cv=none; b=jkupnqAHKxAzZrP8nPIPTKTvvjdq9BDxBHIt8DU+dpNOzV7tAoFgMSiAqlnQqkgovu2lD9HK6K92TE8ge4W2QJoj25oKtSNFAuNE1qJLBfCHFbE82zD3AYwtI0/rhaGdB4JbzELtwGRjJgbOhZksPBfFl5m1j+HO3X8TQQIbIY4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755683831; c=relaxed/simple;
	bh=ERCDnXF+euyBiesIMPAPCqZEmvpwQDMGgLbxGYMFIkE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=lDJ3/IcI1YkS89mzh2a01imAh6ErftEi++A87fkj4RJCIlUz/xpb2fm+QPBpAZ1AJcMI47NlQ1YGDwFweH6AqVz85t3lsOSLPRX3MPI5BYP6dTH3uxdOcwZLgmaDjxvA3k/VirrxWOi3kXn6J1yR8p0cuSSBDq/fOiYT9w8Bfxo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RnJqrwgW; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RnJqrwgW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755683829; x=1787219829;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=ERCDnXF+euyBiesIMPAPCqZEmvpwQDMGgLbxGYMFIkE=;
  b=RnJqrwgWGoiIzkQ+JGfLM56wXQ7UVZdoxRQazYUgYeLYq3y00uXbstar
   4P2zJRrSzf4+lQ3Y2Kz9FvRAHjr1vZgnXeBxNDu8Mx33LcHaJIAqHyGDV
   b7i1qgnTOSOZ3AzxxH0jbcHL7JrM5uXcqLwkJw4OkUuj1AbOVg64QoV0l
   S51oLH0TARg2YV/hGehHsQ8WdvVEvUAgSG+APGD+iN15AmU+n1vvTJioL
   pAXWVgij6krUIgZ+q6pAky2gO9UpPetzTbffc9fe2cv1shyDMTy14DsTa
   xH0YSZV728gHeLXDwpgYrXnfkMuGCk/7F5cXaSag/26gIfRYrYe4v+M4Y
   Q==;
X-CSE-ConnectionGUID: Uc6U8tRhTj+5R3gyUPrNNA==
X-CSE-MsgGUID: dWNfTidSSay+6r07NzdvRA==
X-IronPort-AV: E=McAfee;i="6800,10657,11527"; a="58010899"
X-IronPort-AV: E=Sophos;i="6.17,302,1747724400"; 
   d="scan'208";a="58010899"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Aug 2025 02:57:09 -0700
X-CSE-ConnectionGUID: 04oU+fDrTWaRUVCpzu2ERQ==
X-CSE-MsgGUID: jIaygiqoTa6ic7+7mctAmg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,302,1747724400"; 
   d="scan'208";a="167707885"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by orviesa009.jf.intel.com with ESMTP; 20 Aug 2025 02:57:08 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uofYy-000Iop-2x;
	Wed, 20 Aug 2025 09:57:01 +0000
Date: Wed, 20 Aug 2025 17:56:43 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 3308/3631] drivers/mmc/host/sdhci-cadence.c:297
 sdhci_cdns_tune_blkgap() error: uninitialized symbol 'hrs37_mode'.
Message-ID: <202508201717.XTR5uRFP-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: "Benoît Monin" <benoit.monin@bootlin.com>
CC: Ulf Hansson <ulf.hansson@linaro.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   5303936d609e09665deda94eaedf26a0e5c3a087
commit: 60613a8b9b8187d789750423132ad7664ca448c9 [3308/3631] mmc: sdhci-cadence: implement multi-block read gap tuning
:::::: branch date: 5 hours ago
:::::: commit date: 21 hours ago
config: i386-randconfig-141-20250820 (https://download.01.org/0day-ci/archive/20250820/202508201717.XTR5uRFP-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14+deb12u1) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202508201717.XTR5uRFP-lkp@intel.com/

smatch warnings:
drivers/mmc/host/sdhci-cadence.c:297 sdhci_cdns_tune_blkgap() error: uninitialized symbol 'hrs37_mode'.

vim +/hrs37_mode +297 drivers/mmc/host/sdhci-cadence.c

ff6af28faff53a Masahiro Yamada 2016-12-08  271  
60613a8b9b8187 Benoît Monin    2025-08-18  272  /**
60613a8b9b8187 Benoît Monin    2025-08-18  273   * sdhci_cdns_tune_blkgap() - tune multi-block read gap
60613a8b9b8187 Benoît Monin    2025-08-18  274   * @mmc: MMC host
60613a8b9b8187 Benoît Monin    2025-08-18  275   *
60613a8b9b8187 Benoît Monin    2025-08-18  276   * Tune delay used in multi block read. To do so,
60613a8b9b8187 Benoît Monin    2025-08-18  277   * try sending multi-block read command with incremented gap, unless
60613a8b9b8187 Benoît Monin    2025-08-18  278   * it succeeds.
60613a8b9b8187 Benoît Monin    2025-08-18  279   *
60613a8b9b8187 Benoît Monin    2025-08-18  280   * Return: error code
60613a8b9b8187 Benoît Monin    2025-08-18  281   */
60613a8b9b8187 Benoît Monin    2025-08-18  282  static int sdhci_cdns_tune_blkgap(struct mmc_host *mmc)
60613a8b9b8187 Benoît Monin    2025-08-18  283  {
60613a8b9b8187 Benoît Monin    2025-08-18  284  	struct sdhci_host *host = mmc_priv(mmc);
60613a8b9b8187 Benoît Monin    2025-08-18  285  	struct sdhci_pltfm_host *pltfm_host = sdhci_priv(host);
60613a8b9b8187 Benoît Monin    2025-08-18  286  	struct sdhci_cdns_priv *priv = sdhci_pltfm_priv(pltfm_host);
60613a8b9b8187 Benoît Monin    2025-08-18  287  	void __iomem *hrs37_reg = priv->hrs_addr + SDHCI_CDNS_HRS37;
60613a8b9b8187 Benoît Monin    2025-08-18  288  	void __iomem *hrs38_reg = priv->hrs_addr + SDHCI_CDNS_HRS38;
60613a8b9b8187 Benoît Monin    2025-08-18  289  	int ret;
60613a8b9b8187 Benoît Monin    2025-08-18  290  	u32 gap;
60613a8b9b8187 Benoît Monin    2025-08-18  291  	u32 hrs37_mode;
60613a8b9b8187 Benoît Monin    2025-08-18  292  
60613a8b9b8187 Benoît Monin    2025-08-18  293  	/* Currently only needed in HS200 mode */
60613a8b9b8187 Benoît Monin    2025-08-18  294  	if (host->timing != MMC_TIMING_MMC_HS200)
60613a8b9b8187 Benoît Monin    2025-08-18  295  		return 0;
60613a8b9b8187 Benoît Monin    2025-08-18  296  
60613a8b9b8187 Benoît Monin    2025-08-18 @297  	writel(hrs37_mode, hrs37_reg);
60613a8b9b8187 Benoît Monin    2025-08-18  298  
60613a8b9b8187 Benoît Monin    2025-08-18  299  	for (gap = 0; gap <= SDHCI_CDNS_HRS38_BLKGAP_MAX; gap++) {
60613a8b9b8187 Benoît Monin    2025-08-18  300  		writel(gap, hrs38_reg);
60613a8b9b8187 Benoît Monin    2025-08-18  301  		ret = mmc_read_tuning(mmc, 512, 32);
60613a8b9b8187 Benoît Monin    2025-08-18  302  		if (!ret)
60613a8b9b8187 Benoît Monin    2025-08-18  303  			break;
60613a8b9b8187 Benoît Monin    2025-08-18  304  	}
60613a8b9b8187 Benoît Monin    2025-08-18  305  
60613a8b9b8187 Benoît Monin    2025-08-18  306  	dev_dbg(mmc_dev(mmc), "read block gap tune %s, gap %d\n", ret ? "failed" : "OK", gap);
60613a8b9b8187 Benoît Monin    2025-08-18  307  	return ret;
60613a8b9b8187 Benoît Monin    2025-08-18  308  }
60613a8b9b8187 Benoît Monin    2025-08-18  309  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
