Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57321154BE
	for <oe-kbuild@lists.linux.dev>; Sat,  9 Dec 2023 20:20:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fQNP/K3R"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702153214; x=1733689214;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=RKvMICc1craYRHJHWYwK7ZGvWVifpK3yspMK1fTX0DI=;
  b=fQNP/K3ReBsTud1Fv+8I7BI8J3rNTvi5BhYprihJulia8mpk90hPocKJ
   wQ0Ism68O+L3E/X4IqBKr89uIdlnkjss/lvpuqEVaIB/Z8aoOOiZT+wGq
   XR0EwSr1DTydKX4rP8UAYIYsgKLhnpApH3tAXDZJmUIkDH+62s0URYP4m
   r7pdkDkeWsnO0Jk09h7rFZ0Qv9+YfgNAgwhgv6wrOa8OWV6rKFuzyDjxC
   BPm9WUcMoaNvwO42JyUTFgM2SKKUnRYO0rafD8/pOp61FekJRQpBnxnIK
   vY5rJaeOJ+qSuaqMVy9/NZBsslCkJDcsflZ3nk2SZiM6OSfFadX+G99DA
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10919"; a="425655721"
X-IronPort-AV: E=Sophos;i="6.04,264,1695711600"; 
   d="scan'208";a="425655721"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Dec 2023 12:20:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,264,1695711600"; 
   d="scan'208";a="13858630"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 09 Dec 2023 12:20:12 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rC3o1-000FtQ-11;
	Sat, 09 Dec 2023 20:20:09 +0000
Date: Sun, 10 Dec 2023 04:20:03 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/edac/synopsys_edac.c:557 intr_handler() error: uninitialized
 symbol 'regval'.
Message-ID: <202312100422.OSo9f6BU-lkp@intel.com>
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
TO: Sai Prakash Ranjan <quic_saipraka@quicinc.com>
CC: Arnd Bergmann <arnd@arndb.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   f2e8a57ee9036c7d5443382b6c3c09b51a92ec7e
commit: 548927e0312194167f7ee5de47d50c2036088cce arm64: io: Use asm-generic high level MMIO accessors
date:   1 year, 6 months ago
:::::: branch date: 24 hours ago
:::::: commit date: 1 year, 6 months ago
config: arm64-randconfig-r081-20231127 (https://download.01.org/0day-ci/archive/20231210/202312100422.OSo9f6BU-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project.git f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce: (https://download.01.org/0day-ci/archive/20231210/202312100422.OSo9f6BU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202312100422.OSo9f6BU-lkp@intel.com/

smatch warnings:
drivers/edac/synopsys_edac.c:557 intr_handler() error: uninitialized symbol 'regval'.

vim +/regval +557 drivers/edac/synopsys_edac.c

ae9b56e3996dad Punnaiah Choudary Kalluri 2015-01-06  516  
b500b4a029d577 Manish Narani             2018-10-25  517  /**
b500b4a029d577 Manish Narani             2018-10-25  518   * intr_handler - Interrupt Handler for ECC interrupts.
b500b4a029d577 Manish Narani             2018-10-25  519   * @irq:        IRQ number.
b500b4a029d577 Manish Narani             2018-10-25  520   * @dev_id:     Device ID.
b500b4a029d577 Manish Narani             2018-10-25  521   *
b500b4a029d577 Manish Narani             2018-10-25  522   * Return: IRQ_NONE, if interrupt not set or IRQ_HANDLED otherwise.
b500b4a029d577 Manish Narani             2018-10-25  523   */
b500b4a029d577 Manish Narani             2018-10-25  524  static irqreturn_t intr_handler(int irq, void *dev_id)
b500b4a029d577 Manish Narani             2018-10-25  525  {
b500b4a029d577 Manish Narani             2018-10-25  526  	const struct synps_platform_data *p_data;
b500b4a029d577 Manish Narani             2018-10-25  527  	struct mem_ctl_info *mci = dev_id;
b500b4a029d577 Manish Narani             2018-10-25  528  	struct synps_edac_priv *priv;
b500b4a029d577 Manish Narani             2018-10-25  529  	int status, regval;
b500b4a029d577 Manish Narani             2018-10-25  530  
b500b4a029d577 Manish Narani             2018-10-25  531  	priv = mci->pvt_info;
b500b4a029d577 Manish Narani             2018-10-25  532  	p_data = priv->p_data;
b500b4a029d577 Manish Narani             2018-10-25  533  
f7824ded41491d Dinh Nguyen               2021-10-12  534  	/*
f7824ded41491d Dinh Nguyen               2021-10-12  535  	 * v3.0 of the controller has the ce/ue bits cleared automatically,
f7824ded41491d Dinh Nguyen               2021-10-12  536  	 * so this condition does not apply.
f7824ded41491d Dinh Nguyen               2021-10-12  537  	 */
f7824ded41491d Dinh Nguyen               2021-10-12  538  	if (!(priv->p_data->quirks & DDR_ECC_INTR_SELF_CLEAR)) {
b500b4a029d577 Manish Narani             2018-10-25  539  		regval = readl(priv->baseaddr + DDR_QOS_IRQ_STAT_OFST);
b500b4a029d577 Manish Narani             2018-10-25  540  		regval &= (DDR_QOSCE_MASK | DDR_QOSUE_MASK);
b500b4a029d577 Manish Narani             2018-10-25  541  		if (!(regval & ECC_CE_UE_INTR_MASK))
b500b4a029d577 Manish Narani             2018-10-25  542  			return IRQ_NONE;
f7824ded41491d Dinh Nguyen               2021-10-12  543  	}
b500b4a029d577 Manish Narani             2018-10-25  544  
b500b4a029d577 Manish Narani             2018-10-25  545  	status = p_data->get_error_info(priv);
b500b4a029d577 Manish Narani             2018-10-25  546  	if (status)
b500b4a029d577 Manish Narani             2018-10-25  547  		return IRQ_NONE;
b500b4a029d577 Manish Narani             2018-10-25  548  
b500b4a029d577 Manish Narani             2018-10-25  549  	priv->ce_cnt += priv->stat.ce_cnt;
b500b4a029d577 Manish Narani             2018-10-25  550  	priv->ue_cnt += priv->stat.ue_cnt;
b500b4a029d577 Manish Narani             2018-10-25  551  	handle_error(mci, &priv->stat);
b500b4a029d577 Manish Narani             2018-10-25  552  
b500b4a029d577 Manish Narani             2018-10-25  553  	edac_dbg(3, "Total error count CE %d UE %d\n",
b500b4a029d577 Manish Narani             2018-10-25  554  		 priv->ce_cnt, priv->ue_cnt);
f7824ded41491d Dinh Nguyen               2021-10-12  555  	/* v3.0 of the controller does not have this register */
f7824ded41491d Dinh Nguyen               2021-10-12  556  	if (!(priv->p_data->quirks & DDR_ECC_INTR_SELF_CLEAR))
b500b4a029d577 Manish Narani             2018-10-25 @557  		writel(regval, priv->baseaddr + DDR_QOS_IRQ_STAT_OFST);
b500b4a029d577 Manish Narani             2018-10-25  558  	return IRQ_HANDLED;
b500b4a029d577 Manish Narani             2018-10-25  559  }
b500b4a029d577 Manish Narani             2018-10-25  560  

:::::: The code at line 557 was first introduced by commit
:::::: b500b4a029d577c6b5f3d7480ef2635dd1f30a55 EDAC, synopsys: Add ECC support for ZynqMP DDR controller

:::::: TO: Manish Narani <manish.narani@xilinx.com>
:::::: CC: Borislav Petkov <bp@suse.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
