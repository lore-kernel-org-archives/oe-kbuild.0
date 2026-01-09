Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5ABA513D539
	for <oe-kbuild@lists.linux.dev>; Fri,  9 Jan 2026 20:32:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767990764; cv=none; b=MD6JOk/091AYVMF12s4gkSRuLWQVqyVtmEDUKN+hJENFhP0cQoWCRJnkKWvCLuJsEKKthYIMiGj5Ff0J6+gRBkt02N1NT8D1MZ3yDBJfCgP1hpTecpmmqDVm8v4lXKpX3CI7MpTicrdoQ2mp7aQpL/mbk+z+18U/2dvU5W+aMKw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767990764; c=relaxed/simple;
	bh=xGZ6hGvTGyQsCg9Ym1TuhX2xEEn2gB2uuXQioPUp2Rk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=gmoAIPJhqPM2c8csR5GKzdXq+aRh2RAw5o09VArko7N0rpZLrLZ/PpEWalTOtnZE9oZt+pMd1x7xutk94ZMbMqwRfqxghhpZdFnleJwwNxXHI+GT68xJiuU/IK8/XjAXKpPA+kgx8PkU1zLcdCfueg2ueYycOta5G2DUFwdWcK8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=POk2jmRE; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="POk2jmRE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767990764; x=1799526764;
  h=date:from:to:cc:subject:message-id;
  bh=xGZ6hGvTGyQsCg9Ym1TuhX2xEEn2gB2uuXQioPUp2Rk=;
  b=POk2jmREG5y0mr+NodsPPULrdZYBL3tT/SbiDKwTSCzU4H1eeux9WUx3
   Ag7N9dfoFqCjQ0tSMbzMisYtutCEJ3/kEIfbWZEbmCUwjEHaYaJMBEyD8
   f3l/1W1SOZ7pbafR6ue4H2jdeMdawTOEfR0NlaaDyfIgvetUt0Q7i7KMM
   lQaVBQyNVM8lqSvIgU5MvkPc+0eCLr5aWhNUZWi2SV/xnG5C2GV1komnT
   +gRFms5rOr4p80QXzHzjs+gGEdKuPD4nAiIZQOvn9vQKLS5NXB9Er7JBc
   Wg44iboUd2t4Zx2TeYfx5oWlrSKA1o+gtn0yA75aehCNi0YKsKqi7Gj68
   w==;
X-CSE-ConnectionGUID: roInjftVQ0uOcYHN07fdJw==
X-CSE-MsgGUID: 1X1a+YspQKWwCCmoau6K9g==
X-IronPort-AV: E=McAfee;i="6800,10657,11666"; a="69359432"
X-IronPort-AV: E=Sophos;i="6.21,214,1763452800"; 
   d="scan'208";a="69359432"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jan 2026 12:32:43 -0800
X-CSE-ConnectionGUID: JW2fcDedTaejtIM0tW8hZw==
X-CSE-MsgGUID: VijycHvoRdOvq0Y4dofXRg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,214,1763452800"; 
   d="scan'208";a="204340387"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 09 Jan 2026 12:32:41 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1veJ9z-000000007hY-2aes;
	Fri, 09 Jan 2026 20:32:39 +0000
Date: Sat, 10 Jan 2026 04:32:20 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [android-common:android15-6.6 4/4]
 drivers/ufs/core/ufshcd.c:5399 ufshcd_uic_cmd_compl() error: we previously
 assumed 'cmd' could be null (see line 5389)
Message-ID: <202601100423.k4lcqJtI-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: cros-kernel-buildreports@googlegroups.com

tree:   https://android.googlesource.com/kernel/common android15-6.6
head:   ab8dd06cde55677f939e0642df31f06126d507d4
commit: 4c0eff913df7b0583209fdaff1b33ff8c913dbaa [4/4] FROMLIST: scsi: ufs: core: Make ufshcd_uic_cmd_compl() easier to read
:::::: branch date: 19 hours ago
:::::: commit date: 1 year, 5 months ago
config: x86_64-randconfig-161-20260109 (https://download.01.org/0day-ci/archive/20260110/202601100423.k4lcqJtI-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
smatch version: v0.5.0-8985-g2614ff1a

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202601100423.k4lcqJtI-lkp@intel.com/

New smatch warnings:
drivers/ufs/core/ufshcd.c:5399 ufshcd_uic_cmd_compl() error: we previously assumed 'cmd' could be null (see line 5389)

Old smatch warnings:
drivers/ufs/core/ufshcd.c:1467 ufshcd_devfreq_target() error: uninitialized symbol 'scale_up'.
drivers/ufs/core/ufshcd.c:9203 ufshcd_setup_clocks() warn: 'clki->clk' from clk_prepare_enable() not released on lines: 9183.

vim +/cmd +5399 drivers/ufs/core/ufshcd.c

a45f937110fa6b drivers/scsi/ufs/ufshcd.c Can Guo               2021-05-24  5369  
6ccf44fe4cd7c4 drivers/scsi/ufs/ufshcd.c Seungwon Jeon         2013-06-26  5370  /**
6ccf44fe4cd7c4 drivers/scsi/ufs/ufshcd.c Seungwon Jeon         2013-06-26  5371   * ufshcd_uic_cmd_compl - handle completion of uic command
6ccf44fe4cd7c4 drivers/scsi/ufs/ufshcd.c Seungwon Jeon         2013-06-26  5372   * @hba: per adapter instance
53b3d9c3fdda94 drivers/scsi/ufs/ufshcd.c Seungwon Jeon         2013-08-31  5373   * @intr_status: interrupt status generated by the controller
9333d77573485c drivers/scsi/ufs/ufshcd.c Venkat Gopalakrishnan 2019-11-14  5374   *
3a17fefe0f1960 drivers/ufs/core/ufshcd.c Bart Van Assche       2023-07-27  5375   * Return:
9333d77573485c drivers/scsi/ufs/ufshcd.c Venkat Gopalakrishnan 2019-11-14  5376   *  IRQ_HANDLED - If interrupt is valid
9333d77573485c drivers/scsi/ufs/ufshcd.c Venkat Gopalakrishnan 2019-11-14  5377   *  IRQ_NONE    - If invalid interrupt
6ccf44fe4cd7c4 drivers/scsi/ufs/ufshcd.c Seungwon Jeon         2013-06-26  5378   */
9333d77573485c drivers/scsi/ufs/ufshcd.c Venkat Gopalakrishnan 2019-11-14  5379  static irqreturn_t ufshcd_uic_cmd_compl(struct ufs_hba *hba, u32 intr_status)
6ccf44fe4cd7c4 drivers/scsi/ufs/ufshcd.c Seungwon Jeon         2013-06-26  5380  {
9333d77573485c drivers/scsi/ufs/ufshcd.c Venkat Gopalakrishnan 2019-11-14  5381  	irqreturn_t retval = IRQ_NONE;
4c0eff913df7b0 drivers/ufs/core/ufshcd.c Bart Van Assche       2024-08-21  5382  	struct uic_command *cmd;
9333d77573485c drivers/scsi/ufs/ufshcd.c Venkat Gopalakrishnan 2019-11-14  5383  
a45f937110fa6b drivers/scsi/ufs/ufshcd.c Can Guo               2021-05-24  5384  	spin_lock(hba->host->host_lock);
4c0eff913df7b0 drivers/ufs/core/ufshcd.c Bart Van Assche       2024-08-21  5385  	cmd = hba->active_uic_cmd;
a45f937110fa6b drivers/scsi/ufs/ufshcd.c Can Guo               2021-05-24  5386  	if (ufshcd_is_auto_hibern8_error(hba, intr_status))
a45f937110fa6b drivers/scsi/ufs/ufshcd.c Can Guo               2021-05-24  5387  		hba->errors |= (UFSHCD_UIC_HIBERN8_MASK & intr_status);
a45f937110fa6b drivers/scsi/ufs/ufshcd.c Can Guo               2021-05-24  5388  
4c0eff913df7b0 drivers/ufs/core/ufshcd.c Bart Van Assche       2024-08-21 @5389  	if (intr_status & UIC_COMMAND_COMPL && cmd) {
4c0eff913df7b0 drivers/ufs/core/ufshcd.c Bart Van Assche       2024-08-21  5390  		cmd->argument2 |= ufshcd_get_uic_cmd_result(hba);
4c0eff913df7b0 drivers/ufs/core/ufshcd.c Bart Van Assche       2024-08-21  5391  		cmd->argument3 = ufshcd_get_dme_attr_val(hba);
0f52fcb99ea273 drivers/scsi/ufs/ufshcd.c Can Guo               2020-11-02  5392  		if (!hba->uic_async_done)
4c0eff913df7b0 drivers/ufs/core/ufshcd.c Bart Van Assche       2024-08-21  5393  			cmd->cmd_active = 0;
4c0eff913df7b0 drivers/ufs/core/ufshcd.c Bart Van Assche       2024-08-21  5394  		complete(&cmd->done);
9333d77573485c drivers/scsi/ufs/ufshcd.c Venkat Gopalakrishnan 2019-11-14  5395  		retval = IRQ_HANDLED;
6ccf44fe4cd7c4 drivers/scsi/ufs/ufshcd.c Seungwon Jeon         2013-06-26  5396  	}
53b3d9c3fdda94 drivers/scsi/ufs/ufshcd.c Seungwon Jeon         2013-08-31  5397  
4c0eff913df7b0 drivers/ufs/core/ufshcd.c Bart Van Assche       2024-08-21  5398  	if (intr_status & UFSHCD_UIC_PWR_MASK && hba->uic_async_done) {
4c0eff913df7b0 drivers/ufs/core/ufshcd.c Bart Van Assche       2024-08-21 @5399  		cmd->cmd_active = 0;
57d104c153d3d6 drivers/scsi/ufs/ufshcd.c Subhash Jadavani      2014-09-25  5400  		complete(hba->uic_async_done);
9333d77573485c drivers/scsi/ufs/ufshcd.c Venkat Gopalakrishnan 2019-11-14  5401  		retval = IRQ_HANDLED;
9333d77573485c drivers/scsi/ufs/ufshcd.c Venkat Gopalakrishnan 2019-11-14  5402  	}
aa5c697988b4c7 drivers/scsi/ufs/ufshcd.c Stanley Chu           2020-06-15  5403  
aa5c697988b4c7 drivers/scsi/ufs/ufshcd.c Stanley Chu           2020-06-15  5404  	if (retval == IRQ_HANDLED)
4c0eff913df7b0 drivers/ufs/core/ufshcd.c Bart Van Assche       2024-08-21  5405  		ufshcd_add_uic_command_trace(hba, cmd, UFS_CMD_COMP);
a45f937110fa6b drivers/scsi/ufs/ufshcd.c Can Guo               2021-05-24  5406  	spin_unlock(hba->host->host_lock);
9333d77573485c drivers/scsi/ufs/ufshcd.c Venkat Gopalakrishnan 2019-11-14  5407  	return retval;
6ccf44fe4cd7c4 drivers/scsi/ufs/ufshcd.c Seungwon Jeon         2013-06-26  5408  }
6ccf44fe4cd7c4 drivers/scsi/ufs/ufshcd.c Seungwon Jeon         2013-06-26  5409  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
