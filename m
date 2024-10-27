Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2D5A14B941
	for <oe-kbuild@lists.linux.dev>; Sun, 27 Oct 2024 11:00:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730026807; cv=none; b=bM1ZjgqT+DgtdURaOb+jM3epD4dI8yCFOBY50jBgCYlUCIOEbnsj1Whik296jCzrYZ8y2sXam8KCVLPbme84z75hDPvJ1eWGvk+E4u9ijLLrMhLdoWjlgPw4ga3K6yrIta/SyBmSJ6qh1ZtEFQWdoJXPIuOhfB35LrkJa4PwEwY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730026807; c=relaxed/simple;
	bh=WZHqsnqyPFZvzPgrg0yKlZox3BunKLfVn9PoycOeUqE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jO/own8tiE44zMJ9d0hNp4HI9VuhW3oF9P+8rWhmvaZo9HOjJrTrp++s+NTU/JoSQHgGDX3FZ87WEAlCuJzLCf7nUgPoR6y11/YUEyhUTXS0dml3MvBcupVYaDXMBKxT40Zdbl6zypgL7y6E74PE98qhGz06c1+CDWfWjwfiKwA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AJlW5aDK; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AJlW5aDK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730026805; x=1761562805;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=WZHqsnqyPFZvzPgrg0yKlZox3BunKLfVn9PoycOeUqE=;
  b=AJlW5aDKxisDQuxr94LI1yvmItpsmxqbhfVGNpU4Qk/kT8o9qWM/V0VK
   c7JjWb2qaIfKJt0IxV8lmtip7Eg/pEt1FpiRmVDAuaHM4oMXBtrf4WCiA
   5pWw36En9MI3WDo1sLuJfgFS9c/GbtnwnNu1KNQIyRV6sZ3MNLggXHfFD
   cvDOnP6I49q3g2g18K7IUsrYojl+hB1YEKUeA1+JckySe19hqEquwlkDm
   X0D1DcDiH8y2bQ5oY7k3PVhrU9rfFXB1f8DCa3o8Ok+xJYJ5RUO3G/ciH
   73AkBvXtW0riQ/7f5eCfyxU4UmIzcI7OWkyQJa7RK8ftwix3Qtnz728FA
   w==;
X-CSE-ConnectionGUID: ALtQIq2HTaer0GvY7Vncpg==
X-CSE-MsgGUID: fzbYCaRRT56k28p3fZLu3w==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="29504689"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="29504689"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2024 04:00:05 -0700
X-CSE-ConnectionGUID: RA5RTtnsTfi5/E7u7dPptw==
X-CSE-MsgGUID: mVDNOzqSSUiirwZQJSQtxA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,236,1725346800"; 
   d="scan'208";a="81502661"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 27 Oct 2024 04:00:03 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t5104-000adQ-1v;
	Sun, 27 Oct 2024 11:00:00 +0000
Date: Sun, 27 Oct 2024 18:59:15 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [ulfh-mmc:next 49/61] drivers/mmc/host/sdhci-uhs2.c:436
 sdhci_uhs2_do_detect_init() error: we previously assumed 'host->ops' could
 be null (see line 416)
Message-ID: <202410271835.tqz9s9JV-lkp@intel.com>
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
TO: Ben Chuang <ben.chuang@genesyslogic.com.tw>
CC: Ulf Hansson <ulf.hansson@linaro.org>
CC: AKASHI Takahiro <takahiro.akashi@linaro.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ulfh/mmc.git next
head:   3c0946b6a378fb92658aabcda5c70ea3e83143bf
commit: 379e4dc5b68a6642fc13b94543be33307ed09704 [49/61] mmc: sdhci-uhs2: add pre-detect_init hook
:::::: branch date: 2 days ago
:::::: commit date: 3 days ago
config: arm-randconfig-r071-20241027 (https://download.01.org/0day-ci/archive/20241027/202410271835.tqz9s9JV-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202410271835.tqz9s9JV-lkp@intel.com/

smatch warnings:
drivers/mmc/host/sdhci-uhs2.c:436 sdhci_uhs2_do_detect_init() error: we previously assumed 'host->ops' could be null (see line 416)

vim +436 drivers/mmc/host/sdhci-uhs2.c

4f412f7918048c Victor Shih 2024-10-18  409  
4f412f7918048c Victor Shih 2024-10-18  410  static int sdhci_uhs2_do_detect_init(struct mmc_host *mmc)
4f412f7918048c Victor Shih 2024-10-18  411  {
4f412f7918048c Victor Shih 2024-10-18  412  	struct sdhci_host *host = mmc_priv(mmc);
4f412f7918048c Victor Shih 2024-10-18  413  
4f412f7918048c Victor Shih 2024-10-18  414  	DBG("Begin do uhs2 detect init.\n");
4f412f7918048c Victor Shih 2024-10-18  415  
379e4dc5b68a66 Ben Chuang  2024-10-18 @416  	if (host->ops && host->ops->uhs2_pre_detect_init)
379e4dc5b68a66 Ben Chuang  2024-10-18  417  		host->ops->uhs2_pre_detect_init(host);
379e4dc5b68a66 Ben Chuang  2024-10-18  418  
4f412f7918048c Victor Shih 2024-10-18  419  	if (sdhci_uhs2_interface_detect(host)) {
4f412f7918048c Victor Shih 2024-10-18  420  		pr_warn("%s: cannot detect UHS2 interface.\n", mmc_hostname(host->mmc));
4f412f7918048c Victor Shih 2024-10-18  421  		return -EIO;
4f412f7918048c Victor Shih 2024-10-18  422  	}
4f412f7918048c Victor Shih 2024-10-18  423  
4f412f7918048c Victor Shih 2024-10-18  424  	if (sdhci_uhs2_init(host)) {
4f412f7918048c Victor Shih 2024-10-18  425  		pr_warn("%s: UHS2 init fail.\n", mmc_hostname(host->mmc));
4f412f7918048c Victor Shih 2024-10-18  426  		return -EIO;
4f412f7918048c Victor Shih 2024-10-18  427  	}
4f412f7918048c Victor Shih 2024-10-18  428  
4f412f7918048c Victor Shih 2024-10-18  429  	/* Init complete, do soft reset and enable UHS2 error irqs. */
4f412f7918048c Victor Shih 2024-10-18  430  	sdhci_uhs2_reset(host, SDHCI_UHS2_SW_RESET_SD);
4f412f7918048c Victor Shih 2024-10-18  431  	sdhci_uhs2_clear_set_irqs(host, SDHCI_INT_ALL_MASK, SDHCI_UHS2_INT_ERROR_MASK);
4f412f7918048c Victor Shih 2024-10-18  432  	/*
4f412f7918048c Victor Shih 2024-10-18  433  	 * N.B SDHCI_INT_ENABLE and SDHCI_SIGNAL_ENABLE was cleared
4f412f7918048c Victor Shih 2024-10-18  434  	 * by SDHCI_UHS2_SW_RESET_SD
4f412f7918048c Victor Shih 2024-10-18  435  	 */
4f412f7918048c Victor Shih 2024-10-18 @436  	sdhci_writel(host, host->ier, SDHCI_INT_ENABLE);
4f412f7918048c Victor Shih 2024-10-18  437  	sdhci_writel(host, host->ier, SDHCI_SIGNAL_ENABLE);
4f412f7918048c Victor Shih 2024-10-18  438  
4f412f7918048c Victor Shih 2024-10-18  439  	return 0;
4f412f7918048c Victor Shih 2024-10-18  440  }
4f412f7918048c Victor Shih 2024-10-18  441  

:::::: The code at line 436 was first introduced by commit
:::::: 4f412f7918048c5fc55274658e0c14011adbebe8 mmc: sdhci-uhs2: add related functions to initialize the interface

:::::: TO: Victor Shih <victor.shih@genesyslogic.com.tw>
:::::: CC: Ulf Hansson <ulf.hansson@linaro.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
