Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8907D1F461D
	for <oe-kbuild@lists.linux.dev>; Sun, 25 Jan 2026 16:23:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769358196; cv=none; b=JycavoUj7rBP5izRGeuxNItMosdT/HdUvKVZTaXBbYMe+t/3ikzYfcbgDn96DP/wuq4Ke46i27WNjefNJosb+tmMrGhdQx+b8xoK/1b6KfS7un4z6i6bWyD1DqaOGuutqH+PehJsNSotWhdI1MRqH9KMb/kQ/VHtrS3Zk+j0GGY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769358196; c=relaxed/simple;
	bh=E+t1nnA2yIIGkmql+cNs3zcsIFxHNkb9EY6zs4PGE/E=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ANstBDAam+W9JzgsKWWoGOle0QQJgoeGc/Dydcv49rlqFFi/6OdjtiYC2EaVeoqZcJY25YPqPSTR4/jVKAzlUiYeInUOl29mvSc4nO3rqiYQqBpqpQDB3WPM878YLplE0QR9MS9JYkwaGmiSfhqS5K/iZiMvmOwRvQG8dHWa/qw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KMtLWsDc; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KMtLWsDc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769358195; x=1800894195;
  h=date:from:to:cc:subject:message-id;
  bh=E+t1nnA2yIIGkmql+cNs3zcsIFxHNkb9EY6zs4PGE/E=;
  b=KMtLWsDcs3MpOM+13y0ZASfpTWqx4RiTsbmS3klbn1vtDuWfRKBLWetE
   IpGGkrXPUAq13KXaoL6YkEhWjOdLGfPPBhHtDasAQ1qlseq71blQjinDl
   ml8zxKuS/MI9jAVE41wPyE777NTcgp5PecSVsJGPDuWnursPiBJlVGZE9
   U0NueQKGyXS1l4mvxm16ND4KPR8qO4GzEWHj2VDlQsC7qDdaNYe44xKp9
   kLHmPm/oHspKMmUjp2FTdA9kHQr5SZXp6ZRfvdc6u/6oWeRFnMmYSNqLO
   Tty1sO9PNkwyxWZI/00YN/GUmYfR1WCOoaA0HjQdHA5xtIPVOF4WWQvjN
   Q==;
X-CSE-ConnectionGUID: cwU6o74mQHeMyw3V3srLFg==
X-CSE-MsgGUID: lZbHivNbQDejjLwmYpP38g==
X-IronPort-AV: E=McAfee;i="6800,10657,11682"; a="69571677"
X-IronPort-AV: E=Sophos;i="6.21,253,1763452800"; 
   d="scan'208";a="69571677"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jan 2026 08:23:14 -0800
X-CSE-ConnectionGUID: LkoKwCkNSs6opzevlsvGvw==
X-CSE-MsgGUID: rTo78DiZSAy/c2NIjd+xVg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,253,1763452800"; 
   d="scan'208";a="207379935"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 25 Jan 2026 08:23:13 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vk2tK-00000000WBI-3Ocm;
	Sun, 25 Jan 2026 16:23:10 +0000
Date: Mon, 26 Jan 2026 00:22:14 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [dinguyen:socfpga_sd6hc_support_v1 4/11]
 drivers/mmc/host/sdhci-cadence6.c:956 sdhci_cdns6_hw_reset() warn: potential
 ! vs ~ typo
Message-ID: <202601260038.9v4gbyGL-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Tanmay Kathpalia <tanmay.kathpalia@altera.com>
CC: Dinh Nguyen <dinguyen@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dinguyen/linux.git socfpga_sd6hc_support_v1
head:   a79ac29af37c6923eb8f16457c8d10a545fbcc61
commit: d7c721b1149a4f280ca061566acc95b52df2d351 [4/11] mmc: sdhci-cadence: add Cadence SD6HC support
:::::: branch date: 5 days ago
:::::: commit date: 5 days ago
config: i386-randconfig-r071-20260125 (https://download.01.org/0day-ci/archive/20260126/202601260038.9v4gbyGL-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
smatch version: v0.5.0-8994-gd50c5a4c

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202601260038.9v4gbyGL-lkp@intel.com/

smatch warnings:
drivers/mmc/host/sdhci-cadence6.c:956 sdhci_cdns6_hw_reset() warn: potential ! vs ~ typo

vim +956 drivers/mmc/host/sdhci-cadence6.c

d7c721b1149a4f2 Tanmay Kathpalia 2026-01-18  947  
d7c721b1149a4f2 Tanmay Kathpalia 2026-01-18  948  void sdhci_cdns6_hw_reset(struct sdhci_host *host)
d7c721b1149a4f2 Tanmay Kathpalia 2026-01-18  949  {
d7c721b1149a4f2 Tanmay Kathpalia 2026-01-18  950  	struct sdhci_cdns_priv *priv = sdhci_cdns_get_priv(host);
d7c721b1149a4f2 Tanmay Kathpalia 2026-01-18  951  	void __iomem *reg;
d7c721b1149a4f2 Tanmay Kathpalia 2026-01-18  952  
d7c721b1149a4f2 Tanmay Kathpalia 2026-01-18  953  	reg = priv->hrs_addr + SDHCI_CDNS_HRS11;
d7c721b1149a4f2 Tanmay Kathpalia 2026-01-18  954  	writel(SDHCI_CDNS_HRS11_EMMC_RST, reg);
d7c721b1149a4f2 Tanmay Kathpalia 2026-01-18  955  	udelay(9);
d7c721b1149a4f2 Tanmay Kathpalia 2026-01-18 @956  	writel(!SDHCI_CDNS_HRS11_EMMC_RST, reg);

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
