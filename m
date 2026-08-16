Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F3DC282F30
	for <oe-kbuild@lists.linux.dev>; Sun, 16 Aug 2026 12:08:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786882082; cv=none; b=fu9+bR7ulq7Plq0hrczCj5zyto+j4iUvY2R2z4dnpekWKmvsiFSJpE2ylZjVSOXGag74ODQQttBeP0IuBr4770X8GZgm3/i1bwAUDnCr+8r0k22m94Bi3IpVHS1koo2E4uLxY6cCM920gxxIfZNVFasE0ro78/G+XiFD0lGQYyU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786882082; c=relaxed/simple;
	bh=aYaJpoz8he/FGKy+hMRoR5MHsz9xfDiR3HIu8VEILRc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=FZA/DieALCcjV1Se3mk0eyOq8X7s2oQoXd0gKihml7Rmqps7KXN904Zt88F9VxlDpOxiFNskFeK61RgTYJXxM069dM0DFPiA23ztbcVlin7gObhlsUls8uMGSReu97s3PKISK4mZaFutiIm8k+4bN79MKzN45HIrx3wsZmh2Nzo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=L4Alwxc8; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="L4Alwxc8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786882081; x=1818418081;
  h=date:from:to:cc:subject:message-id;
  bh=aYaJpoz8he/FGKy+hMRoR5MHsz9xfDiR3HIu8VEILRc=;
  b=L4Alwxc8pefyfuNiGLv0nLP4PnD2MuQ6WBsgVydnZmhlgcjJLJM+hsPd
   A+TvYec8x0z5ZCMgvTC4q57jzKZGZxC3MXXNqTVKfjcRdhkaExTvMzPrA
   Gw4GrGYx1pamTpPlBfX3QAMgqfnFGSqF6BuPS52Ge3OCPuNffO7konfAf
   iie+yUFAjOhfDtPFePDVJSbIxtFqsGVRa/YF/wyWFCsPOxS5P8J2iCv6k
   iFijZB0e0KLRi8O/gHKvPSrZvuuBDZuVVPHIf/hdPz6noVrfI2pKBqR2O
   qMVaxJZwAnM2n9h+JIKnhUpcKdshkYZHzHfzVupTEws7kHB9V13xA0Iaf
   Q==;
X-CSE-ConnectionGUID: aDu5WY8GSt+FCA1iFD1W/Q==
X-CSE-MsgGUID: lsm+llDzSQ21dChdXJ7r6Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11876"; a="110168581"
X-IronPort-AV: E=Sophos;i="6.25,226,1779174000"; 
   d="scan'208";a="110168581"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Aug 2026 05:08:00 -0700
X-CSE-ConnectionGUID: Lc1v2tggTDW5FlO0oJ1NIg==
X-CSE-MsgGUID: Eq5cvxBqQHiVB5C+YmNZZA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,226,1779174000"; 
   d="scan'208";a="258455020"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 16 Aug 2026 05:07:58 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wvZee-00000000csY-12dF;
	Sun, 16 Aug 2026 12:07:56 +0000
Date: Sun, 16 Aug 2026 20:07:47 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [android-common:android15-6.6 2/2]
 drivers/ufs/core/ufshcd.c:5399 ufshcd_uic_cmd_compl() error: we previously
 assumed 'cmd' could be null (see line 5389)
Message-ID: <202608162020.7MXG8FW0-lkp@intel.com>
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
head:   24c059d9e217f32d61570fdbd7eb66bc999657a9
commit: 4c0eff913df7b0583209fdaff1b33ff8c913dbaa [2/2] FROMLIST: scsi: ufs: core: Make ufshcd_uic_cmd_compl() easier to read
:::::: branch date: 33 hours ago
:::::: commit date: 2 years ago
config: i386-randconfig-141-20260816 (https://download.01.org/0day-ci/archive/20260816/202608162020.7MXG8FW0-lkp@intel.com/config)
compiler: clang version 22.1.3 (https://github.com/llvm/llvm-project e9846648fd6183ee6d8cbdb4502213fcf902a211)
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202608162020.7MXG8FW0-lkp@intel.com/

New smatch warnings:
drivers/ufs/core/ufshcd.c:5399 ufshcd_uic_cmd_compl() error: we previously assumed 'cmd' could be null (see line 5389)

Old smatch warnings:
drivers/ufs/core/ufshcd.c:9203 ufshcd_setup_clocks() warn: 'clki->clk' from clk_prepare_enable() not released on lines: 9183.

vim +/cmd +5399 drivers/ufs/core/ufshcd.c

a45f937110fa6b0 drivers/scsi/ufs/ufshcd.c Can Guo               2021-05-24  5369  
6ccf44fe4cd7c45 drivers/scsi/ufs/ufshcd.c Seungwon Jeon         2013-06-26  5370  /**
6ccf44fe4cd7c45 drivers/scsi/ufs/ufshcd.c Seungwon Jeon         2013-06-26  5371   * ufshcd_uic_cmd_compl - handle completion of uic command
6ccf44fe4cd7c45 drivers/scsi/ufs/ufshcd.c Seungwon Jeon         2013-06-26  5372   * @hba: per adapter instance
53b3d9c3fdda94d drivers/scsi/ufs/ufshcd.c Seungwon Jeon         2013-08-31  5373   * @intr_status: interrupt status generated by the controller
9333d77573485c8 drivers/scsi/ufs/ufshcd.c Venkat Gopalakrishnan 2019-11-14  5374   *
3a17fefe0f1960d drivers/ufs/core/ufshcd.c Bart Van Assche       2023-07-27  5375   * Return:
9333d77573485c8 drivers/scsi/ufs/ufshcd.c Venkat Gopalakrishnan 2019-11-14  5376   *  IRQ_HANDLED - If interrupt is valid
9333d77573485c8 drivers/scsi/ufs/ufshcd.c Venkat Gopalakrishnan 2019-11-14  5377   *  IRQ_NONE    - If invalid interrupt
6ccf44fe4cd7c45 drivers/scsi/ufs/ufshcd.c Seungwon Jeon         2013-06-26  5378   */
9333d77573485c8 drivers/scsi/ufs/ufshcd.c Venkat Gopalakrishnan 2019-11-14  5379  static irqreturn_t ufshcd_uic_cmd_compl(struct ufs_hba *hba, u32 intr_status)
6ccf44fe4cd7c45 drivers/scsi/ufs/ufshcd.c Seungwon Jeon         2013-06-26  5380  {
9333d77573485c8 drivers/scsi/ufs/ufshcd.c Venkat Gopalakrishnan 2019-11-14  5381  	irqreturn_t retval = IRQ_NONE;
4c0eff913df7b05 drivers/ufs/core/ufshcd.c Bart Van Assche       2024-08-21  5382  	struct uic_command *cmd;
9333d77573485c8 drivers/scsi/ufs/ufshcd.c Venkat Gopalakrishnan 2019-11-14  5383  
a45f937110fa6b0 drivers/scsi/ufs/ufshcd.c Can Guo               2021-05-24  5384  	spin_lock(hba->host->host_lock);
4c0eff913df7b05 drivers/ufs/core/ufshcd.c Bart Van Assche       2024-08-21  5385  	cmd = hba->active_uic_cmd;
a45f937110fa6b0 drivers/scsi/ufs/ufshcd.c Can Guo               2021-05-24  5386  	if (ufshcd_is_auto_hibern8_error(hba, intr_status))
a45f937110fa6b0 drivers/scsi/ufs/ufshcd.c Can Guo               2021-05-24  5387  		hba->errors |= (UFSHCD_UIC_HIBERN8_MASK & intr_status);
a45f937110fa6b0 drivers/scsi/ufs/ufshcd.c Can Guo               2021-05-24  5388  
4c0eff913df7b05 drivers/ufs/core/ufshcd.c Bart Van Assche       2024-08-21 @5389  	if (intr_status & UIC_COMMAND_COMPL && cmd) {
4c0eff913df7b05 drivers/ufs/core/ufshcd.c Bart Van Assche       2024-08-21  5390  		cmd->argument2 |= ufshcd_get_uic_cmd_result(hba);
4c0eff913df7b05 drivers/ufs/core/ufshcd.c Bart Van Assche       2024-08-21  5391  		cmd->argument3 = ufshcd_get_dme_attr_val(hba);
0f52fcb99ea2738 drivers/scsi/ufs/ufshcd.c Can Guo               2020-11-02  5392  		if (!hba->uic_async_done)
4c0eff913df7b05 drivers/ufs/core/ufshcd.c Bart Van Assche       2024-08-21  5393  			cmd->cmd_active = 0;
4c0eff913df7b05 drivers/ufs/core/ufshcd.c Bart Van Assche       2024-08-21  5394  		complete(&cmd->done);
9333d77573485c8 drivers/scsi/ufs/ufshcd.c Venkat Gopalakrishnan 2019-11-14  5395  		retval = IRQ_HANDLED;
6ccf44fe4cd7c45 drivers/scsi/ufs/ufshcd.c Seungwon Jeon         2013-06-26  5396  	}
53b3d9c3fdda94d drivers/scsi/ufs/ufshcd.c Seungwon Jeon         2013-08-31  5397  
4c0eff913df7b05 drivers/ufs/core/ufshcd.c Bart Van Assche       2024-08-21  5398  	if (intr_status & UFSHCD_UIC_PWR_MASK && hba->uic_async_done) {
4c0eff913df7b05 drivers/ufs/core/ufshcd.c Bart Van Assche       2024-08-21 @5399  		cmd->cmd_active = 0;
57d104c153d3d6d drivers/scsi/ufs/ufshcd.c Subhash Jadavani      2014-09-25  5400  		complete(hba->uic_async_done);
9333d77573485c8 drivers/scsi/ufs/ufshcd.c Venkat Gopalakrishnan 2019-11-14  5401  		retval = IRQ_HANDLED;
9333d77573485c8 drivers/scsi/ufs/ufshcd.c Venkat Gopalakrishnan 2019-11-14  5402  	}
aa5c697988b4c7e drivers/scsi/ufs/ufshcd.c Stanley Chu           2020-06-15  5403  
aa5c697988b4c7e drivers/scsi/ufs/ufshcd.c Stanley Chu           2020-06-15  5404  	if (retval == IRQ_HANDLED)
4c0eff913df7b05 drivers/ufs/core/ufshcd.c Bart Van Assche       2024-08-21  5405  		ufshcd_add_uic_command_trace(hba, cmd, UFS_CMD_COMP);
a45f937110fa6b0 drivers/scsi/ufs/ufshcd.c Can Guo               2021-05-24  5406  	spin_unlock(hba->host->host_lock);
9333d77573485c8 drivers/scsi/ufs/ufshcd.c Venkat Gopalakrishnan 2019-11-14  5407  	return retval;
6ccf44fe4cd7c45 drivers/scsi/ufs/ufshcd.c Seungwon Jeon         2013-06-26  5408  }
6ccf44fe4cd7c45 drivers/scsi/ufs/ufshcd.c Seungwon Jeon         2013-06-26  5409  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
