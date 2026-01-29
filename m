Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19E6B270568
	for <oe-kbuild@lists.linux.dev>; Thu, 29 Jan 2026 03:17:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769656625; cv=none; b=d1jtI3zBXvbsfxvxfSmF9kc3/JN+2qVMYaAZA7Ya+bHtATkv8HCyl/YS6ME5j7hdBW7Ja1iP9h/I+q4k+mtMZuZlo9/9haLRA9RcILbLiy3swMwX9writT696ncPIhD0SLSxqJwCny+vW0z3hCUn1haM6G1jOR2OBg9jbSsmiGE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769656625; c=relaxed/simple;
	bh=xmcGD7qk+iR4SZcT0l2QbUH5OKtiy2JQkA7wjkR/FsY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=FU8mk1mcQ8agNIKYqVqiE8PlB1E0qS0eYFU+Haw7F0N6K9TCTJdDslmq9H74DyeduKrLKU/2kHbpPuaBKDoWZeGFBNvzIR55XUdfUujFqsbAaW5aK95lVkoyQXshfkDsB3mZLh7cUr5wjopaVJOQMbwGL7Dd/urr31T8lAhApYE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IycQHiLa; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IycQHiLa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769656622; x=1801192622;
  h=date:from:to:cc:subject:message-id;
  bh=xmcGD7qk+iR4SZcT0l2QbUH5OKtiy2JQkA7wjkR/FsY=;
  b=IycQHiLaqtH1hiooDAEd4NRwWfmW6EhBNoAJsVkGOBuduet0u3M2Oi6B
   aa9bsHxZlI76ubED5NY3c1KcixQz7Fl9VWIGCbixWdTctrE+Ye7Xmoazh
   RpVmuyB34zic+5lQggJ+sb+R5083CFe9xzGz2rHsPlNVwsIG9TApUF6Wc
   lxzTTzuv/7E7QLS3JfCyQJ2OJXbx/yboUESODClTaUsezsBxD33PoBJS1
   /RFi+P0XBADix6FT9BrlJvwv2XWxrkBO6dfojfmCUmjQTlwOJ1K7GiYwY
   ACA/OsEsqQxC7aIDDgF8f6okITNMUbkQy6hZQddnorYey6Y8l3aVHFQ/r
   A==;
X-CSE-ConnectionGUID: vSqKWoFxRDSiyu7vq4PsBw==
X-CSE-MsgGUID: Z7CtYicpSaOItHSk54YprQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11685"; a="81200196"
X-IronPort-AV: E=Sophos;i="6.21,260,1763452800"; 
   d="scan'208";a="81200196"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jan 2026 19:17:02 -0800
X-CSE-ConnectionGUID: m3Rv0RPCRpG98TcPDqzJOA==
X-CSE-MsgGUID: zdNO3brlRfeT6y+pDvBkaA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,260,1763452800"; 
   d="scan'208";a="208341584"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 28 Jan 2026 19:17:00 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vlIWg-00000000b25-153h;
	Thu, 29 Jan 2026 03:16:58 +0000
Date: Thu, 29 Jan 2026 11:16:24 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 9377/10321]
 drivers/mmc/host/dw_mmc.c:3525 dw_mci_runtime_resume() warn: 'host->ciu_clk'
 from clk_prepare_enable() not released on lines: 3485.
Message-ID: <202601291122.uVs6PRtR-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Shawn Lin <shawn.lin@rock-chips.com>
CC: Ulf Hansson <ulf.hansson@linaro.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   3f24e4edcd1b8981c6b448ea2680726dedd87279
commit: d9346fb36d84a25637a4c35f485945715c188e67 [9377/10321] mmc: dw_mmc-pltfm: use modern PM macros
:::::: branch date: 11 hours ago
:::::: commit date: 2 days ago
config: alpha-randconfig-r073-20260129 (https://download.01.org/0day-ci/archive/20260129/202601291122.uVs6PRtR-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 8.5.0
smatch version: v0.5.0-8994-gd50c5a4c

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202601291122.uVs6PRtR-lkp@intel.com/

New smatch warnings:
drivers/mmc/host/dw_mmc.c:3525 dw_mci_runtime_resume() warn: 'host->ciu_clk' from clk_prepare_enable() not released on lines: 3485.

Old smatch warnings:
internal error: arch/alpha/include/asm/io_trivial.h:70 SQL error #2: near "and": syntax error
internal error: arch/alpha/include/asm/io_trivial.h:70 SQL: 'select * from return_states where  and type = 1044 and parameter = -1 and key = '$' limit 1;'
drivers/mmc/host/dw_mmc.c:3525 dw_mci_runtime_resume() warn: 'host->biu_clk' from clk_prepare_enable() not released on lines: 3485,3525.

vim +3525 drivers/mmc/host/dw_mmc.c

f95f3850f7a9e1d Will Newton    2011-01-02  3459  
ed24e1ff5ae3d74 Shawn Lin      2016-10-12  3460  int dw_mci_runtime_resume(struct device *dev)
f95f3850f7a9e1d Will Newton    2011-01-02  3461  {
b23475faed77f6a Jaehoon Chung  2017-06-05  3462  	int ret = 0;
ed24e1ff5ae3d74 Shawn Lin      2016-10-12  3463  	struct dw_mci *host = dev_get_drvdata(dev);
f95f3850f7a9e1d Will Newton    2011-01-02  3464  
49482ab5d2af65c Shawn Lin      2025-12-20  3465  	if (mmc_host_can_gpio_cd(host->mmc) ||
49482ab5d2af65c Shawn Lin      2025-12-20  3466  	     !mmc_card_is_removable(host->mmc)) {
ed24e1ff5ae3d74 Shawn Lin      2016-10-12  3467  		ret = clk_prepare_enable(host->biu_clk);
ed24e1ff5ae3d74 Shawn Lin      2016-10-12  3468  		if (ret)
e61cf1184d72e57 Jaehoon Chung  2011-03-17  3469  			return ret;
e61cf1184d72e57 Jaehoon Chung  2011-03-17  3470  	}
e61cf1184d72e57 Jaehoon Chung  2011-03-17  3471  
ed24e1ff5ae3d74 Shawn Lin      2016-10-12  3472  	ret = clk_prepare_enable(host->ciu_clk);
ed24e1ff5ae3d74 Shawn Lin      2016-10-12  3473  	if (ret)
df9bcc2bc0a1f8d Joonyoung Shim 2016-11-25  3474  		goto err;
df9bcc2bc0a1f8d Joonyoung Shim 2016-11-25  3475  
df9bcc2bc0a1f8d Joonyoung Shim 2016-11-25  3476  	if (!dw_mci_ctrl_reset(host, SDMMC_CTRL_ALL_RESET_FLAGS)) {
df9bcc2bc0a1f8d Joonyoung Shim 2016-11-25  3477  		clk_disable_unprepare(host->ciu_clk);
df9bcc2bc0a1f8d Joonyoung Shim 2016-11-25  3478  		ret = -ENODEV;
df9bcc2bc0a1f8d Joonyoung Shim 2016-11-25  3479  		goto err;
df9bcc2bc0a1f8d Joonyoung Shim 2016-11-25  3480  	}
ed24e1ff5ae3d74 Shawn Lin      2016-10-12  3481  
345e83fda3f5dc7 Shawn Lin      2026-01-06  3482  	if (host->use_dma && host->dma_ops->init) {
345e83fda3f5dc7 Shawn Lin      2026-01-06  3483  		ret = host->dma_ops->init(host);
345e83fda3f5dc7 Shawn Lin      2026-01-06  3484  		if (ret)
345e83fda3f5dc7 Shawn Lin      2026-01-06  3485  			return ret;
345e83fda3f5dc7 Shawn Lin      2026-01-06  3486  	}
141a712a4eb0963 Seungwon Jeon  2012-05-22  3487  
524268990e54dab Seungwon Jeon  2013-08-31  3488  	/*
524268990e54dab Seungwon Jeon  2013-08-31  3489  	 * Restore the initial value at FIFOTH register
524268990e54dab Seungwon Jeon  2013-08-31  3490  	 * And Invalidate the prev_blksz with zero
524268990e54dab Seungwon Jeon  2013-08-31  3491  	 */
e61cf1184d72e57 Jaehoon Chung  2011-03-17  3492  	mci_writel(host, FIFOTH, host->fifoth_val);
524268990e54dab Seungwon Jeon  2013-08-31  3493  	host->prev_blksz = 0;
e61cf1184d72e57 Jaehoon Chung  2011-03-17  3494  
2eb2944fa7d1470 Doug Anderson  2013-08-31  3495  	/* Put in max timeout */
2eb2944fa7d1470 Doug Anderson  2013-08-31  3496  	mci_writel(host, TMOUT, 0xFFFFFFFF);
2eb2944fa7d1470 Doug Anderson  2013-08-31  3497  
e61cf1184d72e57 Jaehoon Chung  2011-03-17  3498  	mci_writel(host, RINTSTS, 0xFFFFFFFF);
e61cf1184d72e57 Jaehoon Chung  2011-03-17  3499  	mci_writel(host, INTMASK, SDMMC_INT_CMD_DONE | SDMMC_INT_DATA_OVER |
e61cf1184d72e57 Jaehoon Chung  2011-03-17  3500  		   SDMMC_INT_TXDR | SDMMC_INT_RXDR |
fa0c328343c6314 Doug Anderson  2015-02-25  3501  		   DW_MCI_ERROR_FLAGS);
e61cf1184d72e57 Jaehoon Chung  2011-03-17  3502  	mci_writel(host, CTRL, SDMMC_CTRL_INT_ENABLE);
e61cf1184d72e57 Jaehoon Chung  2011-03-17  3503  
0e3a22c044478b6 Shawn Lin      2015-08-03  3504  
49482ab5d2af65c Shawn Lin      2025-12-20  3505  	if (host->mmc->pm_flags & MMC_PM_KEEP_POWER)
1183d1cfc7058b5 Shawn Lin      2025-12-16  3506  		dw_mci_set_ios(host->mmc, &host->mmc->ios);
e9748e0364fe82d Ziyuan Xu      2017-01-17  3507  
e9748e0364fe82d Ziyuan Xu      2017-01-17  3508  	/* Force setup bus to guarantee available clock output */
49482ab5d2af65c Shawn Lin      2025-12-20  3509  	dw_mci_setup_bus(host, true);
fa0c328343c6314 Doug Anderson  2015-02-25  3510  
7c526608d5afb62 Ulf Hansson    2019-09-08  3511  	/* Re-enable SDIO interrupts. */
1183d1cfc7058b5 Shawn Lin      2025-12-16  3512  	if (sdio_irq_claimed(host->mmc))
49482ab5d2af65c Shawn Lin      2025-12-20  3513  		__dw_mci_enable_sdio_irq(host, 1);
7c526608d5afb62 Ulf Hansson    2019-09-08  3514  
49482ab5d2af65c Shawn Lin      2025-12-20  3515  	/* Now that host is setup, we can enable card detect */
fa0c328343c6314 Doug Anderson  2015-02-25  3516  	dw_mci_enable_cd(host);
fa0c328343c6314 Doug Anderson  2015-02-25  3517  
df9bcc2bc0a1f8d Joonyoung Shim 2016-11-25  3518  	return 0;
df9bcc2bc0a1f8d Joonyoung Shim 2016-11-25  3519  
df9bcc2bc0a1f8d Joonyoung Shim 2016-11-25  3520  err:
49482ab5d2af65c Shawn Lin      2025-12-20  3521  	if (mmc_host_can_gpio_cd(host->mmc) ||
49482ab5d2af65c Shawn Lin      2025-12-20  3522  	     !mmc_card_is_removable(host->mmc))
df9bcc2bc0a1f8d Joonyoung Shim 2016-11-25  3523  		clk_disable_unprepare(host->biu_clk);
df9bcc2bc0a1f8d Joonyoung Shim 2016-11-25  3524  
1f5c51d76e8f304 Shawn Lin      2016-10-12 @3525  	return ret;
1f5c51d76e8f304 Shawn Lin      2016-10-12  3526  }
e9ed8835e990474 Shawn Lin      2016-10-12  3527  EXPORT_SYMBOL(dw_mci_runtime_resume);
6fe8890d0200ea0 Jaehoon Chung  2011-12-08  3528  

:::::: The code at line 3525 was first introduced by commit
:::::: 1f5c51d76e8f3040fd5c2e711d5760d696281307 mmc: dw_mmc: disable biu clk if possible

:::::: TO: Shawn Lin <shawn.lin@rock-chips.com>
:::::: CC: Ulf Hansson <ulf.hansson@linaro.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
